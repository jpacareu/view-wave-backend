create type "public"."device_status" as enum ('initialized', 'assigned', 'booted');

create table "public"."ads" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "name" text,
    "media_id" text,
    "provider" text,
    "branch_id" uuid default gen_random_uuid()
);


alter table "public"."ads" enable row level security;

create table "public"."branches" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "organization_id" uuid,
    "name" text,
    "places_id" text
);


alter table "public"."branches" enable row level security;

create table "public"."contents" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "media_id" text,
    "provider" text,
    "user_id" uuid default gen_random_uuid()
);


alter table "public"."contents" enable row level security;

create table "public"."devices" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "name" text,
    "android_id" text,
    "branch_id" uuid,
    "list_id" uuid,
    "status" device_status default 'initialized'::device_status,
    "code_value" text,
    "code_exp" timestamp with time zone
);


alter table "public"."devices" enable row level security;

create table "public"."lists" (
    "created_at" timestamp with time zone not null default now(),
    "name" text,
    "content" text[],
    "id" uuid not null default gen_random_uuid()
);


alter table "public"."lists" enable row level security;

create table "public"."organizations" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "name" text
);


alter table "public"."organizations" enable row level security;

create table "public"."users" (
    "id" uuid not null default auth.uid(),
    "organization_id" uuid,
    "created_at" timestamp with time zone not null default now(),
    "name" text,
    "email" text
);


alter table "public"."users" enable row level security;

CREATE UNIQUE INDEX ads_id_key ON public.ads USING btree (id);

CREATE UNIQUE INDEX ads_pkey ON public.ads USING btree (id);

CREATE UNIQUE INDEX branches_pkey ON public.branches USING btree (id);

CREATE UNIQUE INDEX contents_pkey ON public.contents USING btree (id);

CREATE UNIQUE INDEX devices_code_value_key ON public.devices USING btree (code_value);

CREATE UNIQUE INDEX devices_pkey ON public.devices USING btree (id);

CREATE UNIQUE INDEX lists_id_key ON public.lists USING btree (id);

CREATE UNIQUE INDEX lists_pkey ON public.lists USING btree (id);

CREATE UNIQUE INDEX organizations_id_key ON public.organizations USING btree (id);

CREATE UNIQUE INDEX organizations_pkey ON public.organizations USING btree (id);

CREATE UNIQUE INDEX profiles_pkey ON public.users USING btree (id);

alter table "public"."ads" add constraint "ads_pkey" PRIMARY KEY using index "ads_pkey";

alter table "public"."branches" add constraint "branches_pkey" PRIMARY KEY using index "branches_pkey";

alter table "public"."contents" add constraint "contents_pkey" PRIMARY KEY using index "contents_pkey";

alter table "public"."devices" add constraint "devices_pkey" PRIMARY KEY using index "devices_pkey";

alter table "public"."lists" add constraint "lists_pkey" PRIMARY KEY using index "lists_pkey";

alter table "public"."organizations" add constraint "organizations_pkey" PRIMARY KEY using index "organizations_pkey";

alter table "public"."users" add constraint "profiles_pkey" PRIMARY KEY using index "profiles_pkey";

