# view-wave-backend

```bash
supabase functions serve

supabase link

psql postgresql://postgres:postgres@127.0.0.1:54322/postgres

supabase start

supabase stop --all --no-backup

supabase projects list

supabase gen types typescript --project-id "nceyjyktohosdlvbkwca" --schema public > supabase/functions/types.ts

supabase db dump --data-only > supabase/seed.sql
```

### Remote DB to Local:

Start services locally:

- supabase start

Link to your remote project

- supabase link

Compare your local DB with linked one (remote) and create migration file

- supabase db diff -f initial_structure --linked

Add elements to the tables of your DB

- supabase db dump --data-only > supabase/seed.sql

Recreates your DB with migration file

- supabase db reset

Update types

- supabase gen types typescript --project-id "nceyjyktohosdlvbkwca" --schema public > supabase/functions/types.ts


### Push local DB changes to remote DB:

Create a migration file that contains your new change:

- supabase db diff -f my_new_change

Mark migration file was already applied so don't run it again when updating
remote DB

- supabase migration repair 20241119043331 --status applied --linked

Upload change (this will usually fail due to permissions, more info
[here](https://youtu.be/nyX_EygplXQ?si=d8peW82XtZGNRbh_&t=734))

- supabase db push --linked

More info: https://www.youtube.com/watch?v=nyX_EygplXQ
