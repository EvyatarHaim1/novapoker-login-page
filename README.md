# Nova Poker — Login Page

Static HTML login page for the Nova Poker Unity client, hosted via GitHub Pages.

## URL
```
https://evyatarhaim1.github.io/novapoker-login-page/supabase-login.html
```

## What it does
- Authenticates the user against Supabase Auth (Google OAuth, Apple Sign-In on iOS, email/password, guest).
- On success, redirects back to the Unity app via the `novapoker://callback` deep link with `access_token` and user info attached as query params.

## Environments (2026-09-28)
The same file is served at two paths and picks its Supabase project from the **path**:

| Path | Supabase | Used by |
|---|---|---|
| `/supabase-login.html` | production (`auth.novapoker.app`) | the App Store / production TestFlight app |
| `/staging/supabase-login.html` | staging branch `preprod` (`isnznfccqpizdtfgvjdt.supabase.co`) | the "Nova Poker Staging" TestFlight build |

`staging/supabase-login.html` must stay a byte-identical copy of the root file — run `./sync-staging.sh`
after every edit. A staging banner is shown on the staging path.

**E-mail sign-up requires confirmation.** Supabase Authentication → Providers → Email → *Confirm email* must be ON
(both projects). Sign-up sends the link with `emailRedirectTo` = the page itself; the link returns here with the
session in the URL hash and the page hands it to Unity. "Email not confirmed" on login shows a *Resend confirmation
email* button.

## Source of truth
This repo is the canonical location for `supabase-login.html`. The same file is mirrored at:
- `Unity/NOVA_POKER/Auth0CustomLogin/supabase-login.html` (kept in sync manually for now).

## Editing
1. Edit `supabase-login.html` here.
2. Commit + push.
3. GitHub Pages auto-deploys within ~1 minute.
4. Verify: open the URL above in a private window.

## Why GitHub Pages (and not Supabase Storage / Netlify)
- **Supabase Storage** forces `Content-Type: text/plain` on HTML files in public buckets as an anti-phishing measure → page renders as raw text, not as HTML.
- **Netlify** free-tier sites can disappear if the account becomes inactive — already happened once (`eloquent-taiyaki-0e9734.netlify.app` → NXDOMAIN).
- **GitHub Pages** on a public repo is free indefinitely and content-types are served correctly.

## Supabase Auth — Required redirect URLs
For OAuth providers to redirect back here, this URL must be in
**Supabase Dashboard → Authentication → URL Configuration → Redirect URLs**:
- `https://evyatarhaim1.github.io/novapoker-login-page/supabase-login.html`
- `novapoker://callback` (for the Unity deep link)
