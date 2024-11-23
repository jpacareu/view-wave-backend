import { SupabaseClient } from "jsr:@supabase/supabase-js@2";
import { BaseRepository } from "../_shared/base-respository.ts";
import { Database } from "../types.ts";

export class OrganizationRepository extends BaseRepository<"organizations"> {
    constructor(supabase: SupabaseClient<Database>) {
        super(supabase, "organizations");
    }

    getOrganizationById = async (id: string) => {
        const { data, error } = await this.supabase
            .from("organizations")
            .select("id,name")
            .eq("id", id)
            .maybeSingle();

        if (error) {
            throw error;
        }

        return data;
    };
}
