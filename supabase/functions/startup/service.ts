import { SupabaseClient } from "jsr:@supabase/supabase-js@2";
import { DeviceRepository } from "../_repositories/device.ts";
import { DEVICE_STATUS } from "../_shared/constants.ts";

export default class StartupService {
    private repository: DeviceRepository;

    constructor(supabaseClient: SupabaseClient) {
        this.repository = new DeviceRepository(supabaseClient);
    }

    startupByAndroidId = async (androidId: string) => {
        const device = await this.repository.getDeviceByAndroidId(androidId);

        if (!device?.length) {
            return ({
                event: "DEVICE_NOT_FOUND",
                payload: {
                    message:
                        "Device not found, support has been informed about it and is taking care of it, as soon as posible",
                },
            });
        }

        const [deviceData] = device;

        if (deviceData.status === DEVICE_STATUS.ASSIGNED) {
            return ({
                event: "CONTINUE",
                payload: {
                    message: "Device is assigned",
                    list: [
                        // TODO: Add use case for these videos
                        {
                            title: "Video 1",
                            url: "https://www.youtube.com/watch?v=vdPP1_jveeQ",
                        },
                        {
                            title: "Video 2",
                            url: "https://www.youtube.com/watch?v=IZzeLnaygME",
                        },
                    ],
                },
            });
        }

        const code = await this.repository.getCodeByAndroidId(androidId);

        return ({
            event: "STARTUP",
            payload: {
                message: "Please enter the code or scan the QR to continue",
                code, // TODO: Transform this to a QR on Client
            },
        });
    };
}
