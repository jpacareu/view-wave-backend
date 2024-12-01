import { Hono } from "jsr:@hono/hono";
import buildClient from "../_shared/supabase-client.ts";

const app = new Hono();

app.get("/lists/:deviceId", async (c) => {
  const deviceId = c.req.param("deviceId") ?? "";

  const token = c.req.header("Authorization") ?? "";

  const supabaseClient = buildClient({ token });

  return c.json({});
});

Deno.serve(app.fetch);
