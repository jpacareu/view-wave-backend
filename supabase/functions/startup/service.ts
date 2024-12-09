import { SupabaseClient } from "jsr:@supabase/supabase-js@2";
import { DeviceRepository } from "../_repositories/device.ts";
import { DEVICE_STATUS } from "../_shared/constants.ts";
import { DEFAULT_LIST } from "../_configs/default.ts";
import { BaseService } from "../_shared/base-service.ts";
import {
  STARTUP_EVENTS,
  StartupErrorMessage,
  StartupErrorResponseByEvent,
  StartupEventError,
  StartupEventSuccess,
  StartupSuccessMessage,
  StartupSuccessResponseByEvent,
} from "./types.ts";
import { StartupResponsePayload } from "./types.ts";
import { ERROR_TYPE } from "../custom.types.ts";

export default class StartupService extends BaseService<
  StartupSuccessResponseByEvent<StartupEventSuccess>,
  StartupErrorResponseByEvent<StartupEventError>
> {
  private deviceRepository: DeviceRepository;

  constructor(supabaseClient: SupabaseClient) {
    super();
    this.deviceRepository = new DeviceRepository(supabaseClient);
  }

  startupByAndroidId = async (androidId: string) => {
    const device = await this.deviceRepository.getDeviceByAndroidId(
      androidId,
    );

    if (!device) {
      return this.getErrorResponse(STARTUP_EVENTS.ERROR.DEVICE_NOT_FOUND);
    }

    if (device.status === DEVICE_STATUS.ASSIGNED) {
      return this.getSuccessResponse(
        STARTUP_EVENTS.SUCCESS.DEVICE_FOUND,
        {
          data: {
            type: "PLAY_LIST",
            playlist: DEFAULT_LIST,
          },
        },
      );
    }

    const code = await this.deviceRepository.getCodeByAndroidId(androidId);

    return this.getSuccessResponse(
      STARTUP_EVENTS.SUCCESS.STARTUP,
      {
        data: {
          type: "STARTUP",
          code,
        },
      },
    );
  };

  getErrorResponse = (
    event: StartupEventError,
  ): StartupErrorResponseByEvent<StartupEventError> => {
    switch (event) {
      case STARTUP_EVENTS.ERROR.DEVICE_NOT_FOUND:
      case STARTUP_EVENTS.ERROR.DEVICE_STATUS_INVALID:
        return {
          event,
          payload: null,
          message: null,
          error: {
            type: ERROR_TYPE.ERROR,
            message: this.getErrorMessages(event),
          },
        } as StartupErrorResponseByEvent<StartupEventError>;

      default:
        return this.assertNever(event);
    }
  };

  getSuccessResponse = (
    event: StartupEventSuccess,
    data: StartupResponsePayload,
  ): StartupSuccessResponseByEvent<StartupEventSuccess> => {
    switch (event) {
      case STARTUP_EVENTS.SUCCESS.DEVICE_ASSIGNED:
      case STARTUP_EVENTS.SUCCESS.DEVICE_FOUND:
      case STARTUP_EVENTS.SUCCESS.STARTUP:
        return {
          event,
          error: null,
          message: this.getSuccessMessages(event),
          payload: {
            ...data,
          },
        } as StartupSuccessResponseByEvent<StartupEventSuccess>;

      default:
        return this.assertNever(event);
    }
  };

  getErrorMessages(event: StartupEventError): StartupErrorMessage {
    switch (event) {
      case STARTUP_EVENTS.ERROR.DEVICE_NOT_FOUND:
        return "Device not found, support has been informed about it and is taking care of it, as soon as posible";
      case STARTUP_EVENTS.ERROR.DEVICE_STATUS_INVALID:
        return "Device status is invalid";
    }
  }

  getSuccessMessages(event: StartupEventSuccess): StartupSuccessMessage {
    switch (event) {
      case STARTUP_EVENTS.SUCCESS.DEVICE_ASSIGNED:
        return "Device is assigned";
      case STARTUP_EVENTS.SUCCESS.DEVICE_FOUND:
        return "Device found successfully";
      case STARTUP_EVENTS.SUCCESS.STARTUP:
        return "Please enter the code or scan the QR to continue";
    }
  }
}
