import { Injectable, Inject } from '@nestjs/common';
import { SupabaseClient } from '@supabase/supabase-js';

@Injectable()
export class SupabaseService {
  constructor(
    @Inject('SUPABASE_CLIENT') private readonly supabase: SupabaseClient,
  ) { }

  async findAll(table: string) {
    const { data, error } = await this.supabase.from(table).select('*');
    if (error) throw error;
    return data;
  }

  async findById(table: string, id: string) {
    const { data, error } = await this.supabase
      .from(table)
      .select('*')
      .eq('id', id)
      .single();
    if (error) throw error;
    return data;
  }

  async create(table: string, record: any) {
    const { data, error } = await this.supabase.from(table).insert(record);
    if (error) throw error;
    return data;
  }

  async update(table: string, id: string, record: any) {
    const { data, error } = await this.supabase
      .from(table)
      .update(record)
      .eq('id', id);
    if (error) throw error;
    return data;
  }

  async delete(table: string, id: string) {
    const { data, error } = await this.supabase.from(table).delete().eq('id', id);
    if (error) throw error;
    return data;
  }
}
