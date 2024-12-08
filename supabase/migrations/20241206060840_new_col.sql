

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


CREATE EXTENSION IF NOT EXISTS "pg_net" WITH SCHEMA "extensions";






CREATE SCHEMA IF NOT EXISTS "pgmq";


ALTER SCHEMA "pgmq" OWNER TO "postgres";


CREATE EXTENSION IF NOT EXISTS "pgsodium" WITH SCHEMA "pgsodium";






COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";






CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgjwt" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";






CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";






CREATE TYPE "public"."category" AS ENUM (
    'dentist',
    'hair_salon',
    'cuban_restaurant'
);


ALTER TYPE "public"."category" OWNER TO "postgres";


CREATE TYPE "public"."device_status" AS ENUM (
    'initialized',
    'assigned',
    'booted'
);


ALTER TYPE "public"."device_status" OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."generate_and_update_code"("android_id" "text") RETURNS "text"
    LANGUAGE "plpgsql"
    SET "search_path" TO 'public', 'pg_temp'
    AS $$DECLARE
    code INTEGER;
    exists BOOLEAN;
    attempt_count INTEGER := 0;  -- Initialize the attempt counter
    max_attempts INTEGER := 1000;  -- Set a reasonable limit for attempts
BEGIN
    LOOP
        -- Increment the attempt counter
        attempt_count := attempt_count + 1;

        -- Check if the maximum number of attempts has been reached
        IF attempt_count > max_attempts THEN
            RAISE EXCEPTION 'Unable to generate a unique code after % attempts', max_attempts;
        END IF;

        -- Generate a random 5-digit number
        code := floor(random() * 90000 + 10000)::INTEGER;

        -- Check if the code already exists in the devices table
        SELECT EXISTS(SELECT 1 FROM devices WHERE code_value = code::TEXT) INTO exists;

        -- If it does not exist, exit the loop
        IF NOT exists THEN
            EXIT;
        END IF;
    END LOOP;

    -- Update the devices table
    UPDATE devices
    SET code_value = code::TEXT,                 -- Set the generated code
        code_exp = NOW() + INTERVAL '3 hours'  -- Set expiration time to current time + 3 hours
    WHERE devices.android_id = generate_and_update_code.android_id; -- Reference the input parameter android_id

    RETURN code;

END;$$;


ALTER FUNCTION "public"."generate_and_update_code"("android_id" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_branch_devices"("branch_id" "uuid") RETURNS TABLE("id" "uuid", "name" "text", "list_id" "uuid")
    LANGUAGE "plpgsql"
    AS $$
BEGIN
    RETURN QUERY
    SELECT d.id, d.name, d.list_id
    FROM devices d
    JOIN branches b ON b.id = d.branch_id
    JOIN users u ON u.organization_id = b.organization_id
    WHERE b.id = get_branch_devices.branch_id
      AND b.organization_id = d.organization_id
      AND b.organization_id = u.organization_id
      AND u.id = auth.uid();
END;
$$;


ALTER FUNCTION "public"."get_branch_devices"("branch_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."get_user_entities"() RETURNS "jsonb"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
    RETURN (
        SELECT jsonb_build_object(
            'organization', jsonb_build_object(
                'id', b.organization_id,
                'name', o.name,
                'category', o.category
            ),
            'branches', jsonb_agg(
                jsonb_build_object(
                    'id', b.id,
                    'name', b.name,
                    'category', b.category
                )
            )
        )
        FROM branches b
        INNER JOIN users_branches ub ON b.id = ub.branch_id
        INNER JOIN organizations o ON b.organization_id = o.id
        WHERE ub.user_id = auth.uid()
        GROUP BY b.organization_id, o.name, o.category
    );
END;
$$;


ALTER FUNCTION "public"."get_user_entities"() OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."ads" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "name" "text",
    "media_id" "text",
    "provider" "text",
    "branch_id" "uuid" DEFAULT "gen_random_uuid"()
);


ALTER TABLE "public"."ads" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."branches" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "organization_id" "uuid",
    "name" "text",
    "places_id" "text",
    "category" "public"."category" DEFAULT 'dentist'::"public"."category"
);


ALTER TABLE "public"."branches" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."contents" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "media_id" "text",
    "provider" "text",
    "user_id" "uuid" DEFAULT "gen_random_uuid"()
);


ALTER TABLE "public"."contents" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."devices" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "name" "text",
    "android_id" "text",
    "branch_id" "uuid",
    "list_id" "uuid",
    "status" "public"."device_status" DEFAULT 'initialized'::"public"."device_status",
    "code_value" "text",
    "code_exp" timestamp with time zone,
    "organization_id" "uuid"
);


ALTER TABLE "public"."devices" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."lists" (
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "name" "text",
    "content" "text"[],
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "branch_id" "uuid" DEFAULT "gen_random_uuid"(),
    "organization_id" "uuid" DEFAULT "gen_random_uuid"()
);


ALTER TABLE "public"."lists" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."organizations" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "name" "text",
    "category" "text"
);


ALTER TABLE "public"."organizations" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."users" (
    "id" "uuid" DEFAULT "auth"."uid"() NOT NULL,
    "organization_id" "uuid",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "name" "text",
    "email" "text"
);


ALTER TABLE "public"."users" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."users_branches" (
    "user_id" "uuid" NOT NULL,
    "branch_id" "uuid" NOT NULL,
    "is_active" boolean
);


ALTER TABLE "public"."users_branches" OWNER TO "postgres";


ALTER TABLE ONLY "public"."ads"
    ADD CONSTRAINT "ads_id_key" UNIQUE ("id");



