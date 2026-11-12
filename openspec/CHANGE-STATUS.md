# OpenSpec change status

Manual register of OpenSpec changes in this repository. OpenSpec itself does not require this file; it is for programme tracking.

**Agents must update this file in the same turn as any OpenSpec change** (register, edit tasks/specs, apply progress, cancel or complete a task, accept into `develop`, or archive). Refresh task counts with:

```bash
cd neocom-meta && nvm use && npx openspec list --json
```

Last refreshed: 2026-11-12 (`back-cicd` applying 72/72 — WireMock/Gherkin/mock catalog done; stop before commit).

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
| `back-eve-item-dogma-drop` | back / eve-item-dogma-drop | 0/3 | registered | EPIC-016 OPT-001…003; drop unused dogma from `EveItemV1Dto` (modifies `back/eve-items`) |
| `front-known-system` | front / known-system | 0/2 | registered | EPIC-008 LOC-110 KnownSystem card. L2 `FRONT/22.KNOWN-SYSTEM.md` |
| `front-app-shell` | front / app-shell | 0/3 | registered | |
## Deferred

| Change | System / feature | Tasks | Status | Notes |
| --- | --- | --- | --- | --- |
| `esi-character-api` | esi / character-api | 3/4 | deferred | Owner `neocom-esi` is **aside**. Remaining ESI-011 (remove OpenAPI + generated Character API). Resume apply only when `neocom-esi` is back in scope. Design note: ESI-005 vs ESI-011 conflict still open |

## Applying

| Change | System / feature | Tasks | Status | Notes |
| --- | --- | --- | --- | --- |
| `back-cicd` | back / cicd | 72/72 | applying | All tasks done on `neocom-back` `feature/cicd` (CI + logging + WireMock/Gherkin/mock catalog); stop before commit for review |
| `front-cicd` | front / cicd | 87/87 | applying | `neocom-front` `feature/cicd` stacked on `feature/universe`; all tasks done; stop before commit for review |
| `front-universe` | front / universe | 4/4 | applying | `neocom-front` `feature/universe` from `develop`; Universe ESI adapter + client cache + WireMock stubs; stop before commit for review |

## Applied

