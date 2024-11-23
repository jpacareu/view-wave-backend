import { SupabaseClient } from "jsr:@supabase/supabase-js@2";
import { Database } from "../types.ts";

type TableName = keyof Database["public"]["Tables"];

export abstract class BaseRepository<T extends TableName> {
    protected supabase: SupabaseClient<Database>;
    protected table: T;

    constructor(supabaseClient: SupabaseClient, tableName: T) {
        this.supabase = supabaseClient;
        this.table = tableName;
    }

    // Retrieve all records
    async getAll() {
        const { data, error } = await this.supabase.from(
            this.table,
        ).select(
            "*",
        );
        if (error) throw new Error(error.message);
        return data || [];
    }

    // Retrieve a single record by its ID
    async getById(id: string) {
        const { data, error } = await this.supabase
            .from(this.table)
            .select("*")
            .eq("id", id)
            .maybeSingle();

        if (error) {
            if (error.message === "Row not found") return null;
            throw new Error(error.message);
        }
        return data;
    }

    // Create a new record
    async create(item: any) {
        const { data, error } = await this.supabase.from(this.table).insert(
            item,
        ).maybeSingle();
        if (error) throw new Error(error.message);
        return data;
    }

    // Update an existing record
    async update(id: string, updates: any) {
        const { data, error } = await this.supabase
            .from(this.table)
            .update(updates)
            .eq("id", id)
            .maybeSingle();
        if (error) throw new Error(error.message);
        return data;
    }

    // Delete a record by its ID
    async delete(id: string) {
        const { error } = await this.supabase.from(this.table).delete().eq(
            "id",
            id,
        );
        if (error) throw new Error(error.message);
        return true;
    }
}
