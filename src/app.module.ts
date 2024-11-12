import { Module } from '@nestjs/common';

import { DevicesModule } from './devices/devices.module';
import { BranchesModule } from './branches/branches.module';
import { AdsModule } from './ads/ads.module';
import { ListsModule } from './lists/lists.module';
import { OrganizationsModule } from './organizations/organizations.module';
import { ContentsModule } from './contents/contents.module';
import { UsersModule } from './users/users.module';
import { ConfigModule } from '@nestjs/config';
import { SupabaseModule } from './supabase/supabase.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    DevicesModule,
    AdsModule,
    OrganizationsModule,
    ListsModule,
    BranchesModule,
    ContentsModule,
    UsersModule,
    SupabaseModule,
  ],
})
export class AppModule { }
