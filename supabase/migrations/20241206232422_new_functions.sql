create extension if not exists "pgmq" with schema "pgmq" version '1.4.4';

create type "pgmq"."message_record" as ("msg_id" bigint, "read_ct" integer, "enqueued_at" timestamp with time zone, "vt" timestamp with time zone, "message" jsonb);

create type "pgmq"."metrics_result" as ("queue_name" text, "queue_length" bigint, "newest_msg_age_sec" integer, "oldest_msg_age_sec" integer, "total_messages" bigint, "scrape_time" timestamp with time zone);

create type "pgmq"."queue_record" as ("queue_name" character varying, "is_partitioned" boolean, "is_unlogged" boolean, "created_at" timestamp with time zone);

grant select on table "pgmq"."meta" to "pg_monitor";


set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.set_active_branch(target_branch_id uuid)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
DECLARE
temp_user_id uuid;
BEGIN
  -- Check if the target_branch_id belongs to the authenticated user
  SELECT user_id INTO temp_user_id FROM users_branches WHERE branch_id = target_branch_id AND user_id = auth.uid();

  IF NOT FOUND THEN
    RAISE EXCEPTION 'The specified branch does not exist for this user.';
  END IF;

  UPDATE users_branches
  SET is_active = CASE
    WHEN branch_id = target_branch_id THEN true
    ELSE false
  END
  WHERE user_id = auth.uid();
END;
$function$
;

CREATE OR REPLACE FUNCTION public.get_user_entities()
 RETURNS jsonb
 LANGUAGE plpgsql
AS $function$
BEGIN
    RETURN (
     WITH active_branches AS (
            SELECT b.id AS branch_id, b.organization_id, b.name, b.category, ub.is_active, o.name AS org_name, o.category AS org_category
            FROM branches b
            INNER JOIN users_branches ub ON b.id = ub.branch_id
            INNER JOIN organizations o ON b.organization_id = o.id
            WHERE ub.user_id = auth.uid()
        )
        SELECT jsonb_build_object(
            'organization', jsonb_build_object(
                'id', organization_id,
                'name', org_name,
                'category', org_category
            ),
            'branches', jsonb_agg(
                jsonb_build_object(
                    'id', branch_id,
                    'name', name,
                    'category', category
                )
            ),
            'active_branch', COALESCE(
                (SELECT branch_id FROM active_branches WHERE is_active = true LIMIT 1),
                (SELECT branch_id FROM active_branches LIMIT 1)
            )
        )
        FROM active_branches
        GROUP BY organization_id, org_name, org_category
    );
END;
$function$
;

create policy "Update user branches policy"
on "public"."users_branches"
as permissive
for update
to authenticated
using ((user_id = auth.uid()))
with check ((user_id = auth.uid()));



