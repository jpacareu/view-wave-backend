import { SupabaseClient } from "jsr:@supabase/supabase-js@2";
import { UserRepository } from "../_repositories/user.ts";
import { InsertPayload } from "../types.custom.ts";

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

    return this.getResponseByEvent("USER_CRETED", {
      id,
      email,
    });
  };

  getUserEntities = async () => {
    const userEntities = await this.userRepository.getUserEntities();

    if (!userEntities) {
      return this.getResponseByEvent("USER_NOT_FOUND");
    }

    if (!userEntities.organization) {
      return this.getResponseByEvent("USER_ORGANIZATION_NOT_FOUND");
    }

    if (!userEntities.branches) {
      return this.getResponseByEvent("USER_BRANCHES_NOT_FOUND");
    }

    return this.getResponseByEvent("USER_ENTITIES", userEntities);
  };

  getResponseByEvent = (event: string, data?: any) => {
    switch (event) {
      case "USER_NOT_FOUND":
        return ({
          event: "USER_NOT_FOUND",
          payload: {
            message: "User created",
            ...data,
          },
        });
      case "USER_ORGANIZATION_NOT_FOUND":
        return ({
          event: "USER_ORGANIZATION_NOT_FOUND",
          payload: {
            message: "User organization not found",
            ...data,
          },
        });

      case "USER_BRANCHES_NOT_FOUND":
        return ({
          event: "USER_BRANCHES_NOT_FOUND",
          payload: {
            message: "User branches not found",
            ...data,
          },
        });
      case "USER_ENTITIES":
        return ({
          event: "USER_ENTITIES",
          payload: {
            message: "User entities",
            ...data,
          },
        });
      default:
        throw new Error(`Invalid event: ${event}`);
    }
  };
}
