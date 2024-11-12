import { Branch } from '../../branches/entities/branch.entity';
import { List } from '../../lists/entities/list.entity';

export class Device {
    id: string;

    createdAt: Date;

    name: string;

    androidId: string;

    branch: Branch;

    list: List;
}