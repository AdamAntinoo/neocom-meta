# L2 — Infrastructure specs

<!-- L2-STATUS: placed -->

| Field | Value |
| --- | --- |
| Status | 📌 `placed` |
| Kind | placed |
| Epic | — |
| OpenSpec | `front-infrastructure` and infra rows (see file) |
| Unregistered | 0 |
| Next | See `openspec/CHANGE-STATUS.md` |
| Index | [`L2/INDEX.md`](INDEX.md) |

Living L2 register for infrastructure, installation, configuration, and CI/CD.
Use with `/neo:spec-evolution` to promote **pending** rows into OpenSpec. Do not invent product behavior here.

| Legend | Meaning |
| --- | --- |
| `registered` | Already in an OpenSpec change |
| `pending` | Redacted here; **not** yet processed into OpenSpec |

Owning docs: `neocom-meta` (this file and `openspec/`), `neocom-front` (toolchain + local run).

---

## A. Toolchain (front) — registered in OpenSpec

OpenSpec change: `front-infrastructure` → capability `front-toolchain`
(`openspec/changes/front-infrastructure/`)

| ID | Status | Requirement |
| --- | --- | --- |
| INFRA-001 | registered | Application framework is **Angular** |
| INFRA-002 | registered | Angular version is the **current latest stable** at scaffold/upgrade time (recorded: **22.2.x**) |
| INFRA-003 | registered | Development language is **TypeScript** |
| INFRA-004 | registered | Unit tests use the Angular CLI default runner (**Vitest** on Angular 22) |
| INFRA-005 | registered | Acceptance tests use **Cypress** with **Cucumber** (Gherkin features + step definitions) |
| INFRA-006 | registered | Developers use **nvm**; Node must satisfy Angular's engines (`^22.22.3 \|\| ^24.15.0 \|\| >=26.0.0`) |
| INFRA-007 | registered | nvm alias **`neocom`** points at the approved Node version for the NEOCOM environment (pinned: **24.21.0** via `neocom-front/.nvmrc`) |
| INFRA-008 | registered | Local front **dev** uses **WireMock** for HTTP mocks and does not require `neocom-back` |

---

## B. Installation — registered in OpenSpec

OpenSpec change: `infra-developer-install` → `specs/infra/developer-install/spec.md`

| ID | Status | Area | Requirement |
| --- | --- | --- | --- |
| INFRA-010 | registered | Install | Parent repo is obtained with **git clone --recurse-submodules** of `https://github.com/AdamAntinoo/neocom.git` (or equivalent `git submodule update --init --recursive` after a plain clone) |
| INFRA-011 | registered | Install | Required submodules for front work are present: **`neocom-meta`**, **`neocom-front`** |
| INFRA-012 | registered | Install | Developer installs **nvm**, then installs Node from `neocom-front/.nvmrc` and creates/updates alias **`neocom`** before front install |
| INFRA-013 | registered | Install | Front dependencies are installed with **`npm install`** under `neocom-front` while `nvm use neocom` is active |
| INFRA-014 | registered | Install | **WireMock** is available for local front `dev` (standalone JAR or Docker per project docs); stub root and start command are documented in parent/`neocom-front` README when stubs land |
| INFRA-015 | registered | Install | **`neocom-back` is not required** to install or run front `dev` |
| INFRA-016 | registered | Install | Optional tooling for spec work (OpenSpec CLI, Graphify) is documented separately and is not a blocker for front UI install |

---

## C. Infrastructure configuration — registered in OpenSpec

OpenSpec change: `infra-local-config` → `specs/infra/local-config/spec.md`

| ID | Status | Area | Requirement |
| --- | --- | --- | --- |
| INFRA-020 | registered | Config | Front **dev** configuration points HTTP clients at the **WireMock** base URL (not `neocom-back`) |
| INFRA-021 | registered | Config | WireMock **port**, **mappings/stub directory**, and npm/scripts (or compose) for start are pinned in `neocom-front` once stubs exist |
| INFRA-022 | registered | Config | Front serve URL for local UI remains the Angular CLI default unless documented otherwise (typically `http://localhost:4200`) |
| INFRA-023 | registered | Config | Environment / configuration files for `dev` (and later `staging` / `prod`) are owned by the relevant submodule and named consistently; secrets are never committed |
| INFRA-024 | registered | Config | Parent `neocom` tracks product folders as **git submodules**; SHA pins are updated when releasing coordinated changes |
| INFRA-025 | registered | Config | On hosts where `sass-embedded` cannot run (e.g. macOS before 14), front scripts may set **`NG_BUILD_SASS_EMBEDDED=0`** so builds use pure-JS Sass; this is an allowed local/CI workaround until the runner OS is upgraded |
| INFRA-026 | registered | Config | Programme architecture and bootstrap docs stay under `neocom-meta/01.PROGRAMME-DEFINITION/` and stay aligned with this L2 register |

