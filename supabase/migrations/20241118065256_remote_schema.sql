alter table "public"."devices" add column "code_exp" timestamp with time zone;

alter table "public"."devices" add column "code_value" text;

CREATE UNIQUE INDEX devices_code_value_key ON public.devices USING btree (code_value);

alter table "public"."devices" add constraint "devices_code_value_key" UNIQUE using index "devices_code_value_key";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.generate_and_update_code()
 RETURNS text
 LANGUAGE plpgsql
 SECURITY DEFINER
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

    -- Return the generated code
    RETURN code;

END;$function$
;

CREATE OR REPLACE FUNCTION public.generate_and_update_code(android_id text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
DECLARE
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

    -- Raise an error if no rows were updated (to catch invalid android_id)
    IF NOT FOUND THEN
        RAISE EXCEPTION 'No rows found with android_id = %', android_id;
    END IF;

    RETURN code;

END;
$function$
;

CREATE OR REPLACE FUNCTION public.generate_unique_code()
 RETURNS integer
 LANGUAGE plpgsql
AS $function$DECLARE
    code INTEGER;
    exists BOOLEAN;
    attempt_count INTEGER := 0;
    max_attempts INTEGER := 1000;  
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

    -- Return the unique code
    RETURN code;
END;$function$
;

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



