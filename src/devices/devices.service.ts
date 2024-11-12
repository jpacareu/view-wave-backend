import { Injectable } from '@nestjs/common';
import { CreateDeviceDto } from './dto/create-device.dto';
import { UpdateDeviceDto } from './dto/update-device.dto';
import { InjectRepository } from '@nestjs/typeorm';

import { Device } from './entities/device.entity';
import { SupabaseService } from 'src/supabase/supabase.service';

@Injectable()
export class DevicesService {
  private readonly table = 'devices';

  constructor(private readonly supabaseService: SupabaseService) { }

  create(createDeviceDto: CreateDeviceDto) {
    return this.supabaseService.create(this.table, createDeviceDto)
  }

  findAll() {
    return this.supabaseService.findAll(this.table)
  }

  findOne(id: number) {
    return this.supabaseService.findById(this.table, id.toString())
  }

  update(id: number, updateDeviceDto: UpdateDeviceDto) {
    return this.supabaseService.update(this.table, id.toString(), updateDeviceDto)
  }

  remove(id: number) {
    return this.supabaseService.delete(this.table, id.toString())
  }

  // async registerDevice(deviceId: string): Promise<any> {
  //   const device = await Promise.resolve({
  //     id: deviceId,
  //     name: 'Device 1',
  //   } as Device)

  //   if (!device) {
  //     throw new Error('Device not found');
  //   }

  //   const qrData = {
  //     deviceId: device.id,
  //     registeredAt: new Date().toISOString(),
  //   };

  //   const qrJson = JSON.stringify(qrData);

  //   // 4. Retornar el dispositivo y el QR
  //   return {
  //     deviceId: device.id,
  //     name: device.name,
  //     qr: qrJson,
  //   };
  // }
}
