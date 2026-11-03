# OpenSpec registered specs — abstract

One-page view of active OpenSpec changes for planning a **single feature** that folds several registered capabilities together (as `login` already did for front/back/esi login).

Refresh companion counts in `CHANGE-STATUS.md` with `npx openspec list --json`. This abstract is narrative; re-read each `proposal.md` before merging changes.

**Last refreshed:** 2026-11-03 (fold A+B: `front-dashboard-shell` + `front-industry-blueprints`; superseded ten single-capability registered changes).

**How to integrate:** pick a feature name, create or extend one change folder (multi-capability under `specs/<system>/<feature>/`), move or cite the L2 ids, supersede the old change names in the proposal, then archive or drop the superseded folders when apply is complete.

---



## Active register (snapshot)


| Change                    | Tasks | Status (programme)                  | Cluster                         |
| ------------------------- | ----- | ----------------------------------- | ------------------------------- |
| `login`                   | 13/13 | applied (front `@ e3356db`, back `@ 3317849`) | Auth / SSO                      |
| `nestjs-sso-config`       | 0/2   | registered                          | Auth / SSO                      |
| `front-infrastructure`    | 8/8   | applied (`@ e3356db`)               | Front shell & toolchain         |
| `front-app-shell`         | 0/3   | registered                          | Front shell & toolchain         |
| `front-dashboard-shell`   | 0/17  | registered                          | Pilot / UI shell (EPIC-006 fold) |
| `front-industry-blueprints` | 0/17 | registered                          | Industry blueprints (EPIC-010 fold) |
| `front-pilot`             | 5/5   | applied (`@ e3356db`)               | Pilot experience                |
| `front-pilot-panel`       | 4/4   | applied (`@ e3356db`)               | Pilot experience                |
| `front-universe`          | 0/4   | registered                          | Pilot experience                |
| `back-service`            | 0/3   | registered                          | Pilot experience                |
| `domain-module`           | 2/3   | registered                          | Pilot experience                |
| `domain-pilot`            | 5/5   | applied (`@ 477ee33`)               | Domain models (EPIC-004)        |
| `domain-blueprint`        | 2/2   | applied (`@ 477ee33`)               | Domain models (EPIC-004)        |
| `domain-application-info` | 3/3   | applied (`@ 477ee33`)               | Domain models (EPIC-004)        |
| `domain-server-status`    | 2/2   | applied (`@ 477ee33`)               | Domain models (EPIC-004)        |
| `domain-spacelocation`    | 3/3   | applied (`@ 477ee33`)               | Domain models (EPIC-004)        |
| `domain-jsonclass`        | 3/3   | applied                             | Domain models (EPIC-004)        |
| `domain-layout`           | 2/2   | applied (`@ 477ee33`)               | Backend services (EPIC-009)     |
| `domain-ports`            | 2/2   | applied (`@ 477ee33`)               | Backend services (EPIC-009)     |
| `domain-deprecations`     | 2/2   | applied (`@ 477ee33`)               | Backend services (EPIC-009)     |
| `back-openapi`            | 3/3   | applied (`@ 3317849`)               | Backend services (EPIC-009)     |
| `back-industry-blueprints`| 2/2   | applied (`@ 3317849`)               | Backend services (EPIC-009)     |
| `domain-locations`        | 3/3   | applied (`@ 477ee33`)               | Locations (EPIC-008)            |
| `back-spacelocations`     | 2/2   | applied (`@ 3317849`)               | Locations (EPIC-008)            |
| `esi-character-api`       | 3/4   | deferred (`neocom-esi` aside)       | Pilot experience                |
| `infra-developer-install` | 0/4   | registered                          | Front shell & toolchain         |
| `infra-local-config`      | 0/7   | registered                          | Front shell & toolchain         |
| `cicd-pipeline`           | 0/8   | registered                          | Delivery                        |
| `front-angular-structure` | 7/7   | applied (`@ e3356db`)               | Angular codification (EPIC-002) |
| `front-node-render`       | 7/7   | applied (`@ e3356db`)               | Angular codification (EPIC-002) |
| `front-async-sse`         | 7/7   | applied (`@ e3356db`)               | Angular codification (EPIC-002) |
| `back-async-sse`          | 7/7   | applied (`@ 3317849`)               | Angular codification (EPIC-002) |
| `infra-async-persistence` | 4/4   | applied (`@ 3317849` + meta tools)  | Angular codification (EPIC-002) |
| `front-bdd-cypress`       | 0/4   | registered                          | Testing (EPIC-003)              |
| `front-mock-fixtures`     | 0/4   | registered                          | Testing (EPIC-003)              |
| `cicd-coverage-sonar`     | 0/5   | registered                          | Testing (EPIC-003)              |
| `cicd-testing-gates`      | 0/3   | registered                          | Testing (EPIC-003)              |
| `infra-test-commands`     | 0/5   | registered                          | Testing (EPIC-003)              |
| `back-testing`            | 0/5   | registered                          | Testing (EPIC-003)              |


