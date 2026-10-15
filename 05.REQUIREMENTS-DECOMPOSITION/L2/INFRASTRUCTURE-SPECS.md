# L2 — Infrastructure specs

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
| `infra-sso-config` | `infra/sso-config` | INFRA-041 … INFRA-042 |

---

## F. Styles — registered in OpenSpec

OpenSpec change: `infra-style-modules` → `specs/infra/style-modules/spec.md`

| ID | Status | Area | Requirement |
| --- | --- | --- | --- |
| INFRA-040 | registered | Styles | Application stylesheets SHALL use the Sass module system (`@use` and `@forward`). They SHALL NOT use `@import`. Angular's global style loader still emits `@import 'src/styles.scss'`; that deprecation id is silenced in the front build until `@angular/build` stops emitting it |

The domain-repository note that was in UNREGISTERED REQUIREMENTS now lives in `L2/DOMAIN/01.NEOCOM-DOMAIN.md` (`domain-module`).

---

## G. SSO configuration — registered in OpenSpec

OpenSpec change: `infra-sso-config` → `specs/infra/sso-config/spec.md`.

Moved here from `L2/01.EPIC-LOGIN-PROCEDURE/common.md` and `architecture.md`.

| ID | Status | Area | Requirement |
| --- | --- | --- | --- |
| INFRA-041 | registered | Config | The environment variables for this login are `EVE_SSO_CLIENT_ID`, `EVE_SSO_CLIENT_SECRET`, `EVE_SSO_CALLBACK_URL`, and `EVE_SSO_SCOPES`. The front configuration file for the environment holds the client id and the client secret. The back reads those values when it exchanges the authorization code. `EVE_SSO_CALLBACK_URL` is used by the back and must match the registered callback. `EVE_SSO_SCOPES` is used by the front and the back: the registered scope names, separated by spaces, with no wildcard |
| INFRA-042 | registered | Config | When deployment is ready, the client id and the client secret come from Kubernetes secrets into the same front configuration entries used locally. On local development those values are written in the front configuration file and are not secured |

## UNREGISTERED REQUIREMENTS

