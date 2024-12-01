create type "public"."category" as enum ('dentist', 'hair_salon', 'cuban_restaurant');

drop policy "Enable update for authenticated users only" on "public"."devices";

alter table "public"."branches" add column "category" category default 'dentist'::category;

alter table "public"."lists" add column "branch_id" uuid default gen_random_uuid();

alter table "public"."lists" add column "organization_id" uuid default gen_random_uuid();

alter table "public"."lists" add constraint "lists_branch_id_fkey" FOREIGN KEY (branch_id) REFERENCES branches(id) not valid;

alter table "public"."lists" validate constraint "lists_branch_id_fkey";

alter table "public"."lists" add constraint "lists_organization_id_fkey" FOREIGN KEY (organization_id) REFERENCES organizations(id) not valid;

alter table "public"."lists" validate constraint "lists_organization_id_fkey";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.get_user_entities()
 RETURNS jsonb
 LANGUAGE plpgsql
AS $function$
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
$function$
;

create policy "Users can insert new users"
on "public"."users"
as permissive
for insert
to public
with check (true);


create policy "Enable update for authenticated users only"
on "public"."devices"
as permissive
for update
to authenticated, anon
using (true)
with check (true);



