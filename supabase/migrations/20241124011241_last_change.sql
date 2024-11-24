alter table "public"."devices" alter column "organization_id" drop not null;

create policy "Users can read all values"
on "public"."organizations"
as permissive
for select
to public
using (true);



