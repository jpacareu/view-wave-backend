import { Hono } from "jsr:@hono/hono";
import buildClient from "../_shared/supabase-client.ts";
import StartupService from "./service.ts";

const app = new Hono();

app.get("/startup/:androidId", async (c) => {
  const supabaseClient = buildClient();
  const service = new StartupService(supabaseClient);

  const device = await service.startupByAndroidId(c.req.param("androidId"));

  return c.json(device);
});

Deno.serve(app.fetch);
