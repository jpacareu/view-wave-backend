import { Hono } from "jsr:@hono/hono";
import buildClient from "../_shared/supabase-client.ts";
import DeviceService from "./service.ts";

const app = new Hono();

app.get("/branches/:branchId/devices", async (c) => {
  const branchId = c.req.param("branchId");

  const token = c.req.header("Authorization") ?? "";

  const supabaseClient = buildClient({
    global: {
      headers: {
        Authorization: token,
      },
    },
  });

  const service = new DeviceService(supabaseClient);

  const response = await service.getBranchDevices(branchId);

  return c.json(response);
});

Deno.serve(app.fetch);
