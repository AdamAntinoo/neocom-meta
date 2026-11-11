# Narrative dumps — out of scope (Kubernetes)

Moved from `MPV-Prepare.md`, `WIP-P.md`, and `to TEST.md` on 2026-11-11.
These Trello list dumps are **out of scope** (Kubernetes superseded by Docker / EPIC-017 §08).
Not used by `/epic collect` (collector scans `sources/L0/executive/` only).

---

### From `MPV-Prepare.md`

## [PROJECT] To avoid problems with containers and docker or Kubernetes, the locahost name is not allowed. Use a neocom name for referencing.

- URL: https://trello.com/c/8NCS7sD2/1065-project-to-avoid-problems-with-containers-and-docker-or-kubernetes-the-locahost-name-is-not-allowed-use-a-neocom-name-for-refere
- Card ID: `660ed137c0b81262fba08bc5`

_No description._

---

---

### From `MPV-Prepare.md`

## [RESEARCH] Use Kubernetes Config Maps to parametrize applications and reduce the number os images generated.

- URL: https://trello.com/c/To6otIAC/1068-research-use-kubernetes-config-maps-to-parametrize-applications-and-reduce-the-number-os-images-generated
- Card ID: `660f0a843945a03b4e83d19e`
- Labels: WIP (purple)

_No description._

---

---

### From `MPV-Prepare.md`

## [PROJECT] Deploy Backend on Docker and try to get it on Kubernetes.

- URL: https://trello.com/c/jheBOkE6/1085-project-deploy-backend-on-docker-and-try-to-get-it-on-kubernetes
- Card ID: `661688bb17f805fb9e8d6d3c`

_No description._

---

---

### From `MPV-Prepare.md`

## [PROJECT] Deploy the Frontend and the Java Backend to Kubernetes for a first Stage full version.

- URL: https://trello.com/c/HOP9xVbP/1061-project-deploy-the-frontend-and-the-java-backend-to-kubernetes-for-a-first-stage-full-version
- Card ID: `660e6051f4e1e14882874398`

_No description._

---

---

### From `MPV-Prepare.md`

## [CHORE] Add additional logs to frontend to display the configuration in use on the startup to check for values on Kubernetes.

- URL: https://trello.com/c/t7UyuYeG/1070-chore-add-additional-logs-to-frontend-to-display-the-configuration-in-use-on-the-startup-to-check-for-values-on-kubernetes
- Card ID: `660fbb7cbb6fa55cd69a8f05`

_No description._

---

---

### From `MPV-Prepare.md`

## [CONFIG] Fix the Staging configuration to use the pods available on Kubernetes. Use NodePorts if required.

- URL: https://trello.com/c/pnbNdeNf/1083-config-fix-the-staging-configuration-to-use-the-pods-available-on-kubernetes-use-nodeports-if-required
- Card ID: `6616879f531cddc5c64cb4b0`

_No description._

---

---

### From `WIP-P.md`

## [PROJECT] Move secret and encrypted values to Kubernetes secrets.

- URL: https://trello.com/c/wTOBTaTk/1148-project-move-secret-and-encrypted-values-to-kubernetes-secrets
- Card ID: `667867d0592b512d9601f680`

_No description._

---

---

### From `to TEST.md`

## [PROJECT] Automate the deployment process on the local Kubernetes.

- URL: https://trello.com/c/WN9479vp/1052-project-automate-the-deployment-process-on-the-local-kubernetes
- Card ID: `660bd01be0b9e36b66e4e4ef`
- Labels: DONE (green)

_No description._

---

---

### From `to TEST.md`

## [PROJECT] Check that a service can be accessed from the host and that the pods can access the host mocks.

- URL: https://trello.com/c/HBxhaN9c/1051-project-check-that-a-service-can-be-accessed-from-the-host-and-that-the-pods-can-access-the-host-mocks
- Card ID: `660bc54e778865e38a8b509a`
- Labels: DONE (green)

```
apiVersion: v1
kind: Service
metadata:
  name: esi-data-tst
  namespace: neocom
spec:
  type: ExternalName
  externalName: host.minikube.internal
```

---

---

