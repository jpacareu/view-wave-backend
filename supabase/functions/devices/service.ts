import { SupabaseClient } from "jsr:@supabase/supabase-js@2";
import { DeviceRepository } from "../_repositories/device.ts";
import { DEVICE_STATUS } from "../_shared/constants.ts";
import { BranchRepository } from "../_repositories/branch.ts";
import { UserRepository } from "../_repositories/user.ts";
import { DEFAULT_LIST } from "../_configs/default.ts";
import {
  DEVICE_EVENTS,
  DeviceErrorMessage,
  DeviceErrorResponseByEvent,
  DeviceEventError,
  DeviceEventSuccess,
  DeviceResponsePayload,
  DeviceSuccessMessage,
  DeviceSuccessResponseByEvent,
} from "./types.ts";
import { ERROR_TYPE } from "../custom.types.ts";
import { BaseService } from "../_shared/base-service.ts";

export default class DeviceService extends BaseService<
  DeviceSuccessResponseByEvent<DeviceEventSuccess>,
  DeviceErrorResponseByEvent<DeviceEventError>
> {
  private deviceRepository: DeviceRepository;
  private userRepository: UserRepository;
  private branchRepository: BranchRepository;

  constructor(supabaseClient: SupabaseClient) {
    super();
    this.deviceRepository = new DeviceRepository(supabaseClient);
    this.userRepository = new UserRepository(supabaseClient);
    this.branchRepository = new BranchRepository(supabaseClient);
  }

  deleteDevice = async (id: string) => {
    if (!id) {
      return this.getErrorResponse(DEVICE_EVENTS.ERROR.DEVICE_NOT_VALID);
    }

    await this.deviceRepository.update(id, {
      status: DEVICE_STATUS.INITIALIZED,
      code_value: null,
      code_exp: null,
      branch_id: null,
      list_id: null,
    });

    return this.getSuccessResponse(
      DEVICE_EVENTS.SUCCESS.DEVICE_UNASSIGNED,
      null,
    );
  };

  registerDeviceByCode = async (body: { code: string; branch_id: string }) => {
    const { code, branch_id } = body;

    if (!code) {
      return this.getErrorResponse(DEVICE_EVENTS.ERROR.CODE_NOT_FOUND);
    }

    if (!branch_id) {
      return this.getErrorResponse(DEVICE_EVENTS.ERROR.BRANCH_ID_NOT_FOUND);
    }

    const device = await this.deviceRepository.getDeviceByCode(code);

    if (!device) {
      return this.getErrorResponse(DEVICE_EVENTS.ERROR.DEVICE_NOT_FOUND);
    }

    if (device.status === DEVICE_STATUS.ASSIGNED) {
      return this.getErrorResponse(DEVICE_EVENTS.ERROR.DEVICE_ALREADY_ASSIGNED);
    }

    const user = await this.userRepository.getAuthUser();
    const hasBranch = await this.userRepository.getUserBranches(
      user.id,
      branch_id,
    );

    if (!hasBranch) {
      return this.getErrorResponse(DEVICE_EVENTS.ERROR.BRANCH_NOT_FOUND);
    }

    const organization = await this.branchRepository.getOrganizationByBranchId(
      branch_id,
    );

    if (!organization?.organization_id) {
      return this.getErrorResponse(DEVICE_EVENTS.ERROR.ORGANIZATION_NOT_FOUND);
    }

    const updatedDevice = {
      status: DEVICE_STATUS.ASSIGNED,
      branch_id,
      organization_id: organization.organization_id,
      code_value: null,
      code_exp: null,
    };

    await this.deviceRepository.assignDeviceToBranch(device.id, updatedDevice);

    return this.getSuccessResponse(DEVICE_EVENTS.SUCCESS.DEVICE_ASSIGNED, {
      data: {
        type: "PLAY_LIST",
        playlist: DEFAULT_LIST,
      },
    });
  };

  getDevicePlayList = async (deviceId: string) => {
    // VALIDATE DEVICE BELONGS TO USER ORGANIZATION
    if (!deviceId) {
      // TODO: ADD CASE FOR DEVICE INVALID
      return this.getErrorResponse(DEVICE_EVENTS.ERROR.DEVICE_INVALID);
    }

    const device = await this.deviceRepository.getDeviceById(deviceId);

    if (!device) {
      return this.getErrorResponse(DEVICE_EVENTS.ERROR.DEVICE_NOT_FOUND);
    }

    if (device.status !== DEVICE_STATUS.ASSIGNED) {
      return this.getErrorResponse(
        DEVICE_EVENTS.ERROR.DEVICE_NOT_BRANCH_ASSIGNED,
      );
    }

    return this.getSuccessResponse(DEVICE_EVENTS.SUCCESS.DEVICE_ASSIGNED, {
      data: {
        type: "PLAY_LIST",
        playlist: DEFAULT_LIST,
      },
    });
  };

  getErrorResponse = (
    event: DeviceEventError,
  ): DeviceErrorResponseByEvent<DeviceEventError> => {
    switch (event) {
      case DEVICE_EVENTS.ERROR.DEVICE_NOT_VALID:
      case DEVICE_EVENTS.ERROR.DEVICE_ALREADY_ASSIGNED:
      case DEVICE_EVENTS.ERROR.BRANCH_NOT_FOUND:
      case DEVICE_EVENTS.ERROR.ORGANIZATION_NOT_FOUND:
      case DEVICE_EVENTS.ERROR.CODE_NOT_FOUND:
      case DEVICE_EVENTS.ERROR.BRANCH_ID_NOT_FOUND:
      case DEVICE_EVENTS.ERROR.DEVICE_INVALID:
      case DEVICE_EVENTS.ERROR.DEVICE_NOT_FOUND:
      case DEVICE_EVENTS.ERROR.DEVICE_NOT_BRANCH_ASSIGNED:
        return {
          event,
          payload: null,
          message: null,
          error: {
            type: ERROR_TYPE.ERROR,
            message: this.getErrorMessages(event),
          },
        } as DeviceErrorResponseByEvent<DeviceEventError>;

      default:
        return this.assertNever(event);
    }
  };

  getSuccessResponse = (
    event: DeviceEventSuccess,
    data: DeviceResponsePayload,
  ): DeviceSuccessResponseByEvent<DeviceEventSuccess> => {
    switch (event) {
      case DEVICE_EVENTS.SUCCESS.DEVICE_UNASSIGNED:
      case DEVICE_EVENTS.SUCCESS.DEVICE_ASSIGNED:
        return {
          event,
          error: null,
          message: this.getSuccessMessages(event),
          payload: {
            ...data,
          },
        } as DeviceSuccessResponseByEvent<DeviceEventSuccess>;

      default:
        return this.assertNever(event);
    }
  };

  getErrorMessages(event: DeviceEventError): DeviceErrorMessage {
    switch (event) {
      case DEVICE_EVENTS.ERROR.DEVICE_NOT_FOUND:
        return "Device not found";
      case DEVICE_EVENTS.ERROR.DEVICE_ALREADY_ASSIGNED:
        return "Device already assigned";
      case DEVICE_EVENTS.ERROR.BRANCH_NOT_FOUND:
        return "Branch not found";
      case DEVICE_EVENTS.ERROR.ORGANIZATION_NOT_FOUND:
        return "Organization not found";
      case DEVICE_EVENTS.ERROR.CODE_NOT_FOUND:
        return "Code not valid, please provide a valid code";
      case DEVICE_EVENTS.ERROR.BRANCH_ID_NOT_FOUND:
        return "Branch id not valid";
      case DEVICE_EVENTS.ERROR.DEVICE_INVALID:
        return "Device id not valid";
      case DEVICE_EVENTS.ERROR.DEVICE_NOT_VALID:
        return "Device id not valid";
      case DEVICE_EVENTS.ERROR.DEVICE_NOT_BRANCH_ASSIGNED:
        return "Device is not assigned to a branch";
    }
  }

  getSuccessMessages(event: DeviceEventSuccess): DeviceSuccessMessage {
    switch (event) {
      case DEVICE_EVENTS.SUCCESS.DEVICE_ASSIGNED:
        return "Device assigned";
      case DEVICE_EVENTS.SUCCESS.DEVICE_UNASSIGNED:
        return "Device deleted successfully";
    }
  }
}