ALTER TABLE ONLY "public"."ads"
    ADD CONSTRAINT "ads_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."branches"
    ADD CONSTRAINT "branches_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."contents"
    ADD CONSTRAINT "contents_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."devices"
    ADD CONSTRAINT "devices_code_value_key" UNIQUE ("code_value");



ALTER TABLE ONLY "public"."devices"
    ADD CONSTRAINT "devices_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."lists"
    ADD CONSTRAINT "lists_id_key" UNIQUE ("id");



ALTER TABLE ONLY "public"."lists"
    ADD CONSTRAINT "lists_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."organizations"
    ADD CONSTRAINT "organizations_id_key" UNIQUE ("id");



ALTER TABLE ONLY "public"."organizations"
    ADD CONSTRAINT "organizations_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "profiles_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."users_branches"
    ADD CONSTRAINT "users_branches_pkey" PRIMARY KEY ("user_id", "branch_id");



ALTER TABLE ONLY "public"."ads"
    ADD CONSTRAINT "ads_branch_id_fkey" FOREIGN KEY ("branch_id") REFERENCES "public"."branches"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."branches"
    ADD CONSTRAINT "branches_organization_id_fkey" FOREIGN KEY ("organization_id") REFERENCES "public"."organizations"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."contents"
    ADD CONSTRAINT "contents_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."devices"
    ADD CONSTRAINT "devices_branch_id_fkey" FOREIGN KEY ("branch_id") REFERENCES "public"."branches"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."devices"
    ADD CONSTRAINT "devices_list_id_fkey" FOREIGN KEY ("list_id") REFERENCES "public"."lists"("id") ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ONLY "public"."devices"
    ADD CONSTRAINT "devices_organization_id_fkey" FOREIGN KEY ("organization_id") REFERENCES "public"."organizations"("id");



ALTER TABLE ONLY "public"."lists"
    ADD CONSTRAINT "lists_branch_id_fkey" FOREIGN KEY ("branch_id") REFERENCES "public"."branches"("id");



ALTER TABLE ONLY "public"."lists"
    ADD CONSTRAINT "lists_organization_id_fkey" FOREIGN KEY ("organization_id") REFERENCES "public"."organizations"("id");



ALTER TABLE ONLY "public"."users_branches"
    ADD CONSTRAINT "users_branches_branch_id_fkey" FOREIGN KEY ("branch_id") REFERENCES "public"."branches"("id");



ALTER TABLE ONLY "public"."users_branches"
    ADD CONSTRAINT "users_branches_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id");



ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_organization_id_fkey" FOREIGN KEY ("organization_id") REFERENCES "public"."organizations"("id") ON UPDATE CASCADE ON DELETE CASCADE;



CREATE POLICY "Allow public access to table" ON "public"."users_branches" FOR SELECT USING (true);



CREATE POLICY "Enable update for authenticated users only" ON "public"."devices" FOR UPDATE TO "authenticated", "anon" USING (true) WITH CHECK (true);



CREATE POLICY "User can read without restriction" ON "public"."devices" FOR SELECT USING (true);



CREATE POLICY "Users can insert new users" ON "public"."users" FOR INSERT WITH CHECK (true);



CREATE POLICY "Users can read all values" ON "public"."branches" FOR SELECT USING (true);



CREATE POLICY "Users can read all values" ON "public"."organizations" FOR SELECT USING (true);



ALTER TABLE "public"."ads" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."branches" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."contents" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."devices" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."lists" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."organizations" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."users" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."users_branches" ENABLE ROW LEVEL SECURITY;




ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";





GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";


























































































































































































GRANT ALL ON FUNCTION "public"."generate_and_update_code"("android_id" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."generate_and_update_code"("android_id" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."generate_and_update_code"("android_id" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_branch_devices"("branch_id" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."get_branch_devices"("branch_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_branch_devices"("branch_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."get_user_entities"() TO "anon";
GRANT ALL ON FUNCTION "public"."get_user_entities"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."get_user_entities"() TO "service_role";


















GRANT ALL ON TABLE "public"."ads" TO "anon";
GRANT ALL ON TABLE "public"."ads" TO "authenticated";
GRANT ALL ON TABLE "public"."ads" TO "service_role";



GRANT ALL ON TABLE "public"."branches" TO "anon";
GRANT ALL ON TABLE "public"."branches" TO "authenticated";
GRANT ALL ON TABLE "public"."branches" TO "service_role";



GRANT ALL ON TABLE "public"."contents" TO "anon";
GRANT ALL ON TABLE "public"."contents" TO "authenticated";
GRANT ALL ON TABLE "public"."contents" TO "service_role";



GRANT ALL ON TABLE "public"."devices" TO "anon";
GRANT ALL ON TABLE "public"."devices" TO "authenticated";
GRANT ALL ON TABLE "public"."devices" TO "service_role";



GRANT ALL ON TABLE "public"."lists" TO "anon";
GRANT ALL ON TABLE "public"."lists" TO "authenticated";
GRANT ALL ON TABLE "public"."lists" TO "service_role";



GRANT ALL ON TABLE "public"."organizations" TO "anon";
GRANT ALL ON TABLE "public"."organizations" TO "authenticated";
GRANT ALL ON TABLE "public"."organizations" TO "service_role";



GRANT ALL ON TABLE "public"."users" TO "anon";
GRANT ALL ON TABLE "public"."users" TO "authenticated";
GRANT ALL ON TABLE "public"."users" TO "service_role";



GRANT ALL ON TABLE "public"."users_branches" TO "anon";
GRANT ALL ON TABLE "public"."users_branches" TO "authenticated";
GRANT ALL ON TABLE "public"."users_branches" TO "service_role";



ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "service_role";






























RESET ALL;

--
-- Dumped schema changes for auth and storage
--

