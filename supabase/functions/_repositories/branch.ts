import { SupabaseClient } from "jsr:@supabase/supabase-js@2";
import { BaseRepository } from "../_shared/base-respository.ts";
import { Database } from "../types.ts";

export class BranchRepository extends BaseRepository<"branches"> {
  constructor(supabase: SupabaseClient<Database>) {
    super(supabase, "branches");
  }

  getOrganizationByBranchId = async (id: string) => {
    const { data, error } = await this.table
      .select("organization_id")
      .eq("id", id)
      .maybeSingle();

    if (error) {
      throw error;
    }

    return data;
  };

  getBranchDevices = async (branchId: string) => {
    const { data, error } = await this.supabase.rpc(
      "get_branch_devices",
      {
        branch_id: branchId,
      },
    );

    if (error) {
      throw error;
    }

    return data;
  };

  getBranchLists = async (branchId: string) => {
    const { data, error } = await this.supabase.rpc(
      "get_branch_lists",
      {
        branch_ids: branchId,
      },
    );
}
