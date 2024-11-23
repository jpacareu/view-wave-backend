import { SupabaseClient } from "jsr:@supabase/supabase-js@2";
import { DeviceRepository } from "../_repositories/device.ts";
import { UserRepository } from "../_repositories/user.ts";
import { BranchRepository } from "../_repositories/branch.ts";
import { DEVICE_STATUS } from "../_shared/constants.ts";

export default class RegisterService {
    private deviceRepository: DeviceRepository;
    private userRepository: UserRepository;
    private branchRepository: BranchRepository;

    constructor(supabaseClient: SupabaseClient) {
        this.deviceRepository = new DeviceRepository(supabaseClient);
        this.userRepository = new UserRepository(supabaseClient);
        this.branchRepository = new BranchRepository(supabaseClient);
    }

    registerByCode = async (body: {
        code: string;
        branch_id: string;
    }, token: string) => {
        const { code, branch_id: branchId } = body;
        if (!code) {
            return this.getResponseByEvent("CODE_NOT_FOUND");
        }

        if (!branchId) {
            return this.getResponseByEvent("BRANCH_ID_NOT_FOUND");
        }

        const device = await this.deviceRepository.getDeviceByCode(
            code,
        );

        if (!device) {
            return this.getResponseByEvent("DEVICE_NOT_FOUND");
        }

        if (device.status === DEVICE_STATUS.ASSIGNED) {
            return this.getResponseByEvent("DEVICE_ALREADY_ASSIGNED");
        }

        const user = await this.userRepository.getUserFromToken(
            token,
        );

        const hasBranch = await this.userRepository.getUserBranches(
            user.id,
            branchId,
        );

        if (!hasBranch) {
            return this.getResponseByEvent("BRANCH_NOT_FOUND");
        }

        const organization = await this.branchRepository
            .getOrganizationByBranchId(
                branchId,
            );

        if (!organization) {
            return this.getResponseByEvent("ORGANIZATION_NOT_FOUND");
        }

        await this.deviceRepository.update(device.id, {
            status: DEVICE_STATUS.ASSIGNED,
            organization_id: organization.organization_id,
            branch_id: branchId,
        });

        return ({
            event: "DEVICE_FOUND",
            payload: {
                message: "Device found",
                device,
            },
        });
    };

    getResponseByEvent = (event: string) => {
        switch (event) {
            case "CODE_NOT_FOUND":
                return ({
                    event: "CODE_NOT_FOUND",
                    payload: {
                        message: "Code not valid, please provide a valid code",
                    },
                });
            case "BRANCH_NOT_FOUND":
                return ({
                    event: "BRANCH_NOT_FOUND",
                    payload: {
                        message:
                            "Branch not valid, please provide a valid branch",
                    },
                });
            case "DEVICE_FOUND":
                return ({
                    event: "DEVICE_FOUND",
                    payload: {
                        message: "Device found",
                    },
                });
            case "DEVICE_NOT_FOUND":
                return ({
                    event: "DEVICE_NOT_FOUND",
                    payload: {
                        message: "Device not found for that code value",
                    },
                });

            case "ORGANIZATION_NOT_FOUND":
                return ({
                    event: "ORGANIZATION_NOT_FOUND",
                    payload: {
                        message: "Organization not found for that branch",
                    },
                });
            case "DEVICE_ALREADY_ASSIGNED":
                return ({
                    event: "DEVICE_ALREADY_ASSIGNED",
                    payload: {
                        message: "This device is already assigned",
                    },
                });
            default:
                throw new Error("Event not found");
        }
    };
}