**L1 EPIC-003 registered:** six OpenSpec changes above. Related existing tooling stays in `front-infrastructure` / `cicd-pipeline` (not re-registered).

---



## Suggested integration clusters

Use these clusters when deciding what belongs in one `feature/<name>` branch and one OpenSpec change.


| Cluster                                 | Candidate changes                                                                                                             | Why they fit together                                                                                |
| --------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| **Pilot experience**                    | `front-pilot`, `front-pilot-panel`, `front-universe`, `front-dashboard-shell`, `back-service`, `domain-module`, `domain-pilot`, `esi-character-api` | Pilot type → ESI/public data → dashboard-shell fold (header/corp/media/char/dashboard) |
| **Industry blueprints (EPIC-010)**      | `front-industry-blueprints` | Support pages + Feature button + by-location hierarchy/SSE + shared UI (single fold) |
| **Domain models (EPIC-004)**            | `domain-pilot`, `domain-blueprint`, `domain-application-info`, `domain-server-status`, `domain-spacelocation`, `domain-jsonclass` (+ `domain-module`) | Published programme models in `neocom-domain`; header ApplicationInfo/ServerStatus stay under domain; `jsonClass` wire interchange |
| **Locations (EPIC-008)**                | `domain-locations`, `back-spacelocations`, `domain-spacelocation` | Space-location hierarchy + lookup API; thin SpaceLocationV1 interface from EPIC-004 |
| **Backend services (EPIC-009)**         | `domain-layout`, `domain-ports`, `domain-deprecations`, `back-openapi`, `back-industry-blueprints` | Domain truth/ports/deprecations → OpenAPI rules → Industry pilot blueprints |
| **Front shell & toolchain**             | `front-infrastructure`, `front-app-shell`, `infra-developer-install`, `infra-local-config`                                    | Install, Node/Angular stack, canvas chrome, local WireMock config                                    |
| **Auth / SSO**                          | `login` (already multi-system), `nestjs-sso-config`                                                                           | Session already unified; NestJS SSO env/config still separate                                        |
| **Angular codification (EPIC-002)**     | `front-angular-structure`, `front-node-render`, `front-async-sse`, `back-async-sse`, `infra-async-persistence`                | Structure → node/viewer/registry → async SSE enrichment with Nest + PostgreSQL/Redis                 |
| **Delivery**                            | `cicd-pipeline`                                                                                                               | CI/CD boundary; keep separate unless a release feature needs it                                      |
| **Testing (EPIC-003)**                  | `front-bdd-cypress`, `front-mock-fixtures`, `cicd-coverage-sonar`, `cicd-testing-gates`, `infra-test-commands`, `back-testing` | TDD/BDD/SDD commands, Cypress UI/`cy-*`, fixtures, coverage/Sonar, CI job order, back guidelines   |


`login` is the template: one change folder, several capability specs (`front/login`, `back/login`, `esi/sso`, `esi/login`).

---



## Active changes (abstract)



### `login` — applying · 13/13 · multi-system


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




### `front-infrastructure` — applying · 8/8


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




### `front-dashboard-shell` — registered · 0/17


|                    |                                                                 |
| ------------------ | --------------------------------------------------------------- |
| **Why**            | EPIC-006 secured chrome + landing: header, dashboard, media URLs, corporation panel, character selection |
| **Capabilities**   | `front/page-header`, `front/dashboard`, `front/eve-media`, `front/corporation`, `front/character-selection` |
| **Owners**         | `neocom-front`                                                  |
| **Supersedes**     | `front-page-header`, `front-dashboard`, `front-eve-media`, `front-corporation`, `front-character-selection` |
| **Integrate with** | applied `front-pilot`, `front-pilot-panel`, `login`             |
| **Paths**          | `changes/front-dashboard-shell/`                                |




