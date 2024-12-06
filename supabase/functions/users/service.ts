import { SupabaseClient } from "jsr:@supabase/supabase-js@2";
import { UserRepository } from "../_repositories/user.ts";
import { InsertPayload } from "../custom.types.ts";
import { USER_EVENTS, UserEventValue, UserResponseByEvent } from "./types.ts";

export default class UserService {
  private userRepository: UserRepository;

  constructor(supabaseClient: SupabaseClient) {
    this.userRepository = new UserRepository(supabaseClient);
  }

  createUser = async (
    body: InsertPayload<{
      id: string;
      email: string;
    }>,
  ) => {
    const { id, email } = body.record;

    await this.userRepository.create({
      id,
      email,
    });

    return this.getResponseByEvent(USER_EVENTS.USER_CREATED, {
      id,
      email,
    });
  };

  getUserEntities = async () => {
    const userEntities = await this.userRepository.getUserEntities();

    if (!userEntities) {
      return this.getResponseByEvent(USER_EVENTS.USER_HAS_NO_ENTITIES);
    }

    if (!userEntities.organization) {
      return this.getResponseByEvent(USER_EVENTS.USER_ORGANIZATION_NOT_FOUND);
    }

    if (!userEntities.branches?.length) {
      return this.getResponseByEvent(USER_EVENTS.USER_BRANCHES_NOT_FOUND);
    }

    return this.getResponseByEvent(USER_EVENTS.USER_ENTITIES, userEntities);
  };

  setActiveBranch = async (branchId: string) => {
    if (!branchId) {
      return this.getResponseByEvent(USER_EVENTS.USER_ACTIVE_BRANCH_INVALID);
    }

    await this.userRepository.setActiveBranch(
      branchId,
    );

    return this.getResponseByEvent(USER_EVENTS.USER_SET_ACTIVE_BRANCH, {
      branchId,
    });
  };

  getResponseByEvent = <E extends UserEventValue>(
    event: E,
    data: any = null,
  ): UserResponseByEvent<E> => {
    switch (event) {
      case USER_EVENTS.USER_CREATED:
        return {
          event,
          message: "User created",
          payload: {
            ...data,
          },
        } as UserResponseByEvent<E>;
      case USER_EVENTS.USER_HAS_NO_ENTITIES:
        return {
          event,
          message: "User has no entities",
          payload: {
            ...data,
          },
        } as UserResponseByEvent<E>;
      case USER_EVENTS.USER_ORGANIZATION_NOT_FOUND:
        return {
          event,
          message: "User organization not found",
          payload: {
            ...data,
          },
        } as UserResponseByEvent<E>;
      case USER_EVENTS.USER_BRANCHES_NOT_FOUND:
        return {
          event,
          message: "User branches not found",
          payload: {
            ...data,
          },
        } as UserResponseByEvent<E>;
      case USER_EVENTS.USER_ENTITIES:
        return {
          event,
          message: "User entities",
          payload: {
            ...data,
          },
        } as UserResponseByEvent<E>;
      case USER_EVENTS.USER_SET_ACTIVE_BRANCH:
        return {
          event,
          message: "User set active branch",
          payload: {
            ...data,
          },
        } as UserResponseByEvent<E>;

      case USER_EVENTS.USER_ACTIVE_BRANCH_INVALID:
        return {
          event,
          message: "Branch id is not valid",
          payload: {
            ...data,
          },
        } as UserResponseByEvent<E>;

      default:
        throw new Error(`Invalid event: ${event}`);
    }
  };
}
