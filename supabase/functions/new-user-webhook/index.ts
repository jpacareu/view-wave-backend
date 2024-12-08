import { Hono } from "npm:hono";
import buildClient from "../_shared/supabase-client.ts";
import UserService from "../users/service.ts";
import { errorHandler } from "../_shared/error-handling.ts";

const app = new Hono();

app.post("/new-user-webhook", async (c) => {
  const newUser = await c.req.json();

  const supabaseClient = buildClient();

  const service = new UserService(supabaseClient);

  const response = await service.createUser(newUser);

  return c.json(response);
});

app.onError(errorHandler);

Deno.serve(app.fetch);
