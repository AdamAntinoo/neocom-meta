# L2 — Infrastructure specs

Living L2 register for infrastructure, installation, configuration, and CI/CD.
Use with `/spec-registration` to promote **pending** rows into OpenSpec. Do not invent product behavior here.

| Legend | Meaning |
| --- | --- |
| `registered` | Already in an OpenSpec change |
| `pending` | Redacted here; **not** yet processed into OpenSpec |

Owning docs/submodules: `neocom-meta` (this file), `neocom-front` (toolchain + local run), parent `neocom` (clone, OpenSpec root, future CI).

---

## A. Toolchain (front) — registered in OpenSpec

OpenSpec change: `front-infrastructure` → capability `front-toolchain`
(`neocom/openspec/changes/front-infrastructure/`)

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

## B. Installation — pending OpenSpec

Redacted from programme README / Initialization; not yet in OpenSpec.

| ID | Status | Area | Requirement |
| --- | --- | --- | --- |
| INFRA-010 | pending | Install | Parent repo is obtained with **git clone --recurse-submodules** of `https://github.com/AdamAntinoo/neocom.git` (or equivalent `git submodule update --init --recursive` after a plain clone) |
| INFRA-011 | pending | Install | Required submodules for front work are present: **`neocom-meta`**, **`neocom-front`** |
| INFRA-012 | pending | Install | Developer installs **nvm**, then installs Node from `neocom-front/.nvmrc` and creates/updates alias **`neocom`** before front install |
| INFRA-013 | pending | Install | Front dependencies are installed with **`npm install`** under `neocom-front` while `nvm use neocom` is active |
| INFRA-014 | pending | Install | **WireMock** is available for local front `dev` (standalone JAR or Docker per project docs); stub root and start command are documented in parent/`neocom-front` README when stubs land |
| INFRA-015 | pending | Install | **`neocom-back` is not required** to install or run front `dev` |
| INFRA-016 | pending | Install | Optional tooling for spec work (OpenSpec CLI, Graphify) is documented separately and is not a blocker for front UI install |

---

## C. Infrastructure configuration — pending OpenSpec

| ID | Status | Area | Requirement |
| --- | --- | --- | --- |
| INFRA-020 | pending | Config | Front **dev** configuration points HTTP clients at the **WireMock** base URL (not `neocom-back`) |
| INFRA-021 | pending | Config | WireMock **port**, **mappings/stub directory**, and npm/scripts (or compose) for start are pinned in `neocom-front` once stubs exist |
| INFRA-022 | pending | Config | Front serve URL for local UI remains the Angular CLI default unless documented otherwise (typically `http://localhost:4200`) |
| INFRA-023 | pending | Config | Environment / configuration files for `dev` (and later `staging` / `prod`) are owned by the relevant submodule and named consistently; secrets are never committed |
| INFRA-024 | pending | Config | Parent `neocom` tracks product folders as **git submodules**; SHA pins are updated when releasing coordinated changes |
| INFRA-025 | pending | Config | On hosts where `sass-embedded` cannot run (e.g. macOS before 14), front scripts may set **`NG_BUILD_SASS_EMBEDDED=0`** so builds use pure-JS Sass; this is an allowed local/CI workaround until the runner OS is upgraded |
| INFRA-026 | pending | Config | Programme architecture and bootstrap docs stay under `neocom-meta/01.PROGRAMME-DEFINITION/` and stay aligned with this L2 register |

---

## D. CI / CD — pending OpenSpec

Not yet designed in detail; register intent here for later Spec Registration.

| ID | Status | Area | Requirement |
| --- | --- | --- | --- |
| INFRA-030 | pending | CI | CI runs on the parent and/or submodule remotes with a **documented Node version** matching `.nvmrc` / engines (prefer the `neocom` pin **24.21.0**) |
| INFRA-031 | pending | CI | Front CI SHALL run **unit tests** (`npm test` / Vitest, non-watch) on every relevant PR |
| INFRA-032 | pending | CI | Front CI SHALL run **lint/format checks** once those scripts are defined in `neocom-front` |
| INFRA-033 | pending | CI | Front CI SHALL produce a **production build** (`npm run build`) and fail the pipeline on build errors |
| INFRA-034 | pending | CI | Acceptance (**Cypress + Cucumber**) SHALL run in CI on a defined job (PR and/or main); app serve + WireMock (or equivalent mocks) MUST be started for that job |
| INFRA-035 | pending | CI | CI MUST NOT require a live `neocom-back` for front-only pipelines; use WireMock or committed stubs |
| INFRA-036 | pending | CD | Deployment targets, environments, and promotion rules (dev to staging to prod) SHALL be defined before first CD pipeline; until then CD is out of scope for implementation |
| INFRA-037 | pending | CD | Artifacts published by CD (front static assets, later back images) SHALL be versioned and traceable to a git SHA (parent and/or submodule) |
| INFRA-038 | pending | CI/CD | Pipeline definitions live in-repo (e.g. GitHub Actions under the owning repo); exact workflow files are chosen at Spec Registration time |
| INFRA-039 | pending | CI/CD | Secrets for CI/CD use the host's secret store (e.g. GitHub Actions secrets); no credentials in git |

### Implementation notes

- Initial GitHub Actions workflow exists at `neocom-front/.github/workflows/build.yml`.
- It compiles the Angular app (`npm ci` + `npm run build`) using Node from `.nvmrc`.
- Addresses intent of INFRA-030 (Node pin), INFRA-033 (production build), INFRA-035 (no live back), INFRA-038 (in-repo Actions).
- Rows INFRA-030…039 remain Status `pending` until `/spec-registration` into OpenSpec.
- Unit/e2e/lint CI jobs still not added (INFRA-031, 032, 034).
- Local Kubernetes is the deployment target; `neocom-meta` package scripts `k8s:start` / `k8s:dashboard` bootstrap the local cluster (still pending OpenSpec).

---

## E. Registration backlog

Promote **pending** IDs via `/spec-registration` into one or more OpenSpec changes, for example:

| Suggested OpenSpec capability / change | Candidate IDs |
| --- | --- |
| `front-toolchain` (already exists — archive/apply as needed) | INFRA-001 … INFRA-008 |
| `developer-install` (new) | INFRA-010 … INFRA-016 |
| `local-infra-config` (new) | INFRA-020 … INFRA-026 |
| `ci-cd` (new) | INFRA-030 … INFRA-039 |

After registration, set each row's **Status** to `registered` and cite the OpenSpec change name here.

## UNREGISTERED REQUIREMENTS
* There is a new repository https://github.com/AdamAntinoo/neocom-domain.git to be added as a submodule and where domain objects should be declared. This repository is a node component that will be used to deeclare typescript classes and other components that belong to the business domain of the neocom project. This module should be included into the front and back by package dependencies so probably it should be published into npm
