import { SupabaseClient } from "jsr:@supabase/supabase-js@2";
import { BaseRepository } from "../_shared/base-respository.ts";
import { Database } from "../types.ts";

export class DeviceRepository extends BaseRepository<"devices"> {
    constructor(supabase: SupabaseClient<Database>) {
        super(supabase, "devices");
    }

    getDeviceByAndroidId = async (
        androidId: string,
    ) => {
        const { data, error } = await this.supabase
            .from("devices")
            .select("id,status")
            .eq("android_id", androidId);

        if (error) {
            throw error;
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
            throw error;
        }

        return data;
    };

    getDeviceByCode = async (code: string) => {
        const now = new Date().toISOString();
        
        const { data, error } = await this.supabase
            .from("devices")
            .select("id,status,code_exp")
            .eq("code_value", `${code}`)
            .gt("code_exp", now)
            .maybeSingle();

        if (error) {
            throw error;
        }

        return data;
    };
}
