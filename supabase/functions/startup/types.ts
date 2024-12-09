import { DEFAULT_LIST } from "../_configs/default.ts";
import { ErrorResponse, SuccessResponse } from "../custom.types.ts";

export const STARTUP_EVENTS = {
  SUCCESS: {
    DEVICE_FOUND: "DEVICE_FOUND",
    DEVICE_ASSIGNED: "DEVICE_ASSIGNED",
    STARTUP: "STARTUP",
  },
  ERROR: {
    DEVICE_NOT_FOUND: "DEVICE_NOT_FOUND",
    DEVICE_STATUS_INVALID: "DEVICE_STATUS_INVALID",
  },
} as const;

export type StartupEventSuccess =
  typeof STARTUP_EVENTS.SUCCESS[keyof typeof STARTUP_EVENTS.SUCCESS];

export type StartupEventError =
  typeof STARTUP_EVENTS.ERROR[keyof typeof STARTUP_EVENTS.ERROR];

export type StartupSuccessResponseByEvent<E extends StartupEventSuccess> =
  E extends typeof STARTUP_EVENTS.SUCCESS.DEVICE_FOUND ? SuccessResponse<
      typeof STARTUP_EVENTS.SUCCESS.DEVICE_FOUND,
      "Device found successfully",
      {
        data: {
          type: "PLAY_LIST";
          playlist: typeof DEFAULT_LIST;
        };
      }
    >
    : E extends typeof STARTUP_EVENTS.SUCCESS.DEVICE_ASSIGNED ? SuccessResponse<
        typeof STARTUP_EVENTS.SUCCESS.DEVICE_ASSIGNED,
        "Device is assigned",
        { device_id: string; user_id: string }
      >
    : E extends typeof STARTUP_EVENTS.SUCCESS.STARTUP ? SuccessResponse<
        typeof STARTUP_EVENTS.SUCCESS.STARTUP,
        "Please enter the code or scan the QR to continue",
        {
          data: {
            type: "STARTUP";
            code: string;
          };
        }
      >
    : never;

export type StartupErrorResponseByEvent<E extends StartupEventError> = E extends
  typeof STARTUP_EVENTS.ERROR.DEVICE_NOT_FOUND ? ErrorResponse<
    typeof STARTUP_EVENTS.ERROR.DEVICE_NOT_FOUND,
    "Device not found, support has been informed about it and is taking care of it, as soon as posible"
  >
  : E extends typeof STARTUP_EVENTS.ERROR.DEVICE_STATUS_INVALID ? ErrorResponse<
      typeof STARTUP_EVENTS.ERROR.DEVICE_STATUS_INVALID,
      "Device status is invalid"
    >
  : never;

export type StartupResponsePayload = StartupSuccessResponseByEvent<
  StartupEventSuccess
>["payload"];

export type StartupSuccessMessage = NonNullable<
  StartupSuccessResponseByEvent<
    StartupEventSuccess
  >["message"]
>;

export type StartupErrorMessage = NonNullable<
  StartupErrorResponseByEvent<StartupEventError>["error"]["message"]
>;
