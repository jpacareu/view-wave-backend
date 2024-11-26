import { Hono } from "jsr:@hono/hono";
import buildClient from "../_shared/supabase-client.ts";
import DeviceService from "./service.ts";

const app = new Hono();

app.post("/devices/register", async (c) => {
  const token = c.req.header("Authorization") ?? "";

  const supabaseClient = buildClient({
    global: {
      headers: {
        Authorization: token,
      },
    },
  });

  const service = new DeviceService(supabaseClient);

  const body = await c.req.json();

  const response = await service.registerDeviceByCode(body);

  return c.json(response);
});

app.delete("/devices/:deviceId", async (c) => {
  const deviceId = c.req.param("deviceId") ?? "";

  const token = c.req.header("Authorization") ?? "";

  const supabaseClient = buildClient({
    global: {
      headers: {
        Authorization: token,
      },
    },
  });

  const service = new DeviceService(supabaseClient);

  const response = await service.deleteDevice(deviceId);

  return c.json(response);
});

Deno.serve(app.fetch);
