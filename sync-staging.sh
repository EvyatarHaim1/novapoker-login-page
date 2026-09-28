#!/usr/bin/env bash
# Keep /staging/supabase-login.html a byte-identical copy of the root page.
# The page picks its environment from the PATH it is served at (IS_STAGING), so
# the two files must never diverge. Run after every edit, before committing.
set -e
cd "$(dirname "$0")"
mkdir -p staging
cp supabase-login.html staging/supabase-login.html
echo "staging/supabase-login.html synced"
