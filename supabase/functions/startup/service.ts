import { SupabaseClient } from "jsr:@supabase/supabase-js@2";
import { DeviceRepository } from "../_repositories/device.ts";
import { DEVICE_STATUS } from "../_shared/constants.ts";
import { DEFAULT_LIST } from "../_configs/default.ts";

export default class StartupService {
  private deviceRepository: DeviceRepository;

  constructor(supabaseClient: SupabaseClient) {
    this.deviceRepository = new DeviceRepository(supabaseClient);
  }

  startupByAndroidId = async (androidId: string) => {
    const device = await this.deviceRepository.getDeviceByAndroidId(
      androidId,
    );

    if (!device) {
      return ({
        event: "DEVICE_NOT_FOUND",
        message:
          "Device not found, support has been informed about it and is taking care of it, as soon as posible",
        payload: null,
      });
    }

    if (device.status === DEVICE_STATUS.ASSIGNED) {
      // get list
      return ({
        event: "PLAY_LIST",
        message: "Device is assigned",
        payload: {
          data: {
            type: "PLAY_LIST",
            playlist: DEFAULT_LIST,
          },
        },
      });
    }

    const code = await this.deviceRepository.getCodeByAndroidId(androidId);

    return ({
      event: "STARTUP",
      message: "Please enter the code or scan the QR to continue",
      payload: {
        data: {
          type: "STARTUP",
          code,
        },
      },
    });
  };
}
