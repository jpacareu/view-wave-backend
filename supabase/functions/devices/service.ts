import { SupabaseClient } from "jsr:@supabase/supabase-js@2";
import { DeviceRepository } from "../_repositories/device.ts";
import { DEVICE_STATUS } from "../_shared/constants.ts";
import { UserRepository } from "../_repositories/user.ts";
import { BranchRepository } from "../_repositories/branch.ts";
import { DEFAULT_LIST } from "../_configs/default.ts";

export default class DeviceService {
  private deviceRepository: DeviceRepository;
  private userRepository: UserRepository;
  private branchRepository: BranchRepository;

  constructor(supabaseClient: SupabaseClient) {
    this.deviceRepository = new DeviceRepository(supabaseClient);
    this.userRepository = new UserRepository(supabaseClient);
    this.branchRepository = new BranchRepository(supabaseClient);
  }

  deleteDevice = async (id: string) => {
    if (!id) {
      this.getResponseByEvent("DEVICE_NOT_VALID");
    }

    // TODO: see what else should trigger this
    const devices = await this.deviceRepository.update(
      id,
      {
        status: DEVICE_STATUS.INITIALIZED,
        code_value: null,
        code_exp: null,
        branch_id: null,
        list_id: null,
      },
    );

    return this.getResponseByEvent("DEVICE_UNASSIGNED", { devices });
  };

  registerDeviceByCode = async (body: {
    code: string;
    branch_id: string;
  }) => {
    const { code, branch_id: branchId } = body;
    if (!code) {
      return this.getResponseByEvent("CODE_NOT_FOUND");
    }

    if (!branchId) {
      return this.getResponseByEvent("BRANCH_ID_NOT_FOUND");
    }

    const device = await this.deviceRepository.getDeviceByCode(
      code,
    );

    if (!device) {
      return this.getResponseByEvent("DEVICE_NOT_FOUND");
    }

    if (device.status === DEVICE_STATUS.ASSIGNED) {
      return this.getResponseByEvent("DEVICE_ALREADY_ASSIGNED");
    }

    const user = await this.userRepository.getAuthUser();

    const hasBranch = await this.userRepository.getUserBranches(
      user.id,
      branchId,
    );

    if (!hasBranch) {
      return this.getResponseByEvent("BRANCH_NOT_FOUND");
    }

    const organization = await this.branchRepository
      .getOrganizationByBranchId(
        branchId,
      );

    if (!organization?.organization_id) {
      return this.getResponseByEvent("ORGANIZATION_NOT_FOUND");
    }

    const newDevice = {
      status: DEVICE_STATUS.ASSIGNED,
      branch_id: branchId,
      organization_id: organization.organization_id,
      code_value: null,
      code_exp: null,
    };

    await this.deviceRepository.assignDeviceToBranch(
      device.id,
      newDevice,
    );

    return this.getResponseByEvent("DEVICE_ASSIGNED", {});
  };

  getDevicePlayList = async (deviceId: string, listId: string) => {
    if (!deviceId) {
      // TODO: ADD CASE FOR DEVICE INVALID
      return this.getResponseByEvent("DEVICE_INVALID");
    }

    if (!listId) {
      // TODO: ADD CASE FOR LIST INVALID
      return this.getResponseByEvent("LIST_INVALID");
    }

    const device = await this.deviceRepository.getDeviceByIdAndListId(
      deviceId,
      listId,
    );

    if (!device) {
      return this.getResponseByEvent("DEVICE_NOT_FOUND_FOR_LIST");
    }

    if (device.status !== DEVICE_STATUS.ASSIGNED) {
      return this.getResponseByEvent("DEVICE_UNASSIGNED");
    }

    return this.getResponseByEvent("DEVICE_ASSIGNED", {
      data: {
        type: "PLAY_LIST",
        playlist: DEFAULT_LIST,
      },
    });
  };

  getResponseByEvent = (event: string, data?: any) => {
    switch (event) {
      case "CODE_NOT_FOUND":
        return ({
          event: "CODE_NOT_FOUND",
          message: "Code not valid, please provide a valid code",
          payload: {
            ...data,
          },
        });
      case "BRANCH_NOT_FOUND":
        return ({
          event: "BRANCH_NOT_FOUND",
          message:
            "Branch not valid, please provide a valid branch to register the device",
          payload: {
            ...data,
          },
        });
      case "DEVICE_FOUND":
        return ({
          event: "DEVICE_FOUND",
          message: "Device found",
          payload: {
            ...data,
          },
        });
      case "DEVICE_NOT_FOUND":
        return ({
          event: "DEVICE_NOT_FOUND",
          message: "Device not found for that code value",
          payload: {
            ...data,
          },
        });
      case "ORGANIZATION_NOT_FOUND":
        return ({
          event: "ORGANIZATION_NOT_FOUND",
          message: "Organization not found for that branch",
          payload: {
            ...data,
          },
        });
      case "DEVICE_ALREADY_ASSIGNED":
        return ({
          event: "DEVICE_ALREADY_ASSIGNED",
          message: "This device is already assigned",
          payload: {
            ...data,
          },
        });
      case "DEVICE_NOT_VALID":
        return ({
          event: "DEVICE_NOT_VALID",
          message: "Device id not valid",
          payload: {
            ...data,
          },
        });
      case "DEVICE_UNASSIGNED":
        return ({
          event: "DEVICE_UNASSIGNED",
          message: "Device unassigned",
          payload: {
            ...data,
          },
        });
      case "DEVICE_ASSIGNED":
        return ({
          event: "DEVICE_ASSIGNED",
          message: "Device assigned",
          payload: {
            ...data,
          },
        });
      case "DEVICE_INVALID":
        return ({
          event: "DEVICE_INVALID",
          message: "Device id not valid",
          payload: {
            ...data,
          },
        });

      case "LIST_INVALID":
        return ({
          event: "LIST_INVALID",
          message: "List id not valid",
          payload: {
            ...data,
          },
        });
      case "DEVICE_NOT_FOUND_FOR_LIST":
        return ({
          event: "DEVICE_NOT_FOUND_FOR_LIST",
          message: "Device not found for that list",
          payload: {
            ...data,
          },
        });

      default:
        throw new Error("Event not found");
    }
  };
}
