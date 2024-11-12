import { Module } from '@nestjs/common';
import { DevicesModule } from './devices/devices.module';
import { BranchesModule } from './branches/branches.module';
import { AdsModule } from './ads/ads.module';
import { ListsModule } from './lists/lists.module';
import { OrganizationsModule } from './organizations/organizations.module';


@Module({
  imports: [DevicesModule, AdsModule, OrganizationsModule, ListsModule, BranchesModule],
})
export class AppModule { }
