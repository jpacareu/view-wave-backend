import { SupabaseClient, User } from "jsr:@supabase/supabase-js@2";
import { BaseRepository } from "../_shared/base-respository.ts";
import { Database } from "../types.ts";

export class UserRepository extends BaseRepository<"users"> {
    constructor(supabase: SupabaseClient<Database>) {
        super(supabase, "users");
    }

    getUserFromToken = async (
        authorization: string,
    ): Promise<User> => {
        const token = authorization.replace("Bearer ", "");
        const { data, error } = await this.supabase.auth.getUser(token);

        if (error) {
            throw error;
        }

        return data.user;
    };

    getUserByEmail = async (
        email: string,
    ) => {
        const { data, error } = await this.supabase
            .from("users")
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
}
