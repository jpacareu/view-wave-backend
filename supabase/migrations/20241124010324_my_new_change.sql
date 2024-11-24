alter table "public"."devices" add column "organization_id" uuid not null;

alter table "public"."organizations" add column "category" text;

alter table "public"."devices" add constraint "devices_organization_id_fkey" FOREIGN KEY (organization_id) REFERENCES organizations(id) not valid;

alter table "public"."devices" validate constraint "devices_organization_id_fkey";


