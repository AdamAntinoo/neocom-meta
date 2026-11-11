# NEOCOM programme

Onboarding and documentation root for NEOCOM. This repository holds the agent configuration, programme documentation, and specs. The GitHub landing page is the short [README.md](./README.md); this file is the full programme guide.

Each repository is one independent project. The parent `neocom` repository is deprecated.

## Contents

1. [Active projects](#1-active-projects)
2. [Documentation](#2-documentation)
3. [Commands](#3-commands)
4. [Configuration](#4-configuration)
   1. [Ports](#41-ports)
   2. [External services (Docker)](#42-external-services-docker)
5. [Methodology](#5-methodology)
   1. [Stages](#51-stages)
   2. [Open an epic](#52-open-an-epic)
   3. [Register a reviewed epic into OpenSpec](#53-register-a-reviewed-epic-into-openspec)
   4. [A duplicate or a very similar requirement](#54-a-duplicate-or-a-very-similar-requirement)
   5. [Requirement status on the epic](#55-requirement-status-on-the-epic)
   6. [Iteration](#56-iteration)
   7. [Develop several features](#57-develop-several-features)
6. [For developers](#6-for-developers)
   1. [Prerequisites](#61-prerequisites)
   2. [Download the repositories](#62-download-the-repositories)
   3. [Node version](#63-node-version)
   4. [Install](#64-install)
   5. [External services](#65-external-services)
   6. [Start the service chain](#66-start-the-service-chain)
   7. [Tests](#67-tests)
7. [Docker deployment (`staging` / `prod`)](#7-docker-deployment-staging--prod)

## 1. Active projects

Four independent GitHub projects. Clone URLs below are the `origin` remotes used by the programme.

| Repository | Clone URL | Purpose |
| --- | --- | --- |
| [neocom-meta](https://github.com/AdamAntinoo/neocom-meta) | `https://github.com/AdamAntinoo/neocom-meta.git` | This repo: onboarding, programme docs, agent harness (`.dsh/`), OpenSpec, Graphify |
| [neocom-front](https://github.com/AdamAntinoo/neocom-front) | `https://github.com/AdamAntinoo/neocom-front.git` | Angular frontend. The dev server proxies pilot requests to `neocom-back` |
| [neocom-back](https://github.com/AdamAntinoo/neocom-back) | `https://github.com/AdamAntinoo/neocom-back.git` | NestJS API. Public pilot data is read from ESI through `@lgriffin/esi.ts` |
| [neocom-domain](https://github.com/AdamAntinoo/neocom-domain) | `https://github.com/AdamAntinoo/neocom-domain.git` | Published Node domain library on npm. Package version is npm-led (`npm run version:sync` from latest publish); git tags follow publish |

Left aside for now: [neocom-esi](https://github.com/AdamAntinoo/neocom-esi) (`https://github.com/AdamAntinoo/neocom-esi.git`). The deprecated parent [neocom](https://github.com/AdamAntinoo/neocom) repository is not an active project — do not clone it for new work.

## 2. Documentation

| Path | What it holds |
| --- | --- |
| `01.PROGRAMME-DEFINITION/` | Architecture and active features |
| `sources/` | L0 and L1 requirements |
| `openspec/` | Registered and applied OpenSpec changes. Agents keep `openspec/CHANGE-STATUS.md` current after every OpenSpec change |
| `.cursor/agents/` | Project agents |
| `.cursor/commands/` | Slash commands |
| `.cursor/skills/` | Workflows those commands follow |

## 3. Commands

Type the command in chat. A name in `<angle brackets>` is the argument you supply.

| Command | Definition | Usage |
| --- | --- | --- |
| `/epic` | Open an epic. The same prompt starts with the name and continues with the purpose, scope, and other details. The L1 file is `NN.EPIC-NAME.md`, from `01.EPIC-LOGIN-PROCEDURE.md` | `/epic login procedure A brief description of the purpose, scope, and other details.` |
| `/neocom-methodology` | Walk design, spec, develop, test, and deploy. Define an epic and register reviewed units into OpenSpec | `/neocom-methodology` |
| `/epic:extract` | Register L1 units whose Review cell is `[x] reviewed` into OpenSpec. No args: epics with pending work. Args: epic number(s) preferred (`01`, `02`). Duplicates go to `sources/L1/00.DUPLICATES.md` | `/epic:extract` or `/epic:extract 01` or `/epic:extract 01 02` |
| `/opsx-explore` | Think through an idea, a problem, or a requirement before a change exists | `/opsx-explore` |
| `/opsx-propose` | Create one OpenSpec change and its proposal, spec, design, and tasks. Planning only | `/opsx-propose <system>-<feature>` |
| `/opsx-update` | Revise the planning artifacts of an existing change and keep them consistent | `/opsx-update <system>-<feature>` |
| `/opsx-apply` | Implement the tasks of an OpenSpec change. NEOCOM delivery uses `/feature-delivery` so the work lands on `feature/<feature>` | `/opsx-apply <system>-<feature>` |
| `/opsx-sync` | Copy a change's delta specs into the main specs. Leaves the change open | `/opsx-sync <system>-<feature>` |
| `/opsx-archive` | Sync when needed, then move a completed change to `openspec/changes/archive/`. The release pull request is a separate step | `/opsx-archive <system>-<feature>` |
| `/feature-delivery` | Apply a registered feature on `feature/<feature>` from `develop` and commit. Several features can be open. Rebase when one needs another's code. One pull request into `develop` can carry several features. Stop for review first | `/feature-delivery <feature>` |
| `/neocom-code` | Implement product code for a registered change in the repository that owns it | `/neocom-code` |
| `/neocom-meta` | Edit docs, sources, agent configuration, and the spec pipeline in `neocom-meta` | `/neocom-meta` |
| `/verifier` | Read-only check that a claimed change exists in the owning repository and matches the spec | `/verifier` |
| `/neocom-git` | Commits, branches, pull requests, tags, and package versions for one repository | `/neocom-git` |
| `/neocom-git-workflow` | The commit, branch, and pull-request playbook used by `/neocom-git` | `/neocom-git-workflow` |
| `/git:commit` | Commit all pending changes on one repository's current branch. Project is required | `/git:commit neocom-front` |
| `/git:pr` | Commit pending work and open the pull request. No project means `neocom-meta`, `neocom-front`, and `neocom-back`. A named aside repository is skipped | `/git:pr` or `/git:pr neocom-front` |

A pull request into `develop` uses a Conventional Commit title. A pull request from `develop` into `main` is titled `Release-` plus GitVersion `MajorMinorPatch`. Neither pull request is merged unless you ask.

## 4. Configuration

### 4.1 Ports

NEOCOM project code is **60**. A service port is that code, then the setup digit, then the service digit.

| Digit | Meaning |
| --- | --- |
| Setup `0` | Dev watch. The process reloads while you edit |
| Setup `1` | Stable. The process stays up for integration testing |
| Service `1` | `neocom-front` |
| Service `2` | `neocom-back` |

| Setup | Front | Back | Postgres | Redis |
| --- | --- | --- | --- | --- |
| Dev watch | **6001** | **6002** | **6003** | **6004** |
| Stable testing | **6011** | **6012** | **6013** | **6014** |

Use one setup for both app processes. The front proxy for `/v1/pilots` in `neocom-front/config/backends.json` must target the back port of that same setup. After the back port, Postgres takes the next number and Redis the one after that.

| Setup | Where the port is set |
| --- | --- |
| Dev watch, back | `PORT=6002` in `neocom-back/.env.application` |
| Dev watch, front | `npm run start:dev -- --port 6001` |
| Dev watch, Postgres / Redis | `neocom-back/tools/docker` host ports `6003` / `6004`; `DATABASE_URL` / `REDIS_URL` in `.env.async` |
| Stable, back | `PORT=6012` |
| Stable, front | `server.port` in `neocom-front/config/backends.json` is `6011`. The `/v1/pilots` route targets `http://127.0.0.1:6012` |

`neocom-back` also reads `ENVIRONMENT`, `LOGLEVEL`, `VERSION` (from `.env.version`), and an optional `BANNER` file. Those do not change the port.

### 4.2 External services (Docker)

Required **external services** for a full local back stack live under `neocom-back/tools/docker/` (`docker-compose.yml`). Reviewed against that compose file:

| Service | Image | Container | Host port (dev-watch) | Container port | Role |
| --- | --- | --- | --- | --- | --- |
| PostgreSQL | `postgres:16-alpine` | `neocom-back-postgres` | **6003** | `5432` | Async persistence (processed / calculated nodes). DB `neocom_async`, user/password `neocom` / `neocom` |
| Redis | `redis:7-alpine` | `neocom-back-redis` | **6004** | `6379` | BullMQ enrichment queue and optional SSE fan-out |

Nest connects with `.env.async` (defaults match compose):

| Variable | Default |
| --- | --- |
| `DATABASE_URL` | `postgresql://neocom:neocom@localhost:6003/neocom_async` |
| `REDIS_URL` | `redis://localhost:6004` |

Start / stop from `neocom-back` root: `npm run docker:up` / `npm run docker:down` / `npm run docker:ps` (compose file `tools/docker/docker-compose.yml`). After Postgres is healthy, apply schema with Flyway (`npm run db:migrate`; see `neocom-back/tools/db/`). Without `DATABASE_URL` / `REDIS_URL`, Nest falls back to in-memory store and in-process enrichment (unit tests / offline).

**Not** in `tools/docker`: WireMock (front mocks; optional for the ESI pilot chain). App **`staging`** / **`prod`** deploy is Docker (§7 / EPIC-017 §08).

## 5. Methodology

`/neocom-methodology` follows this section. The workflow is design, spec, develop, test, and deploy, across every code repository. An epic is the first step. An epic collects requirements that usually span more than one repository.

Git stays with `/neocom-git`. Product code stays with `/neocom-code`. Registering reviewed L1 units into OpenSpec stays with `/epic:extract`. This methodology decides the order and where a requirement sits. Command definitions are in [section 3](#3-commands).

### 5.1 Stages

| Stage | What happens | Who acts |
| --- | --- | --- |
| Design | `/epic` writes the L1 file from the name and the goals | `/neocom-methodology` |
| Spec | `/epic:extract` registers reviewed L1 units into OpenSpec | `/epic:extract` |
| Develop | Several features can be open. Each starts as `feature/<feature>` from `develop`. Rebase when one needs another's code. One pull request into `develop` can carry several of them | `/neocom-code`, commit by `/neocom-git` |
| Test | Run the tests the change names. The user reviews the branch | `/verifier`, then the user |
| Deploy | After archive, open a pull request from `develop` into `main` titled `Release-` plus GitVersion `MajorMinorPatch` | `/neocom-git` |

Deploy does not invent a host. The release pull request is the promotion. It stays unmerged until the user asks.

```mermaid
flowchart LR
  design[Design: epic L1] --> spec[Spec: OpenSpec]
  spec --> develop[Develop on feature branch]
  develop --> test[Test and user review]
  test --> deploy[Deploy: develop into main]
```

### 5.2 Open an epic

`/epic` is the first action. The prompt is one sequence. The name and the description are not placed on separate lines. The name comes first. The rest of the same prompt is a brief description of the purpose, the scope, and the other details. The epic is expected to expand into a set of features.

```text
/epic login procedure A brief description of the purpose, scope, and other details of the epic that will expand into a set of features.
```

The L1 file name is `NN.EPIC-NAME.md`. `NN` is the next two-digit number, starting at `01`. `EPIC-NAME` is `EPIC-` plus the name in uppercase, with words separated by `-`:

`sources/L1/01.EPIC-LOGIN-PROCEDURE.md`

The file uses this template. The title is the id, then the name in uppercase. `## Goals` is the description from the prompt.

```markdown
# EPIC-001 - LOGIN PROCEDURE

## Spec traceability

| Field | Value |
| --- | --- |
| Status | `none` |
| OpenSpec changes | |
| Index | `L1/TRACEABILITY.md` |

## Goals
The goal of this epic is to define the login procedure for the application.
```

An epic collects requirements that usually span more than one repository. Later prompts add templates, designs, and other material that describes the features inside the epic. That material is appended to the same file. Agents keep `## Spec traceability` and `L1/TRACEABILITY.md` updated when OpenSpec changes are registered, applying, applied, or archived, so later runs skip work already processed.

```mermaid
flowchart TD
  prompt["/epic login procedure, then the description"] --> file["L1/01.EPIC-LOGIN-PROCEDURE.md"]
  file --> title["# EPIC-001 - LOGIN PROCEDURE"]
  file --> goals["## Goals"]
  later[Later prompts: templates, designs, features] --> file
```

### 5.3 Register a reviewed epic into OpenSpec

`/epic:extract` reads L1 only. With no arguments it processes every epic that still has units at `[x] reviewed` (`L1/TRACEABILITY.md`). With one or more epic references (`01`, `EPIC-001`, `login`, path, …) it processes only those epics. It writes an OpenSpec change `<system>-<feature>`. It does not write `sources/L2/`.

Requirements are authored **inside the L1 epic** under sections, each with a **Review** status. New requirements start at **`to review`**. The old `UNREGISTERED REQUIREMENTS` inbox is deprecated.

One iteration registers only units whose Review cell is `[x] reviewed`. Sections still `to review` stay on the epic. After registration, that cell becomes `registered`. The next iteration starts when a unit is set to `[x] reviewed`. `superseded`, `out of scope`, and `duplicated` are never registered. Legacy `extracted` (from the removed L2 copy) is skipped unless set back to `[x] reviewed`.

```mermaid
flowchart TD
  l1["L1 epic, Review = reviewed"] --> os["openspec/changes/system-feature"]
```

### 5.4 A duplicate or a very similar requirement

When extract finds a unit that duplicates a requirement already in OpenSpec, or is very similar to one, that unit is **not** registered again. It is moved to the holding epic [`sources/L1/00.DUPLICATES.md`](./sources/L1/00.DUPLICATES.md) for user review, reinsertion, or removal. On the source epic, Review becomes `duplicated`.

```mermaid
flowchart TD
  note[Reviewed unit] --> compare{Same or very similar to an OpenSpec requirement?}
  compare -->|yes| dup["sources/L1/00.DUPLICATES.md"]
  compare -->|no| openspec[Register]
  dup --> review[User reviews, reinserts, or removes]
```

`00.DUPLICATES` is not a normal source. Notes held there are ignored until the user reinserts them into a product epic (typically at `to review` or `reviewed`).

### 5.5 Requirement status on the epic

Control is the **Review** cell on register / requirement rows inside L1 sections:

| Status | Role |
| --- | --- |
| `to review` | Initial. Not registrable. |
| `reviewed` | Ready for `/epic:extract`. |
| `registered` | Already in OpenSpec. |
| `extracted` | Legacy, from the removed L2 copy. Skipped unless set back to `reviewed`. |
| `duplicated` | Holding copy in `00.DUPLICATES`. |
| `superseded` / `out of scope` | Never register. |

### 5.6 Iteration

Design and spec repeat. A new requirement is added to an L1 epic section at `to review`. When the developer sets it to `[x] reviewed`, `/epic:extract` registers it into OpenSpec or moves it to `00.DUPLICATES`. Develop, test, and deploy run for the features that were registered. Section 5.7 is how several of those features stay open without colliding.

### 5.7 Develop several features

More than one registered feature can be in progress at the same time. In **`neocom-front`** and **`neocom-back`**, each one is its own branch created from `develop` (`feature/<feature>`).

`neocom-meta` has no product code. General agents, docs, and OpenSpec work commits on **`feature/agents`** (usually the single active meta branch). CI/CD ecosystem work uses **`feature/cicd`** when commanded; that branch is rebased onto the latest `feature/agents` tip or onto `develop` as instructed. Do not open a short-lived `feature/<product-feature>` on meta for each OpenSpec apply.

`/neocom-code` implements a product feature's tasks on `feature/<feature>`. `/neocom-git` commits on that branch (or on `feature/agents` / `feature/cicd` in meta). A new product feature is not created from another feature branch, and it is not created from `main`.

Two open branches in the same repository must not edit the same files while both still start from `develop`. When they would, stop and choose which branch rebases onto the other before either continues.

A feature rebases onto another open feature only when it needs that feature's code. The branch is still the one that was created from `develop`. After the branch it depends on moves, rebase again onto that new tip. Conflicts are resolved on the branch being rebased. The branch underneath is left as it is.

Before a pull request:

- Sync the package version from GitVersion `MajorMinorPatch` (`npm run version:sync` in `neocom-front` or `neocom-back`). Commit any version file changes. Do not open a PR with a stale version.
- A feature that depends on no other open feature is rebased onto the current `develop`.
- A feature that depends on another is rebased only after that other feature has been rebased onto `develop`.
- A rebase rewrites the feature branch. If that branch is already on the remote, `/neocom-git` asks before a force push. `develop` and `main` are not force-pushed.

Apply still stops for review. It does not open the pull request. After the user accepts the review, several features can go into the same pull request into `develop`. Stack them in dependency order and open the pull request from the tip of that stack. The pull request names every feature it contains. Features that do not depend on each other and do not touch the same files stay in separate pull requests unless the user asks to group them.

```mermaid
flowchart TD
  develop[develop] --> featureA["feature/login-page from develop"]
  develop --> featureB["feature/login-callback from develop"]
  featureA --> rebase["rebase callback onto login-page when it needs that code"]
  featureB --> rebase
  rebase --> stack[Stack the reviewed features]
  featureA --> stack
  stack --> pr["One pull request into develop"]
```

## 6. For developers

Local integration runs the whole service chain: the Angular front calls `neocom-back`, and the back reads public ESI data. The pilot panel is the path to exercise: `GET /v1/pilots/93813310`.

WireMock remains available for front routes that are still mocked (`/api`, `/nin/v1`, `/esi/v1`). The pilot chain does not need it.

### 6.1 Prerequisites

- Git
- [nvm](https://github.com/nvm-sh/nvm)
- [Docker](https://docs.docker.com/get-docker/) — required for [§4.2 External services](#42-external-services-docker) (PostgreSQL + Redis via `neocom-back/tools/docker`)
- Network access so `neocom-back` can reach ESI
- Optional: Java or a second Docker use when you also start WireMock for front mocks
- Optional: OpenSpec and Graphify when you work on specs or knowledge graphs in this repository

### 6.2 Download the repositories

Clone every **active** project from [§1 Active projects](#1-active-projects) as siblings (same parent directory). Use the Clone URL column:

```bash
git clone https://github.com/AdamAntinoo/neocom-meta.git
git clone https://github.com/AdamAntinoo/neocom-front.git
git clone https://github.com/AdamAntinoo/neocom-back.git
git clone https://github.com/AdamAntinoo/neocom-domain.git
```

Do not clone aside or deprecated repositories (`neocom-esi`, parent `neocom`) unless you have an explicit reason.

### 6.3 Node version

Every active repository has `.nvmrc` set to the nvm alias `neocom`. Before `node`, `npm`, or `npx`, run `nvm use` in that repository.

```bash
cd neocom-front
nvm use
node -v
```

### 6.4 Install

Install dependencies in each code repository (with `nvm use neocom` / `nvm use` active):

```bash
cd neocom-domain
nvm use
npm install

cd ../neocom-back
nvm use
npm install

cd ../neocom-front
nvm use
npm install
```

In `neocom-back`, set `PORT=6002` in `.env.application` for the dev-watch setup. Confirm `.env.async` has the `DATABASE_URL` / `REDIS_URL` defaults from [§4.2](#42-external-services-docker).

### 6.5 External services

Bring up the required Docker services from [§4.2](#42-external-services-docker):

```bash
cd neocom-back
nvm use
npm run docker:up      # PostgreSQL :6003, Redis :6004
npm run docker:ps      # both healthy
npm run db:migrate     # Flyway schema once Postgres is up
```

Stop with `npm run docker:down` when finished.

### 6.6 Start the service chain

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

### 6.7 Tests

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

## 7. Docker deployment (`staging` / `prod`)

Programme **`staging`** and **`prod`** deployments target a **Docker engine** (see EPIC-017 §08): `develop` → `staging`, `main` → `prod`. Local developer work uses `dev` (`start:dev`) and the service chain in [section 6](#6-for-developers). Shared data services for local async (Postgres / Redis) use Docker Compose under the product repos (`neocom-back` `tools/docker/`). App image / compose manifests for full `staging`/`prod` stacks are owned by the product repositories and the CD workflows — not a separate cluster bootstrap in this meta repo.
