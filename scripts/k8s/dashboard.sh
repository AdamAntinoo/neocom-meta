#!/usr/bin/env bash
# Open a local Kubernetes dashboard (prefers minikube dashboard).
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=_common.sh
source "${SCRIPT_DIR}/_common.sh"

stack="$(detect_stack)"

case "${stack}" in
  minikube)
    echo "Opening minikube dashboard (blocks until you stop it with Ctrl+C)…"
    minikube dashboard
    ;;
  docker-desktop)
    cat <<'EOF'
Docker Desktop detected.

Prefer Docker Desktop's built-in UI (Dashboard → Containers / Kubernetes) for local inspection.
This package does not install the upstream kubernetes/dashboard Helm/YAML stack by default
(it is heavy for day-to-day local use).

If you need kubectl access: ensure Kubernetes is enabled, then run npm run k8s:status.
EOF
    ;;
  kind)
    cat <<'EOF'
kind detected.

minikube dashboard is not available. Options:
  • Install minikube for a one-command local dashboard, or
  • Use kubectl (npm run k8s:status) / a GUI of your choice.

This package does not auto-apply the upstream kubernetes/dashboard manifests.
EOF
    ;;
  none)
    die "no local Kubernetes stack detected. Run npm run k8s:start first (minikube preferred)."
    ;;
esac
