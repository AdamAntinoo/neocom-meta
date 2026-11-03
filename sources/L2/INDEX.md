# L2 specification index

Dashboard for **what is waiting in L2** and where each file sits in the pipeline. Icons match the file status header (`<!-- L2-STATUS: … -->`).

Authoritative companions:

- `sources/L1/TRACEABILITY.md` — per-epic Sections + L2 delivery (OpenSpec / Delivery)
- `openspec/CHANGE-STATUS.md` — OpenSpec apply / archive
- This file — L2 file backlog (`inbox` → `/neo:spec-evolution`)

Agents update this file in the same turn as `/neo:extract-l2` or `/neo:spec-evolution` when they create, clear, or place L2 notes.

## Status legend

| Icon | Status | Meaning |
| --- | --- | --- |
| 📥 | `inbox` | Epic extract with notes still `pending` for `/neo:spec-evolution` |
| 📭 | `cleared` | Epic extract; no pending notes (registered or moved to `sources/L1/00.DUPLICATES.md`) |
| 📌 | `placed` | System/feature register with stable IDs (`L2/<SYSTEM>/…`) |
| 🔗 | `pointer` | Pointer-only file; no requirements owned here |
| ⛔ | `parked` | Intentionally not progressing |

`UNREGISTERED REQUIREMENTS` / L2 `DUPLICATED` headings are deprecated. L1 Review (`to review` → `reviewed`) gates extract; duplicates hold in `sources/L1/00.DUPLICATES.md`.

**Queue:** 📥 `0` inbox · 📭 `19` cleared · 🔗 `1` pointer · 📌 `45` placed

## Files

