import { SupabaseClient } from "jsr:@supabase/supabase-js@2";
import { BaseRepository } from "../_shared/base-respository.ts";
import { Database } from "../types.ts";
import { UserEntities } from "../users/types.ts";

export class UserRepository extends BaseRepository<"users"> {
  constructor(supabase: SupabaseClient<Database>) {
    super(supabase, "users");
  }

  getAuthUser = async () => {
    const { data, error } = await this.supabase.auth.getUser();

    if (error) {
      throw error;
    }

    return data.user;
  };

  getUserEntities = async () => {
    const { data, error } = await this.supabase
      .rpc("get_user_entities");

    if (error) {
      throw error;
    }

    return data as UserEntities;
  };

  getUserByEmail = async (
    email: string,
  ) => {
    const { data, error } = await this.table
      .select("id,email")
      .eq("email", email);

    if (error) {
      throw error;
    }

    return data;
  };

  getUserBranches = async (userId: string, branchId: string) => {
    const { data, error } = await this.supabase
      .from("users_branches")
      .select("*")
      .eq("user_id", userId)
      .eq("branch_id", branchId)
      .maybeSingle();

    if (error) {
      throw error;
    }

    return data;
  };

  setUserActiveBranch = async (
    branchId: string,
  ) => {
    const userResponse = await this.supabase.auth.getUser();

    if (userResponse.error) {
      throw userResponse.error;
    }

    const { id: userId } = userResponse.data.user;

    // update with rpc
    const { data, error } = await this.supabase
      .from("users_branches")
      .update({ is_active: true })
      .eq("user_id", userId)
      .eq("branch_id", branchId)
      .maybeSingle();

    if (error) {
      throw error;
    }

    return data;
  };
}
