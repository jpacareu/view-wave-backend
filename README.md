supabase functions serve

supabase link

psql postgresql://postgres:postgres@127.0.0.1:54322/postgres

supabase start

supabase stop --all --no-backup

supabase projects list


supabase db dump --data-only > supabase/seed.sql

Migration:
- Remove migration sql and run
  supabase db pull
