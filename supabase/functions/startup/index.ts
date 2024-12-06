import { Hono } from "jsr:@hono/hono";
import buildClient from "../_shared/supabase-client.ts";
import StartupService from "./service.ts";
import { errorHandler } from "../_shared/error-handling.ts";

const app = new Hono();

/**
 * This method should not be JWT protected
 */
app.get("/startup/:androidId", async (c) => {
  const supabaseClient = buildClient();
  const service = new StartupService(supabaseClient);

  const response = await service.startupByAndroidId(c.req.param("androidId"));

  return c.json(response);
});

app.onError(errorHandler);

Deno.serve(app.fetch);
