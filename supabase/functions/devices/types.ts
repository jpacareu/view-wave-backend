import { DEFAULT_LIST } from "../_configs/default.ts";
import { ErrorResponse, SuccessResponse } from "../custom.types.ts";
import { Tables } from "../types.ts";

export type DeviceEntities = {
  device: Pick<Tables<"devices">, "id" | "status" | "branch_id">;
  branch: Pick<Tables<"branches">, "id" | "name" | "organization_id">;
  organization: Pick<Tables<"organizations">, "id" | "name">;
};

export const DEVICE_EVENTS = {
  SUCCESS: {
    DEVICE_ASSIGNED: "DEVICE_ASSIGNED",
    DEVICE_UNASSIGNED: "DEVICE_UNASSIGNED",
  },
  ERROR: {
    DEVICE_NOT_VALID: "DEVICE_NOT_VALID",
    DEVICE_NOT_FOUND: "DEVICE_NOT_FOUND",
    DEVICE_ALREADY_ASSIGNED: "DEVICE_ALREADY_ASSIGNED",
    BRANCH_NOT_FOUND: "BRANCH_NOT_FOUND",
    ORGANIZATION_NOT_FOUND: "ORGANIZATION_NOT_FOUND",
    CODE_NOT_FOUND: "CODE_NOT_FOUND",
    BRANCH_ID_NOT_FOUND: "BRANCH_ID_NOT_FOUND",
    DEVICE_INVALID: "DEVICE_INVALID",
    DEVICE_NOT_BRANCH_ASSIGNED: "DEVICE_NOT_BRANCH_ASSIGNED",
  },
} as const;

export type DeviceEventSuccess =
  typeof DEVICE_EVENTS.SUCCESS[keyof typeof DEVICE_EVENTS.SUCCESS];
export type DeviceEventError =
  typeof DEVICE_EVENTS.ERROR[keyof typeof DEVICE_EVENTS.ERROR];

export type DeviceSuccessResponseByEvent<E extends DeviceEventSuccess> =
  E extends typeof DEVICE_EVENTS.SUCCESS.DEVICE_ASSIGNED ? SuccessResponse<
      typeof DEVICE_EVENTS.SUCCESS.DEVICE_ASSIGNED,
      "Device assigned",
      {
        data: {
          type: "PLAY_LIST";
          playlist: typeof DEFAULT_LIST;
        };
      }
    >
    : E extends typeof DEVICE_EVENTS.SUCCESS.DEVICE_UNASSIGNED
      ? SuccessResponse<
        typeof DEVICE_EVENTS.SUCCESS.DEVICE_UNASSIGNED,
        "Device deleted successfully",
        null
      >
    : never;

export type DeviceErrorResponseByEvent<E extends DeviceEventError> = E extends
  typeof DEVICE_EVENTS.ERROR.DEVICE_NOT_VALID ? ErrorResponse<
    typeof DEVICE_EVENTS.ERROR.DEVICE_NOT_VALID,
    "Device id not valid"
  >
  : E extends typeof DEVICE_EVENTS.ERROR.DEVICE_NOT_FOUND ? ErrorResponse<
      typeof DEVICE_EVENTS.ERROR.DEVICE_NOT_FOUND,
      "Device not found"
    >
  : E extends typeof DEVICE_EVENTS.ERROR.DEVICE_ALREADY_ASSIGNED
    ? ErrorResponse<
      typeof DEVICE_EVENTS.ERROR.DEVICE_ALREADY_ASSIGNED,
      "Device already assigned"
    >
  : E extends typeof DEVICE_EVENTS.ERROR.BRANCH_NOT_FOUND ? ErrorResponse<
      typeof DEVICE_EVENTS.ERROR.BRANCH_NOT_FOUND,
      "Branch not found"
    >
  : E extends typeof DEVICE_EVENTS.ERROR.ORGANIZATION_NOT_FOUND ? ErrorResponse<
      typeof DEVICE_EVENTS.ERROR.ORGANIZATION_NOT_FOUND,
      "Organization not found"
    >
  : E extends typeof DEVICE_EVENTS.ERROR.CODE_NOT_FOUND ? ErrorResponse<
      typeof DEVICE_EVENTS.ERROR.CODE_NOT_FOUND,
      "Code not valid, please provide a valid code"
    >
  : E extends typeof DEVICE_EVENTS.ERROR.BRANCH_ID_NOT_FOUND ? ErrorResponse<
      typeof DEVICE_EVENTS.ERROR.BRANCH_ID_NOT_FOUND,
      "Branch id not valid"
    >
  : E extends typeof DEVICE_EVENTS.ERROR.DEVICE_INVALID ? ErrorResponse<
      typeof DEVICE_EVENTS.ERROR.DEVICE_INVALID,
      "Device id not valid"
    >
  : E extends typeof DEVICE_EVENTS.ERROR.DEVICE_NOT_BRANCH_ASSIGNED ? ErrorResponse<
      typeof DEVICE_EVENTS.ERROR.DEVICE_NOT_BRANCH_ASSIGNED,
      "Device is not assigned to a branch"
    >
  : never;

export type DeviceResponsePayload = DeviceSuccessResponseByEvent<
  DeviceEventSuccess
>["payload"];

export type DeviceSuccessMessage = NonNullable<
  DeviceSuccessResponseByEvent<DeviceEventSuccess>["message"]
>;

export type DeviceErrorMessage = NonNullable<
  DeviceErrorResponseByEvent<DeviceEventError>["error"]["message"]
>;

