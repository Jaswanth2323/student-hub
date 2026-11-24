-- Student Hub: run this script in Supabase SQL Editor.
-- One row per authenticated user. RLS ensures users can only read/write their own row.
create table if not exists public.student_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  tasks jsonb not null default '[]'::jsonb,
  profile jsonb not null default '{"name":"","type":"College student"}'::jsonb,
  sessions integer not null default 0 check (sessions >= 0),
  updated_at timestamptz not null default now()
);

alter table public.student_data enable row level security;

drop policy if exists "Users can read their own student data" on public.student_data;
create policy "Users can read their own student data"
  on public.student_data for select
  to authenticated
  using ((select auth.uid()) = user_id);

drop policy if exists "Users can insert their own student data" on public.student_data;
create policy "Users can insert their own student data"
  on public.student_data for insert
  to authenticated
  with check ((select auth.uid()) = user_id);

drop policy if exists "Users can update their own student data" on public.student_data;
create policy "Users can update their own student data"
  on public.student_data for update
  to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

grant select, insert, update on public.student_data to authenticated;
