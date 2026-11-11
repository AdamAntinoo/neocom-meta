#!/usr/bin/env bash
# Initial install from scratch (CICD-F-092…098). Run from any directory.
# Clones active repos beside each other, npm install, Graphify per repo.
set -euo pipefail

ROOT_PARENT="${NEOCOM_ROOT:-$HOME/IdeaProjects/E.NEOCOM}"
REPOS=(neocom-meta neocom-front neocom-back neocom-domain)

echo "==> nvm check (CICD-F-092)"
if [[ -s "${NVM_DIR:-$HOME/.nvm}/nvm.sh" ]]; then
  # shellcheck disable=SC1090
  source "${NVM_DIR:-$HOME/.nvm}/nvm.sh"
elif [[ -s "$HOME/.nvm/nvm.sh" ]]; then
  # shellcheck disable=SC1090
  source "$HOME/.nvm/nvm.sh"
else
  echo "nvm not found. Install nvm and the neocom alias before continuing." >&2
  exit 1
fi
nvm use neocom || nvm install && nvm alias neocom "$(node -v | tr -d v)" && nvm use neocom

mkdir -p "$ROOT_PARENT"
cd "$ROOT_PARENT"

for repo in "${REPOS[@]}"; do
  if [[ ! -d "$repo/.git" ]]; then
    echo "==> clone $repo (CICD-F-093)"
    git clone "https://github.com/AdamAntinoo/${repo}.git" "$repo"
  else
    echo "==> $repo already present"
  fi
done

for repo in "${REPOS[@]}"; do
  echo "==> npm install in $repo (CICD-F-094)"
  (
    cd "$repo"
    nvm use
    npm install
    if command -v graphify >/dev/null 2>&1 || [[ -x .venv/bin/graphify ]]; then
      echo "==> Graphify install/update in $repo (CICD-F-097)"
      if [[ -x .venv/bin/graphify ]]; then
        .venv/bin/graphify update . || true
      else
        graphify update . || true
      fi
    else
      echo "graphify CLI not found for $repo — skip (install graphifyy when ready)"
    fi
  )
done

echo "==> WireMock for front automated testing: cd neocom-front && npm run wiremock (CICD-F-095)"
echo "Done."
