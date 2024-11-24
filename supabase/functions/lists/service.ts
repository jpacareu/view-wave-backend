import { SupabaseClient } from "jsr:@supabase/supabase-js@2";
import { DeviceRepository } from "../_repositories/device.ts";
import { DEVICE_STATUS } from "../_shared/constants.ts";

export default class DeviceService {
  private deviceRepository: DeviceRepository;

  constructor(supabaseClient: SupabaseClient) {
    this.deviceRepository = new DeviceRepository(supabaseClient);
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

  getResponseByEvent = (event: string, data?: any) => {
    switch (event) {
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
      default:
        throw new Error("Event not found");
    }
  };
}
