# L1 epic → OpenSpec traceability

Authoritative central record of epic → sections → L2 → OpenSpec → delivery. Agents **skip** material already `applied` / `archived` on later extract/register. Each epic file also carries a `## Spec traceability` header that must stay in sync with this file’s epic section (Highest status, OpenSpec names, L2 paths).

Delivery SHAs / PR numbers are copied from [`openspec/DELIVERY-INDEX.md`](../../openspec/DELIVERY-INDEX.md) (owned by `/neocom-git`). Prefer that index and graphify over live GitHub.

Companions: `sources/L2/INDEX.md` (L2 backlog), `openspec/CHANGE-STATUS.md` (OpenSpec programme status), `openspec/DELIVERY-INDEX.md` (commits/PRs). `SPEC-EPIC-INDEX.md` is **deprecated** (do not update).

Last refreshed: 2026-11-04 (EPIC-011 `/neo:spec-evolution`).

## Table of contents

| Epic file | Id | Highest |
| --- | --- | --- |
| [`01.EPIC-LOGIN-PROCEDURE.md`](#01epic-login-proceduremd) | EPIC-001 | ✅ `applied` |
| [`02.EPIC-ANGULAR-CODIFICATION.md`](#02epic-angular-codificationmd) | EPIC-002 | ✅ `applied` |
| [`03.EPIC-TESTING.md`](#03epic-testingmd) | EPIC-003 | 📝 `registered` |
| [`04.EPIC-MODELS.md`](#04epic-modelsmd) | EPIC-004 | ✅ `applied` |
| [`05.EPIC-ESI-UNIVERSE.md`](#05epic-esi-universemd) | EPIC-005 | ⚪ `none` |
| [`06.EPIC-USER-INTERFACE.md`](#06epic-user-interfacemd) | EPIC-006 | 🚧 `applying` |
| [`07.EPIC-NEOCOM-API.md`](#07epic-neocom-apimd) | EPIC-007 | ⚪ `none` |
| [`08.EPIC-LOCATIONS.md`](#08epic-locationsmd) | EPIC-008 | 📤 `extracted` |
| [`09.EPIC-BACKEND-SERVICES.md`](#09epic-backend-servicesmd) | EPIC-009 | ✅ `applied` |
| [`10.EPIC-INDUSTRY-BLUEPRINTS.md`](#10epic-industry-blueprintsmd) | EPIC-010 | 🚧 `applying` |
| [`11.EPIC-BLUEPRINT-LIST-PROCESSING.md`](#11epic-blueprint-list-processingmd) | EPIC-011 | 🔨 `applying` |

Also: [How to read](#how-to-read) · [How agents update this file](#how-agents-update-this-file)

## How to read

Each epic is a section headed with the L1 filename (for example `## \`01.EPIC-LOGIN-PROCEDURE.md\``) containing:

1. **Sections** — L1 register / requirement slices and their status (Review gate and/or pipeline).
2. **L2 delivery** — keyed by **L2 file** (OpenSpec + commit/PR evidence).

| Column (Sections) | Meaning |
| --- | --- |
| **Section** | L1 section id or heading slice |
| **Item** | Register row / requirement group under that section |
| **Status** | ⏳ `to review` · 👀 `reviewed` · 📤 `extracted` · 📝 `registered` · 🔨 `applying` · ✅ `applied` · 📦 `archived` · 🚫 `out of scope` · ⚪ `none` · 🔁 `duplicated` |

| Column (L2 delivery) | Meaning |
| --- | --- |
| **L2 file** | Key under `sources/L2/` |
| **OpenSpec status** | Highest pipeline status for change(s) on that L2 row |
| **OpenSpec changes** | Change id(s), task `N/N`, validation tip when `applied` |
| **Delivery** | From DELIVERY-INDEX: `owner/repo#N` when known, else `repo@sha`, else `—` |
| **Last updated** | Date of last index edit for this slice |

Pipeline: `none` → `extracted` → `registered` → `applying` → `applied` → `archived`.

### Develop tips (reference)

| Repo | Develop tip | PR note |
| --- | --- | --- |
| `neocom-back` | `3317849` | **PR `#4`** (industry / async / spacelocations / openapi) |
| `neocom-front` | `e3356db` | tip commit (no PR id in index for some stacks) |
| `neocom-domain` | `477ee33` | tip commit |


## `01.EPIC-LOGIN-PROCEDURE.md`

Epic id: EPIC-001 · Highest: ✅ `applied` · Last updated: 2026-11-03

### Sections

| Section | Item | Status |
| --- | --- | --- |
| Login flow | SSO / Authorization Code procedure | ✅ `applied` (`login`) |
| Development registration | Dev app registration + callback | ✅ `applied` (`login`) |
| Environment | Front/back env for SSO | ✅ `applied` (`login`); related `nestjs-sso-config` 📝 `registered` |
| Proposed solution | Token storage / refresh on back | ✅ `applied` (`login`) |
| State flow | Auth state machine | ✅ `applied` (`login`) |
| How the code follows the states | Implementation mapping | ✅ `applied` (`login`) |
| Login page | Front login UI | ✅ `applied` (`login`) |
| Login progress | Progress / callback UX | ✅ `applied` (`login`) |

### L2 delivery

| L2 file | OpenSpec status | OpenSpec changes | Delivery | Last updated |
| --- | --- | --- | --- | --- |
| `FRONT/06.LOGIN.md` | ✅ `applied` | `login` (13/13, validated front `@ e3356db` / back `@ 3317849`) | `neocom-front@e3356db`; `neocom-back@3317849` (SSO on develop; no distinct login PR id in local history) | 2026-11-03 |
| `BACK/BACK-LOGIN.md` | ✅ `applied` | `login` (13/13, validated back `@ 3317849`) | `neocom-back@3317849` | 2026-11-03 |
| `ESI/ESI-LOGIN.md` | ✅ `applied` | `login` (13/13) — esi/login capability | covered by front/back develop tips above | 2026-11-03 |
| `ESI/ESI-SSO.md` | ✅ `applied` | `login` (13/13) — esi/sso capability | covered by front/back develop tips above | 2026-11-03 |
| *(related, not extracted under this epic alone)* | 📝 `registered` | `nestjs-sso-config` (0/2) | — | 2026-11-03 |

Legacy path note: `L2/01.EPIC-LOGIN-PROCEDURE/` cleared; placed files above are the live L2 keys.

---

## `02.EPIC-ANGULAR-CODIFICATION.md`

Epic id: EPIC-002 · Highest: ✅ `applied` · Last updated: 2026-11-03

### Sections

| Section | Item | Status |
| --- | --- | --- |
| Division / structure | Pages, panels, section modules | ✅ `applied` (`front-angular-structure`) |
| Node | Node MVC, render registry, viewer | ✅ `applied` (`front-node-render`) |
| Synchronous processing / asynchronous rendering | Front async SSE + adapter cache | ✅ `applied` (`front-async-sse`) |
| Async infra (extract `.async-infra`) | Persistence / Redis companion | ✅ `applied` (`infra-async-persistence`, `back-async-sse`) |
| Related — pilot panel | `v1-pilot-panel` / HEADER variants | ✅ `applied` (`front-pilot-panel`) |
| Related — pilot definition | NeoCom pilot nodes | ✅ `applied` (`front-pilot`) |
| Related — app shell | Canvas chrome | 📝 `registered` (`front-app-shell` 0/3) |
| Related — dashboard | Dashboard feature | 📝 `registered` (`front-dashboard-shell` 0/6) |
| Related — infrastructure | Toolchain / WireMock | ✅ `applied` (`front-infrastructure`) |

### L2 delivery

| L2 file | OpenSpec status | OpenSpec changes | Delivery | Last updated |
| --- | --- | --- | --- | --- |
| `02.EPIC-ANGULAR-CODIFICATION.structure.md` | ✅ `applied` | `front-angular-structure` (7/7, validated front `@ e3356db`) | `neocom-front@e3356db` | 2026-11-03 |
| `FRONT/07.ANGULAR-STRUCTURE.md` | ✅ `applied` | `front-angular-structure` (7/7, validated front `@ e3356db`) | `neocom-front@e3356db` | 2026-11-03 |
| `02.EPIC-ANGULAR-CODIFICATION.nodes.md` | ✅ `applied` | `front-node-render` (7/7, validated front `@ e3356db`) | `neocom-front@e3356db` | 2026-11-03 |
| `FRONT/08.NODE-RENDER.md` | ✅ `applied` | `front-node-render` (7/7, validated front `@ e3356db`) | `neocom-front@e3356db` | 2026-11-03 |
| `02.EPIC-ANGULAR-CODIFICATION.async-sse.md` | ✅ `applied` | `front-async-sse` (7/7, validated front `@ e3356db`); `back-async-sse` (7/7, validated back `@ 3317849`) | `neocom-front@e3356db`; `AdamAntinoo/neocom-back#4` → `@ 3317849` | 2026-11-03 |
| `FRONT/09.ASYNC-SSE.md` | ✅ `applied` | `front-async-sse` (7/7, validated front `@ e3356db`) | `neocom-front@e3356db` | 2026-11-03 |
| `BACK/BACK-ASYNC-SSE.md` | ✅ `applied` | `back-async-sse` (7/7, validated back `@ 3317849`) | `AdamAntinoo/neocom-back#4` → `@ 3317849` | 2026-11-03 |
| `02.EPIC-ANGULAR-CODIFICATION.async-infra.md` | ✅ `applied` | `infra-async-persistence` (4/4); `back-async-sse` (7/7); `front-async-sse` (7/7) | meta `tools/infra` + `AdamAntinoo/neocom-back#4` → `@ 3317849`; front `@ e3356db` | 2026-11-03 |
| `INFRASTRUCTURE-SPECS.md` (§H async) | ✅ `applied` | `infra-async-persistence` (4/4); also hosts `front-infrastructure` (8/8) | `neocom-front@e3356db` (WireMock); back docker via `#4` → `@ 3317849` | 2026-11-03 |
| `FRONT/05.PILOT-PANEL.md` | ✅ `applied` | `front-pilot-panel` (4/4, validated front `@ e3356db`) | `neocom-front@e3356db` | 2026-11-03 |
| `FRONT/01.PILOT-DEFINITION.md` | ✅ `applied` | `front-pilot` (5/5, validated front `@ e3356db`) — 🔗 pointer | `neocom-front@e3356db` | 2026-11-03 |
| `FRONT/03.APP-SHELL.md` | 📝 `registered` | `front-app-shell` (0/3) | — | 2026-10-17 |
| `FRONT/04.DASHBOARD.md` | 📝 `registered` | `front-dashboard-shell` (0/6) | — | 2026-10-17 |

---

## `03.EPIC-TESTING.md`

Epic id: EPIC-003 · Highest: 📝 `registered` · Last updated: 2026-10-17

### Sections

| Section | Item | Status |
| --- | --- | --- |
| Cypress UI and content validation | BDD / Cypress | 📝 `registered` (`front-bdd-cypress` 0/4) |
| Mock data from real runs | Fixtures | 📝 `registered` (`front-mock-fixtures` 0/4) |
| Coverage control and quality gates | Sonar / coverage | 📝 `registered` (`cicd-coverage-sonar` 0/5) |
| CI/CD test jobs and Sonar gate order | Testing gates | 📝 `registered` (`cicd-testing-gates` 0/3) |
| Testing command catalog | Shared TDD/BDD/SDD commands | 📝 `registered` (`infra-test-commands` 0/5) |
| Backend testing | Back guidelines / WireMock / Gherkin | 📝 `registered` (`back-testing` 0/5) |

### L2 delivery

| L2 file | OpenSpec status | OpenSpec changes | Delivery | Last updated |
| --- | --- | --- | --- | --- |
| `03.EPIC-TESTING.bdd-cypress.md` | 📝 `registered` | `front-bdd-cypress` (0/4) | — | 2026-10-17 |
| `FRONT/10.BDD-CYPRESS.md` | 📝 `registered` | `front-bdd-cypress` (0/4) | — | 2026-10-17 |
| `03.EPIC-TESTING.mock-fixtures.md` | 📝 `registered` | `front-mock-fixtures` (0/4) | — | 2026-10-17 |
| `FRONT/11.MOCK-FIXTURES.md` | 📝 `registered` | `front-mock-fixtures` (0/4) | — | 2026-10-17 |
| `03.EPIC-TESTING.coverage-sonar.md` | 📝 `registered` | `cicd-coverage-sonar` (0/5) | — | 2026-10-17 |
| `CICD/01.COVERAGE-SONAR.md` | 📝 `registered` | `cicd-coverage-sonar` (0/5) | — | 2026-10-17 |
| `03.EPIC-TESTING.cicd-gates.md` | 📝 `registered` | `cicd-testing-gates` (0/3) | — | 2026-10-17 |
| `CICD/02.TESTING-GATES.md` | 📝 `registered` | `cicd-testing-gates` (0/3) | — | 2026-10-17 |
| `03.EPIC-TESTING.command-catalog.md` | 📝 `registered` | `infra-test-commands` (0/5) | — | 2026-10-17 |
| `INFRASTRUCTURE-SPECS.md` (§I test commands) | 📝 `registered` | `infra-test-commands` (0/5) | — | 2026-10-17 |
| `03.EPIC-TESTING.backend-testing.md` | 📝 `registered` | `back-testing` (0/5) | — | 2026-10-17 |
| `BACK/BACK-TESTING.md` | 📝 `registered` | `back-testing` (0/5) | — | 2026-10-17 |

---

## `04.EPIC-MODELS.md`

Epic id: EPIC-004 · Highest: ✅ `applied` · Last updated: 2026-11-03 (leftover `[x]` → 🔁 duplicates)

### Sections

| Section | Item | Status |
| --- | --- | --- |
| 03 | PricedItemV1 | ⏳ `to review` |
| 04 | EveLocationV1 | ⏳ `to review` |
| 05 | EveAssetV1 | ⏳ `to review` |
| 06 | PublicPilotV1 | ✅ `applied` |
| 07 | PilotV2 | ✅ `applied` |
| 08 | ShipV1 | ⏳ `to review` |
| 09 | PilotShipV1 | ⏳ `to review` |
| 10 | BlueprintV1 | ✅ `applied` (IND-BP-000 🔁 `duplicated` → [00.DUPLICATES](./00.DUPLICATES.md) / DOM-BP-001) |
| 11 | ProcessedBlueprintSummaryV1 | ⏳ `to review` |
| 12 | ProcessedBlueprintV1 | ⏳ `to review` |
| 12 | ResourceV1 | ⏳ `to review` |
| 13 | IndustryResourceV1 | ⏳ `to review` |
| 14 | BOMResourceV1 | ⏳ `to review` |
| 15 | BuildActionDtoV1 | ⏳ `to review` |
| 16 | BOMGroupV1 | ⏳ `to review` |
| 18 | ApplicationInfoV1 | ✅ `applied` |
| 19 | ServerStatusV1 | ✅ `applied` (SRV-001/004 🔁 `duplicated`; field/render contract **superseded** → EPIC-006 UI-SSP / SRV-005…006 `to review`) |
| 20 | SpaceLocationV1 | ✅ `applied` |
| 21 | neocom-domain deploy | ⏳ `to review` |
| 22 | `jsonClass` interchange | ✅ `applied` (DOM-JSONCLASS-001…003 🔁 `duplicated` → [00.DUPLICATES](./00.DUPLICATES.md)) |
| — | EveItem / ESI type mirrors | 🚫 `out of scope` |
| — | ESI corp / alliance / race | 🚫 `out of scope` |

### L2 delivery

| L2 file | OpenSpec status | OpenSpec changes | Delivery | Last updated |
| --- | --- | --- | --- | --- |
| `04.EPIC-MODELS.md` | ✅ `applied` | cleared epic extract; `domain-jsonclass` (+ prior domain-*) | domain `@ 477ee33` | 2026-11-03 |
| `DOMAIN/02.PILOT.md` | ✅ `applied` | `domain-pilot` (5/5, validated domain `@ 477ee33`); consumer `front-pilot` (5/5, front `@ e3356db`) | `neocom-domain@477ee33`; `neocom-front@e3356db` | 2026-11-03 |
| `DOMAIN/03.BLUEPRINT.md` | ✅ `applied` | `domain-blueprint` (2/2, validated domain `@ 477ee33`) | `neocom-domain@477ee33` | 2026-11-03 |
| `DOMAIN/04.APPLICATION-INFO.md` | ✅ `applied` | `domain-application-info` (3/3, validated domain `@ 477ee33`) | `neocom-domain@477ee33` | 2026-11-03 |
| `DOMAIN/05.SERVER-STATUS.md` | ✅ `applied` | `domain-server-status` (2/2, validated domain `@ 477ee33`) | `neocom-domain@477ee33` | 2026-11-03 |
| `DOMAIN/07.SPACELOCATION-V1.md` | ✅ `applied` | `domain-spacelocation` (3/3, validated domain `@ 477ee33`) | `neocom-domain@477ee33` | 2026-11-03 |
| `DOMAIN/08.JSONCLASS.md` | ✅ `applied` | `domain-jsonclass` (3/3, validated domain `@ 477ee33` / front `@ e3356db` / back `@ 3317849`) | `neocom-domain@477ee33`; `neocom-front@e3356db`; `AdamAntinoo/neocom-back#4` → `@ 3317849` | 2026-11-03 |
| `FRONT/01.PILOT-DEFINITION.md` | ✅ `applied` | `front-pilot` (5/5) — pointer into domain pilot | `neocom-front@e3356db` | 2026-11-03 |

---

## `05.EPIC-ESI-UNIVERSE.md`

Epic id: EPIC-005 · Highest: ⚪ `none` · Last updated: 2026-10-19

### Sections

| Section | Item | Status |
| --- | --- | --- |
| — | (no Review register extracted yet; SDE / universe notes stay on L1) | ⚪ `none` |

### L2 delivery

| L2 file | OpenSpec status | OpenSpec changes | Delivery | Last updated |
| --- | --- | --- | --- | --- |
| — (no L2 extract) | ⚪ `none` | — | — | 2026-10-19 |

---

## `06.EPIC-USER-INTERFACE.md`

Epic id: EPIC-006 · Highest: 🚧 `applying` · Last updated: 2026-11-03 (spec-evolution DEF-IB amend) · L1: [`06.EPIC-USER-INTERFACE.md`](./06.EPIC-USER-INTERFACE.md)

### Sections

| Section | Item | Status |
| --- | --- | --- |
| [Page register](./06.EPIC-USER-INTERFACE.md#page-register) | Dashboard | 🔁 `duplicated` → [UI-DASH-001](../L2/FRONT/04.DASHBOARD.md) · [00.DUPLICATES](./00.DUPLICATES.md) |
| [Page register](./06.EPIC-USER-INTERFACE.md#page-register) | Feature dashboard | 🔁 `duplicated` → [UI-DASH-013](../L2/FRONT/04.DASHBOARD.md) · [00.DUPLICATES](./00.DUPLICATES.md) |
| [Page register](./06.EPIC-USER-INTERFACE.md#page-register) | Authentication pages | imported (not extractable) |
| [Page geometry](./06.EPIC-USER-INTERFACE.md#page-geometry-shared-styles) | UI-GEO-001 | 📝 `registered` → [`front-dashboard-shell`](../../openspec/changes/front-dashboard-shell/) · [FRONT/12](../L2/FRONT/12.PAGE-HEADER.md) (DEF-IB-006 token) |
| [Versioned panels](./06.EPIC-USER-INTERFACE.md#versioned-panels-and-renders-vn-) | UI-VER-001…004 | 📝 `registered` → [`front-dashboard-shell`](../../openspec/changes/front-dashboard-shell/) · [FRONT/12](../L2/FRONT/12.PAGE-HEADER.md) |
| [Media (EVE Image Server)](./06.EPIC-USER-INTERFACE.md#media-from-the-eve-image-server) | UI-MED-001…008 | 📝 `registered` → [`front-dashboard-shell`](../../openspec/changes/front-dashboard-shell/) · [FRONT/18](../L2/FRONT/18.EVE-MEDIA.md) |
| [Common header](./06.EPIC-USER-INTERFACE.md#common-header-element-app-page-header) | UI-HDR-001…011 | 📝 `registered` → [`front-dashboard-shell`](../../openspec/changes/front-dashboard-shell/) · [FRONT/12](../L2/FRONT/12.PAGE-HEADER.md) |
| [Application info panel](./06.EPIC-USER-INTERFACE.md#application-info-panel-v1-application-info-render) | UI-AIP-001…006 | 📝 `registered` → [`front-dashboard-shell`](../../openspec/changes/front-dashboard-shell/) · [FRONT/12](../L2/FRONT/12.PAGE-HEADER.md) |
| [Server status panel](./06.EPIC-USER-INTERFACE.md#server-status-panel-v1-server-status-render) | UI-SSP-001…007 | 📝 `registered` → [`front-dashboard-shell`](../../openspec/changes/front-dashboard-shell/) · [FRONT/12](../L2/FRONT/12.PAGE-HEADER.md) |
| [Corporation panel](./06.EPIC-USER-INTERFACE.md#corporation-panel-v1-corporation-render) | UI-CORP-001…013 | 📝 `registered` → [`front-dashboard-shell`](../../openspec/changes/front-dashboard-shell/) · [FRONT/19](../L2/FRONT/19.CORPORATION.md) |
| [Dashboard](./06.EPIC-USER-INTERFACE.md#dashboard-landing-page) | UI-DASH-001…005, 007…010, 012…015 | 📝 `registered` → [`front-dashboard-shell`](../../openspec/changes/front-dashboard-shell/) · [FRONT/04](../L2/FRONT/04.DASHBOARD.md) |
| [Dashboard requirements](./06.EPIC-USER-INTERFACE.md#dashboard-requirements) | UI-DASH-006, 011 | ⏳ `[ ] to review` |
| [Character selection](./06.EPIC-USER-INTERFACE.md#character-selection-login-006--ui) | UI-CHAR-002 | 📝 `registered` → [`front-dashboard-shell`](../../openspec/changes/front-dashboard-shell/) · [FRONT/20](../L2/FRONT/20.CHARACTER-SELECTION.md) |

### L2 delivery

| L2 file | OpenSpec status | OpenSpec changes | Delivery | Last updated |
| --- | --- | --- | --- | --- |
| [`06.EPIC-USER-INTERFACE.header.md`](../L2/06.EPIC-USER-INTERFACE.header.md) | 📭 `cleared` | [`front-dashboard-shell`](../../openspec/changes/front-dashboard-shell/) | — | 2026-11-03 |
| [`06.EPIC-USER-INTERFACE.dashboard.md`](../L2/06.EPIC-USER-INTERFACE.dashboard.md) | 📭 `cleared` | [`front-dashboard-shell`](../../openspec/changes/front-dashboard-shell/) | — | 2026-11-03 |
| [`06.EPIC-USER-INTERFACE.media.md`](../L2/06.EPIC-USER-INTERFACE.media.md) | 📭 `cleared` | [`front-dashboard-shell`](../../openspec/changes/front-dashboard-shell/) | — | 2026-11-03 |
| [`06.EPIC-USER-INTERFACE.corporation.md`](../L2/06.EPIC-USER-INTERFACE.corporation.md) | 📭 `cleared` | [`front-dashboard-shell`](../../openspec/changes/front-dashboard-shell/) | — | 2026-11-03 |
| [`06.EPIC-USER-INTERFACE.character.md`](../L2/06.EPIC-USER-INTERFACE.character.md) | 📭 `cleared` | [`front-dashboard-shell`](../../openspec/changes/front-dashboard-shell/) | — | 2026-11-03 |
| [`FRONT/12.PAGE-HEADER.md`](../L2/FRONT/12.PAGE-HEADER.md) | 🚧 `applying` | [`front-dashboard-shell`](../../openspec/changes/front-dashboard-shell/) (17/17) | `neocom-front@1be24de` (`feature/dashboard-shell`) | 2026-11-03 |
| [`FRONT/04.DASHBOARD.md`](../L2/FRONT/04.DASHBOARD.md) | 🚧 `applying` | [`front-dashboard-shell`](../../openspec/changes/front-dashboard-shell/) (17/17) | `neocom-front@1be24de` (`feature/dashboard-shell`) | 2026-11-03 |
| [`FRONT/18.EVE-MEDIA.md`](../L2/FRONT/18.EVE-MEDIA.md) | 🚧 `applying` | [`front-dashboard-shell`](../../openspec/changes/front-dashboard-shell/) (17/17) | `neocom-front@1be24de` (`feature/dashboard-shell`) | 2026-11-03 |
| [`FRONT/19.CORPORATION.md`](../L2/FRONT/19.CORPORATION.md) | 🚧 `applying` | [`front-dashboard-shell`](../../openspec/changes/front-dashboard-shell/) (17/17) | `neocom-front@1be24de` (`feature/dashboard-shell`) | 2026-11-03 |
| [`FRONT/20.CHARACTER-SELECTION.md`](../L2/FRONT/20.CHARACTER-SELECTION.md) | 🚧 `applying` | [`front-dashboard-shell`](../../openspec/changes/front-dashboard-shell/) (17/17) | `neocom-front@1be24de` (`feature/dashboard-shell`) | 2026-11-03 |

---

## `07.EPIC-NEOCOM-API.md`

Epic id: EPIC-007 · Highest: ⚪ `none` (flows Review-gated; related back work under other epics) · Last updated: 2026-10-19

### Sections

| Section | Item | Status |
| --- | --- | --- |
| API flows | Flow 06 — GET industry blueprints (async) | 👀 `reviewed` |
| API flows | Flow 07 — GET industry blueprints SSE | 👀 `reviewed` |

### L2 delivery

| L2 file | OpenSpec status | OpenSpec changes | Delivery | Last updated |
| --- | --- | --- | --- | --- |
| — (no L2 extract under this epic) | ⚪ `none` | related manufacture SSE delivered via `back-async-sse` on EPIC-002 / `#4` | see `02` / `BACK/BACK-ASYNC-SSE.md` | 2026-10-19 |

---

## `08.EPIC-LOCATIONS.md`

Epic id: EPIC-008 · Highest: 🔧 `applying` · Last updated: 2026-11-04

### Sections

| Section | Item | Status |
| --- | --- | --- |
| 01 | LOC-001 location kind | 📤 `extracted` (delivered via `domain-locations` / `back-spacelocations` ✅) |
| 01 | LOC-002 ancestor place | 📤 `extracted` (delivered ✅) |
| 01 | LOC-003 planets/ships/holds | 🚫 `out of scope` |
| 03 | SpaceLocation (LOC-010) | 📤 `extracted` → ✅ via OpenSpec on develop |
| 03 | LOC-011 callers use SpaceLocation | 🚫 `out of scope` |
| 04 | Region (LOC-020) | 📤 `extracted` → ✅ via OpenSpec on develop |
| 05 | Constellation (LOC-030) | 📤 `extracted` → ✅ via OpenSpec on develop |
| 06 | Solar system (LOC-040) | 📤 `extracted` → ✅ via OpenSpec on develop |
| 07 | Station (LOC-050, LOC-051) | 📤 `extracted` → ✅ via OpenSpec on develop |
| 08 | Structure (LOC-060) | 📤 `extracted` → ✅ via OpenSpec on develop |
| 09 | LocationAssetContainer | 🚫 `out of scope` |
| 10 | ShippingYardLocation | 🚫 `out of scope` |
| 11 | LookupRegion (LOC-090) | ⏳ `to review` |
| 12 | LookupSolarSystem (LOC-100) | ⏳ `to review` |
| 13 | KnownSystem (LOC-110) | 📝 `registered` → `front-known-system` |
| 14 | Front stubs (LOC-120, LOC-121) | 🚫 `out of scope` |
| 15 | Space location service LOC-130…142 (BACK-229) | 🔧 `applying` → `back-space-location-service` 8/8 |
| 15 | Space location service register row | ⏳ `to review` |

### L2 delivery

| L2 file | OpenSpec status | OpenSpec changes | Delivery | Last updated |
| --- | --- | --- | --- | --- |
| `08.EPIC-LOCATIONS.md` | 📭 `cleared` | `front-known-system` (LOC-110); prior `domain-locations`, `back-spacelocations` | — | 2026-11-04 |
| `08.EPIC-LOCATIONS.space-location-service.md` | 📭 `cleared` | `back-space-location-service` (LOC-130…142) applying | — | 2026-11-04 |
| `FRONT/22.KNOWN-SYSTEM.md` | 📝 `registered` | `front-known-system` | — | 2026-11-04 |
| `BACK/BACK-SPACE-LOCATION-SERVICE.md` | 🔧 `applying` | `back-space-location-service` 8/8 | — (uncommitted on `feature/space-location-service`) | 2026-11-04 |
| `DOMAIN/06.LOCATIONS.md` | ✅ `applied` | `domain-locations` (3/3, validated domain `@ 477ee33`) | `neocom-domain@477ee33` | 2026-11-03 |
| `BACK/BACK-SPACELOCATIONS.md` | ✅ `applied` | `back-spacelocations` (2/2, validated back `@ 3317849`) | `AdamAntinoo/neocom-back#4` → `@ 3317849` | 2026-11-03 |

---

## `09.EPIC-BACKEND-SERVICES.md`

Epic id: EPIC-009 · Highest: ✅ `applied` · Last updated: 2026-11-03

### Sections

| Section | Item | Status |
| --- | --- | --- |
| 01–02 | BACK-SVC-001…004, 010…013 (layout / Record / V1) | 📤 `extracted` → ✅ `applied` (`domain-layout`) |
| 03–04 | BACK-SVC-020…022, 030…032 (ports) | 📤 `extracted` → ✅ `applied` (`domain-ports`) |
| 05–06 | BACK-SVC-040…042, 050…052 (deprecations) | 📤 `extracted` → ✅ `applied` (`domain-deprecations`) |
| 07 | BACK-SVC-060…063 (OpenAPI) | 📤 `extracted` → ✅ `applied` (`back-openapi`) |
| 08 | BACK-SVC-070…072 (industry blueprints API) | 📤 `extracted` → ✅ `applied` (`back-industry-blueprints`) |

### L2 delivery

| L2 file | OpenSpec status | OpenSpec changes | Delivery | Last updated |
| --- | --- | --- | --- | --- |
| `09.EPIC-BACKEND-SERVICES.md` | ✅ `applied` | cleared epic extract | see placed rows | 2026-11-03 |
| `DOMAIN/09.LAYOUT.md` | ✅ `applied` | `domain-layout` (2/2, validated domain `@ 477ee33`) | `neocom-domain@477ee33` | 2026-11-03 |
| `DOMAIN/10.PORTS.md` | ✅ `applied` | `domain-ports` (2/2, validated domain `@ 477ee33`) | `neocom-domain@477ee33` | 2026-11-03 |
| `DOMAIN/11.DEPRECATIONS.md` | ✅ `applied` | `domain-deprecations` (2/2, validated domain `@ 477ee33`) | `neocom-domain@477ee33` | 2026-11-03 |
| `BACK/BACK-OPENAPI.md` | ✅ `applied` | `back-openapi` (3/3, validated back `@ 3317849`) | `AdamAntinoo/neocom-back#4` → `@ 3317849` | 2026-11-03 |
| `BACK/BACK-INDUSTRY-BLUEPRINTS.md` | ✅ `applied` | `back-industry-blueprints` (2/2, validated back `@ 3317849`) | `AdamAntinoo/neocom-back#4` → `@ 3317849` | 2026-11-03 |

---

## `10.EPIC-INDUSTRY-BLUEPRINTS.md`

Epic id: EPIC-010 · Highest: 🚧 `applying` · Last updated: 2026-11-03 · L1: [`10.EPIC-INDUSTRY-BLUEPRINTS.md`](./10.EPIC-INDUSTRY-BLUEPRINTS.md)

### Sections

| Section | Item | Status |
| --- | --- | --- |
| [01](./10.EPIC-INDUSTRY-BLUEPRINTS.md#section-01--spec-model-strip-page) | IND-BP-001…007 (model-strip page) | 📝 `registered` → [`front-industry-blueprints`](../../openspec/changes/front-industry-blueprints/) · [FRONT/13](../L2/FRONT/13.MODEL-STRIP.md) |
| [02](./10.EPIC-INDUSTRY-BLUEPRINTS.md#section-02--spec-featurev1-display-element) | IND-BP-010…012 (FeatureV1 / `v1-feature-button`) | 📝 `registered` → [`front-industry-blueprints`](../../openspec/changes/front-industry-blueprints/) · [FRONT/15](../L2/FRONT/15.FEATURE-BUTTON.md) |
| [03](./10.EPIC-INDUSTRY-BLUEPRINTS.md#section-03--dashboard-feature-panel-procedural-population) | IND-BP-020…023 (Feature panel population) | 📝 `registered` → [`front-industry-blueprints`](../../openspec/changes/front-industry-blueprints/) · [FRONT/15](../L2/FRONT/15.FEATURE-BUTTON.md) |
| [04](./10.EPIC-INDUSTRY-BLUEPRINTS.md#section-04--spec-v1-blueprint-by-location-page) | IND-BP-030…036 (v1-blueprint-by-location page) | 📝 `registered` → [`front-industry-blueprints`](../../openspec/changes/front-industry-blueprints/) · [FRONT/16](../L2/FRONT/16.BLUEPRINT-BY-LOCATION.md) |
| [05](./10.EPIC-INDUSTRY-BLUEPRINTS.md#section-05--spec-v1-region-render) | IND-BP-060…063, 070…072 (v1-region render) | 📝 `registered` → [`front-industry-blueprints`](../../openspec/changes/front-industry-blueprints/) · [FRONT/16](../L2/FRONT/16.BLUEPRINT-BY-LOCATION.md) |
| [06](./10.EPIC-INDUSTRY-BLUEPRINTS.md#section-06--spec-color-table-support-page) | IND-BP-040…042 (color-table support page) | 📝 `registered` → [`front-industry-blueprints`](../../openspec/changes/front-industry-blueprints/) · [FRONT/14](../L2/FRONT/14.COLOR-TABLE.md) |
| [07](./10.EPIC-INDUSTRY-BLUEPRINTS.md#section-07--spec-shared-ui-definitions) | IND-BP-080…083, 088 (shared UI) | 📝 `registered` → [`front-industry-blueprints`](../../openspec/changes/front-industry-blueprints/) · [FRONT/17](../L2/FRONT/17.SHARED-UI.md) |
| [07](./10.EPIC-INDUSTRY-BLUEPRINTS.md#expandable-items) | IND-BP-084…087 (expand/collaborate) | 🔁 `duplicated` → [NODE-003](../L2/FRONT/08.NODE-RENDER.md) · [00.DUPLICATES](./00.DUPLICATES.md) |
| [08](./10.EPIC-INDUSTRY-BLUEPRINTS.md#section-08--spec-v1-blueprint-render) | IND-BP-090…095 (v1-blueprint render) | 📝 `registered` → [`front-industry-blueprints`](../../openspec/changes/front-industry-blueprints/) · [FRONT/16](../L2/FRONT/16.BLUEPRINT-BY-LOCATION.md) |
| [09](./10.EPIC-INDUSTRY-BLUEPRINTS.md#section-09--spec-v1-system-render) | IND-BP-100…105 (v1-system render) | 📝 `registered` → [`front-industry-blueprints`](../../openspec/changes/front-industry-blueprints/) · [FRONT/16](../L2/FRONT/16.BLUEPRINT-BY-LOCATION.md) |
| [10](./10.EPIC-INDUSTRY-BLUEPRINTS.md#section-10--spec-process-blueprints-into-the-location-hierarchy) | IND-BP-110…118 (hierarchy aggregation / SSE feed) | 📝 `registered` → [`front-industry-blueprints`](../../openspec/changes/front-industry-blueprints/) · [FRONT/16](../L2/FRONT/16.BLUEPRINT-BY-LOCATION.md) |

### L2 delivery

| L2 file | OpenSpec status | OpenSpec changes | Delivery | Last updated |
| --- | --- | --- | --- | --- |
| [`10.EPIC-INDUSTRY-BLUEPRINTS.md`](../L2/10.EPIC-INDUSTRY-BLUEPRINTS.md) | 📭 `cleared` | [`front-industry-blueprints`](../../openspec/changes/front-industry-blueprints/) | — | 2026-11-03 |
| [`FRONT/13.MODEL-STRIP.md`](../L2/FRONT/13.MODEL-STRIP.md) | 🚧 `applying` | [`front-industry-blueprints`](../../openspec/changes/front-industry-blueprints/) (17/17) | `neocom-front@c382959` (`feature/industry-blueprints`) | 2026-11-03 |
| [`FRONT/14.COLOR-TABLE.md`](../L2/FRONT/14.COLOR-TABLE.md) | 🚧 `applying` | [`front-industry-blueprints`](../../openspec/changes/front-industry-blueprints/) (17/17) | `neocom-front@c382959` (`feature/industry-blueprints`) | 2026-11-03 |
| [`FRONT/15.FEATURE-BUTTON.md`](../L2/FRONT/15.FEATURE-BUTTON.md) | 🚧 `applying` | [`front-industry-blueprints`](../../openspec/changes/front-industry-blueprints/) (17/17) | `neocom-front@c382959` (`feature/industry-blueprints`) | 2026-11-03 |
| [`FRONT/16.BLUEPRINT-BY-LOCATION.md`](../L2/FRONT/16.BLUEPRINT-BY-LOCATION.md) | 🚧 `applying` | [`front-industry-blueprints`](../../openspec/changes/front-industry-blueprints/) (17/17) | `neocom-front@c382959` (`feature/industry-blueprints`) | 2026-11-03 |
| [`FRONT/17.SHARED-UI.md`](../L2/FRONT/17.SHARED-UI.md) | 🚧 `applying` | [`front-industry-blueprints`](../../openspec/changes/front-industry-blueprints/) (17/17) | `neocom-front@c382959` (`feature/industry-blueprints`) | 2026-11-03 |

---

## `11.EPIC-BLUEPRINT-LIST-PROCESSING.md`

Epic id: EPIC-011 · Highest: 🔨 `applying` · Last updated: 2026-11-04 · L1: [`11.EPIC-BLUEPRINT-LIST-PROCESSING.md`](./11.EPIC-BLUEPRINT-LIST-PROCESSING.md)

### Sections

| Section | Item | Status |
| --- | --- | --- |
| [01](./11.EPIC-BLUEPRINT-LIST-PROCESSING.md#section-01--pilot-blueprint-feed-into-blueprint-by-location-panel) | BLP-001…003, 009…013, 024…025 | 🔨 `applying` → [`front-blueprint-list-processing`](../../openspec/changes/front-blueprint-list-processing/) · [FRONT/21](../L2/FRONT/21.BLUEPRINT-LIST-PROCESSING.md) |
| [02](./11.EPIC-BLUEPRINT-LIST-PROCESSING.md#section-02--aggregate-into-systems-and-regions-sort-and-node-render) | BLP-004…008 | 🔨 `applying` → [`front-blueprint-list-processing`](../../openspec/changes/front-blueprint-list-processing/) · [FRONT/21](../L2/FRONT/21.BLUEPRINT-LIST-PROCESSING.md) |
| [03](./11.EPIC-BLUEPRINT-LIST-PROCESSING.md#section-03--blueprint-location-catalog--spacelocationv1dto--spacelocationnodev1) | BLP-014…015, 018…020, 026…030 (back); BLP-016…017 (front) | 🔨 `applying` (back 8/8 · front `@ 8030666`) → [`back-blueprint-list-processing`](../../openspec/changes/back-blueprint-list-processing/) + [`front-blueprint-list-processing`](../../openspec/changes/front-blueprint-list-processing/) |
| [04](./11.EPIC-BLUEPRINT-LIST-PROCESSING.md#section-04--real-time-provider--panel-integration-design) | BLP-021…023 | 🔨 `applying` → [`front-blueprint-list-processing`](../../openspec/changes/front-blueprint-list-processing/) · [FRONT/21](../L2/FRONT/21.BLUEPRINT-LIST-PROCESSING.md) |

### L2 delivery

| L2 file | OpenSpec status | OpenSpec changes | Delivery | Last updated |
| --- | --- | --- | --- | --- |
| [`11.EPIC-BLUEPRINT-LIST-PROCESSING.md`](../L2/11.EPIC-BLUEPRINT-LIST-PROCESSING.md) | 📭 `cleared` | `front-blueprint-list-processing`, `back-blueprint-list-processing` | — | 2026-11-04 |
| [`FRONT/21.BLUEPRINT-LIST-PROCESSING.md`](../L2/FRONT/21.BLUEPRINT-LIST-PROCESSING.md) | 🔨 `applying` | [`front-blueprint-list-processing`](../../openspec/changes/front-blueprint-list-processing/) | — | 2026-11-05 |
| [`BACK/BACK-BLUEPRINT-LIST-PROCESSING.md`](../L2/BACK/BACK-BLUEPRINT-LIST-PROCESSING.md) | 🔨 `applying` | [`back-blueprint-list-processing`](../../openspec/changes/back-blueprint-list-processing/) | — | 2026-11-04 |

---

## How agents update this file

1. **`/epic`:** add a new `## \`NN.EPIC-NAME.md\`` section (Highest ⚪ `none`), empty Sections / L2 delivery placeholders, Last updated today; **refresh the Table of contents** row for that epic.
2. **`/neo:extract-l2`:** upsert **Sections** rows (Review → 📤 `extracted` or 🔁 `duplicated`); add/refresh **L2 delivery** rows for new epic extracts (status 📤 / OpenSpec `—` until registered); sync epic `## Spec traceability` and `L2/INDEX.md`. Do not update `SPEC-EPIC-INDEX.md`.
3. **`/neo:spec-evolution`:** set OpenSpec names on L2 delivery rows; status ≥ 📝 `registered`; clear pending / backlog via L2/INDEX; sync Spec traceability.
4. **Apply start (`/neocom-code`):** OpenSpec status 🔨 `applying` on affected L2 rows; Highest on epic section if that is the epic’s furthest status.
5. **PR merge → develop (`/neocom-git`):** OpenSpec → ✅ `applied`; fill **Delivery** from `DELIVERY-INDEX.md`; bump Last updated; sync Spec traceability Highest.
6. **Validate on develop:** keep Delivery / validation tips aligned with DELIVERY-INDEX Validated column.
7. **OpenSpec archive:** OpenSpec → 📦 `archived`; then source-archive eligible L2/L1 (§6.7) and point L2 paths at `archive/` in this file.
8. Do **not** invent a second dashboard. Sections + L2 delivery **are** the Review/pipeline records. Do not update deprecated `SPEC-EPIC-INDEX.md`.
9. Authored L1 sections stay as written. Only Review cells and `## Spec traceability` change on the epic file.
