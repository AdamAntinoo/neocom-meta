#!/usr/bin/env bash
# Shared helpers for local Kubernetes lifecycle scripts.
set -euo pipefail

have() {
  command -v "$1" >/dev/null 2>&1
}

die() {
  echo "error: $*" >&2
  exit 1
}

docker_running() {
  have docker && docker info >/dev/null 2>&1
}

# Ensure Docker daemon is up (required by minikube docker driver and kind).
# On macOS, launches Docker Desktop and waits until the socket responds.
ensure_docker() {
  if docker_running; then
    echo "Docker daemon is running."
    return 0
  fi

  if ! have docker; then
    die "docker CLI not found. Install Docker Desktop, then re-run: npm run k8s:start"
  fi

  echo "Docker daemon is not running."

  case "$(uname -s)" in
    Darwin)
      if [[ -d "/Applications/Docker.app" ]]; then
        echo "Starting Docker Desktop…"
        open -a Docker
      else
        die "Docker Desktop not found at /Applications/Docker.app. Install it, start Docker, then retry."
      fi
      ;;
    Linux)
      if have systemctl; then
        echo "Attempting to start docker via systemctl (may need sudo)…"
        sudo systemctl start docker || die "Could not start docker. Start the Docker service manually and retry."
      else
        die "Start the Docker daemon manually, then re-run: npm run k8s:start"
      fi
      ;;
    *)
      die "Start Docker manually, then re-run: npm run k8s:start"
      ;;
  esac

  local waited=0
  local timeout="${DOCKER_WAIT_SECONDS:-120}"
  echo "Waiting for Docker daemon (up to ${timeout}s)…"
  while (( waited < timeout )); do
    if docker_running; then
      echo "Docker is ready (${waited}s)."
      return 0
    fi
    sleep 2
    waited=$((waited + 2))
  done

  die "Docker did not become ready within ${timeout}s. Open Docker Desktop, wait until it shows Running, then retry: npm run k8s:start"
}

# Prefer minikube when installed; otherwise detect docker-desktop / kind contexts.
detect_stack() {
  if have minikube; then
    echo "minikube"
    return
  fi

  if have kubectl; then
    local ctx
    ctx="$(kubectl config current-context 2>/dev/null || true)"
    case "${ctx}" in
      docker-desktop|docker-desktop*)
        echo "docker-desktop"
        return
        ;;
      kind-*)
        echo "kind"
        return
        ;;
    esac
  fi

  if have kind; then
    echo "kind"
    return
  fi

  echo "none"
}

require_kubectl() {
  have kubectl || die "kubectl not found. Install kubectl, or enable Kubernetes in Docker Desktop / minikube / kind."
}
