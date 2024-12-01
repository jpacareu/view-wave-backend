import { SupabaseClient } from "jsr:@supabase/supabase-js@2";
import { DeviceRepository } from "../_repositories/device.ts";
import { DEVICE_STATUS } from "../_shared/constants.ts";
import { UserRepository } from "../_repositories/user.ts";
import { BranchRepository } from "../_repositories/branch.ts";

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

    const value = await this.deviceRepository.assignDeviceToBranch(
      device.id,
      newDevice,
    );

    return this.getResponseByEvent("DEVICE_ASSIGNED", {
      value,
    });
  };

  unassignList = async (id: string) => {
    await this.deviceRepository.update(
      id,
      {
        list_id: null,
      },
    );

    return this.getResponseByEvent("DEVICE_SUCCESSFULLY_UNASSIGNED");
  };

  getResponseByEvent = (event: string, data?: any) => {
    switch (event) {
      case "CODE_NOT_FOUND":
        return ({
          event: "CODE_NOT_FOUND",
          payload: {
            message: "Code not valid, please provide a valid code",
            ...data,
          },
        });
      case "BRANCH_NOT_FOUND":
        return ({
          event: "BRANCH_NOT_FOUND",
          payload: {
            message:
              "Branch not valid, please provide a valid branch to register the device",
            ...data,
          },
        });
      case "DEVICE_FOUND":
        return ({
          event: "DEVICE_FOUND",
          payload: {
            message: "Device found",
            ...data,
          },
        });
      case "DEVICE_NOT_FOUND":
        return ({
          event: "DEVICE_NOT_FOUND",
          payload: {
            message: "Device not found for that code value",
            ...data,
          },
        });
      case "ORGANIZATION_NOT_FOUND":
        return ({
          event: "ORGANIZATION_NOT_FOUND",
          payload: {
            message: "Organization not found for that branch",
            ...data,
          },
        });
      case "DEVICE_ALREADY_ASSIGNED":
        return ({
          event: "DEVICE_ALREADY_ASSIGNED",
          payload: {
            message: "This device is already assigned",
            ...data,
          },
        });
      case "DEVICE_NOT_VALID":
        return ({
          event: "DEVICE_NOT_VALID",
          payload: {
            message: "Device id not valid",
            ...data,
          },
        });
      case "DEVICE_UNASSIGNED":
        return ({
          event: "DEVICE_UNASSIGNED",
          payload: {
            message: "Device unassigned",
            ...data,
          },
        });
      case "DEVICE_ASSIGNED":
        return ({
          event: "DEVICE_ASSIGNED",
          payload: {
            message: "Device assigned",
            ...data,
          },
        });

      case "DEVICE_SUCCESSFULLY_UNASSIGNED":
        return ({
          event: "DEVICE_SUCCESSFULLY_UNASSIGNED",
          payload: {
            message: "Device successfully unassigned",
            ...data,
          },
        });
      default:
        throw new Error("Event not found");
    }
  };
}
