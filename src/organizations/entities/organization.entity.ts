import { User } from '../../users/entities/user.entity';
import { Branch } from '../../branches/entities/branch.entity';

export class Organization {
    id: string;

    createdAt: Date;

    name: string;

    users: User[];

    branches: Branch[];
}
