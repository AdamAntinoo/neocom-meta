#!/usr/bin/env bash
# Run neocom-back + neocom-front with prefixed logs in one terminal.
# Usage (from neocom-meta):
#   bash scripts/dev-front-back.sh
# Stop: Ctrl+C (kills both).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BACK="$(cd "$ROOT/../neocom-back" && pwd)"
FRONT="$(cd "$ROOT/../neocom-front" && pwd)"

if [[ ! -d "$BACK" || ! -d "$FRONT" ]]; then
  echo "Expected siblings: $BACK and $FRONT" >&2
  exit 1
fi

# Load nvm alias `neocom` when available.
if [[ -s "${NVM_DIR:-$HOME/.nvm}/nvm.sh" ]]; then
  # shellcheck source=/dev/null
  . "${NVM_DIR:-$HOME/.nvm}/nvm.sh"
  nvm use neocom >/dev/null || nvm use >/dev/null || true
fi

if ! command -v npx >/dev/null; then
  echo "npx not found (activate Node / nvm first)" >&2
  exit 1
fi

echo "back  → $BACK  (PORT from .env.application, usually 3000)"
echo "front → $FRONT (ng serve :6001)"
echo "Combined log viewer — Ctrl+C stops both."
echo

# concurrently prefixes each line: [back] … / [front] …
# --kill-others: if one dies, stop the other so you notice.
cd "$ROOT"
exec npx --yes concurrently@9 \
  --names back,front \
  --prefix-colors blue,magenta \
  --kill-others-on-fail \
  "cd \"$BACK\" && npm run start:dev" \
  "cd \"$FRONT\" && npm run start:dev"
