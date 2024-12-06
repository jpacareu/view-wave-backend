import { Hono } from "jsr:@hono/hono";
import buildClient from "../_shared/supabase-client.ts";
import UserService from "./service.ts";
import { errorHandler } from "../_shared/error-handling.ts";

const app = new Hono();

app.get("users/entities", async (c) => {
  const token = c.req.header("Authorization") ?? "";

  const supabaseClient = buildClient({ token });

  const service = new UserService(supabaseClient);

  const response = await service.getUserEntities();

  return c.json(response);
});

// WIP
app.put("users/branches/activate", async (c) => {
  const token = c.req.header("Authorization") ?? "";
  const body = await c.req.json();

  const { branch_id: branchId } = body;

  const supabaseClient = buildClient({ token });

  const service = new UserService(supabaseClient);

  const response = await service.setActiveBranch(branchId);

  return c.json(response);
});

app.onError(errorHandler);

Deno.serve(app.fetch);