---

## D. CI / CD — registered in OpenSpec

OpenSpec change: `cicd-pipeline` → `specs/cicd/pipeline/spec.md`

| ID | Status | Area | Requirement |
| --- | --- | --- | --- |
| INFRA-030 | registered | CI | CI runs on the parent and/or submodule remotes with a **documented Node version** matching `.nvmrc` / engines (prefer the `neocom` pin **24.21.0**) |
| INFRA-031 | registered | CI | Front CI SHALL run **unit tests** (`npm test` / Vitest, non-watch) on every relevant PR |
| INFRA-032 | registered | CI | Front CI SHALL run **lint/format checks** once those scripts are defined in `neocom-front` |
| INFRA-033 | registered | CI | Front CI SHALL produce a **production build** (`npm run build`) and fail the pipeline on build errors |
| INFRA-034 | registered | CI | Acceptance (**Cypress + Cucumber**) SHALL run in CI on a defined job (PR and/or main); app serve + WireMock (or equivalent mocks) MUST be started for that job |
| INFRA-035 | registered | CI | CI MUST NOT require a live `neocom-back` for front-only pipelines; use WireMock or committed stubs |
| INFRA-036 | registered | CD | Deployment targets, environments, and promotion rules (dev to staging to prod) SHALL be defined before first CD pipeline; until then CD is out of scope for implementation |
| INFRA-037 | registered | CD | Artifacts published by CD (front static assets, later back images) SHALL be versioned and traceable to a git SHA (parent and/or submodule) |
| INFRA-038 | registered | CI/CD | Pipeline definitions live in-repo (e.g. GitHub Actions under the owning repo); exact workflow files are chosen at Spec Registration time |
| INFRA-039 | registered | CI/CD | Secrets for CI/CD use the host's secret store (e.g. GitHub Actions secrets); no credentials in git |

### Implementation notes

- Initial GitHub Actions workflow exists at `neocom-front/.github/workflows/build.yml`.
- It compiles the Angular app (`npm ci` + `npm run build`) using Node from `.nvmrc`.
- Addresses intent of INFRA-030 (Node pin), INFRA-033 (production build), INFRA-035 (no live back), INFRA-038 (in-repo Actions).
- Rows INFRA-030…039 are registered in OpenSpec change `cicd-pipeline`.
- Unit/e2e/lint CI jobs are specified (INFRA-031, 032, 034) and are not implemented yet.
- Local Kubernetes is the deployment target; `neocom-meta` package scripts `k8s:start` / `k8s:dashboard` bootstrap the local cluster (recorded on `cicd-pipeline`).

---

## E. Registration map

| OpenSpec change | Capability path | IDs |
| --- | --- | --- |
| `front-infrastructure` | `front-toolchain` | INFRA-001 … INFRA-008 |
| `infra-developer-install` | `infra/developer-install` | INFRA-010 … INFRA-016 |
| `infra-local-config` | `infra/local-config` | INFRA-020 … INFRA-026 |
| `cicd-pipeline` | `cicd/pipeline` | INFRA-030 … INFRA-039 |
| `infra-style-modules` | `infra/style-modules` | INFRA-040 |
| `nestjs-sso-config` | `back/nestjs-sso-config` | INFRA-041 … INFRA-042 |
| `infra-async-persistence` | `infra/async-persistence` | INFRA-050 … INFRA-055 |
| `infra-test-commands` | `infra/test-commands` | INFRA-060 … INFRA-064 |

---

## F. Styles — registered in OpenSpec

OpenSpec change: `infra-style-modules` → `specs/infra/style-modules/spec.md`

| ID | Status | Area | Requirement |
| --- | --- | --- | --- |
| INFRA-040 | registered | Styles | Application stylesheets SHALL use the Sass module system (`@use` and `@forward`). They SHALL NOT use `@import`. Angular's global style loader still emits `@import 'src/styles.scss'`; that deprecation id is silenced in the front build until `@angular/build` stops emitting it |

The domain-repository note that was in UNREGISTERED REQUIREMENTS now lives in `L2/DOMAIN/01.NEOCOM-DOMAIN.md` (`domain-module`).

---

## G. SSO configuration — registered in OpenSpec

OpenSpec change: `nestjs-sso-config` → `specs/back/nestjs-sso-config/spec.md`.

Moved here from `L2/01.EPIC-LOGIN-PROCEDURE/common.md` and `architecture.md`.

