import {
  createClient,
  SupabaseClientOptions,
} from "jsr:@supabase/supabase-js@2";
import { Database } from "../types.ts";

const buildClient = ({ token } = { token: "" }) => {
  const options: SupabaseClientOptions<"public"> = {
    global: {
      headers: {
        Authorization: token,
      },
    },
  };

  const supabaseClient = createClient<Database>(
    Deno.env.get("SUPABASE_URL") ?? "",
    Deno.env.get("SUPABASE_ANON_KEY") ?? "",
    options,
  );

  return supabaseClient;
};

export default buildClient;
