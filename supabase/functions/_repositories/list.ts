import { SupabaseClient } from "jsr:@supabase/supabase-js@2";
import { BaseRepository } from "../_shared/base-respository.ts";
import { Database, Enums } from "../types.ts";

export class ListRepository extends BaseRepository<"lists"> {
  constructor(supabase: SupabaseClient<Database>) {
    super(supabase, "lists");
  }

  getListsByBranchId = async (
    branchId: string,
  ) => {
    const { data, error } = await this.table
      .select("id,content")
      .eq("branch_id", branchId);

    if (error) {
      throw error;
    }

    return data;
  };

  getListByDeviceId = async (
    deviceId: string,
  ) => {
    const { data, error } = await this.table
      .select("id,status")
      .eq("device_id", deviceId)
      .maybeSingle();

    if (error) {
      throw error;
    }

    return data;
  };
}
