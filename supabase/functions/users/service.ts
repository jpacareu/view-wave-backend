import { SupabaseClient } from "jsr:@supabase/supabase-js@2";
import { UserRepository } from "../_repositories/user.ts";
import { InsertPayload } from "../custom.types.ts";
import { ResponseDto } from "../dto.types.ts";
import {
  ResponseUserCreated,
  USER_EVENTS,
  UserEvent,
  UserPayload,
} from "./types.ts";

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
  ): Promise<ResponseUserCreated> => {
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
      return this.getResponseByEvent("USER_HAS_NO_ENTITIES");
    }

    if (!userEntities.organization) {
      return this.getResponseByEvent("USER_ORGANIZATION_NOT_FOUND");
    }

    if (!userEntities.branches?.length) {
      return this.getResponseByEvent("USER_BRANCHES_NOT_FOUND");
    }

    return this.getResponseByEvent("USER_ENTITIES", userEntities);
  };

  getResponseByEvent = (event: string, data?: any) => {
    switch (event) {
      case "USER_CREATED":
        return ({
          event: "USER_CREATED",
          message: "User created",
          payload: {
            ...data,
          },
        });
      case "USER_HAS_NO_ENTITIES":
        return ({
          event: "USER_HAS_NO_ENTITIES",
          message: "User has no entities",
          payload: {
            ...data,
          },
        });
      case "USER_ORGANIZATION_NOT_FOUND":
        return ({
          event: "USER_ORGANIZATION_NOT_FOUND",
          message: "User organization not found",
          payload: {
            ...data,
          },
        });

      case "USER_BRANCHES_NOT_FOUND":
        return ({
          event: "USER_BRANCHES_NOT_FOUND",
          message: "User branches not found",
          payload: {
            ...data,
          },
        });
      case "USER_ENTITIES":
        return ({
          event: "USER_ENTITIES",
          message: "User entities",
          payload: {
            ...data,
          },
        });
      default:
        throw new Error(`Invalid event: ${event}`);
    }
  };
}
