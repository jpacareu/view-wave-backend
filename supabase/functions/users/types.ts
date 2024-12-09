import { ErrorResponse, SuccessResponse } from "../custom.types.ts";
import { Tables } from "../types.ts";

export type UserEntities = {
  organization: Pick<Tables<"organizations">, "id" | "name" | "category">;
  branches: Array<
    & { is_active: boolean }
    & Pick<
      Tables<"branches">,
      "id" | "name" | "category"
    >
  >;
  active_branch: Tables<"branches">["id"];
};

export const USER_EVENTS = {
  SUCCESS: {
    USER_CREATED: "USER_CREATED",
    USER_ENTITIES: "USER_ENTITIES",
    USER_SET_ACTIVE_BRANCH: "USER_SET_ACTIVE_BRANCH",
  },
  ERROR: {
    USER_HAS_NO_ENTITIES: "USER_HAS_NO_ENTITIES",
    USER_ORGANIZATION_NOT_FOUND: "USER_ORGANIZATION_NOT_FOUND",
    USER_BRANCHES_NOT_FOUND: "USER_BRANCHES_NOT_FOUND",
    USER_ACTIVE_BRANCH_INVALID: "USER_ACTIVE_BRANCH_INVALID",
  },
} as const;

export type UserEventSuccess =
  typeof USER_EVENTS.SUCCESS[keyof typeof USER_EVENTS.SUCCESS];
export type UserEventError =
  typeof USER_EVENTS.ERROR[keyof typeof USER_EVENTS.ERROR];

export type UserSuccessResponseByEvent<E extends UserEventSuccess> = E extends
  typeof USER_EVENTS.SUCCESS.USER_CREATED ? SuccessResponse<
    typeof USER_EVENTS.SUCCESS.USER_CREATED,
    "User created successfully",
    { id: string; email: string }
  >
  : E extends typeof USER_EVENTS.SUCCESS.USER_ENTITIES ? SuccessResponse<
      typeof USER_EVENTS.SUCCESS.USER_ENTITIES,
      "",
      UserEntities
    >
  : E extends typeof USER_EVENTS.SUCCESS.USER_SET_ACTIVE_BRANCH // {
    ? SuccessResponse<
      typeof USER_EVENTS.SUCCESS.USER_SET_ACTIVE_BRANCH,
      "Branch changed",
      { branch_id: string }
    >
  : never;

export type UserErrorResponseByEvent<E extends UserEventError> = E extends
  typeof USER_EVENTS.ERROR.USER_HAS_NO_ENTITIES ? ErrorResponse<
    typeof USER_EVENTS.ERROR.USER_HAS_NO_ENTITIES,
    "User has no entities"
  >
  : E extends typeof USER_EVENTS.ERROR.USER_ORGANIZATION_NOT_FOUND
    ? ErrorResponse<
      typeof USER_EVENTS.ERROR.USER_ORGANIZATION_NOT_FOUND,
      "User organization not found"
    >
  : E extends typeof USER_EVENTS.ERROR.USER_BRANCHES_NOT_FOUND ? ErrorResponse<
      typeof USER_EVENTS.ERROR.USER_BRANCHES_NOT_FOUND,
      "User branches not found"
    >
  : E extends typeof USER_EVENTS.ERROR.USER_ACTIVE_BRANCH_INVALID
    ? ErrorResponse<
      typeof USER_EVENTS.ERROR.USER_ACTIVE_BRANCH_INVALID,
      "Branch id is not valid"
    >
  : never;

export type UserResponsePayload = UserSuccessResponseByEvent<
  UserEventSuccess
>["payload"];

export type UserSuccessMessage = NonNullable<
  UserSuccessResponseByEvent<
    UserEventSuccess
  >["message"]
>;

export type UserErrorMessage = NonNullable<
  UserErrorResponseByEvent<UserEventError>["error"]["message"]
>;
