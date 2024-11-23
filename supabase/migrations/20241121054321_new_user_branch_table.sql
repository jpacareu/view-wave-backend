drop policy "Enable update for authenticated users only" on "public"."devices";

create table "public"."users_branches" (
    "user_id" uuid not null,
    "branch_id" uuid not null
);


alter table "public"."users_branches" enable row level security;

CREATE UNIQUE INDEX users_branches_pkey ON public.users_branches USING btree (user_id, branch_id);

alter table "public"."users_branches" add constraint "users_branches_pkey" PRIMARY KEY using index "users_branches_pkey";

alter table "public"."users_branches" add constraint "users_branches_branch_id_fkey" FOREIGN KEY (branch_id) REFERENCES branches(id) not valid;

alter table "public"."users_branches" validate constraint "users_branches_branch_id_fkey";

alter table "public"."users_branches" add constraint "users_branches_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) not valid;

alter table "public"."users_branches" validate constraint "users_branches_user_id_fkey";

grant delete on table "public"."users_branches" to "anon";

grant insert on table "public"."users_branches" to "anon";

grant references on table "public"."users_branches" to "anon";

grant select on table "public"."users_branches" to "anon";

grant trigger on table "public"."users_branches" to "anon";

grant truncate on table "public"."users_branches" to "anon";

grant update on table "public"."users_branches" to "anon";

grant delete on table "public"."users_branches" to "authenticated";

grant insert on table "public"."users_branches" to "authenticated";

grant references on table "public"."users_branches" to "authenticated";

grant select on table "public"."users_branches" to "authenticated";

grant trigger on table "public"."users_branches" to "authenticated";

grant truncate on table "public"."users_branches" to "authenticated";

grant update on table "public"."users_branches" to "authenticated";

grant delete on table "public"."users_branches" to "service_role";

grant insert on table "public"."users_branches" to "service_role";

grant references on table "public"."users_branches" to "service_role";

grant select on table "public"."users_branches" to "service_role";

grant trigger on table "public"."users_branches" to "service_role";

grant truncate on table "public"."users_branches" to "service_role";

grant update on table "public"."users_branches" to "service_role";

create policy "Allow public access to table"
on "public"."users_branches"
as permissive
for select
to public
using (true);


create policy "Enable update for authenticated users only"
on "public"."devices"
as permissive
for update
to anon
using (true)
with check (true);



