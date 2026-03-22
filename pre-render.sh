#!/bin/bash
# Pre-render hook: populate index.qmd based on the active Quarto profile.
#
# Quarto hard-requires index.qmd as the first book chapter but we need
# different content there per output format:
#
#   html profile (default) → index.qmd = landing_page.qmd  (Vorwort / homepage)
#   pdf  profile           → index.qmd = einleitung.qmd    (Einleitung = chapter 1)
#
# Quarto sets QUARTO_PROFILE to the active profile name before invoking
# pre-render scripts, so we can branch on it here.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Quarot called with the following profile: $QUARTO_PROFILE"
if [ "$QUARTO_PROFILE" = "pdf" ]; then
  echo "[pre-render] pdf profile active → copying einleitung.qmd to index.qmd"
  cp "$SCRIPT_DIR/einleitung.qmd" "$SCRIPT_DIR/index.qmd"
else
  echo "[pre-render] html profile active → copying landing_page.qmd to index.qmd"
  cp "$SCRIPT_DIR/landing_page.qmd" "$SCRIPT_DIR/index.qmd"
fi