| Change | System / feature | Tasks | Status | Notes |
| --- | --- | --- | --- | --- |
| `front-assets-by-location` | front / assets-by-location | 14/14 | applied | EPIC-015; [neocom-front#7](https://github.com/AdamAntinoo/neocom-front/pull/7) merged 2026-11-09; develop @ `d1fed92`; `openspec validate` passed (warnings only: long requirement text) |
| `back-assets` | back / assets | 14/14 | applied | EPIC-014; [neocom-back#9](https://github.com/AdamAntinoo/neocom-back/pull/9) merged 2026-11-09; develop @ `63a2098`; `openspec validate` passed |
| `back-eve-items` | back / eve-items | 22/22 | applied | EPIC-013; [neocom-back#8](https://github.com/AdamAntinoo/neocom-back/pull/8) merged + included in [#9](https://github.com/AdamAntinoo/neocom-back/pull/9); develop @ `b72ff05`…`63a2098`; `openspec validate` passed |

## Archived

| Archive folder | Main spec |
| --- | --- |
| `2026-11-09-back-service` | `specs/back/service/spec.md` |
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
| **Eve items (EPIC-013)**                | `back-eve-items`, `back-eve-item-dogma-drop` | ESI type → EveItemV1Dto → PricedItemV1Dto; get-by-id / Redis; Jita hub prices; OPT drop unused dogma (EPIC-016) |
| **Assets (EPIC-014)**                   | `back-assets` | EveAssetV1Dto + LocatedAssetContainerV1Dto; ESI + authenticated pilot HTTP (full/by-location); PilotPort/UC; Redis TTL 60m |
| **Assets by location (EPIC-015)**       | `front-assets-by-location` | Dashboard Feature + `pilot` module page + locationId aggregation / Unidentified roots + `v1-asset-render` |
| **Backend services (EPIC-009)**         | `domain-layout`, `domain-ports`, `domain-deprecations`, `back-openapi`, `back-industry-blueprints` | Domain truth/ports/deprecations → OpenAPI rules → Industry pilot blueprints |
| **Front shell & toolchain**             | `front-infrastructure`, `front-app-shell`                                                                                     | Node/Angular stack, canvas chrome; install/local WireMock config → EPIC-017 §12/§13                  |
| **Auth / SSO**                          | `login` (multi-system; archived)                                                                                              | Session unified; obsolete `nestjs-sso-config` removed 2026-11-09                                     |
| **Angular codification (EPIC-002)**     | `front-angular-structure`, `front-node-render`, `front-async-sse`, `back-async-sse`, `infra-async-persistence`                | Structure → node/viewer/registry → async SSE enrichment with Nest + PostgreSQL/Redis                 |
| **CI/CD (EPIC-017)**                    | `front-cicd`, `back-cicd` | Registered set incl. SemVer 130–133 (2026-11-11c); L1 leftover `[ ]`: SDD CICD-F-045…047 only |


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
| **Related**              | Former `nestjs-sso-config` / `back-nestjs-sso-config` / `infra-sso-config` removed as obsolete (2026-11-09); env contract lives with `login`                                                                                                                                                                             |
| **Paths**                | `changes/archive/2026-11-06-login/`                                                                                                                                                                                                                                             |


### `front-infrastructure` — archived · 8/8


|                    |                                                                                                              |
| ------------------ | ------------------------------------------------------------------------------------------------------------ |
| **Why**            | Shared front stack: Angular 22, TypeScript, Vitest, Cypress+Cucumber, nvm `neocom`, WireMock for front `dev` |
| **Capabilities**   | `front-toolchain`                                                                                            |
| **Owners**         | `neocom-front`, programme docs                                                                               |
| **Branch**         | `feature/infrastructure` from `develop` @ `90a9e42`                                                          |
| **Integrate with** | `front-app-shell`; EPIC-017 §12/§13 (former install/local-config)                                            |
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


### `front-universe` — applying · 4/4


|                    |                                                                                  |
| ------------------ | -------------------------------------------------------------------------------- |
| **Why**            | Unauthenticated ESI reference data (ancestries, bloodlines, …) to complete Pilot |
| **Capabilities**   | `front/universe`                                                                 |
| **Owners**         | front + domain Pilot model                                                       |
| **Integrate with** | `front-pilot`, `domain-module`                                                   |
| **Paths**          | `changes/front-universe/` · `neocom-front` `feature/universe`                    |


### `back-service` — archived · 3/3


|                    |                                                                                   |
| ------------------ | --------------------------------------------------------------------------------- |
| **Why**            | Pilot use case: public ESI → pilot DTO; not-found; `NeocomBackendError`           |
| **Capabilities**   | `back/service`                                                                    |
| **Owners**         | `neocom-back`                                                                     |
| **Integrate with** | `front-pilot`, `esi-character-api`, archived `back-esi-client` / `back-hexagonal` |
| **Paths**          | `changes/archive/2026-11-09-back-service/` · main `specs/back/service/spec.md`    |
| **Evidence**       | Already on `neocom-back` `develop` @ `63a2098` (`EsiPilotSource` + `GetPilotUseCase` + `ExceptionCatalog.PILOT_NOT_FOUND`) |


### `back-eve-item-dogma-drop` — registered · 0/3


|                    |                                                                 |
| ------------------ | --------------------------------------------------------------- |
| **Why**            | Drop unused `dogmaAttributes` / `dogmaEffects` from `EveItemV1Dto` wire |
| **Capabilities**   | `back/eve-items` (MODIFIED)                                     |
| **Owners**         | `neocom-back`                                                   |
| **Requirements**   | OPT-001…003 (EPIC-016)                                          |
| **Branch**         | `feature/eve-item-dogma-drop` from `develop` (suggested)        |
| **Integrate with** | `back-eve-items`; nested asset `item` payloads                  |
| **Paths**          | `changes/back-eve-item-dogma-drop/`                             |


### `back-eve-items` — applied · 22/22


|                    |                                                                 |
| ------------------ | --------------------------------------------------------------- |
| **Why**            | ESI type → EveItem/PricedItem DTOs + get-by-id HTTP/Redis       |
| **Capabilities**   | `back/eve-items`                                                |
| **Owners**         | `neocom-back`                                                   |
| **Requirements**   | ITEM-001…007, ITEM-010…026; DEF-EI-001/002/003                  |
| **Branch**         | tip on `feature/assets` (was `feature/eve-items`); PR [#9](https://github.com/AdamAntinoo/neocom-back/pull/9) |
| **Integrate with** | EPIC-012 EveLocation / market (hub buy/sell from The Forge orders @ Jita 4-4); follow-on `back-eve-item-dogma-drop` |
| **Paths**          | `changes/back-eve-items/`                                       |


### `front-assets-by-location` — applied · 14/14


|                    |                                                                 |
| ------------------ | --------------------------------------------------------------- |
| **Why**            | Dashboard Feature + pilot assets-by-location page (Region/Unidentified → System → Asset/Container) + `v1-asset-render` |
| **Capabilities**   | `front/assets-by-location`                                      |
| **Owners**         | `neocom-front`                                                  |
| **Requirements**   | FAL-001…003, 010…015, 020…037 (EPIC-015)                        |
| **Branch**         | `feature/assets-by-location` from `develop`                     |
| **Integrate with** | `back-assets` (pilot assets HTTP); spacelocations lookup; `v1-region-render` / `v1-system-render` |
| **Paths**          | `changes/front-assets-by-location/`                             |
| **Apply notes**    | Committed `bd179c7`; PR [#7](https://github.com/AdamAntinoo/neocom-front/pull/7) open for develop validation. Unidentified icon (FAL-025) still deferred. |


### `back-assets` — applied · 14/14


|                    |                                                                 |
| ------------------ | --------------------------------------------------------------- |
| **Why**            | ESI character assets → EveAsset DTOs + authenticated pilot HTTP + Redis |
| **Capabilities**   | `back/assets`                                                   |
| **Owners**         | `neocom-back` only (new models/ports; domain deprecated for new) |
| **Requirements**   | AST-001…014 (EPIC-014)                                          |
| **Branch**         | `feature/assets` @ `9e2c297` → `develop` via PR [#9](https://github.com/AdamAntinoo/neocom-back/pull/9) |
| **Integrate with** | `back-eve-items` (nested PricedItem); EPIC-012 EveLocationV1Dto |
| **Paths**          | `changes/back-assets/`                                          |


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


### `front-cicd` — applying · 87/87


|                    |                                                                 |
| ------------------ | --------------------------------------------------------------- |
| **Why**            | EPIC-017 front CI/CD set (`CICD-F-*`): BDD/fixtures, coverage/Sonar, gates, catalog, deploy/GHCR, SemVer bump/release/naming, logging, CI pipeline, install, local-config, domain-node tests, Cypress step families + `cy-*` |
| **Capabilities**   | `front/cicd`                                                    |
| **Owners**         | `neocom-front`                                                  |
| **Integrate with** | `back-cicd` |
| **Paths**          | `changes/front-cicd/` · `neocom-front` `feature/cicd` · meta `feature/cicd` Actions |
| **Supersedes**     | `front-bdd-cypress`, `front-mock-fixtures`; front half of coverage/gates/commands |
| **Remaining**      | none — review uncommitted front apply, then `/git:commit` |


### `back-cicd` — applying · 72/72


|                    |                                                                 |
| ------------------ | --------------------------------------------------------------- |
| **Why**            | EPIC-017 back CI/CD set (`CICD-B-*`): guidelines, WireMock, Gherkin, OpenAPI scenarios + mock catalog, coverage/Sonar, gates, deploy/GHCR, SemVer bump/release/naming, logging, CI pipeline, step catalog |
| **Capabilities**   | `back/cicd`                                                     |
| **Owners**         | `neocom-back`                                                   |
| **Integrate with** | `front-cicd` |
| **Paths**          | `changes/back-cicd/` · `neocom-back` `feature/cicd` · meta `feature/cicd` `back-ci` |
| **Supersedes**     | `back-testing`; back half of coverage/gates/commands |
| **Remaining**      | none — review uncommitted back apply, then `/git:commit` |


---

## Capability index (active)


| Capability path           | Change                    |
| ------------------------- | ------------------------- |
| `back/assets`             | `back-assets`             |
| `front/login`             | `login`                   |
| `back/login`              | `login`                   |
| `esi/sso`                 | `login`                   |
| `esi/login`               | `login`                   |
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
| `front/assets-by-location` | `front-assets-by-location` |
| `front/pilot`             | `front-pilot`             |
| `front/pilot-panel`       | `front-pilot-panel`       |
| `front/universe`          | `front-universe`          |
| `back/service`            | `back-service` (archived → `specs/back/service`) |
| `back/eve-items`          | `back-eve-items` (+ delta `back-eve-item-dogma-drop`) |
| `domain/neocom-domain`    | `domain-module`           |
| `esi/character-api`       | `esi-character-api`       |
| `front/angular-structure` | `front-angular-structure` |
| `front/node-render`       | `front-node-render`       |
| `front/async-sse`         | `front-async-sse`         |
| `back/async-sse`          | `back-async-sse`          |
| `infra/async-persistence` | `infra-async-persistence` |
| `front/cicd`              | `front-cicd`              |
| `back/cicd`               | `back-cicd`               |


## How to update this file

1. After `/epic:extract`, add a row under **Registered** with status `registered`. Add or adjust the matching **Change abstracts** entry and **Capability index** rows when the change is new.
2. When `/feature-delivery` starts, move the row to **Applying** and name the branch if useful.
3. After the pull request into `develop` is accepted (`/git:pr`), move the row to **Applied** and refresh `DELIVERY-INDEX.md` (merged + develop tip).
4. After `openspec archive`, move the row to **Archived** and point at the main spec path; move the delivery row to **Archived delivery** in `DELIVERY-INDEX.md`; drop or archive the change abstract if it no longer applies.
5. Keep status sections in order: **Registered**, **Deferred**, **Applying**, **Applied**, **Archived**.
6. Refresh task counts with `npx openspec list --json` whenever the register is reviewed.
7. Move a change to **Deferred** when apply is blocked by programme scope (e.g. owning repo aside); return it to **Registered** or **Applying** when the blocker clears.
8. When folding several changes into one feature, update **Suggested integration clusters**, **Change abstracts**, and **Capability index** in this file (there is no separate abstract file).