| ID | Status | Area | Requirement |
| --- | --- | --- | --- |
| INFRA-041 | registered | Config | The environment variables for this login are `EVE_SSO_CLIENT_ID`, `EVE_SSO_CLIENT_SECRET`, `EVE_SSO_CALLBACK_URL`, and `EVE_SSO_SCOPES`. The front configuration file for the environment holds the client id and the client secret. The back reads those values when it exchanges the authorization code. `EVE_SSO_CALLBACK_URL` is used by the back and must match the registered callback. `EVE_SSO_SCOPES` is used by the front and the back: the registered scope names, separated by spaces, with no wildcard |
| INFRA-042 | registered | Config | When deployment is ready, the client id and the client secret come from Kubernetes secrets into the same front configuration entries used locally. On local development those values are written in the front configuration file and are not secured |

## H. Async persistence (PostgreSQL / Redis) — registered in OpenSpec

OpenSpec change: `infra-async-persistence` → `specs/infra/async-persistence/spec.md`.

Source: `L2/02.EPIC-ANGULAR-CODIFICATION.async-infra.md` (EPIC-002). Companion: `front-async-sse`, `back-async-sse`.

| ID | Status | Area | Requirement |
| --- | --- | --- | --- |
| INFRA-050 | applying | Async | The asynchronous workflow needs a durable database for extended and calculated data and a way to run background enrichment (provision alongside front/back library work owned by `front-async-sse` / `back-async-sse`). Local compose: `infra/docker-compose.async-persistence.yml`. |
| INFRA-051 | applying | Persistence | Persist extended and calculated results that must not be recomputed on every page open (for example blueprint manufacture index, expanded BOM cost fields, enrichment status, timestamps for staleness). Durable application storage, distinct from the front adapter cache and from any short-lived HTTP/CDN cache. Record shape: `infra/async-persistence.md`. |
| INFRA-052 | applying | Persistence | Database contents at least: scope key (e.g. pilot id), node identity, simplified fields, calculated fields, readiness/completion state, `updatedAt` / staleness markers, and enough payload to rebuild a viewer node without calling ESI again when fresh. Operations: read list for HTTP response; upsert one item when background work finishes; query incomplete or stale items for the worker. |
| INFRA-053 | applying | Persistence | A relational database is required. Prefer PostgreSQL unless programme infra already standardises another engine. Access from Nest via an official or Nest-supported ORM/query layer (package chosen at design time). Schema and migrations live in `neocom-back` (or a shared infra repo if adopted later). |
| INFRA-054 | applying | Provision | Provision PostgreSQL (persistence) and Redis (queue and optional pub/sub for SSE fan-out). Config/secrets for DB and Redis in back environments; SSE URL/base path in front environments. Documented in `infra/async-persistence.md`. |
| INFRA-055 | applying | Checklist | Checklist: PostgreSQL (or approved equivalent) provisioned for processed/calculated node data; Nest persistence module + migrations for list/item records and staleness fields; Redis + BullMQ (or approved queue) for one-by-one background enrichment; Nest `@Sse()` endpoints per list scope with Redis pub/sub if multiple replicas; front adapter with HTTP + cache + authenticated SSE consumer; front panel wiring for in-place SSE merge; DB/Redis secrets in back envs; SSE base path in front envs. See `infra/async-persistence.md`. |

## I. Testing command catalog — registered in OpenSpec

OpenSpec change: `infra-test-commands` → `specs/infra/test-commands/spec.md`.

Source: `L2/03.EPIC-TESTING.command-catalog.md` (EPIC-003).

| ID | Status | Area | Requirement |
| --- | --- | --- | --- |
| INFRA-060 | registered | Test commands | There SHALL be a **catalog of stable, common testing commands** shared across NEOCOM projects. Names SHALL be **short and clear**. |
| INFRA-061 | registered | Test commands | Front and back MAY differ in how each command is implemented, but the catalog names and intent SHALL stay the same so agents and developers use one vocabulary. |
| INFRA-062 | registered | Test commands | The catalog SHALL cover separately: **TDD** (unit testing — project unit runner, e.g. Vitest on front and back); **BDD** (acceptance testing — Cypress with Gherkin); **SDD** (integration / full automated UI testing — defined later; SHALL cover cross-cutting automated UI tests beyond acceptance scenarios). |
| INFRA-063 | registered | Test commands | Each catalog entry SHALL include the **environment setup** required to run that layer (for example Node/nvm, WireMock or mocks, app under test, Cypress binary). |
| INFRA-064 | registered | Test commands | There SHALL also be a command that runs **all testing layers in sequence** (TDD, then BDD, then SDD when defined), after applying the setup each layer needs. |

## UNREGISTERED REQUIREMENTS

