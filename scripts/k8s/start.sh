#!/usr/bin/env bash
# Start / enable a local Kubernetes cluster (prefers minikube).
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=_common.sh
source "${SCRIPT_DIR}/_common.sh"

stack="$(detect_stack)"

case "${stack}" in
  minikube)
    ensure_docker
    echo "Starting minikube…"
    minikube start
    echo "Cluster ready. Run: npm run k8s:status"
    ;;
  docker-desktop)
    ensure_docker
    echo "Detected Docker Desktop Kubernetes context."
    echo "Enable Kubernetes in Docker Desktop → Settings → Kubernetes if the cluster is not running,"
    echo "then wait until kubectl responds."
    require_kubectl
    if kubectl cluster-info >/dev/null 2>&1; then
      echo "Cluster already reachable."
      kubectl get nodes
    else
      die "Docker Desktop Kubernetes is not reachable yet. Enable it in the Docker Desktop UI and retry: npm run k8s:start"
    fi
    ;;
  kind)
    ensure_docker
    if ! have kind; then
      die "kind context detected but kind CLI not found."
    fi
    require_kubectl
    if kubectl cluster-info >/dev/null 2>&1; then
      echo "kind cluster already reachable."
      kubectl get nodes
    else
      echo "Creating kind cluster (default name: kind)…"
      kind create cluster
    fi
    ;;
  none)
    cat >&2 <<'EOF'
error: no local Kubernetes stack detected.

Install one of:
  • minikube (preferred) — https://minikube.sigs.k8s.io/docs/start/
  • Docker Desktop with Kubernetes enabled
  • kind — https://kind.sigs.k8s.io/

Then re-run: npm run k8s:start
EOF
    exit 1
    ;;
esac
