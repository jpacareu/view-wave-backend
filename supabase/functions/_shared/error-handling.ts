import { BlankEnv } from "jsr:@hono/hono/types";
import { ErrorHandler } from "npm:hono";
import * as Sentry from "npm:@sentry/deno";

Sentry.init({
  dsn: Deno.env.get("SENTRY_DSN"),
  tracesSampleRate: 1.0,
  integrations: [],
});

Sentry.setTag("region", Deno.env.get("SB_REGION"));
Sentry.setTag("execution_id", Deno.env.get("SB_EXECUTION_ID"));

/**
 * Handles errors by returning a JSON response with an error message and status.
 *
 * @param err - The error that occurred, which may be an instance of HTTPException.
 * @param c - The context object used to construct the JSON response.
 * @returns A JSON response containing the error event, message, and payload with status.
 */
export const errorHandler: ErrorHandler<BlankEnv> = (e, c) => {
  Sentry.captureException(e);

  return c.json({
    event: "RESPONSE_ERROR",
    error: {
      type: "ERROR",
      message: "Something went wrong, we are working on it",
    },
    payload: null,
  }, 200);
};
