# neocom-meta

Onboarding and documentation root for NEOCOM. This repository holds the agent configuration, programme documentation, and specs.

Each repository is one independent project. The parent `neocom` repository is deprecated.

## Active projects

| Repository | Purpose |
| --- | --- |
| [neocom-meta](https://github.com/AdamAntinoo/neocom-meta.git) | This repo: onboarding, programme docs, Cursor agents, OpenSpec, Graphify |
| [neocom-front](https://github.com/AdamAntinoo/neocom-front.git) | Angular frontend. The dev server proxies pilot requests to `neocom-back` |
| [neocom-back](https://github.com/AdamAntinoo/neocom-back.git) | NestJS API. Public pilot data is read from ESI through `@lgriffin/esi.ts` |

Left aside for now: [neocom-domain](https://github.com/AdamAntinoo/neocom-domain.git) and [neocom-esi](https://github.com/AdamAntinoo/neocom-esi.git). They are not required to run or integration-test the service chain.

## Documentation

| Path | What it holds |
| --- | --- |
| `01.PROGRAMME-DEFINITION/` | Architecture and active features |
| `05.REQUIREMENTS-DECOMPOSITION/` | L1 and L2 requirements |
| `openspec/` | Registered and applied OpenSpec changes |
| `.cursor/agents/` | Project agents |
| `.cursor/commands/` | Slash commands |
| `.cursor/skills/` | Workflows those commands follow |

## Commands and skills

| Command | Skill | What it does |
| --- | --- | --- |
| `/spec-collect` | `spec-collect` | Turn `02.SOURCES` into L1 requirements |
| | `extract-requirements-from-urls` | Fetch documentation URLs into `02.SOURCES/extracted` and a Graphify map |
| `/neo:register-spec` | `register-requirements`, `spec-registration` | Review new L1/L2 notes and register them in OpenSpec |
| `/spec-registration` | `spec-registration` | Same registration workflow as `/neo:register-spec` |
| `/feature-delivery` | `feature-delivery` | Apply one registered feature on `feature/<feature>` from `develop`, then commit |
| `/neocom-git-workflow` | `neocom-git-workflow` | Commit, branch, and pull-request playbook for `/neocom-git` |
| `/neo:pr` | `neo-pr` | Commit pending work and prepare pull requests. No project means the three active repositories. `/neo:pr neocom-front` selects one |

OpenSpec also provides `/opsx-explore`, `/opsx-propose`, `/opsx-apply`, `/opsx-update`, `/opsx-sync`, and `/opsx-archive`, with matching skills under `.cursor/skills/`.

Agents for the active projects are `/neocom-meta`, `/neocom-front`, `/neocom-back`, and `/neocom-git`. `/verifier` checks work after it is claimed done.

Feature delivery commits on `feature/<feature-name>` created from `develop`. If that branch does not exist, create it. The pull request into `develop` waits until you have reviewed and tested. `/neo:pr` is the request to commit and prepare that pull request. It does not merge.

## Configuration

NEOCOM project code is **60**. A service port is that code, then the setup digit, then the service digit.

| Digit | Meaning |
| --- | --- |
| Setup `0` | Dev watch. The process reloads while you edit |
| Setup `1` | Stable. The process stays up for integration testing |
| Service `1` | `neocom-front` |
| Service `2` | `neocom-back` |

| Setup | Front | Back |
| --- | --- | --- |
| Dev watch | **6001** | **6002** |
| Stable testing | **6011** | **6012** |

Use one setup for both services. The front proxy for `/v1/pilots` in `neocom-front/config/backends.json` must target the back port of that same setup.

| Setup | Where the port is set |
| --- | --- |
| Dev watch, back | `PORT=6002` in `neocom-back/.env` (copied from `.env.example`) |
| Dev watch, front | `npm run start:dev -- --port 6001` |
| Stable, back | `PORT=6012` |
| Stable, front | `server.port` in `neocom-front/config/backends.json` is `6011`. The `/v1/pilots` route targets `http://127.0.0.1:6012` |

`neocom-back` also reads `ENVIRONMENT`, `LOGLEVEL`, `VERSION` (from `.env.version`), and an optional `BANNER` file. Those do not change the port.

---

## Part 1 — For developers

Local integration runs the whole service chain: the Angular front calls `neocom-back`, and the back reads public ESI data. The pilot panel is the path to exercise: `GET /v1/pilots/93813310`.

WireMock remains available for front routes that are still mocked (`/api`, `/nin/v1`, `/esi/v1`). The pilot chain does not need it.

### Prerequisites

- Git
- [nvm](https://github.com/nvm-sh/nvm)
- Network access so `neocom-back` can reach ESI
- Optional: Java or Docker only when you also start WireMock
- Optional: OpenSpec and Graphify when you work on specs or knowledge graphs in this repository

### 1. Download the repositories

Clone the active projects as siblings:

```bash
git clone https://github.com/AdamAntinoo/neocom-meta.git
git clone https://github.com/AdamAntinoo/neocom-front.git
git clone https://github.com/AdamAntinoo/neocom-back.git
```

### 2. Node version

Every active repository has `.nvmrc` set to the nvm alias `neocom`. Before `node`, `npm`, or `npx`, run `nvm use` in that repository.

```bash
cd neocom-front
nvm use
node -v
```

### 3. Install

```bash
cd neocom-back
nvm use
npm install

cd ../neocom-front
nvm use
npm install
```

In `neocom-back`, copy `.env.example` to `.env` when that file is missing. For the dev-watch setup set `PORT=6002`.

### 4. Start the service chain

Start the dev-watch setup. Start the back first. It listens on port 6002 and uses `@lgriffin/esi.ts` for public character, corporation, portrait, race, ancestry, and bloodline data.

```bash
cd neocom-back
nvm use
npm run start:dev
```

Start the front on port 6001. Point `/v1/pilots` in `config/backends.json` at `http://127.0.0.1:6002`.

```bash
cd neocom-front
nvm use
npm run start:dev -- --port 6001
```

Open `http://127.0.0.1:6001/app/dashboard`. The pilot panel loads pilot `93813310` from the back.

For a stable integration run, bind the back to `6012` and the front to `6011` instead. Leave the watch processes off those ports.

| Process | Role in the chain |
| --- | --- |
| `neocom-back` dev watch | API on port 6002. Reads public ESI |
| `neocom-front` dev watch | UI on `http://127.0.0.1:6001/app/`. Proxies `/v1/pilots` to port 6002 |
| Stable back / front | Ports 6012 and 6011, for integration testing |
| ESI | Reached by the back through `@lgriffin/esi.ts`. No separate ESI process |
| WireMock on port 8080 | Only for front routes that are still mocked |

### 5. Tests

Unit and end-to-end tests stay inside each repository:

```bash
cd neocom-back
nvm use
npm test
npm run test:e2e

cd ../neocom-front
nvm use
npm test
npm run e2e
```

Integration across the chain is the running dashboard: the pilot panel shows the public pilot returned by `neocom-back` from ESI. With the dev-watch processes up, `GET http://127.0.0.1:6001/v1/pilots/93813310` is the same request the panel makes. The stable pair answers that request on port 6011.

---

## Local Kubernetes

Cluster scripts in this repository start a local Kubernetes cluster. They do not deploy the front, the back, or the ESI client. Use the service chain above for integration testing.

```bash
npm run k8s:start       # prefer minikube; else Docker Desktop / kind guidance
npm run k8s:dashboard   # minikube dashboard (Docker Desktop: use Docker UI)
npm run k8s:status      # kubectl cluster-info + nodes
npm run k8s:stop        # minikube stop / kind delete (Docker Desktop: UI)
```

Scripts live under `scripts/k8s/`. No Helm charts or app deploy manifests yet.
