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

  getResponseByEvent = (event: string, data?: any) => {
    switch (event) {
      case "USER_CRETED":
        return ({
          event: "USER_CRETED",
          payload: {
            message: "User created",
            ...data,
          },
        });
    }
  };
}
