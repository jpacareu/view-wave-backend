import { SupabaseClient } from "jsr:@supabase/supabase-js@2";
import { BaseRepository } from "../_shared/base-respository.ts";
import { Database } from "../types.ts";

export class BranchRepository extends BaseRepository<"branches"> {
    constructor(supabase: SupabaseClient<Database>) {
        super(supabase, "branches");
    }

    getOrganizationByBranchId = async (id: string) => {
        const { data, error } = await this.supabase
            .from("branches")
            .select("organization_id")
            .eq("id", id)
            .maybeSingle();

        if (error) {
            throw error;
        }

        return data;
    };
}
