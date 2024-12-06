import { Hono } from "jsr:@hono/hono";
import buildClient from "../_shared/supabase-client.ts";
import DeviceService from "./service.ts";
import { errorHandler } from "../_shared/error-handling.ts";

const app = new Hono();

app.get("/lists/:deviceId", async (c) => {
  const deviceId = c.req.param("deviceId") ?? "";

  const token = c.req.header("Authorization") ?? "";

  const supabaseClient = buildClient({ token });

  const service = new DeviceService(supabaseClient);

  const response = await service.deleteDevice(deviceId);

  return c.json(response);
});

app.onError(errorHandler);

Deno.serve(app.fetch);
