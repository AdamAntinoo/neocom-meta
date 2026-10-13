#!/usr/bin/env bash
# Stop a local Kubernetes cluster when the stack supports it.
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=_common.sh
source "${SCRIPT_DIR}/_common.sh"

stack="$(detect_stack)"

case "${stack}" in
  minikube)
    echo "Stopping minikube…"
    minikube stop
    ;;
  docker-desktop)
    cat <<'EOF'
Docker Desktop Kubernetes cannot be stopped from this script.
Disable Kubernetes (or quit Docker Desktop) from the Docker Desktop UI.
EOF
    ;;
  kind)
    if ! have kind; then
      die "kind context detected but kind CLI not found."
    fi
    echo "Deleting kind cluster (default name: kind)…"
    kind delete cluster
    ;;
  none)
    die "no local Kubernetes stack detected. Nothing to stop."
    ;;
esac
