import { SupabaseClient } from "jsr:@supabase/supabase-js@2";
import { BaseRepository } from "../_shared/base-respository.ts";
import { Database, Enums } from "../types.ts";

export class DeviceRepository extends BaseRepository<"devices"> {
  constructor(supabase: SupabaseClient<Database>) {
    super(supabase, "devices");
  }

  getDeviceByAndroidId = async (
    androidId: string,
  ) => {
    const { data, error } = await this.table
      .select("id,status")
      .eq("android_id", androidId)
      .maybeSingle();

    if (error) {
      throw Error(error.message);
    }

    return data;
  };

  getCodeByAndroidId = async (
    androidId: string,
  ): Promise<string> => {
    const { data, error } = await this.supabase.rpc(
      "generate_and_update_code",
      { android_id: androidId },
    );

    if (error) {
      throw Error(error.message);
    }

    return data;
  };

  getDeviceByCode = async (code: string) => {
    const now = new Date().toISOString();

    const { data, error } = await this.table
      .select("id,status,code_exp")
      .eq("code_value", `${code}`)
      .gt("code_exp", now)
      .maybeSingle();

    if (error) {
      throw Error(error.message);
    }

    return data;
  };

  assignDeviceToBranch = (
    id: string,
    payload: {
      branch_id: string;
      organization_id: string;
      status: Enums<"device_status">;
      code_value: string | null;
      code_exp: string | null;
    },
  ) => {
    return this.update(id, { ...payload });
  };

  getDeviceByIdAndListId = async (
    id: string,
    listId: string,
  ) => {
    const { data, error } = await this.table
      .select("status")
      .eq("id", id)
      .eq("list_id", listId)
      .maybeSingle();

    if (error) {
      throw Error(error.message);
    }

    return data;
  };
}
