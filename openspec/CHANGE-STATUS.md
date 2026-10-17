# OpenSpec change status

Manual register of OpenSpec changes in this repository. OpenSpec itself does not require this file; it is for programme tracking.

**Agents must update this file in the same turn as any OpenSpec change** (register, edit tasks/specs, apply progress, cancel or complete a task, accept into `develop`, or archive). Refresh task counts with:

```bash
cd neocom-meta && nvm use && npx openspec list --json
```

Last refreshed: 2026-10-17 (from `openspec list --json`).

## Status legend

| Status | Meaning |
| --- | --- |
| `registered` | Change exists under `changes/<name>/` with proposal, specs, design, and tasks |
| `applying` | Implementation on `feature/<feature>` from `develop` |
| `applied` | Work accepted on `develop`; archive not done yet |
| `archived` | Moved to `changes/archive/` and merged into `openspec/specs/` |

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
| `back-async-sse` | back / async-sse | 7/7 | applying | EPIC-002; BASSE-001…012. Branch `feature/async-sse` from `develop` @ `6a030c1`. In-memory default; TypeORM/BullMQ when `DATABASE_URL`/`REDIS_URL` set. Ready for user review (no PR) |
| `infra-async-persistence` | infra / async-persistence | 4/4 | applying | EPIC-002; INFRA-050…055. Docs + `infra/docker-compose.async-persistence.yml` on `feature/agents`. Companion front/back applying |

## Applied

*(none)*

## Registered

| Change | System / feature | Tasks | Status | Notes |
| --- | --- | --- | --- | --- |
| `nestjs-sso-config` | back / nestjs-sso-config | 0/2 | registered | INFRA-041…042; NestJS SSO env/config; related to `login`. Renamed from `back-nestjs-sso-config` (earlier `infra-sso-config`) |
| `front-pilot` | front / pilot | 4/5 | registered | |
| `front-pilot-panel` | front / pilot-panel | 0/4 | registered | |
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
