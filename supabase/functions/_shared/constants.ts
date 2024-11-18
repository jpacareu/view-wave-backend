import type { Enums } from "../types.ts";

export const DEVICE_STATUS: Record<
    Uppercase<Enums<"device_status">>,
    Enums<"device_status">
> = {
    INITIALIZED: "initialized",
    BOOTED: "booted",
    ASSIGNED: "assigned",
};
