import { Hono } from "jsr:@hono/hono";
import buildClient from "../_shared/supabase-client.ts";
import UserService from "./service.ts";

const app = new Hono();

app.post("/users", async (c) => {
  const newUser = await c.req.json();

  const supabaseClient = buildClient();

  const service = new UserService(supabaseClient);

  const response = await service.createUser(newUser);

  return c.json(response);
});

Deno.serve(app.fetch);
