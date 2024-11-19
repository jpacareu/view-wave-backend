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
CREATE EXTENSION IF NOT EXISTS "pgsodium" WITH SCHEMA "pgsodium";
COMMENT ON SCHEMA "public" IS 'standard public schema';
CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";
CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";
CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";
CREATE EXTENSION IF NOT EXISTS "pgjwt" WITH SCHEMA "extensions";
CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";
CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";
CREATE TYPE "public"."device_status" AS ENUM (
    'initialized',
    'assigned',
    'booted'
);
ALTER TYPE "public"."device_status" OWNER TO "postgres";
COMMENT ON TYPE "public"."device_status" IS 'Status of the device';
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
COMMENT ON TABLE "public"."ads" IS 'Ads Videos';
CREATE TABLE IF NOT EXISTS "public"."branches" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "organization_id" "uuid",
    "name" "text",
    "places_id" "text"
);
ALTER TABLE "public"."branches" OWNER TO "postgres";
COMMENT ON COLUMN "public"."branches"."organization_id" IS 'Id of the organization to what it belongs to';
CREATE TABLE IF NOT EXISTS "public"."contents" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "media_id" "text",
    "provider" "text",
    "user_id" "uuid" DEFAULT "gen_random_uuid"()
);
ALTER TABLE "public"."contents" OWNER TO "postgres";
COMMENT ON TABLE "public"."contents" IS 'Custom content';
CREATE TABLE IF NOT EXISTS "public"."devices" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "name" "text",
    "android_id" "text",
    "branch_id" "uuid",
    "list_id" "uuid",
    "status" "public"."device_status" DEFAULT 'initialized'::"public"."device_status"
);
ALTER TABLE "public"."devices" OWNER TO "postgres";
COMMENT ON TABLE "public"."devices" IS 'Devices';
COMMENT ON COLUMN "public"."devices"."status" IS 'Status of the device';
CREATE TABLE IF NOT EXISTS "public"."lists" (
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "name" "text",
    "content" "text"[],
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL
);
ALTER TABLE "public"."lists" OWNER TO "postgres";
CREATE TABLE IF NOT EXISTS "public"."organizations" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "name" "text"
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
COMMENT ON TABLE "public"."users" IS 'User profiles';
ALTER TABLE ONLY "public"."ads"
    ADD CONSTRAINT "ads_id_key" UNIQUE ("id");
ALTER TABLE ONLY "public"."ads"
    ADD CONSTRAINT "ads_pkey" PRIMARY KEY ("id");
ALTER TABLE ONLY "public"."branches"
    ADD CONSTRAINT "branches_pkey" PRIMARY KEY ("id");
ALTER TABLE ONLY "public"."contents"
    ADD CONSTRAINT "contents_pkey" PRIMARY KEY ("id");
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
ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_organization_id_fkey" FOREIGN KEY ("organization_id") REFERENCES "public"."organizations"("id") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "public"."ads" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "public"."branches" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "public"."contents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "public"."devices" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "public"."lists" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "public"."organizations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "public"."users" ENABLE ROW LEVEL SECURITY;
ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";
ALTER PUBLICATION "supabase_realtime" ADD TABLE ONLY "public"."branches";
ALTER PUBLICATION "supabase_realtime" ADD TABLE ONLY "public"."contents";
ALTER PUBLICATION "supabase_realtime" ADD TABLE ONLY "public"."devices";
GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";
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
