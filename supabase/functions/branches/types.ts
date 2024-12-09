import { ErrorResponse, SuccessResponse } from "../custom.types.ts";

export const BRANCH_EVENTS = {
  SUCCESS: {
    BRANCH_DEVICES_LIST: "BRANCH_DEVICES_LIST",
  },
  ERROR: {
    BRANCH_NOT_PRESENT: "BRANCH_NOT_PRESENT",
  },
} as const;

export type BranchEventSuccess =
  typeof BRANCH_EVENTS.SUCCESS[keyof typeof BRANCH_EVENTS.SUCCESS];

export type BranchEventError =
  typeof BRANCH_EVENTS.ERROR[keyof typeof BRANCH_EVENTS.ERROR];

export type BranchSuccessResponseByEvent<E extends BranchEventSuccess> =
  E extends typeof BRANCH_EVENTS.SUCCESS.BRANCH_DEVICES_LIST ? SuccessResponse<
      typeof BRANCH_EVENTS.SUCCESS.BRANCH_DEVICES_LIST,
      "List of devices",
      {
        devices: {
          id: string;
          name: string;
          list_id: string;
        }[];
      }
    >
    : never;

export type BranchErrorResponseByEvent<E extends BranchEventError> = E extends
  typeof BRANCH_EVENTS.ERROR.BRANCH_NOT_PRESENT ? ErrorResponse<
    typeof BRANCH_EVENTS.ERROR.BRANCH_NOT_PRESENT,
    "Branch id not valid"
  >
  : never;

export type BranchResponsePayload = BranchSuccessResponseByEvent<
  BranchEventSuccess
>["payload"];

export type BranchSuccessMessage = NonNullable<
  BranchSuccessResponseByEvent<BranchEventSuccess>["message"]
>;

export type BranchErrorMessage = NonNullable<
  BranchErrorResponseByEvent<BranchEventError>["error"]["message"]
>;
