import { User } from '../../users/entities/user.entity';

export class Content {

    id: string;

    createdAt: Date;

    mediaId: string;

    provider: string;

    user: User;
}
