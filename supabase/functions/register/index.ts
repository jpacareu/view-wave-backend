import { Hono } from "jsr:@hono/hono";
import buildClient from "../_shared/supabase-client.ts";
import RegisterService from "./service.ts";

const app = new Hono();

app.put("/register", async (c) => {
  const token = c.req.header("Authorization") ?? "";

  const supabaseClient = buildClient({
    global: {
      headers: {
        Authorization: token,
      },
    },
  });

  const service = new RegisterService(supabaseClient);

  const body = await c.req.json();

  const response = await service.registerByCode(body, token);

  return c.json(response);
});

Deno.serve(app.fetch);
