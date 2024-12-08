export type InsertPayload<T> = {
  type: "INSERT";
  table: string;
  schema: string;
  record: T;
  old_record: null;
};
export type UpdatePayload<T> = {
  type: "UPDATE";
  table: string;
  schema: string;
  record: T;
  old_record: T;
};
export type DeletePayload<T> = {
  type: "DELETE";
  table: string;
  schema: string;
  record: null;
  old_record: T;
};

export const ERROR_TYPE = {
  WARNING: "WARNING",
  ERROR: "ERROR",
} as const;

export type ErrorResponse<T, U> = {
  event: T;
  message: null;
  error: {
    type: typeof ERROR_TYPE.ERROR;
    message: U;
  };
  payload: null;
};

export type SuccessResponse<T, U, V = null> = {
  event: T;
  message: U;
  error: null;
  payload: V;
};
