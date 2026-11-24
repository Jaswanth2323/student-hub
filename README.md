# Student Hub — Starter Website

A responsive, free-first student resource and productivity website.

## Run locally
1. Extract the ZIP.
2. Open `index.html` in a modern browser.
3. No package installation, API key, server, or paid service is required for this starter.

For local development, you can also run:
```bash
python -m http.server 8000
```
Then open http://localhost:8000.

## Included working features
- Responsive navigation and dashboard
- Curated resource directory with search and category filters
- Career, placement and opportunity links
- Study task creation, completion, deletion and filtering
- Local CGPA-to-percentage estimator (editable multiplier)
- Marks percentage calculator
- Pomodoro focus timer with local session count
- Five-question aptitude quiz
- Local profile preferences
- Browser localStorage persistence

## Important limitations
This is a functional front-end starter, not a production multi-user platform.
- User data is stored in the current browser only; it does not sync across devices.
- There is no server-side authentication, shared database, admin console, AI tutor, automatic job feed, or automated resource ingestion yet.
- External links lead to third-party providers. Their availability, fees, eligibility and terms can change.
- The CGPA multiplier is configurable because Indian institutions do not all use the same conversion rule.

## Recommended next production steps
1. Move to Next.js + TypeScript.
2. Add Supabase Auth and PostgreSQL with row-level security.
3. Add verified admin-managed resource records and link health checks.
4. Add a secure server-side AI endpoint only after selecting an AI provider and setting a budget/usage limit.
5. Add tests, accessibility checks, privacy policy, terms and backups.
6. Deploy the production app and configure a custom domain.

Never place private API keys in browser JavaScript.

## Deployment
This site is deployed with GitHub Pages using the workflow at `.github/workflows/pages.yml`. Every push to `main` triggers a deployment.


## Supabase setup (required for accounts and cloud sync)

The frontend now includes email/password sign-up and login, and syncs each signed-in user's study tasks, profile, and focus-session count to Supabase. The public GitHub Pages site will not be able to authenticate until you connect your own Supabase project.

1. Create a free project at https://supabase.com/.
2. In the Supabase dashboard, open **SQL Editor**, paste the contents of `supabase/schema.sql`, and run it. This creates the `student_data` table and enables row-level security so each account can access only its own row.
3. Open **Project Settings → API** (or **Data API**) and copy the Project URL and the publishable/anon key. These are public browser credentials; never use a `service_role` or secret key in this website.
4. In `index.html`, replace `YOUR_SUPABASE_PROJECT_URL` and `YOUR_SUPABASE_ANON_KEY` with those two values, then commit the change to `main`.
5. In Supabase **Authentication → URL Configuration**, set the Site URL to `https://jaswanth2323.github.io/student-hub/` and add that same URL to the allowed redirect URLs.
6. In **Authentication → Providers → Email**, keep email/password enabled. For a public launch, keep email confirmation enabled and configure your SMTP provider if you need reliable production email delivery. Supabase's built-in test email service is rate-limited.

### What is synced

- Study tasks (including completion state, due date and priority)
- Display name and student category
- Completed focus-session count

The Pomodoro timer's current countdown is temporary and is not synced. Resource links and quiz content are shared static content. Do not store sensitive personal information in this starter app.

### Security note

The Supabase publishable/anon key is expected to be visible in frontend code. Database security comes from Supabase Auth plus the row-level security policies in `supabase/schema.sql`. Never expose a Supabase service-role/secret key in GitHub Pages or any browser code.
