# OpenSpec change status

Manual register of OpenSpec changes in this repository. OpenSpec itself does not require this file; it is for programme tracking.

**Agents must update this file in the same turn as any OpenSpec change** (register, edit tasks/specs, apply progress, cancel or complete a task, accept into `develop`, or archive). Refresh task counts with:

```bash
cd neocom-meta && nvm use && npx openspec list --json
```

Last refreshed: 2026-11-03 (`/neo:spec-evolution` DEF-IB amend → `front-dashboard-shell` 17/22; DOM-SRV-004/005 marked registered on L2). Tips: back `3317849` (28/28), front `e3356db` (44/44), domain `477ee33` (11/11). No archive yet (release PR not opened).

## Status legend

| Status | Meaning |
| --- | --- |
| `registered` | Change exists under `changes/<name>/` with proposal, specs, design, and tasks |
| `applying` | Implementation on `feature/<feature>` (default base `develop`; may be stacked). Apply stops before commit |
| `applied` | Merged to `develop` (or ready on develop) and eligible for **validation on develop**; archive not done yet. Note `validated on develop @ <sha>` when validation passes |
| `archived` | Developer-selected after develop validation; `/openspec-archive-change` done (`changes/archive/` + `openspec/specs/`). Draft Release PR may still be open — main/spec parity for the release only when the selected archive set is complete and the PR is marked ready |
| `deferred` | Registered but **not applyable** until a named blocker clears (e.g. owning repo aside). Do not start `/openspec-apply-change` |

PR content control: `.dsh/templates/openspec-delivery-control.md` (feature → develop = validation intake; **archive then** draft `develop` → `main`).  
Commit / PR / develop-tip evidence per change: [`DELIVERY-INDEX.md`](./DELIVERY-INDEX.md) (owned by `/neocom-git`; graphify-indexed — prefer over live GitHub).

Task progress comes from checkboxes in each change’s `tasks.md` (`openspec list`).

**Row order in this file:** archived, then applying (then applied when any), then deferred, then registered.

## Archived

| Archive folder | Main spec |
| --- | --- |
| `2026-10-15-back-esi-client` | `specs/back/esi-client/spec.md` |
| `2026-10-15-back-hexagonal` | `specs/back/hexagonal/spec.md` |
| `2026-10-15-infra-style-modules` | `specs/infra/style-modules/spec.md` |

## Applying

| Change | System / feature | Tasks | Status | Notes |
| --- | --- | --- | --- | --- |
| `front-dashboard-shell` | front / dashboard-shell (multi-cap) | 17/22 | applying | EPIC-006 fold committed on `neocom-front` `feature/dashboard-shell` `@ 1be24de`. DEF-IB amend registered 2026-11-03 (UI-VER-004, UI-GEO-001, UI-HDR-010/011, UI-AIP-006, UI-DASH-015) — 5 tasks open. Prior tip awaiting PR → `develop` |
| `front-industry-blueprints` | front / industry-blueprints (multi-cap) | 17/17 | applying | EPIC-010 fold committed on `neocom-front` `feature/industry-blueprints` `@ c382959` (stacked on `dashboard-shell`). Awaiting PR → `develop`. Gap: list/SSE `location` chain not yet on back DTO |

## Applied

| Change | System / feature | Tasks | Status | Notes |
| --- | --- | --- | --- | --- |
| `login` | front/login, back/login, esi/sso, esi/login | 13/13 | applied | Validated on develop: front `@ e3356db`, back `@ 3317849` (SSO pages + callback cookies / token storage). Related `nestjs-sso-config` still registered |
| `front-infrastructure` | front / toolchain | 8/8 | applied | Validated on develop `@ e3356db` (WireMock script + toolchain). Vitest 44/44 |
| `front-angular-structure` | front / angular-structure | 7/7 | applied | Validated on develop `@ e3356db` (EPIC-002 STRUCT) |
| `front-node-render` | front / node-render | 7/7 | applied | Validated on develop `@ e3356db` (EPIC-002 NODE) |
| `front-async-sse` | front / async-sse | 7/7 | applied | Validated on develop `@ e3356db` (adapter cache + SSE merge; `sseBasePath: '/v1'`) |
| `back-async-sse` | back / async-sse | 7/7 | applied | Validated on develop `@ 3317849` (manufacture SSE, BullMQ/Redis, TypeORM/Flyway). Vitest 28/28. Gap check: routes under `/v1/pilots/:pilotId/manufacture/*` |
| `infra-async-persistence` | infra / async-persistence | 4/4 | applied | Validated with back develop `@ 3317849` + meta `tools/infra` companion + front `sseBasePath`. Docker/Flyway optional locally |
| `domain-pilot` | domain / pilot | 5/5 | applied | Validated on develop `@ 477ee33` (PublicPilotV1 + PilotV2). Domain tests 11/11 |
| `domain-blueprint` | domain / blueprint | 2/2 | applied | Validated on develop `@ 477ee33` (BlueprintV1 + ME/TE clamp) |
| `domain-application-info` | domain / application-info | 3/3 | applied | Validated on develop `@ 477ee33` |
| `domain-server-status` | domain / server-status | 2/2 | applied | Validated on develop `@ 477ee33`. Field/render ADDED text **superseded** by EPIC-006 panel set — delta draft uses **REMOVED** + replacement **ADDED** in change `specs/domain/server-status/spec.md`; register/apply follow-up when reviewed |
| `domain-spacelocation` | domain / spacelocation | 3/3 | applied | Validated on develop `@ 477ee33` (`SpaceLocationV1`) |
| `domain-locations` | domain / locations | 3/3 | applied | Validated on develop `@ 477ee33` (hierarchy in `SpaceLocationV1`) |
| `back-spacelocations` | back / spacelocations | 2/2 | applied | Validated on develop `@ 3317849` — `GET /api/v1/universe/spacelocations/:locationId` |
| `domain-jsonclass` | domain / jsonclass (+ back, front) | 3/3 | applied | Validated: domain `@ 477ee33`, front `@ e3356db` (`pilot-from-dto` / render registry), back `@ 3317849` (`SpaceLocation` / BlueprintV1 stamps) |
| `domain-layout` | domain / layout | 2/2 | applied | Validated on develop `@ 477ee33` (models extend `Record`; flat `src/domain`) |
| `domain-ports` | domain / ports | 2/2 | applied | Validated on develop `@ 477ee33` (`PilotPort` + `IndustryPort`) |
| `domain-deprecations` | domain / deprecations | 2/2 | applied | Validated on develop `@ 477ee33` — DTOs `@deprecated`; `src/esi-api/DEPRECATED.md` + `src/dto/DEPRECATED.md` |
| `back-openapi` | back / openapi | 3/3 | applied | Validated on develop `@ 3317849` — `tools/openapi/` + industry YAML `BlueprintV1` |
| `back-industry-blueprints` | back / industry-blueprints | 2/2 | applied | Validated on develop `@ 3317849` — sync `GET /v1/pilots/:pilotId/blueprints` via ESI `createClient` (no scaffolds) |
| `front-pilot` | front / pilot | 5/5 | applied | Validated on develop `@ e3356db` (NeoCom nodes wrapping domain Pilot models) |
| `front-pilot-panel` | front / pilot-panel | 4/4 | applied | Validated on develop `@ e3356db` (`v1-pilot-panel` + HEADER variants) |

