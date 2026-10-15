#!/usr/bin/env bash
# Show local Kubernetes cluster status.
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=_common.sh
source "${SCRIPT_DIR}/_common.sh"

require_kubectl

stack="$(detect_stack)"
echo "Detected stack: ${stack}"
echo "---"
kubectl cluster-info
echo "---"
kubectl get nodes -o wide
