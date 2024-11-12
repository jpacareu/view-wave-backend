import { Branch } from '../../branches/entities/branch.entity';

export class Ad {
    id: string;

    createdAt: Date;

    name: string;

    mediaId: string;

    provider: string;

    branch: Branch;
}