alter table "public"."ads" add constraint "ads_branch_id_fkey" FOREIGN KEY (branch_id) REFERENCES branches(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."ads" validate constraint "ads_branch_id_fkey";

alter table "public"."ads" add constraint "ads_id_key" UNIQUE using index "ads_id_key";

alter table "public"."branches" add constraint "branches_organization_id_fkey" FOREIGN KEY (organization_id) REFERENCES organizations(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."branches" validate constraint "branches_organization_id_fkey";

alter table "public"."contents" add constraint "contents_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."contents" validate constraint "contents_user_id_fkey";

alter table "public"."devices" add constraint "devices_branch_id_fkey" FOREIGN KEY (branch_id) REFERENCES branches(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."devices" validate constraint "devices_branch_id_fkey";

alter table "public"."devices" add constraint "devices_code_value_key" UNIQUE using index "devices_code_value_key";

alter table "public"."devices" add constraint "devices_list_id_fkey" FOREIGN KEY (list_id) REFERENCES lists(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."devices" validate constraint "devices_list_id_fkey";

alter table "public"."lists" add constraint "lists_id_key" UNIQUE using index "lists_id_key";

alter table "public"."organizations" add constraint "organizations_id_key" UNIQUE using index "organizations_id_key";

alter table "public"."users" add constraint "users_organization_id_fkey" FOREIGN KEY (organization_id) REFERENCES organizations(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."users" validate constraint "users_organization_id_fkey";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.generate_and_update_code(android_id text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$DECLARE
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
    WHERE devices.android_id = generate_and_update_code.android_id; -- Use fully qualified reference

    RETURN code;

END;$function$
;

grant delete on table "public"."ads" to "anon";

grant insert on table "public"."ads" to "anon";

grant references on table "public"."ads" to "anon";

grant select on table "public"."ads" to "anon";

grant trigger on table "public"."ads" to "anon";

grant truncate on table "public"."ads" to "anon";

grant update on table "public"."ads" to "anon";

grant delete on table "public"."ads" to "authenticated";

grant insert on table "public"."ads" to "authenticated";

grant references on table "public"."ads" to "authenticated";

grant select on table "public"."ads" to "authenticated";

grant trigger on table "public"."ads" to "authenticated";

grant truncate on table "public"."ads" to "authenticated";

grant update on table "public"."ads" to "authenticated";

grant delete on table "public"."ads" to "service_role";

grant insert on table "public"."ads" to "service_role";

grant references on table "public"."ads" to "service_role";

grant select on table "public"."ads" to "service_role";

grant trigger on table "public"."ads" to "service_role";

grant truncate on table "public"."ads" to "service_role";

grant update on table "public"."ads" to "service_role";

grant delete on table "public"."branches" to "anon";

grant insert on table "public"."branches" to "anon";

grant references on table "public"."branches" to "anon";

grant select on table "public"."branches" to "anon";

grant trigger on table "public"."branches" to "anon";

grant truncate on table "public"."branches" to "anon";

grant update on table "public"."branches" to "anon";

grant delete on table "public"."branches" to "authenticated";

grant insert on table "public"."branches" to "authenticated";

grant references on table "public"."branches" to "authenticated";

grant select on table "public"."branches" to "authenticated";

grant trigger on table "public"."branches" to "authenticated";

grant truncate on table "public"."branches" to "authenticated";

grant update on table "public"."branches" to "authenticated";

grant delete on table "public"."branches" to "service_role";

grant insert on table "public"."branches" to "service_role";

grant references on table "public"."branches" to "service_role";

grant select on table "public"."branches" to "service_role";

grant trigger on table "public"."branches" to "service_role";

grant truncate on table "public"."branches" to "service_role";

grant update on table "public"."branches" to "service_role";

grant delete on table "public"."contents" to "anon";

grant insert on table "public"."contents" to "anon";

grant references on table "public"."contents" to "anon";

grant select on table "public"."contents" to "anon";

grant trigger on table "public"."contents" to "anon";

grant truncate on table "public"."contents" to "anon";

grant update on table "public"."contents" to "anon";

grant delete on table "public"."contents" to "authenticated";

grant insert on table "public"."contents" to "authenticated";

grant references on table "public"."contents" to "authenticated";

grant select on table "public"."contents" to "authenticated";

grant trigger on table "public"."contents" to "authenticated";

grant truncate on table "public"."contents" to "authenticated";

grant update on table "public"."contents" to "authenticated";

grant delete on table "public"."contents" to "service_role";

grant insert on table "public"."contents" to "service_role";

grant references on table "public"."contents" to "service_role";

grant select on table "public"."contents" to "service_role";

grant trigger on table "public"."contents" to "service_role";

grant truncate on table "public"."contents" to "service_role";

grant update on table "public"."contents" to "service_role";

grant delete on table "public"."devices" to "anon";

grant insert on table "public"."devices" to "anon";

grant references on table "public"."devices" to "anon";

grant select on table "public"."devices" to "anon";

grant trigger on table "public"."devices" to "anon";

grant truncate on table "public"."devices" to "anon";

grant update on table "public"."devices" to "anon";

grant delete on table "public"."devices" to "authenticated";

grant insert on table "public"."devices" to "authenticated";

grant references on table "public"."devices" to "authenticated";

grant select on table "public"."devices" to "authenticated";

grant trigger on table "public"."devices" to "authenticated";

grant truncate on table "public"."devices" to "authenticated";

grant update on table "public"."devices" to "authenticated";

grant delete on table "public"."devices" to "service_role";

grant insert on table "public"."devices" to "service_role";

grant references on table "public"."devices" to "service_role";

grant select on table "public"."devices" to "service_role";

grant trigger on table "public"."devices" to "service_role";

grant truncate on table "public"."devices" to "service_role";

grant update on table "public"."devices" to "service_role";

grant delete on table "public"."lists" to "anon";

grant insert on table "public"."lists" to "anon";

grant references on table "public"."lists" to "anon";

grant select on table "public"."lists" to "anon";

grant trigger on table "public"."lists" to "anon";

grant truncate on table "public"."lists" to "anon";

grant update on table "public"."lists" to "anon";

grant delete on table "public"."lists" to "authenticated";

grant insert on table "public"."lists" to "authenticated";

grant references on table "public"."lists" to "authenticated";

grant select on table "public"."lists" to "authenticated";

grant trigger on table "public"."lists" to "authenticated";

grant truncate on table "public"."lists" to "authenticated";

grant update on table "public"."lists" to "authenticated";

grant delete on table "public"."lists" to "service_role";

grant insert on table "public"."lists" to "service_role";

grant references on table "public"."lists" to "service_role";

grant select on table "public"."lists" to "service_role";

grant trigger on table "public"."lists" to "service_role";

grant truncate on table "public"."lists" to "service_role";

grant update on table "public"."lists" to "service_role";

grant delete on table "public"."organizations" to "anon";

grant insert on table "public"."organizations" to "anon";

grant references on table "public"."organizations" to "anon";

grant select on table "public"."organizations" to "anon";

grant trigger on table "public"."organizations" to "anon";

grant truncate on table "public"."organizations" to "anon";

grant update on table "public"."organizations" to "anon";

grant delete on table "public"."organizations" to "authenticated";

grant insert on table "public"."organizations" to "authenticated";

grant references on table "public"."organizations" to "authenticated";

grant select on table "public"."organizations" to "authenticated";

grant trigger on table "public"."organizations" to "authenticated";

grant truncate on table "public"."organizations" to "authenticated";

grant update on table "public"."organizations" to "authenticated";

grant delete on table "public"."organizations" to "service_role";

grant insert on table "public"."organizations" to "service_role";

grant references on table "public"."organizations" to "service_role";

grant select on table "public"."organizations" to "service_role";

grant trigger on table "public"."organizations" to "service_role";

grant truncate on table "public"."organizations" to "service_role";

grant update on table "public"."organizations" to "service_role";

grant delete on table "public"."users" to "anon";

grant insert on table "public"."users" to "anon";

grant references on table "public"."users" to "anon";

grant select on table "public"."users" to "anon";

grant trigger on table "public"."users" to "anon";

grant truncate on table "public"."users" to "anon";

grant update on table "public"."users" to "anon";

grant delete on table "public"."users" to "authenticated";

grant insert on table "public"."users" to "authenticated";

grant references on table "public"."users" to "authenticated";

grant select on table "public"."users" to "authenticated";

grant trigger on table "public"."users" to "authenticated";

grant truncate on table "public"."users" to "authenticated";

grant update on table "public"."users" to "authenticated";

grant delete on table "public"."users" to "service_role";

grant insert on table "public"."users" to "service_role";

grant references on table "public"."users" to "service_role";

grant select on table "public"."users" to "service_role";

grant trigger on table "public"."users" to "service_role";

grant truncate on table "public"."users" to "service_role";

grant update on table "public"."users" to "service_role";

create policy "Users can read all values"
on "public"."branches"
as permissive
for select
to public
using (true);


create policy "Enable update for authenticated users only"
on "public"."devices"
as permissive
for update
to authenticated
using (true)
with check (true);


create policy "User can read without restriction"
on "public"."devices"
as permissive
for select
to public
using (true);



