import { ERROR_TYPE } from "../custom.types.ts";
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
  typeof USER_EVENTS.SUCCESS.USER_CREATED ? {
    event: typeof USER_EVENTS.SUCCESS.USER_CREATED;
    message: "User created successfully";
    error: null;
    payload: { id: string; email: string };
  }
  : E extends typeof USER_EVENTS.SUCCESS.USER_ENTITIES ? {
      event: typeof USER_EVENTS.SUCCESS.USER_ENTITIES;
      message: "";
      error: null;
      payload: UserEntities;
    }
  : E extends typeof USER_EVENTS.SUCCESS.USER_SET_ACTIVE_BRANCH ? {
      event: typeof USER_EVENTS.SUCCESS.USER_SET_ACTIVE_BRANCH;
      message: "Branch changed";
      error: null;
      payload: { branch_id: string };
    }
  : never;

export type UserErrorResponseByEvent<E extends UserEventError> = E extends
  typeof USER_EVENTS.ERROR.USER_HAS_NO_ENTITIES ? {
    event: typeof USER_EVENTS.ERROR.USER_HAS_NO_ENTITIES;
    message: null;
    error: {
      type: typeof ERROR_TYPE.ERROR;
      message: "User has no entities";
    };
    payload: null;
  }
  : E extends typeof USER_EVENTS.ERROR.USER_ORGANIZATION_NOT_FOUND ? {
      event: typeof USER_EVENTS.ERROR.USER_ORGANIZATION_NOT_FOUND;
      message: null;
      error: {
        type: typeof ERROR_TYPE.ERROR;
        message: "User organization not found";
      };
      payload: null;
    }
  : E extends typeof USER_EVENTS.ERROR.USER_BRANCHES_NOT_FOUND ? {
      event: typeof USER_EVENTS.ERROR.USER_BRANCHES_NOT_FOUND;
      message: null;
      error: {
        type: typeof ERROR_TYPE.ERROR;
        message: "User branches not found";
      };
      payload: null;
    }
  : E extends typeof USER_EVENTS.ERROR.USER_ACTIVE_BRANCH_INVALID ? {
      event: typeof USER_EVENTS.ERROR.USER_ACTIVE_BRANCH_INVALID;
      message: null;
      error: {
        type: typeof ERROR_TYPE.ERROR;
        message: "Branch id is not valid";
      };
      payload: null;
    }
  : never;

export type UserResponsePayload = UserSuccessResponseByEvent<
  UserEventSuccess
>["payload"];

export type UserSuccessMessage = NonNullable<
  UserSuccessResponseByEvent<
    UserEventSuccess
  >["message"]
>;
