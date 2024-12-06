import { Tables } from "../types.ts";

export type UserEntities = {
  organization: Pick<Tables<"organizations">, "id" | "name" | "category">;
  branches: Pick<Tables<"branches">, "id" | "name" | "category">[];
};

export const USER_EVENTS = {
  USER_CREATED: "USER_CREATED",
  USER_HAS_NO_ENTITIES: "USER_HAS_NO_ENTITIES",
  USER_ORGANIZATION_NOT_FOUND: "USER_ORGANIZATION_NOT_FOUND",
  USER_BRANCHES_NOT_FOUND: "USER_BRANCHES_NOT_FOUND",
  USER_ENTITIES: "USER_ENTITIES",
} as const;

export type UserEventValue = typeof USER_EVENTS[keyof typeof USER_EVENTS];

export type UserResponseByEvent<E extends UserEventValue> = E extends
  typeof USER_EVENTS.USER_CREATED ? {
    event: typeof USER_EVENTS.USER_CREATED;
    message: "User created";
    payload: { id: string; email: string };
  }
  : E extends typeof USER_EVENTS.USER_HAS_NO_ENTITIES ? {
      event: typeof USER_EVENTS.USER_HAS_NO_ENTITIES;
      message: "User has no entities";
      payload?: null;
    }
  : E extends typeof USER_EVENTS.USER_ORGANIZATION_NOT_FOUND ? {
      event: typeof USER_EVENTS.USER_ORGANIZATION_NOT_FOUND;
      message: "User organization not found";
      payload?: null;
    }
  : E extends typeof USER_EVENTS.USER_BRANCHES_NOT_FOUND ? {
      event: typeof USER_EVENTS.USER_BRANCHES_NOT_FOUND;
      message: "User branches not found";
      payload?: null;
    }
  : E extends typeof USER_EVENTS.USER_ENTITIES ? {
      event: typeof USER_EVENTS.USER_ENTITIES;
      message: "User entities";
      payload: UserEntities;
    }
  : never;
