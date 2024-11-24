import { SupabaseClient } from "jsr:@supabase/supabase-js@2";
import { BranchRepository } from "../_repositories/branch.ts";

export default class BranchService {
  private branchRepository: BranchRepository;

  constructor(supabaseClient: SupabaseClient) {
    this.branchRepository = new BranchRepository(supabaseClient);
  }

  getBranchDevices = async (branchId: string) => {
    if (!branchId) {
      this.getResponseByEvent("BRANCH_NOT_PRESENT");
    }

    const devices = await this.branchRepository.getBranchDevices(
      branchId,
    );

    return this.getResponseByEvent("BRANCH_DEVICES_LIST", { devices });
  };

  getResponseByEvent = (event: string, data?: any) => {
    switch (event) {
      case "BRANCH_NOT_PRESENT":
        return ({
          event: "BRANCH_NOT_PRESENT",
          payload: {
            message: "Branch id not valid",
            ...data,
          },
        });
      case "BRANCH_DEVICES_LIST":
        return ({
          event: "BRANCH_DEVICES_LIST",
          payload: {
            message: "List of devices",
            ...data,
          },
        });
      default:
        throw new Error("Event not found");
    }
  };
}
