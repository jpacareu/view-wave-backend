import { SupabaseClient } from "jsr:@supabase/supabase-js@2";
import { BranchRepository } from "../_repositories/branch.ts";
import { BaseService } from "../_shared/base-service.ts";
import {
  BRANCH_EVENTS,
  BranchErrorMessage,
  BranchErrorResponseByEvent,
  BranchEventError,
  BranchEventSuccess,
  BranchResponsePayload,
  BranchSuccessMessage,
  BranchSuccessResponseByEvent,
} from "./types.ts";
import { ERROR_TYPE } from "../custom.types.ts";

export default class BranchService extends BaseService<
  BranchSuccessResponseByEvent<BranchEventSuccess>,
  BranchErrorResponseByEvent<BranchEventError>
> {
  private branchRepository: BranchRepository;

  constructor(supabaseClient: SupabaseClient) {
    super();
    this.branchRepository = new BranchRepository(supabaseClient);
  }

  getBranchDevices = async (branchId: string) => {
    if (!branchId) {
      return this.getErrorResponse(BRANCH_EVENTS.ERROR.BRANCH_NOT_PRESENT);
    }

    const devices = await this.branchRepository.getBranchDevices(branchId);

    return this.getSuccessResponse(BRANCH_EVENTS.SUCCESS.BRANCH_DEVICES_LIST, {
      devices,
    });
  };

  getErrorResponse = (
    event: BranchEventError,
  ): BranchErrorResponseByEvent<BranchEventError> => {
    switch (event) {
      case BRANCH_EVENTS.ERROR.BRANCH_NOT_PRESENT:
        return {
          event,
          payload: null,
          message: null,
          error: {
            type: ERROR_TYPE.ERROR,
            message: this.getErrorMessages(event),
          },
        } as BranchErrorResponseByEvent<BranchEventError>;

      default:
        return this.assertNever(event);
    }
  };

  getSuccessResponse = (
    event: BranchEventSuccess,
    data: BranchResponsePayload,
  ): BranchSuccessResponseByEvent<BranchEventSuccess> => {
    switch (event) {
      case BRANCH_EVENTS.SUCCESS.BRANCH_DEVICES_LIST:
        return {
          event,
          error: null,
          message: this.getSuccessMessages(event),
          payload: {
            ...data,
          },
        } as BranchSuccessResponseByEvent<BranchEventSuccess>;

      default:
        return this.assertNever(event);
    }
  };

  getErrorMessages(event: BranchEventError): BranchErrorMessage {
    switch (event) {
      case BRANCH_EVENTS.ERROR.BRANCH_NOT_PRESENT:
        return "Branch id not valid";
    }
  }

  getSuccessMessages(event: BranchEventSuccess): BranchSuccessMessage {
    switch (event) {
      case BRANCH_EVENTS.SUCCESS.BRANCH_DEVICES_LIST:
        return "List of devices";
    }
  }
}
