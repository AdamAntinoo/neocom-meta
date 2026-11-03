# OpenSpec change status

Manual register of OpenSpec changes in this repository. OpenSpec itself does not require this file; it is for programme tracking.

**Agents must update this file in the same turn as any OpenSpec change** (register, edit tasks/specs, apply progress, cancel or complete a task, accept into `develop`, or archive). Refresh task counts with:

```bash
cd neocom-meta && nvm use && npx openspec list --json
```

Last refreshed: 2026-11-03 (`back` `side/industry` @ `2c14f3c` — integrated `a6028c7` async restructure; `back-async-sse` + `infra-async-persistence` reset for reapply/validation).

## Status legend

| Status | Meaning |
| --- | --- |
| `registered` | Change exists under `changes/<name>/` with proposal, specs, design, and tasks |
| `applying` | Implementation on `feature/<feature>` (default base `develop`; may be stacked). Apply stops before commit |
| `applied` | Merged to `develop` (or ready on develop) and eligible for **validation on develop**; archive not done yet. Note `validated on develop @ <sha>` when validation passes |
| `archived` | Released via `develop` → `main` archive list; moved to `changes/archive/` and merged into `openspec/specs/` |

PR content control: `.dsh/templates/openspec-delivery-control.md` (feature → develop = validation intake; develop → main = archive trigger).

Task progress comes from checkboxes in each change’s `tasks.md` (`openspec list`).

**Row order in this file:** archived, then applying (then applied when any), then registered.

## Archived

| Archive folder | Main spec |
| --- | --- |
| `2026-10-15-back-esi-client` | `specs/back/esi-client/spec.md` |
| `2026-10-15-back-hexagonal` | `specs/back/hexagonal/spec.md` |
| `2026-10-15-infra-style-modules` | `specs/infra/style-modules/spec.md` |

## Applying

