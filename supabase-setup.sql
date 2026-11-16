-- Run in your own Supabase project's SQL editor.
create table if not exists public.spinnote_snapshots (
  user_id uuid primary key references auth.users(id) on delete cascade,
  revision text not null,
  data jsonb not null,
  updated_at timestamptz not null default now()
);
alter table public.spinnote_snapshots enable row level security;
revoke all on public.spinnote_snapshots from anon;
grant select, insert, update on public.spinnote_snapshots to authenticated;
create policy "own_select" on public.spinnote_snapshots for select to authenticated using ((select auth.uid()) = user_id);
create policy "own_insert" on public.spinnote_snapshots for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "own_update" on public.spinnote_snapshots for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
