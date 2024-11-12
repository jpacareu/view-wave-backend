import { Organization } from '../../organizations/entities/organization.entity';
import { Ad } from '../../ads/entities/ad.entity';
import { Device } from '../../devices/entities/device.entity';

export class Branch {
    id: string;

    createdAt: Date;

    organizationId: string;

    organization: Organization;

    ads: Ad[];

    devices: Device[];
}
