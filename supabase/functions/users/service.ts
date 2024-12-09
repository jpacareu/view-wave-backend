import { SupabaseClient } from "jsr:@supabase/supabase-js@2";
import { UserRepository } from "../_repositories/user.ts";
import { ERROR_TYPE, InsertPayload } from "../custom.types.ts";
import { BaseService } from "../_shared/base-service.ts";
import {
  USER_EVENTS,
  UserErrorMessage,
  UserErrorResponseByEvent,
  UserEventError,
  UserEventSuccess,
  UserResponsePayload,
  UserSuccessMessage,
  UserSuccessResponseByEvent,
} from "./types.ts";

export default class UserService extends BaseService<
  UserSuccessResponseByEvent<UserEventSuccess>,
  UserErrorResponseByEvent<UserEventError>
> {
  private userRepository: UserRepository;

  constructor(supabaseClient: SupabaseClient) {
    super();
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

    return this.getSuccessResponse(USER_EVENTS.SUCCESS.USER_CREATED, {
      id,
      email,
    });
  };

  getUserEntities = async () => {
    const userEntities = await this.userRepository.getUserEntities();

    if (!userEntities) {
      return this.getErrorResponse(USER_EVENTS.ERROR.USER_HAS_NO_ENTITIES);
    }

    if (!userEntities.organization) {
      return this.getErrorResponse(
        USER_EVENTS.ERROR.USER_ORGANIZATION_NOT_FOUND,
      );
    }

    if (!userEntities.branches?.length) {
      return this.getErrorResponse(USER_EVENTS.ERROR.USER_BRANCHES_NOT_FOUND);
    }

    // Set active branch using active_branch id
    userEntities.branches.forEach((branch) => {
      branch.is_active = branch.id === userEntities.active_branch;
    });

    return this.getSuccessResponse(
      USER_EVENTS.SUCCESS.USER_ENTITIES,
      userEntities,
    );
  };

  setActiveBranch = async (branchId: string) => {
    if (!branchId) {
      return this.getErrorResponse(
        USER_EVENTS.ERROR.USER_ACTIVE_BRANCH_INVALID,
      );
    }

    await this.userRepository.setActiveBranch(
      branchId,
    );

    return this.getSuccessResponse(USER_EVENTS.SUCCESS.USER_SET_ACTIVE_BRANCH, {
      branch_id: branchId,
    });
  };

  getErrorResponse = <E extends UserEventError>(
    event: E,
  ): UserErrorResponseByEvent<E> => {
    switch (event) {
      // Error
      case USER_EVENTS.ERROR.USER_HAS_NO_ENTITIES:
      case USER_EVENTS.ERROR.USER_ORGANIZATION_NOT_FOUND:
      case USER_EVENTS.ERROR.USER_BRANCHES_NOT_FOUND:
      case USER_EVENTS.ERROR.USER_ACTIVE_BRANCH_INVALID:
        return {
          event,
          payload: null,
          message: null,
          error: {
            type: ERROR_TYPE.ERROR,
            message: this.getErrorMessages(event),
          },
        } as UserErrorResponseByEvent<E>;

      default:
        return this.assertNever(event);
    }
  };

  getSuccessResponse = <E extends UserEventSuccess>(
    event: E,
    data: UserResponsePayload,
  ): UserSuccessResponseByEvent<E> => {
    switch (event) {
      case USER_EVENTS.SUCCESS.USER_CREATED:
      case USER_EVENTS.SUCCESS.USER_ENTITIES:
      case USER_EVENTS.SUCCESS.USER_SET_ACTIVE_BRANCH:
        return {
          event,
          error: null,
          message: this.getSuccessMessages(event),
          payload: {
            ...data,
          },
        } as UserSuccessResponseByEvent<E>;

      default:
        return this.assertNever(event);
    }
  };

  getErrorMessages(event: UserEventError): UserErrorMessage {
    switch (event) {
      case USER_EVENTS.ERROR.USER_HAS_NO_ENTITIES:
        return "User has no entities";
      case USER_EVENTS.ERROR.USER_ORGANIZATION_NOT_FOUND:
        return "User organization not found";
      case USER_EVENTS.ERROR.USER_BRANCHES_NOT_FOUND:
        return "User branches not found";
      case USER_EVENTS.ERROR.USER_ACTIVE_BRANCH_INVALID:
        return "Branch id is not valid";
    }
  }

  getSuccessMessages(event: UserEventSuccess): UserSuccessMessage {
    switch (event) {
      case USER_EVENTS.SUCCESS.USER_CREATED:
        return "User created successfully";
      case USER_EVENTS.SUCCESS.USER_ENTITIES:
        return "";
      case USER_EVENTS.SUCCESS.USER_SET_ACTIVE_BRANCH:
        return "Branch changed";
    }
  }
}
