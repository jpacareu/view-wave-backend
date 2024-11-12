// src/lists/list.entity.ts
import { Device } from '../../devices/entities/device.entity';

export class List {

    id: string;

    createdAt: Date;

    name: string;

    content: string;

    device: Device;
}