| L2 path | Kind | Status | Unregistered | OpenSpec | Epic | Next |
| --- | --- | --- | --- | --- | --- | --- |
| `06.EPIC-USER-INTERFACE.header.md` | extract | 📭 `cleared` | 0 | `front-dashboard-shell` | EPIC-006 | — |
| `06.EPIC-USER-INTERFACE.dashboard.md` | extract | 📭 `cleared` | 0 | `front-dashboard-shell` | EPIC-006 | — |
| `06.EPIC-USER-INTERFACE.media.md` | extract | 📭 `cleared` | 0 | `front-dashboard-shell` | EPIC-006 | — |
| `06.EPIC-USER-INTERFACE.corporation.md` | extract | 📭 `cleared` | 0 | `front-dashboard-shell` | EPIC-006 | — |
| `06.EPIC-USER-INTERFACE.character.md` | extract | 📭 `cleared` | 0 | `front-dashboard-shell` | EPIC-006 | — |
| `10.EPIC-INDUSTRY-BLUEPRINTS.md` | extract | 📭 `cleared` | 0 | `front-industry-blueprints` | EPIC-010 | — |
| `FRONT/12.PAGE-HEADER.md` | placed | 📌 `placed` | 0 | `front-dashboard-shell` | EPIC-006 | See `openspec/CHANGE-STATUS.md` |
| `FRONT/13.MODEL-STRIP.md` | placed | 📌 `placed` | 0 | `front-industry-blueprints` | EPIC-010 | See `openspec/CHANGE-STATUS.md` |
| `FRONT/14.COLOR-TABLE.md` | placed | 📌 `placed` | 0 | `front-industry-blueprints` | EPIC-010 | See `openspec/CHANGE-STATUS.md` |
| `FRONT/15.FEATURE-BUTTON.md` | placed | 📌 `placed` | 0 | `front-industry-blueprints` | EPIC-010 | See `openspec/CHANGE-STATUS.md` |
| `FRONT/16.BLUEPRINT-BY-LOCATION.md` | placed | 📌 `placed` | 0 | `front-industry-blueprints` | EPIC-010 | See `openspec/CHANGE-STATUS.md` |
| `FRONT/17.SHARED-UI.md` | placed | 📌 `placed` | 0 | `front-industry-blueprints` | EPIC-010 | See `openspec/CHANGE-STATUS.md` |
| `FRONT/18.EVE-MEDIA.md` | placed | 📌 `placed` | 0 | `front-dashboard-shell` | EPIC-006 | See `openspec/CHANGE-STATUS.md` |
| `FRONT/19.CORPORATION.md` | placed | 📌 `placed` | 0 | `front-dashboard-shell` | EPIC-006 | See `openspec/CHANGE-STATUS.md` |
| `FRONT/20.CHARACTER-SELECTION.md` | placed | 📌 `placed` | 0 | `front-dashboard-shell` | EPIC-006 | See `openspec/CHANGE-STATUS.md` |
| `09.EPIC-BACKEND-SERVICES.md` | extract | 📭 `cleared` | 0 | `domain-layout`, `domain-ports`, `domain-deprecations`, `back-openapi`, `back-industry-blueprints` | EPIC-009 | — |
| `DOMAIN/09.LAYOUT.md` | placed | 📌 `placed` | 0 | `domain-layout` | EPIC-009 | See `openspec/CHANGE-STATUS.md` |
| `DOMAIN/10.PORTS.md` | placed | 📌 `placed` | 0 | `domain-ports` | EPIC-009 | See `openspec/CHANGE-STATUS.md` |
| `DOMAIN/11.DEPRECATIONS.md` | placed | 📌 `placed` | 0 | `domain-deprecations` | EPIC-009 | See `openspec/CHANGE-STATUS.md` |
| `BACK/BACK-OPENAPI.md` | placed | 📌 `placed` | 0 | `back-openapi` | EPIC-009 | See `openspec/CHANGE-STATUS.md` |
| `BACK/BACK-INDUSTRY-BLUEPRINTS.md` | placed | 📌 `placed` | 0 | `back-industry-blueprints` | EPIC-009 | See `openspec/CHANGE-STATUS.md` |
| `02.EPIC-ANGULAR-CODIFICATION.async-infra.md` | extract | 📭 `cleared` | 0 | `infra-async-persistence`, `back-async-sse`, `front-async-sse` | EPIC-002 | — |
| `02.EPIC-ANGULAR-CODIFICATION.async-sse.md` | extract | 📭 `cleared` | 0 | `front-async-sse`, `back-async-sse` | EPIC-002 | — |
| `02.EPIC-ANGULAR-CODIFICATION.nodes.md` | extract | 📭 `cleared` | 0 | `front-node-render` | EPIC-002 | — |
| `02.EPIC-ANGULAR-CODIFICATION.structure.md` | extract | 📭 `cleared` | 0 | `front-angular-structure` | EPIC-002 | — |
| `03.EPIC-TESTING.backend-testing.md` | extract | 📭 `cleared` | 0 | `back-testing` | EPIC-003 | — |
| `03.EPIC-TESTING.bdd-cypress.md` | extract | 📭 `cleared` | 0 | `front-bdd-cypress` | EPIC-003 | — |
| `03.EPIC-TESTING.cicd-gates.md` | extract | 📭 `cleared` | 0 | `cicd-testing-gates` | EPIC-003 | — |
| `03.EPIC-TESTING.command-catalog.md` | extract | 📭 `cleared` | 0 | `infra-test-commands` | EPIC-003 | — |
| `03.EPIC-TESTING.coverage-sonar.md` | extract | 📭 `cleared` | 0 | `cicd-coverage-sonar` | EPIC-003 | — |
| `03.EPIC-TESTING.mock-fixtures.md` | extract | 📭 `cleared` | 0 | `front-mock-fixtures` | EPIC-003 | — |
| `04.EPIC-MODELS.md` | extract | 📭 `cleared` | 0 | `domain-jsonclass` (+ prior domain-*) | EPIC-004 | — |
| `DOMAIN/08.JSONCLASS.md` | placed | 📌 `placed` | 0 | `domain-jsonclass` | EPIC-004 | See `openspec/CHANGE-STATUS.md` |
| `08.EPIC-LOCATIONS.md` | extract | 📭 `cleared` | 0 | `domain-locations`, `back-spacelocations` | EPIC-008 | — |
| `FRONT/01.PILOT-DEFINITION.md` | pointer | 🔗 `pointer` | 0 | `front-pilot` | EPIC-004 | — |
| `BACK/BACK-ASYNC-SSE.md` | placed | 📌 `placed` | 0 | `back-async-sse` | — | See `openspec/CHANGE-STATUS.md` |
| `BACK/BACK-HEXAGONAL.md` | placed | 📌 `placed` | 0 | `back-hexagonal` (archived) | — | See `openspec/CHANGE-STATUS.md` |
| `BACK/BACK-LOGIN.md` | placed | 📌 `placed` | 0 | `login` | — | See `openspec/CHANGE-STATUS.md` |
| `BACK/BACK-SERVICE.md` | placed | 📌 `placed` | 0 | `back-service` | — | See `openspec/CHANGE-STATUS.md` |
| `BACK/BACK-SPACELOCATIONS.md` | placed | 📌 `placed` | 0 | `back-spacelocations` | EPIC-008 | See `openspec/CHANGE-STATUS.md` |
| `BACK/BACK-TESTING.md` | placed | 📌 `placed` | 0 | `back-testing` | — | See `openspec/CHANGE-STATUS.md` |
| `CICD/01.COVERAGE-SONAR.md` | placed | 📌 `placed` | 0 | `cicd-coverage-sonar` | — | See `openspec/CHANGE-STATUS.md` |
| `CICD/02.TESTING-GATES.md` | placed | 📌 `placed` | 0 | `cicd-testing-gates` | — | See `openspec/CHANGE-STATUS.md` |
| `DOMAIN/01.NEOCOM-DOMAIN.md` | placed | 📌 `placed` | 0 | `domain-module` | — | See `openspec/CHANGE-STATUS.md` |
| `DOMAIN/02.PILOT.md` | placed | 📌 `placed` | 0 | `domain-pilot` | EPIC-004 | See `openspec/CHANGE-STATUS.md` |
| `DOMAIN/03.BLUEPRINT.md` | placed | 📌 `placed` | 0 | `domain-blueprint` | EPIC-004 | See `openspec/CHANGE-STATUS.md` |
| `DOMAIN/04.APPLICATION-INFO.md` | placed | 📌 `placed` | 0 | `domain-application-info` | EPIC-004 | See `openspec/CHANGE-STATUS.md` |
| `DOMAIN/05.SERVER-STATUS.md` | placed | 📌 `placed` | 0 | `domain-server-status` | EPIC-004 | See `openspec/CHANGE-STATUS.md` |
| `DOMAIN/06.LOCATIONS.md` | placed | 📌 `placed` | 0 | `domain-locations` | EPIC-008 | See `openspec/CHANGE-STATUS.md` |
| `DOMAIN/07.SPACELOCATION-V1.md` | placed | 📌 `placed` | 0 | `domain-spacelocation` | EPIC-004 | See `openspec/CHANGE-STATUS.md` |
| `ESI/ESI-CLIENT.md` | placed | 📌 `placed` | 0 | `back-esi-client` (archived) / `esi-client` | — | See `openspec/CHANGE-STATUS.md` |
| `ESI/ESI-LOGIN.md` | placed | 📌 `placed` | 0 | `login` | — | See `openspec/CHANGE-STATUS.md` |
| `ESI/ESI-SPECS.md` | placed | 📌 `placed` | 0 | `esi-character-api` | — | See `openspec/CHANGE-STATUS.md` |
| `ESI/ESI-SSO.md` | placed | 📌 `placed` | 0 | `login` | — | See `openspec/CHANGE-STATUS.md` |
| `FRONT/02.UNIVERSE.md` | placed | 📌 `placed` | 0 | `front-universe` | — | See `openspec/CHANGE-STATUS.md` |
| `FRONT/03.APP-SHELL.md` | placed | 📌 `placed` | 0 | `front-app-shell` | — | See `openspec/CHANGE-STATUS.md` |
| `FRONT/04.DASHBOARD.md` | placed | 📌 `placed` | 0 | `front-dashboard-shell` | EPIC-006 | See `openspec/CHANGE-STATUS.md` |
| `FRONT/05.PILOT-PANEL.md` | placed | 📌 `placed` | 0 | `front-pilot-panel` | — | See `openspec/CHANGE-STATUS.md` |
| `FRONT/06.LOGIN.md` | placed | 📌 `placed` | 0 | `login` | — | See `openspec/CHANGE-STATUS.md` |
| `FRONT/07.ANGULAR-STRUCTURE.md` | placed | 📌 `placed` | 0 | `front-angular-structure` | — | See `openspec/CHANGE-STATUS.md` |
| `FRONT/08.NODE-RENDER.md` | placed | 📌 `placed` | 0 | `front-node-render` | — | See `openspec/CHANGE-STATUS.md` |
| `FRONT/09.ASYNC-SSE.md` | placed | 📌 `placed` | 0 | `front-async-sse` | — | See `openspec/CHANGE-STATUS.md` |
| `FRONT/10.BDD-CYPRESS.md` | placed | 📌 `placed` | 0 | `front-bdd-cypress` | — | See `openspec/CHANGE-STATUS.md` |
| `FRONT/11.MOCK-FIXTURES.md` | placed | 📌 `placed` | 0 | `front-mock-fixtures` | — | See `openspec/CHANGE-STATUS.md` |
| `INFRASTRUCTURE-SPECS.md` | placed | 📌 `placed` | 0 | `front-infrastructure` and infra rows (see file) | — | See `openspec/CHANGE-STATUS.md` |

## How to read progress

| You want… | Look at… |
| --- | --- |
| What still needs Spec Evolution | Rows with 📥 `inbox` |
| Whether an epic was extracted at all | `L1/TRACEABILITY.md` epic Highest / L2 delivery rows |
| OpenSpec apply / PR / archive | `openspec/CHANGE-STATUS.md` + `openspec/DELIVERY-INDEX.md` |
| L1 models still waiting human review | `L1/TRACEABILITY.md` ### Sections (`⏳ to review`) |

Rule of thumb: ⚪ `none` on TRACEABILITY → `/neo:extract-l2`; 📤 `extracted` + 📥 inbox here → `/neo:spec-evolution`; 📝+ → `CHANGE-STATUS.md`.