### `front-industry-blueprints` — registered · 0/17


|                    |                                                                 |
| ------------------ | --------------------------------------------------------------- |
| **Why**            | EPIC-010 Industry front vertical as one applyable feature       |
| **Capabilities**   | `front/model-strip`, `front/color-table`, `front/feature-button`, `front/blueprint-by-location`, `front/shared-ui` |
| **Owners**         | `neocom-front`                                                  |
| **Supersedes**     | `front-model-strip`, `front-color-table`, `front-feature-button`, `front-blueprint-by-location`, `front-shared-ui` |
| **Integrate with** | applied `front-node-render`, `front-async-sse`; may stack after `front-dashboard-shell` |
| **Paths**          | `changes/front-industry-blueprints/`                            |




### `front-pilot` — applying · 5/5


|                    |                                                                                            |
| ------------------ | ------------------------------------------------------------------------------------------ |
| **Why**            | Pilot as game presence; ≤3 pilots per credential; public ESI character; fixture `93813310` |
| **Capabilities**   | `front/pilot`                                                                              |
| **Owners**         | Model in `neocom-domain`, consumed by front                                                |
| **Integrate with** | `domain-module`, `front-universe`, `front-pilot-panel`, `back-service`                     |
| **Paths**          | `changes/front-pilot/`                                                                     |




### `front-pilot-panel` — applying · 4/4


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




### `domain-module` — registered · 2/3


|                    |                                                                 |
| ------------------ | --------------------------------------------------------------- |
| **Why**            | Shared Node TypeScript domain package on npm for front and back |
| **Capabilities**   | `domain/neocom-domain`                                          |
| **Owners**         | `neocom-domain` published package                               |
| **Note**           | DOMAIN-001 submodule cancelled in proposal; npm package remains |
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




### `front-angular-structure` — registered · 0/7


|                    |                                                                              |
| ------------------ | ---------------------------------------------------------------------------- |
| **Why**            | Page/panel/section division; industry + manufacture modules; placement rules |
| **Capabilities**   | `front/angular-structure`                                                    |
| **Owners**         | `neocom-front`                                                               |
| **Integrate with** | `front-node-render`, `front-app-shell`, `front-dashboard-shell`              |
| **Paths**          | `changes/front-angular-structure/`                                           |




### `front-node-render` — registered · 0/7


|                    |                                                                                          |
| ------------------ | ---------------------------------------------------------------------------------------- |
| **Why**            | Node MVC, render registry (replace `*ngIf`), hierarchy flatten, viewer/standalone panels |
| **Capabilities**   | `front/node-render`                                                                      |
| **Owners**         | `neocom-front`                                                                           |
| **Integrate with** | `front-angular-structure`, `front-async-sse`                                             |
| **Paths**          | `changes/front-node-render/`                                                             |




### `front-async-sse` — registered · 0/7


|                    |                                                                                       |
| ------------------ | ------------------------------------------------------------------------------------- |
| **Why**            | Front adapter cache + authenticated SSE; partial first paint; in-place row enrichment |
| **Capabilities**   | `front/async-sse`                                                                     |
| **Owners**         | `neocom-front`                                                                        |
| **Integrate with** | `back-async-sse`, `infra-async-persistence`, `front-node-render`                      |
| **Paths**          | `changes/front-async-sse/`                                                            |




### `back-async-sse` — registered · 0/7


|                    |                                                                      |
| ------------------ | -------------------------------------------------------------------- |
| **Why**            | Nest list persistence, BullMQ enrichment, `@Sse()` push, ESI on miss |
| **Capabilities**   | `back/async-sse`                                                     |
| **Owners**         | `neocom-back`                                                        |
| **Integrate with** | `front-async-sse`, `infra-async-persistence`                         |
| **Paths**          | `changes/back-async-sse/`                                            |




### `infra-async-persistence` — registered · 0/4


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



## Already archived (for context)


| Archive                          | Main spec                           | Role                       |
| -------------------------------- | ----------------------------------- | -------------------------- |
| `2026-10-15-back-esi-client`     | `specs/back/esi-client/spec.md`     | ESI client install in back |
| `2026-10-15-back-hexagonal`      | `specs/back/hexagonal/spec.md`      | Hexagonal Nest layout      |
| `2026-10-15-infra-style-modules` | `specs/infra/style-modules/spec.md` | Style / module infra       |


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