## Deferred

| Change | System / feature | Tasks | Status | Notes |
| --- | --- | --- | --- | --- |
| `esi-character-api` | esi / character-api | 3/4 | deferred | Owner `neocom-esi` is **aside**. Remaining ESI-011 (remove OpenAPI + generated Character API). Resume apply only when `neocom-esi` is back in scope. Design note: ESI-005 vs ESI-011 conflict still open |

## Registered

| Change | System / feature | Tasks | Status | Notes |
| --- | --- | --- | --- | --- |
| `nestjs-sso-config` | back / nestjs-sso-config | 0/2 | registered | INFRA-041…042; NestJS SSO env/config; related to `login`. Renamed from `back-nestjs-sso-config` (earlier `infra-sso-config`) |
| `front-universe` | front / universe | 0/4 | registered | |
| `front-app-shell` | front / app-shell | 0/3 | registered | |
| `back-service` | back / service | 0/3 | registered | |
| `domain-module` | domain / neocom-domain | 2/3 | registered | |
| `infra-developer-install` | infra / developer-install | 0/4 | registered | |
| `infra-local-config` | infra / local-config | 0/7 | registered | |
| `cicd-pipeline` | cicd / pipeline | 0/8 | registered | |
| `front-bdd-cypress` | front / bdd-cypress | 0/4 | registered | EPIC-003; BDD-001…004. SDD→BDD→TDD + Cypress `cy-*` UI/content validation |
| `front-mock-fixtures` | front / mock-fixtures | 0/4 | registered | EPIC-003; FIX-001…004. Fixtures from real runs; Gherkin-selectable |
| `cicd-coverage-sonar` | cicd / coverage-sonar | 0/5 | registered | EPIC-003; COV-001…005. Coverage tools, quality gates, SonarCloud |
| `cicd-testing-gates` | cicd / testing-gates | 0/3 | registered | EPIC-003; GATE-001…003. Parallel unit/acceptance before Sonar |
| `infra-test-commands` | infra / test-commands | 0/5 | registered | EPIC-003; INFRA-060…064. Shared TDD/BDD/SDD command catalog |
| `back-testing` | back / testing | 0/5 | registered | EPIC-003; BTEST-001…005. Back guidelines, WireMock, Gherkin |

Delta specs usually live at `changes/<system>-<feature>/specs/<system>/<feature>/spec.md`. A multi-system feature may use one change folder (for example `changes/login/`) with several capability specs underneath.

**Abstract for combining changes into one feature:** see [`SPECS-ABSTRACT.md`](./SPECS-ABSTRACT.md) (why, capabilities, owners, integration clusters).

## How to update this file

1. After `/neo:spec-evolution`, add a row under **Registered** with status `registered`.
2. When `/feature-delivery` starts, move the row to **Applying** and name the branch if useful.
3. After the pull request into `develop` is accepted (`/git:pr`), move the row to **Applied** and refresh `DELIVERY-INDEX.md` (merged + develop tip).
4. After `openspec archive`, move the row to **Archived** and point at the main spec path; move the delivery row to **Archived delivery** in `DELIVERY-INDEX.md`.
5. Keep sections in order: **Archived**, **Applying**, **Applied**, **Deferred**, **Registered**.
6. Refresh task counts with `npx openspec list --json` whenever the register is reviewed.
7. Move a change to **Deferred** when apply is blocked by programme scope (e.g. owning repo aside); return it to **Registered** or **Applying** when the blocker clears.
