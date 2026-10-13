# Feature — Initialization

| Field | Value |
| --- | --- |
| ID | `FEAT-INIT` |
| Status | recorded (active in programme definition) |
| Owners | `neocom-front`, `neocom-back` (when present), `neocom-meta` for programme/config |
| Related L1 | *(to be linked after `/spec-collect`)* |
| Sources | Programme repos; app bootstrap conventions; NestJS / platform docs as applicable |

## Intent

Bring the NEOCOM application and supporting programme configuration to a usable starting state: repositories present, front (and later back) bootstrapped, environment and tooling ready so other features (starting with Login) can run.

## In scope (initial)

- Parent `neocom` checkout with submodules initialized (`neocom-meta`, `neocom-front`).
- Frontend app scaffold on latest Angular + TypeScript with Vitest and Cypress + Cucumber available for later acceptance work.
- Local **dev** front run uses **WireMock** for mocked APIs; `neocom-back` is not required in this mode.
- Programme documentation and agent/spec pipeline available under `neocom-meta`.
- OpenSpec and Graphify available at the ecosystem root for subsequent spec and map work.
- Clear first-run / bootstrap path documented for developers in the parent README (clone → submodule update → install → WireMock → front `dev`).

## Out of scope (for now)

- Full production deployment and CI topology (track under L2 / infrastructure when defined).
- Completing Login flows (see [login.md](./login.md)).
- Deciding or scaffolding `neocom-back` until the backend stack is chosen.

## Working branch

- **Branch:** `feature/initialization` (parent `neocom`, `neocom-meta`, `neocom-front`).
- Exception to the usual `feat/…` convention: this workstream uses the user-mandated `feature/…` prefix.

## Notes from development

- Developer entrypoint: `neocom/README.md` Part 1 (download, install, start with WireMock).
- **Node / nvm:** use `nvm use neocom` (alias → Node **24.21.0**, also in `neocom-front/.nvmrc`). Engines allow Node 22.22.3+, 24.15.0+, or 26+.
- **Angular:** front scaffold is **22.2.x**. Unit tests: `npm test -- --watch=false`. Acceptance: Cypress + Cucumber (`cypress.config.ts`, `cypress/e2e/features/`).
- **Sass on macOS before 14:** Angular’s default `sass-embedded` Dart VM requires macOS 14+. Front npm scripts set `NG_BUILD_SASS_EMBEDDED=0` so builds use pure-JS `sass` on older hosts (e.g. macOS 12).
- **CI build:** `neocom-front/.github/workflows/build.yml` runs `npm ci` + `npm run build` with Node from `.nvmrc` (see L2 INFRA-030…039 notes).
- **Local K8s:** deployment target is local Kubernetes; from `neocom-meta`, `npm run k8s:start` / `k8s:dashboard` bootstrap the cluster (minikube preferred).
- **Start page:** `neocom-front` opens on the dashboard home page. `/` redirects to `/dashboard` (`DashboardHomePageComponent`). Header panels `app-info-panel` and `server-info-panel`, plus `v1-pilot-panel`, are empty shells under `src/app/panels`. Cypress catalog tags (`cy-section-name`, `cy-field-label`, `cy-field-value`) are recorded in `neocom-front/docs/ui-component-catalog.md`.
- Record WireMock stub paths and remaining first-run issues here as initialization continues.
- When Spec Collect / Spec Registration produce related L1/L2 items, link their IDs in this file.
