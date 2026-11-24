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