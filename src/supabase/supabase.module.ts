import { Module, Global } from '@nestjs/common';
import { SupabaseService } from './supabase.service';
import { createClient } from '@supabase/supabase-js';

@Global()
@Module({
  providers: [
    {
      provide: 'SUPABASE_CLIENT',
      useFactory: () => {
        const supabaseUrl = process.env.SUPABASE_URL;
        const supabaseKey = process.env.SUPABASE_ANON_KEY;
        return createClient(supabaseUrl, supabaseKey);
      },
    },
    SupabaseService,
  ],
  exports: [SupabaseService],
})
export class SupabaseModule { }
