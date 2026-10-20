# L1 epic → OpenSpec traceability

Central index so agents can **skip** epics (or passages) that are already extracted, registered, applying, applied, or archived. Each epic file also carries a `## Spec traceability` section; keep both in sync.

Refresh OpenSpec task counts from `npx openspec list --json` when updating this file.

## Status values

| Status | Meaning |
| --- | --- |
| `none` | No L2 extract and no OpenSpec change yet |
| `extracted` | Epic-named L2 file(s) exist (`L2/NN.EPIC-NAME.md` and/or `L2/NN.EPIC-NAME.<group>.md`); OpenSpec not registered (or not yet for this epic) |
| `registered` | One or more OpenSpec changes exist under `openspec/changes/` |
| `applying` | Implementation on `feature/<feature>` |
| `applied` | Accepted on `develop`; not archived |
| `archived` | OpenSpec change in `openspec/changes/archive/` |

**Skip rules**

- `/neo:extract-l2`: still skip passages already present in the L2 tree. In addition, treat passages covered by OpenSpec changes in status `applied` or `archived` as done; only extract **new** L1 material appended after the last update. On an epic with a **Review** column, extract only rows marked `reviewed` and then set those cells to `extracted`. Leave `to review` sections untouched until a later iteration marks them `reviewed`.
- `/neo:spec-evolution`: register notes already under `UNREGISTERED REQUIREMENTS`. Do not open L1 to add models still `to review`. Skip L2 notes whose L1 epic row lists the same behavior under an `applied` or `archived` change (move to `DUPLICATED` if re-appeared).
- `/epic` appends: when adding material to an epic that is `applied`/`archived`, mark new sections as not yet traced until extract/register runs.

## Index

| L1 epic | Epic id | Highest OpenSpec status | OpenSpec changes | L2 path | Last updated |
| --- | --- | --- | --- | --- | --- |
| `01.EPIC-LOGIN-PROCEDURE.md` | EPIC-001 | applying | `login` (13/13), related `nestjs-sso-config` (0/2) | Legacy `L2/01.EPIC-LOGIN-PROCEDURE/`; new extracts use epic-named files | 2026-10-17 |
| `02.EPIC-ANGULAR-CODIFICATION.md` | EPIC-002 | applying | `front-angular-structure` (7/7, `feature/angular-structure`), `front-node-render` (7/7, `feature/node-render`), `front-async-sse` (7/7, `feature/async-sse`), `back-async-sse` (7/7, `feature/async-sse`), `infra-async-persistence` (4/4, `feature/agents`); related: `front-app-shell`, `front-dashboard`, `front-pilot`, `front-pilot-panel`, `front-infrastructure` (8/8, applying on `feature/infrastructure`) | Epic extracts + `L2/FRONT/07.ANGULAR-STRUCTURE.md`, `08.NODE-RENDER.md`, `09.ASYNC-SSE.md`, `L2/BACK/BACK-ASYNC-SSE.md`, `INFRASTRUCTURE-SPECS.md` §H | 2026-10-17 |
| `03.EPIC-TESTING.md` | EPIC-003 | registered | `front-bdd-cypress`, `front-mock-fixtures`, `cicd-coverage-sonar`, `cicd-testing-gates`, `infra-test-commands`, `back-testing` | Epic extracts + `L2/FRONT/10.BDD-CYPRESS.md`, `11.MOCK-FIXTURES.md`, `L2/CICD/01.COVERAGE-SONAR.md`, `02.TESTING-GATES.md`, `INFRASTRUCTURE-SPECS.md` §I, `L2/BACK/BACK-TESTING.md` | 2026-10-17 |
| `04.EPIC-MODELS.md` | EPIC-004 | none | | L1 holds models; `L2/DOMAIN/MODELS/` pointers; Pilot front pointer `L2/FRONT/01.PILOT-DEFINITION.md` | 2026-10-19 |
| `05.EPIC-ESI-UNIVERSE.md` | EPIC-005 | none | | SDE source + back install noted on L1 | 2026-10-19 |
| `06.EPIC-USER-INTERFACE.md` | EPIC-006 | none | | Auth page UI + `app-page-header` shell rules on L1 (not extracted yet) | 2026-10-19 |
| `07.EPIC-NEOCOM-API.md` | EPIC-007 | none | | Baseline: auth `POST /v1/auth/callback` + cookie refresh; pilot `GET /v1/pilots/{id}`; related industry blueprints sync/SSE. More flows TBD | 2026-10-19 |
| `08.EPIC-LOCATIONS.md` | EPIC-008 | none | | | 2026-10-19 |

Non-epic L1 notes (`REQUIREMENTS.md`, `UX.md`, `ESI.md`) are not rows here until an `/epic` owns them.

## How agents update this file

1. After `/neo:extract-l2` creates or updates epic-named L2 file(s), set status at least `extracted` and fill **L2 path** with those file paths.
2. After `/neo:spec-evolution` registers OpenSpec changes sourced from that epic, add change names and set `registered` (or keep a higher status).
3. When `/feature-delivery` starts, set `applying`.
4. When the pull request into `develop` is accepted, set `applied`.
5. After `openspec archive`, set `archived`.
6. Mirror the same facts into `## Spec traceability` on the L1 epic file.
