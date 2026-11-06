# OpenSpec change status

Manual register of OpenSpec changes in this repository. OpenSpec itself does not require this file; it is for programme tracking.

**Agents must update this file in the same turn as any OpenSpec change** (register, edit tasks/specs, apply progress, cancel or complete a task, accept into `develop`, or archive). Refresh task counts with:

```bash
cd neocom-meta && nvm use && npx openspec list --json
```

Last refreshed: 2026-11-06 (`/git:release-done` — archived 29 OpenSpec changes from Release-0.1.0; front PR#6 / back PR#7 merged).

## Status legend

| Status | Meaning |
| --- | --- |
| `registered` | Change exists under `changes/<name>/` with proposal, specs, design, and tasks |
| `deferred` | Registered but **not applyable** until a named blocker clears (e.g. owning repo aside). Do not start `/openspec-apply-change` |
| `applying` | Implementation on `feature/<feature>` (default base `develop`; may be stacked). Apply stops before commit |
| `applied` | Merged to `develop` (or ready on develop); product validation may continue; eligible for `/git:release`. Notes: `in release PR #N` while OpenSpec validation is open; `validated for release @ <sha>` when that passes |
| `archived` | `/git:release-done` after Release PR merge ran `/openspec-archive-change` (`changes/archive/` + `openspec/specs/`) for ids listed on that PR |

PR content control: `.dsh/templates/openspec-delivery-control.md` (feature → develop = product intake; `/git:release` = OpenSpec validate while open; `/git:release-done` = archive + L1).  
Commit / PR / develop-tip evidence per change: [`DELIVERY-INDEX.md`](./DELIVERY-INDEX.md) (owned by `/neocom-git`; graphify-indexed — prefer over live GitHub).

Task progress comes from checkboxes in each change’s `tasks.md` (`openspec list`).

**Row order in this file:** registered, then deferred, then applying, then applied, then archived.

## Registered

| Change | System / feature | Tasks | Status | Notes |
| --- | --- | --- | --- | --- |
| `front-known-system` | front / known-system | 0/2 | registered | EPIC-008 LOC-110 KnownSystem card. L2 `FRONT/22.KNOWN-SYSTEM.md` |
| `nestjs-sso-config` | back / nestjs-sso-config | 0/2 | registered | INFRA-041…042; NestJS SSO env/config; related to `login`. Renamed from `back-nestjs-sso-config` (earlier `infra-sso-config`) |
| `front-universe` | front / universe | 0/4 | registered | |
| `front-app-shell` | front / app-shell | 0/3 | registered | |
| `back-service` | back / service | 0/3 | registered | |
| `infra-developer-install` | infra / developer-install | 0/4 | registered | |
| `infra-local-config` | infra / local-config | 0/7 | registered | |
| `cicd-pipeline` | cicd / pipeline | 0/8 | registered | |
| `front-bdd-cypress` | front / bdd-cypress | 0/4 | registered | EPIC-003; BDD-001…004. SDD→BDD→TDD + Cypress `cy-*` UI/content validation |
| `front-mock-fixtures` | front / mock-fixtures | 0/4 | registered | EPIC-003; FIX-001…004. Fixtures from real runs; Gherkin-selectable |
| `cicd-coverage-sonar` | cicd / coverage-sonar | 0/5 | registered | EPIC-003; COV-001…005. Coverage tools, quality gates, SonarCloud |
| `cicd-testing-gates` | cicd / testing-gates | 0/3 | registered | EPIC-003; GATE-001…003. Parallel unit/acceptance before Sonar |
| `infra-test-commands` | infra / test-commands | 0/5 | registered | EPIC-003; INFRA-060…064. Shared TDD/BDD/SDD command catalog |
| `back-testing` | back / testing | 0/5 | registered | EPIC-003; BTEST-001…005. Back guidelines, WireMock, Gherkin |

## Deferred

| Change | System / feature | Tasks | Status | Notes |
| --- | --- | --- | --- | --- |
| `esi-character-api` | esi / character-api | 3/4 | deferred | Owner `neocom-esi` is **aside**. Remaining ESI-011 (remove OpenAPI + generated Character API). Resume apply only when `neocom-esi` is back in scope. Design note: ESI-005 vs ESI-011 conflict still open |

## Applying

| Change | System / feature | Tasks | Status | Notes |
| --- | --- | --- | --- | --- |
| — | — | — | — | None |

## Applied

| Change | System / feature | Tasks | Status | Notes |
| --- | --- | --- | --- | --- |
| — | — | — | — | None — Release-0.1.0 set archived 2026-11-06 |

## Archived

| Archive folder | Main spec |
| --- | --- |
| `2026-10-15-back-esi-client` | `specs/back/esi-client/spec.md` |
| `2026-10-15-back-hexagonal` | `specs/back/hexagonal/spec.md` |
| `2026-10-15-infra-style-modules` | `specs/infra/style-modules/spec.md` |
| `2026-11-06-login` | `specs/front/login/spec.md (+ back/esi)` |
| `2026-11-06-front-infrastructure` | `specs/front-toolchain/spec.md` |
| `2026-11-06-front-angular-structure` | `specs/front/angular-structure/spec.md` |
| `2026-11-06-front-node-render` | `specs/front/node-render/spec.md` |
| `2026-11-06-front-async-sse` | `specs/front/async-sse/spec.md` |
| `2026-11-06-front-pilot` | `specs/front/pilot/spec.md` |
| `2026-11-06-front-pilot-panel` | `specs/front/pilot-panel/spec.md` |
| `2026-11-06-front-dashboard-shell` | `specs/front/dashboard-shell/spec.md` |
| `2026-11-06-front-industry-blueprints` | `specs/front/industry-blueprints/spec.md` |
| `2026-11-06-front-blueprint-list-processing` | `specs/front/blueprint-list-processing/spec.md` |
| `2026-11-06-front-domain-nodes` | `specs/front/domain-nodes/spec.md` |
| `2026-11-06-back-async-sse` | `specs/back/async-sse/spec.md` |
| `2026-11-06-back-spacelocations` | `specs/back/spacelocations/spec.md` |
| `2026-11-06-back-openapi` | `specs/back/openapi/spec.md` |
| `2026-11-06-back-industry-blueprints` | `specs/back/industry-blueprints/spec.md` |
| `2026-11-06-back-blueprint-list-processing` | `specs/back/blueprint-list-processing/spec.md` |
| `2026-11-06-back-space-location-service` | `specs/back/space-location-service/spec.md` |
| `2026-11-06-infra-async-persistence` | `specs/infra/async-persistence/spec.md` |
| `2026-11-06-domain-module` | `specs/domain/neocom-domain/spec.md` |
| `2026-11-06-domain-pilot` | `specs/domain/pilot/spec.md` |
| `2026-11-06-domain-blueprint` | `specs/domain/blueprint/spec.md` |
| `2026-11-06-domain-application-info` | `specs/domain/application-info/spec.md` |
| `2026-11-06-domain-server-status` | `specs/domain/server-status/spec.md` |
| `2026-11-06-domain-spacelocation` | `specs/domain/spacelocation/spec.md` |
| `2026-11-06-domain-locations` | `specs/domain/locations/spec.md` |
| `2026-11-06-domain-jsonclass` | `specs/domain/jsonclass/spec.md` |
| `2026-11-06-domain-layout` | `specs/domain/layout/spec.md` |
| `2026-11-06-domain-ports` | `specs/domain/ports/spec.md` |
| `2026-11-06-domain-deprecations` | `specs/domain/deprecations/spec.md` |


Delta specs usually live at `changes/<system>-<feature>/specs/<system>/<feature>/spec.md`. A multi-system feature may use one change folder (for example `changes/login/`) with several capability specs underneath.

## Specs abstract

**2026-11-06:** 29 OpenSpec changes from Release-0.1.0 are **archived** (see Archived table). Abstracts below may still describe historical intent; prefer `openspec/specs/` + archive folders for current truth.

One-page planning view for folding several registered capabilities into a **single feature** (as `login` did for front/back/esi login). Status and task counts live in the sections above; refresh those with `npx openspec list --json`. Re-read each `proposal.md` before merging changes.

**How to integrate:** pick a feature name, create or extend one change folder (multi-capability under `specs/<system>/<feature>/`), cite the L1 ids, supersede the old change names in the proposal, then archive or drop the superseded folders when apply is complete. When folding changes, update the **Suggested integration clusters**, **Change abstracts**, and **Capability index** in this same file.

## Suggested integration clusters

Use these clusters when deciding what belongs in one `feature/<name>` branch and one OpenSpec change.


| Cluster                                 | Candidate changes                                                                                                             | Why they fit together                                                                                |
| --------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| **Pilot experience**                    | `front-pilot`, `front-pilot-panel`, `front-universe`, `front-dashboard-shell`, `back-service`, `domain-module`, `domain-pilot`, `esi-character-api` | Pilot type → ESI/public data → dashboard-shell fold (header/corp/media/char/dashboard) |
| **Industry blueprints (EPIC-010)**      | `front-industry-blueprints` | Support pages + Feature button + by-location hierarchy/SSE + shared UI (single fold) |
| **Front domain NeoCom nodes (EPIC-006)** | `front-domain-nodes` | File naming, `@domain` alias, render≡jsonClass, hierarchy children, BlueprintV1DtoWire |
| **Domain models (EPIC-004)**            | `domain-pilot`, `domain-blueprint`, `domain-application-info`, `domain-server-status`, `domain-spacelocation`, `domain-jsonclass` (+ `domain-module`) | Published programme models in `neocom-domain`; header ApplicationInfo/ServerStatus stay under domain; `jsonClass` wire interchange |
| **Locations (EPIC-008)**                | `domain-locations`, `back-spacelocations`, `domain-spacelocation`, `front-known-system`, `back-space-location-service` | Hierarchy + lookup API + KnownSystem card + Nest ESI/Redis space-location service (BACK-229) |
| **Backend services (EPIC-009)**         | `domain-layout`, `domain-ports`, `domain-deprecations`, `back-openapi`, `back-industry-blueprints` | Domain truth/ports/deprecations → OpenAPI rules → Industry pilot blueprints |
| **Front shell & toolchain**             | `front-infrastructure`, `front-app-shell`, `infra-developer-install`, `infra-local-config`                                    | Install, Node/Angular stack, canvas chrome, local WireMock config                                    |
| **Auth / SSO**                          | `login` (already multi-system), `nestjs-sso-config`                                                                           | Session already unified; NestJS SSO env/config still separate                                        |
| **Angular codification (EPIC-002)**     | `front-angular-structure`, `front-node-render`, `front-async-sse`, `back-async-sse`, `infra-async-persistence`                | Structure → node/viewer/registry → async SSE enrichment with Nest + PostgreSQL/Redis                 |
| **Delivery**                            | `cicd-pipeline`                                                                                                               | CI/CD boundary; keep separate unless a release feature needs it                                      |
| **Testing (EPIC-003)**                  | `front-bdd-cypress`, `front-mock-fixtures`, `cicd-coverage-sonar`, `cicd-testing-gates`, `infra-test-commands`, `back-testing` | TDD/BDD/SDD commands, Cypress UI/`cy-*`, fixtures, coverage/Sonar, CI job order, back guidelines   |


`login` is the template: one change folder, several capability specs (`front/login`, `back/login`, `esi/sso`, `esi/login`).

---

## Change abstracts


### `login` — archived · 13/13 · multi-system


|                          |                                                                                                                                                                                                                                                              |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Why**                  | Authenticate with EVE SSO and establish a session across front, back, and ESI contract                                                                                                                                                                       |
| **Capabilities**         | `front/login`, `back/login`, `esi/sso`, `esi/login`                                                                                                                                                                                                          |
| **Owners**               | `neocom-front`, `neocom-back` (ESI-012 noted for `neocom-esi`)                                                                                                                                                                                               |
| **Requirements (short)** | Guard + return cookie; scopes; authorize link; SSO state; readable access cookie; character switch; login page; callback; token file storage; code exchange; multi-character; refresh/401; Authorization Code; three cookies; PKCE (fulfilled outside apply) |
| **Related**              | Keep `nestjs-sso-config` separate unless folding env var names into this feature                                                                                                                                                                             |
| **Paths**                | `changes/login/`                                                                                                                                                                                                                                             |


### `nestjs-sso-config` — registered · 0/2


|                    |                                                                                       |
| ------------------ | ------------------------------------------------------------------------------------- |
| **Why**            | NestJS SSO env vars and K8s secrets for client id/secret                              |
| **Capabilities**   | `back/nestjs-sso-config`                                                              |
| **Owners**         | `neocom-back` (NestJS Config); docs in `neocom-meta`; local values also on front      |
| **Requirements**   | `EVE_SSO_`* variables; Kubernetes secrets at deploy                                   |
| **Integrate with** | `login` (optional fold)                                                               |
| **Paths**          | `changes/nestjs-sso-config/` (formerly `back-nestjs-sso-config` / `infra-sso-config`) |


### `front-infrastructure` — archived · 8/8


|                    |                                                                                                              |
| ------------------ | ------------------------------------------------------------------------------------------------------------ |
| **Why**            | Shared front stack: Angular 22, TypeScript, Vitest, Cypress+Cucumber, nvm `neocom`, WireMock for front `dev` |
| **Capabilities**   | `front-toolchain`                                                                                            |
| **Owners**         | `neocom-front`, programme docs                                                                               |
| **Branch**         | `feature/infrastructure` from `develop` @ `90a9e42`                                                          |
| **Integrate with** | `front-app-shell`, `infra-developer-install`, `infra-local-config`                                           |
| **Paths**          | `changes/front-infrastructure/`                                                                              |


### `front-app-shell` — registered · 0/3


|                    |                                                                  |
| ------------------ | ---------------------------------------------------------------- |
| **Why**            | Full-canvas frame: zero margin/border on outlet, pages, and body |
| **Capabilities**   | `front/app-shell`                                                |
| **Owners**         | `neocom-front`                                                   |
| **Integrate with** | `front-infrastructure`, `front-dashboard-shell`                  |
| **Paths**          | `changes/front-app-shell/`                                       |


### `front-domain-nodes` — archived · 5/5


|                    |                                                                 |
| ------------------ | --------------------------------------------------------------- |
| **Why**            | Front NeoCom domain-node norms (DEF-BLP-007…013 / UI-DOM-001…005) |
| **Capabilities**   | `front/domain-nodes`                                            |
| **Owners**         | `neocom-front`                                                  |
| **Note**           | Alias **`@domain`**; tasks complete on `feature/blueprint-list-processing` tip 2026-11-06 |
| **Integrate with** | `front-blueprint-list-processing`, `front-node-render`          |
| **Paths**          | `changes/front-domain-nodes/`                                   |


### `front-dashboard-shell` — archived · 22/24


|                    |                                                                 |
| ------------------ | --------------------------------------------------------------- |
| **Why**            | EPIC-006 secured chrome + landing: header, dashboard, media URLs, corporation panel, character selection |
| **Capabilities**   | `front/page-header`, `front/dashboard`, `front/eve-media`, `front/corporation`, `front/character-selection` |
| **Owners**         | `neocom-front`                                                  |
| **Supersedes**     | `front-page-header`, `front-dashboard`, `front-eve-media`, `front-corporation`, `front-character-selection` |
| **Note**           | 2026-11-06: UI-CORP-014 + UI-GEO-002 (DEF-BLP-004/005) registered; 2 tasks open |
| **Integrate with** | applied `front-pilot`, `front-pilot-panel`, `login`             |
| **Paths**          | `changes/front-dashboard-shell/`                                |


### `front-industry-blueprints` — archived · 0/17


|                    |                                                                 |
| ------------------ | --------------------------------------------------------------- |
| **Why**            | EPIC-010 Industry front vertical as one applyable feature       |
| **Capabilities**   | `front/model-strip`, `front/color-table`, `front/feature-button`, `front/blueprint-by-location`, `front/shared-ui` |
| **Owners**         | `neocom-front`                                                  |
| **Supersedes**     | `front-model-strip`, `front-color-table`, `front-feature-button`, `front-blueprint-by-location`, `front-shared-ui` |
| **Integrate with** | applied `front-node-render`, `front-async-sse`; may stack after `front-dashboard-shell` |
| **Paths**          | `changes/front-industry-blueprints/`                            |


### `front-pilot` — archived · 5/5


|                    |                                                                                            |
| ------------------ | ------------------------------------------------------------------------------------------ |
| **Why**            | Pilot as game presence; ≤3 pilots per credential; public ESI character; fixture `93813310` |
| **Capabilities**   | `front/pilot`                                                                              |
| **Owners**         | Model in `neocom-domain`, consumed by front                                                |
| **Integrate with** | `domain-module`, `front-universe`, `front-pilot-panel`, `back-service`                     |
| **Paths**          | `changes/front-pilot/`                                                                     |


### `front-pilot-panel` — archived · 4/4


|                    |                                                                   |
| ------------------ | ----------------------------------------------------------------- |
| **Why**            | UI panel for Pilot public/private data, variants, Cypress markers |
| **Capabilities**   | `front/pilot-panel`                                               |
| **Owners**         | `neocom-front`                                                    |
| **Integrate with** | `front-pilot`, `front-dashboard-shell`                            |
| **Paths**          | `changes/front-pilot-panel/`                                      |


### `front-universe` — registered · 0/4


|                    |                                                                                  |
| ------------------ | -------------------------------------------------------------------------------- |
| **Why**            | Unauthenticated ESI reference data (ancestries, bloodlines, …) to complete Pilot |
| **Capabilities**   | `front/universe`                                                                 |
| **Owners**         | front + domain Pilot model                                                       |
| **Integrate with** | `front-pilot`, `domain-module`                                                   |
| **Paths**          | `changes/front-universe/`                                                        |


### `back-service` — registered · 0/3


|                    |                                                                                   |
| ------------------ | --------------------------------------------------------------------------------- |
| **Why**            | Pilot use case: public ESI → pilot DTO; not-found; `NeocomBackendError`           |
| **Capabilities**   | `back/service`                                                                    |
| **Owners**         | `neocom-back`                                                                     |
| **Integrate with** | `front-pilot`, `esi-character-api`, archived `back-esi-client` / `back-hexagonal` |
| **Paths**          | `changes/back-service/`                                                           |


### `domain-module` — archived · 3/3


|                    |                                                                 |
| ------------------ | --------------------------------------------------------------- |
| **Why**            | Shared Node TypeScript domain package on npm for front and back |
| **Capabilities**   | `domain/neocom-domain`                                          |
| **Owners**         | `neocom-domain` published package                               |
| **Note**           | DOMAIN-001 submodule cancelled; DOMAIN-003 closed 2026-11-06 (npm + app deps already live) |
| **Integrate with** | `front-pilot`, `back-service`                                   |
| **Paths**          | `changes/domain-module/`                                        |


### `esi-character-api` — deferred · 3/4


|                    |                                                                                     |
| ------------------ | ----------------------------------------------------------------------------------- |
| **Why**            | Drop generated Character API; high-level data via `@lgriffin/esi.ts` / `neocom-esi` |
| **Capabilities**   | `esi/character-api`                                                                 |
| **Owners**         | `neocom-esi` (aside) — **do not apply** until that repo is back in scope             |
| **Integrate with** | `back-service`, pilot cluster                                                       |
| **Paths**          | `changes/esi-character-api/`                                                        |
| **Blocker**        | Remaining ESI-011; programme leaves `neocom-esi` aside (2026-11-03)               |


### `infra-developer-install` — registered · 0/4


|                    |                                                                                          |
| ------------------ | ---------------------------------------------------------------------------------------- |
| **Why**            | Repeatable clone/install: recursive clone, nvm, front npm install, WireMock without back |
| **Capabilities**   | `infra/developer-install`                                                                |
| **Integrate with** | `front-infrastructure`, `infra-local-config`                                             |
| **Paths**          | `changes/infra-developer-install/`                                                       |


### `infra-local-config` — registered · 0/7


|                    |                                                                               |
| ------------------ | ----------------------------------------------------------------------------- |
| **Why**            | WireMock base URL, local UI URL, env/secrets, submodule pins, Sass workaround |
| **Capabilities**   | `infra/local-config`                                                          |
| **Integrate with** | `front-infrastructure`, `infra-developer-install`                             |
| **Paths**          | `changes/infra-local-config/`                                                 |


### `cicd-pipeline` — registered · 0/8


|                    |                                                                                                                                                    |
| ------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Why**            | Front CI jobs, Node pin, Cypress without live back, CD deferred, local K8s target                                                                  |
| **Capabilities**   | `cicd/pipeline`                                                                                                                                    |
| **Owners**         | GitHub Actions in front (and later ecosystem)                                                                                                      |
| **Integrate with** | Usually alone; optionally a “delivery” meta feature; will align with EPIC-003 (parallel unit/acceptance before Sonar) when that epic is registered |
| **Paths**          | `changes/cicd-pipeline/`                                                                                                                           |


### `front-angular-structure` — archived · 0/7


|                    |                                                                              |
| ------------------ | ---------------------------------------------------------------------------- |
| **Why**            | Page/panel/section division; industry + manufacture modules; placement rules |
| **Capabilities**   | `front/angular-structure`                                                    |
| **Owners**         | `neocom-front`                                                               |
| **Integrate with** | `front-node-render`, `front-app-shell`, `front-dashboard-shell`              |
| **Paths**          | `changes/front-angular-structure/`                                           |


### `front-node-render` — archived · 0/7


|                    |                                                                                          |
| ------------------ | ---------------------------------------------------------------------------------------- |
| **Why**            | Node MVC, render registry (replace `*ngIf`), hierarchy flatten, viewer/standalone panels |
| **Capabilities**   | `front/node-render`                                                                      |
| **Owners**         | `neocom-front`                                                                           |
| **Integrate with** | `front-angular-structure`, `front-async-sse`                                             |
| **Paths**          | `changes/front-node-render/`                                                             |


### `front-async-sse` — archived · 0/7


|                    |                                                                                       |
| ------------------ | ------------------------------------------------------------------------------------- |
| **Why**            | Front adapter cache + authenticated SSE; partial first paint; in-place row enrichment |
| **Capabilities**   | `front/async-sse`                                                                     |
| **Owners**         | `neocom-front`                                                                        |
| **Integrate with** | `back-async-sse`, `infra-async-persistence`, `front-node-render`                      |
| **Paths**          | `changes/front-async-sse/`                                                            |


### `back-async-sse` — archived · 0/7


|                    |                                                                      |
| ------------------ | -------------------------------------------------------------------- |
| **Why**            | Nest list persistence, BullMQ enrichment, `@Sse()` push, ESI on miss |
| **Capabilities**   | `back/async-sse`                                                     |
| **Owners**         | `neocom-back`                                                        |
| **Integrate with** | `front-async-sse`, `infra-async-persistence`                         |
| **Paths**          | `changes/back-async-sse/`                                            |


### `infra-async-persistence` — archived · 0/4


|                    |                                                                                   |
| ------------------ | --------------------------------------------------------------------------------- |
| **Why**            | Provision PostgreSQL + Redis; persistence contract and async enrichment checklist |
| **Capabilities**   | `infra/async-persistence`                                                         |
| **Owners**         | meta docs; runtime for back/front envs                                            |
| **Integrate with** | `back-async-sse`, `front-async-sse`                                               |
| **Paths**          | `changes/infra-async-persistence/`                                                |


### `front-bdd-cypress` — registered · 0/4


|                    |                                                                              |
| ------------------ | ---------------------------------------------------------------------------- |
| **Why**            | SDD→BDD→TDD; Cypress validates content/UI via documented `cy-*` attributes |
| **Capabilities**   | `front/bdd-cypress`                                                          |
| **Owners**         | `neocom-front`                                                               |
| **Integrate with** | `front-mock-fixtures`, `front-infrastructure`, `infra-test-commands`         |
| **Paths**          | `changes/front-bdd-cypress/`                                                 |


### `front-mock-fixtures` — registered · 0/4


|                    |                                                                    |
| ------------------ | ------------------------------------------------------------------ |
| **Why**            | Real-run fixtures (errors/stale/incorrect); replaceable adapters |
| **Capabilities**   | `front/mock-fixtures`                                              |
| **Owners**         | `neocom-front`                                                     |
| **Integrate with** | `front-bdd-cypress`, `cicd-pipeline`                               |
| **Paths**          | `changes/front-mock-fixtures/`                                     |


### `cicd-coverage-sonar` — registered · 0/5


|                    |                                                         |
| ------------------ | ------------------------------------------------------- |
| **Why**            | Coverage tools, quality-gate rules, SonarCloud reporting |
| **Capabilities**   | `cicd/coverage-sonar`                                   |
| **Owners**         | front/back CI; meta docs                                |
| **Integrate with** | `cicd-testing-gates`, `cicd-pipeline`                   |
| **Paths**          | `changes/cicd-coverage-sonar/`                          |


### `cicd-testing-gates` — registered · 0/3


|                    |                                                              |
| ------------------ | ------------------------------------------------------------ |
| **Why**            | Parallel unit+acceptance before SonarCloud analysis          |
| **Capabilities**   | `cicd/testing-gates`                                         |
| **Owners**         | front/back CI                                                |
| **Integrate with** | `cicd-coverage-sonar`, `cicd-pipeline`                       |
| **Paths**          | `changes/cicd-testing-gates/`                                |


### `infra-test-commands` — registered · 0/5


|                    |                                                          |
| ------------------ | -------------------------------------------------------- |
| **Why**            | Shared TDD/BDD/SDD command catalog and run-all sequence  |
| **Capabilities**   | `infra/test-commands`                                    |
| **Owners**         | meta docs; front/back scripts                            |
| **Integrate with** | `front-bdd-cypress`, `back-testing`                      |
| **Paths**          | `changes/infra-test-commands/`                           |


### `back-testing` — registered · 0/5


|                    |                                                                 |
| ------------------ | --------------------------------------------------------------- |
| **Why**            | Back mirrors front testing guidelines; WireMock; Gherkin BDD  |
| **Capabilities**   | `back/testing`                                                  |
| **Owners**         | `neocom-back`                                                   |
| **Integrate with** | `front-bdd-cypress`, `cicd-coverage-sonar`, `infra-test-commands` |
| **Paths**          | `changes/back-testing/`                                         |


---

## Capability index (active)


| Capability path           | Change                    |
| ------------------------- | ------------------------- |
| `front/login`             | `login`                   |
| `back/login`              | `login`                   |
| `esi/sso`                 | `login`                   |
| `esi/login`               | `login`                   |
| `back/nestjs-sso-config`  | `nestjs-sso-config`       |
| `front-toolchain`         | `front-infrastructure`    |
| `front/app-shell`         | `front-app-shell`         |
| `front/dashboard`         | `front-dashboard-shell`         |
| `front/eve-media`         | `front-dashboard-shell`         |
| `front/corporation`       | `front-dashboard-shell`       |
| `front/character-selection` | `front-dashboard-shell` |
| `front/page-header`       | `front-dashboard-shell`       |
| `front/domain-nodes`      | `front-domain-nodes`          |
| `front/model-strip`       | `front-industry-blueprints`       |
| `front/color-table`       | `front-industry-blueprints`       |
| `front/feature-button`    | `front-industry-blueprints`    |
| `front/blueprint-by-location` | `front-industry-blueprints` |
| `front/shared-ui`         | `front-industry-blueprints`         |
| `front/pilot`             | `front-pilot`             |
| `front/pilot-panel`       | `front-pilot-panel`       |
| `front/universe`          | `front-universe`          |
| `back/service`            | `back-service`            |
| `domain/neocom-domain`    | `domain-module`           |
| `esi/character-api`       | `esi-character-api`       |
| `infra/developer-install` | `infra-developer-install` |
| `infra/local-config`      | `infra-local-config`      |
| `cicd/pipeline`           | `cicd-pipeline`           |
| `front/angular-structure` | `front-angular-structure` |
| `front/node-render`       | `front-node-render`       |
| `front/async-sse`         | `front-async-sse`         |
| `back/async-sse`          | `back-async-sse`          |
| `infra/async-persistence` | `infra-async-persistence` |
| `front/bdd-cypress`       | `front-bdd-cypress`       |
| `front/mock-fixtures`     | `front-mock-fixtures`     |
| `cicd/coverage-sonar`     | `cicd-coverage-sonar`     |
| `cicd/testing-gates`      | `cicd-testing-gates`      |
| `infra/test-commands`     | `infra-test-commands`     |
| `back/testing`            | `back-testing`            |


## How to update this file

1. After `/epic:extract`, add a row under **Registered** with status `registered`. Add or adjust the matching **Change abstracts** entry and **Capability index** rows when the change is new.
2. When `/feature-delivery` starts, move the row to **Applying** and name the branch if useful.
3. After the pull request into `develop` is accepted (`/git:pr`), move the row to **Applied** and refresh `DELIVERY-INDEX.md` (merged + develop tip).
4. After `openspec archive`, move the row to **Archived** and point at the main spec path; move the delivery row to **Archived delivery** in `DELIVERY-INDEX.md`; drop or archive the change abstract if it no longer applies.
5. Keep status sections in order: **Registered**, **Deferred**, **Applying**, **Applied**, **Archived**.
6. Refresh task counts with `npx openspec list --json` whenever the register is reviewed.
7. Move a change to **Deferred** when apply is blocked by programme scope (e.g. owning repo aside); return it to **Registered** or **Applying** when the blocker clears.
8. When folding several changes into one feature, update **Suggested integration clusters**, **Change abstracts**, and **Capability index** in this file (there is no separate abstract file).
