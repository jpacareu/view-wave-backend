import { Hono } from "npm:hono";

import buildClient from "../_shared/supabase-client.ts";
import BranchService from "./service.ts";
import { errorHandler } from "../_shared/error-handling.ts";

const app = new Hono();

app.get("/branches/:branchId/devices", async (c) => {
  const branchId = c.req.param("branchId");

  const token = c.req.header("Authorization") ?? "";

  const supabaseClient = buildClient({ token });

  const service = new BranchService(supabaseClient);

  const response = await service.getBranchDevices(branchId);

  return c.json(response);
});

app.onError(errorHandler);

Deno.serve(app.fetch);
