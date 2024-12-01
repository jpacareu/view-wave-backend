import { Hono } from "jsr:@hono/hono";
import buildClient from "../_shared/supabase-client.ts";
import UserService from "./service.ts";

const app = new Hono();

app.get("users/entities", async (c) => {
  const token = c.req.header("Authorization") ?? "";

  const supabaseClient = buildClient({ token });

  const service = new UserService(supabaseClient);

  const response = await service.getUserEntities();

  return c.json(response);
});

Deno.serve(app.fetch);
