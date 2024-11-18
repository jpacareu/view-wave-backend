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
    ): Promise<number> => {
        const { data, error } = await this.supabase.rpc(
            "generate_and_update_code",
            { android_id: androidId },
        );

        if (error) {
            throw error;
        }

        return data;
    };
}
