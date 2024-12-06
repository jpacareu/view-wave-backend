import { HTTPException } from "https://deno.land/x/hono@v4.3.11/http-exception.ts";
import { ErrorHandler } from "jsr:@hono/hono/types";

/**
 * Handles errors by returning a JSON response with an error message and status.
 *
 * @param err - The error that occurred, which may be an instance of HTTPException.
 * @param c - The context object used to construct the JSON response.
 * @returns A JSON response containing the error event, message, and payload with status.
 */
export const errorHandler: ErrorHandler = (err, c) => {
  const message: string = err.message ??
    "Something went wrong, we are working on it";
  const cause = err instanceof HTTPException ? err.cause : "unknown";
  const status = err instanceof HTTPException ? err.status : 500;

  return c.json({
    event: "RESPONSE_ERROR",
    message: message,
    payload: {
      status,
      cause,
    },
  }, 200);
};
