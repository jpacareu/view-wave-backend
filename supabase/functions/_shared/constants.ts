import type { Enums } from "../types.ts";

type DeviceStatus = Uppercase<Enums<"device_status">>;

type DeviceStatusMap = {
    [K in DeviceStatus]: Lowercase<K>;
};

export const DEVICE_STATUS: DeviceStatusMap = {
    INITIALIZED: "initialized",
    BOOTED: "booted",
    ASSIGNED: "assigned",
};
