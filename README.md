# Nova Poker — Login Page

Static HTML login page for the Nova Poker Unity client, hosted via GitHub Pages.

## URL
```
https://evyatarhaim1.github.io/novapoker-login-page/supabase-login.html
```

## What it does
- Authenticates the user against Supabase Auth (Google OAuth, Apple Sign-In on iOS, email/password, guest).
- On success, redirects back to the Unity app via the `novapoker://callback` deep link with `access_token` and user info attached as query params.

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