| Change | System / feature | Tasks | Status | Notes |
| --- | --- | --- | --- | --- |
| `login` | front/login, back/login, esi/sso, esi/login | 13/13 | applying | `feature/login` in front and back. Tasks complete; ESI-012 marked fulfilled outside this apply. Meta work on `feature/agents`. Ready for review / `/git:pr` then archive |
| `front-infrastructure` | front / toolchain | 8/8 | applying | Spec path `front-toolchain`. Branch `feature/infrastructure` from `develop` @ `90a9e42`. WireMock stubs + `npm run wiremock`; Vitest 23/23; Cypress `app.feature` smoke 2/2. Ready for user review (no PR yet) |
| `front-angular-structure` | front / angular-structure | 7/7 | applying | EPIC-002; STRUCT-001…007. Branch `feature/angular-structure` from `develop` @ `6bc6535`. Ready for user review (no PR) |
| `front-node-render` | front / node-render | 7/7 | applying | EPIC-002; NODE-001…017. Branch `feature/node-render` rebased onto `feature/angular-structure` @ `28b8334`. Ready for user review (no PR) |
| `front-async-sse` | front / async-sse | 7/7 | applying | EPIC-002; FASSE-001…010. Branch `feature/async-sse` rebased onto `feature/node-render` @ `96dcabd`. Ready for user review (no PR) |
| `back-async-sse` | back / async-sse | 0/7 | applying | **REAPPLY** EPIC-002; BASSE-001…012. Integrated `a6028c7` onto `side/industry` @ `2c14f3c` (outbound adapters, Flyway under `tools/db`, docker compose). Manufacture SSE kept at `/v1/pilots/:pilotId/manufacture/*` (not `/industry`). Tasks unchecked for re-validation before PR |
| `infra-async-persistence` | infra / async-persistence | 0/4 | applying | **REAPPLY** EPIC-002; INFRA-050…055. Back now owns Flyway + `tools/docker` Postgres/Redis (`2c14f3c`); meta compose remains companion. Tasks unchecked for re-validation |
| `domain-pilot` | domain / pilot | 5/5 | applying | EPIC-004; `feature/domain-models` in `neocom-domain`. PublicPilotV1 + PilotV2. Ready for user review (no PR) |
| `domain-blueprint` | domain / blueprint | 2/2 | applying | EPIC-004; DOM-BP-001…003. Domain `feature/domain-models` (BlueprintV1 + ME/TE clamp); front `feature/blueprint` (`v1-blueprint` identity for BlueprintV1). Ready for `/neocom-git` + review |
| `domain-application-info` | domain / application-info | 3/3 | applying | EPIC-004; ApplicationInfoV1 on `feature/domain-models` (accessors). Front render remains consumer. Ready for user review (no PR) |
| `domain-server-status` | domain / server-status | 2/2 | applying | EPIC-004; ServerStatusV1 on `feature/domain-models`. Ready for user review (no PR) |
| `domain-spacelocation` | domain / spacelocation | 3/3 | applying | EPIC-004; thin empty interface dropped — `SpaceLocationV1` is the published lookup class on `feature/domain-models` @ `3b0e426`. Ready for user review (no PR) |
| `domain-locations` | domain / locations | 3/3 | applying | EPIC-008; hierarchy flattened into `SpaceLocationV1` on `feature/domain-models` @ `3b0e426`. Ready for user review (no PR) |
| `back-spacelocations` | back / spacelocations | 2/2 | applying | EPIC-008; LOC-010 stacked on `side/industry` @ `2c14f3c`. `LOCATION_CATALOG` port moved to `@Domain/ports`. Ready for validation with industry+async coexistence (no PR) |
| `domain-jsonclass` | domain / jsonclass (+ back, front) | 3/3 | applying | EPIC-004; DOM-JSONCLASS-001…003. Back `feature/jsonclass` (Pilot + SpaceLocation `jsonClass`); front `feature/jsonclass` (select via `jsonClass`); domain `feature/domain-models` (align PilotV2 / SpaceLocation). Ready for `/neocom-git` + user review |
| `domain-layout` | domain / layout | 2/2 | applying | EPIC-009; BACK-SVC-001…004, 010…013. `feature/domain-models` @ `3b0e426`: models extend `Record`; NeoCom removed from package (front-only); `src/ports` + flat `src/domain`. Committed — review / PR |
| `domain-ports` | domain / ports | 2/2 | applying | EPIC-009; BACK-SVC-020…022, 030…032. `PilotPort` + `IndustryPort` under `src/ports` @ `3b0e426`. Committed — review / PR |
| `domain-deprecations` | domain / deprecations | 2/2 | applying | EPIC-009; BACK-SVC-040…042, 050…052. DTOs `@deprecated`; `esi-api/DEPRECATED.md` @ `3b0e426`. Committed — review / PR |
| `back-openapi` | back / openapi | 3/3 | applying | EPIC-009; BACK-SVC-060…063. `tools/openapi/README.md` + industry YAML uses domain schema name `BlueprintV1`. Branch `feature/industry-blueprints` @ `7bbbea0`. Ready for user review (no PR) |
| `back-industry-blueprints` | back / industry-blueprints | 2/2 | applying | EPIC-009; BACK-SVC-070…072. Sync `GET /v1/pilots/:pilotId/blueprints` on `side/industry` @ `2c14f3c`; distinct from async manufacture routes. Ready for validation with async+spacelocations coexistence (no PR) |
| `front-pilot` | front / pilot | 5/5 | applying | EPIC-004 PILOT-002…007. Front uses `neocom-domain` `PublicPilotV1`/`PilotV2` + NeoCom nodes. Committed on `feature/blueprint` @ `6357f65`. Ready for user review (no PR) |
| `front-pilot-panel` | front / pilot-panel | 4/4 | applying | PANEL-001…012. `v1-pilot-panel` + `v1-public-pilot` / `v2-pilot` renders; variants `-PILOT-*-VARIANT-`. Committed on `feature/blueprint` @ `857933b`. Ready for user review (no PR) |

## Applied

*(none)*

## Registered

| Change | System / feature | Tasks | Status | Notes |
| --- | --- | --- | --- | --- |
| `nestjs-sso-config` | back / nestjs-sso-config | 0/2 | registered | INFRA-041…042; NestJS SSO env/config; related to `login`. Renamed from `back-nestjs-sso-config` (earlier `infra-sso-config`) |
| `front-universe` | front / universe | 0/4 | registered | |
| `front-app-shell` | front / app-shell | 0/3 | registered | |
| `front-dashboard` | front / dashboard | 0/6 | registered | |
| `back-service` | back / service | 0/3 | registered | |
| `domain-module` | domain / neocom-domain | 2/3 | registered | |
| `esi-character-api` | esi / character-api | 3/4 | registered | |
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
3. After the pull request into `develop` is accepted (`/git:pr`), move the row to **Applied**.
4. After `openspec archive`, move the row to **Archived** and point at the main spec path.
5. Keep sections in order: **Archived**, **Applying**, **Applied**, **Registered**.
6. Refresh task counts with `npx openspec list --json` whenever the register is reviewed.
