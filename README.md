# neocom-meta

Onboarding and documentation root for NEOCOM. This repository holds the agent configuration, programme documentation, and specs.

Product repositories are independent clones. The parent `neocom` checkout is not required to install or run the ecosystem.

| Repository | Purpose |
| --- | --- |
| [neocom-meta](https://github.com/AdamAntinoo/neocom-meta.git) | This repo: onboarding, programme docs, Cursor agents |
| [neocom-front](https://github.com/AdamAntinoo/neocom-front.git) | Angular 22 frontend |
| [neocom-domain](https://github.com/AdamAntinoo/neocom-domain.git) | Business-domain TypeScript package |
| `neocom-back` | Backend API (not required for front `dev`) |

## Documentation

| Path | What it holds |
| --- | --- |
| `01.PROGRAMME-DEFINITION/` | Architecture and active features (Initialization, Login, and the rest of the programme) |
| `05.REQUIREMENTS-DECOMPOSITION/` | L1 and L2 requirements |
| `openspec/` | Registered and applied OpenSpec changes |
| `.cursor/` | Cursor agents, commands, and conventions |

Spec intake:

- `/spec-collect` — sources → L1 requirements
- `/spec-registration` — atomic L1/L2 → OpenSpec
- `/neo:register-spec` — review notes under `UNREGISTERED REQUIREMENTS` and register them

OpenSpec changes and the Graphify knowledge graph are kept with this documentation set.

---

## Part 1 — For developers

Local **dev** runs the Angular front against **WireMock**. The front does **not** call `neocom-back` in this mode: HTTP dependencies are mocked.

### Prerequisites

- Git
- [nvm](https://github.com/nvm-sh/nvm) (Node Version Manager)
- Java (for WireMock standalone) **or** Docker if you run WireMock in a container
- Optional: [OpenSpec](https://openspec.dev/docs/installation) / Graphify only if you work on specs or knowledge graphs

### 1. Download the repositories

```bash
git clone https://github.com/AdamAntinoo/neocom-meta.git
git clone https://github.com/AdamAntinoo/neocom-front.git
git clone https://github.com/AdamAntinoo/neocom-domain.git
```

Clone them as siblings when a front test needs the domain checkout beside `neocom-front`.

### 2. Node version (nvm + `neocom` alias)

`neocom-front` uses **Angular 22**, which requires Node `^22.22.3 || ^24.15.0 || >=26.0.0`. The front repo pins **24.21.0** in `.nvmrc`.

```bash
cd neocom-front
nvm install          # installs the version from .nvmrc (24.21.0)
nvm alias neocom 24.21.0
nvm use neocom
node -v              # expect v24.21.0
```

Use `nvm use neocom` whenever you work on NEOCOM so the shell matches the project Node.

### 3. Install

```bash
cd neocom-front
nvm use neocom
npm install
```

WireMock stubs for local front `dev` are in `neocom-front/support/wiremock`.

```bash
# Example — standalone JAR
# java -jar wiremock-standalone.jar --port 8080 --root-dir neocom-front/support/wiremock

# Example — Docker
# docker run --rm -p 8080:8080 -v "$PWD/neocom-front/support/wiremock:/home/wiremock" wiremock/wiremock:latest
```

Backend (`neocom-back`) is **not** required for the front **dev** configuration.

### 4. Start local services (dev)

1. **Start WireMock** on port 8080 with stub root `neocom-front/support/wiremock` (front points at WireMock, e.g. `http://localhost:8080`).
2. **Start the Angular front** in **dev**:

```bash
cd neocom-front
nvm use neocom
npm run start:dev
```

3. Open the URL printed by the Angular CLI (typically `http://localhost:4200`).

| Process | Needed for front `dev`? | Role |
| --- | --- | --- |
| WireMock | **Yes** | Mocks backend HTTP APIs |
| `neocom-front` (`dev`) | **Yes** | Angular 22 + TypeScript UI |
| `neocom-back` | **No** | Real API — not used in front `dev` |

### 5. Tests (front)

```bash
cd neocom-front
nvm use neocom
npm test          # Vitest
npm run e2e       # Cypress + Cucumber (serve the app first for local runs)
```

---

## Local Kubernetes

Deployment targets a **local Kubernetes** cluster. From this repository:

```bash
npm run k8s:start       # prefer minikube; else Docker Desktop / kind guidance
npm run k8s:dashboard   # minikube dashboard (Docker Desktop: use Docker UI)
npm run k8s:status      # kubectl cluster-info + nodes
npm run k8s:stop        # minikube stop / kind delete (Docker Desktop: UI)
```

Scripts live under `scripts/k8s/` and detect the stack at runtime. No Helm charts or app deploy manifests yet.
