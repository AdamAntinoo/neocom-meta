# neocom-meta
Neocom repository to store the IA agent configuration, project documentation and specs.

## Local Kubernetes

Deployment targets a **local Kubernetes** cluster. From this package:

```bash
npm run k8s:start       # prefer minikube; else Docker Desktop / kind guidance
npm run k8s:dashboard   # minikube dashboard (Docker Desktop: use Docker UI)
npm run k8s:status      # kubectl cluster-info + nodes
npm run k8s:stop        # minikube stop / kind delete (Docker Desktop: UI)
```

Scripts live under `scripts/k8s/` and detect the stack at runtime. No Helm charts or app deploy manifests yet.
