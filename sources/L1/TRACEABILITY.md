# L1 epic → OpenSpec traceability

Authoritative central record of epic → **Sections** (Review / pipeline). Agents **skip** material already `applied` / `archived` on later `/epic:extract` runs. Each epic file also carries a `## Spec traceability` header that must stay in sync with this file’s epic section (Highest status, OpenSpec names).

Delivery SHAs / PR numbers live in [`openspec/DELIVERY-INDEX.md`](../../openspec/DELIVERY-INDEX.md) (owned by `/neocom-git`). Prefer that index and graphify over live GitHub.

Companions: `openspec/CHANGE-STATUS.md` (OpenSpec programme status), `openspec/DELIVERY-INDEX.md` (commits/PRs). **Removed (do not recreate):** `sources/L2/`, `SPEC-EPIC-INDEX.md`, and **`### L2 delivery`**.

Last refreshed: 2026-11-06 (`/git:release-done` Release-0.1.0 — 29 OpenSpec archived; L1 source-archive for fully covered epics).

## Table of contents

| Epic file | Id | Highest |
| --- | --- | --- |
| [`01.EPIC-LOGIN-PROCEDURE.md`](#01epic-login-proceduremd) | EPIC-001 | ✅ `applied` |
| [`02.EPIC-ANGULAR-CODIFICATION.md`](#02epic-angular-codificationmd) | EPIC-002 | ✅ `applied` |
| [`03.EPIC-TESTING.md`](#03epic-testingmd) | EPIC-003 | 📝 `registered` |
| [`04.EPIC-MODELS.md`](#04epic-modelsmd) | EPIC-004 | ✅ `applied` |
| [`05.EPIC-ESI-UNIVERSE.md`](#05epic-esi-universemd) | EPIC-005 | ⚪ `none` |
| [`06.EPIC-USER-INTERFACE.md`](#06epic-user-interfacemd) | EPIC-006 | ✅ `applied` |
| [`07.EPIC-NEOCOM-API.md`](#07epic-neocom-apimd) | EPIC-007 | ⚪ `none` (flows Review-gated; related back work under other epics) |
| [`08.EPIC-LOCATIONS.md`](#08epic-locationsmd) | EPIC-008 | ✅ `applied` |
| [`09.EPIC-BACKEND-SERVICES.md`](#09epic-backend-servicesmd) | EPIC-009 | 📦 `archived` |
| [`10.EPIC-INDUSTRY-BLUEPRINTS.md`](#10epic-industry-blueprintsmd) | EPIC-010 | 📦 `archived` |
| [`11.EPIC-BLUEPRINT-LIST-PROCESSING.md`](#11epic-blueprint-list-processingmd) | EPIC-011 | 📦 `archived` |

Also: [How to read](#how-to-read) · [How agents update this file](#how-agents-update-this-file)

## How to read

Each epic is a section headed with the L1 filename (for example `## \`01.EPIC-LOGIN-PROCEDURE.md\``) containing:

1. **Sections** — L1 register / requirement slices and their status (Review gate and/or pipeline). **This is the active record.**
2. Delivery evidence lives in `openspec/DELIVERY-INDEX.md` and `openspec/CHANGE-STATUS.md`. Do not recreate an L2 delivery section.

| Column (Sections) | Meaning |
| --- | --- |
| **Section** | L1 section id or heading slice |
| **Item** | Register row / requirement group under that section |
| **Status** | ⏳ `to review` · 👀 `reviewed` · 📤 `extracted` · 📝 `registered` · 🔨 `applying` · ✅ `applied` · 📦 `archived` · 🚫 `out of scope` · ⚪ `none` · 🔁 `duplicated` |

Pipeline: `none` → `registered` → `applying` → `applied` → `archived`. Legacy rows may still say `extracted` (the removed L2 copy). `/epic:extract` does not write that status.

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
| Login flow | SSO / Authorization Code procedure | 📦 `archived` (`login`) |
| Development registration | Dev app registration + callback | 📦 `archived` (`login`) |
| Environment | Front/back env for SSO | 📦 `archived` (`login`); related `nestjs-sso-config` 📝 `registered` |
| Proposed solution | Token storage / refresh on back | 📦 `archived` (`login`) |
| State flow | Auth state machine | 📦 `archived` (`login`) |
| How the code follows the states | Implementation mapping | 📦 `archived` (`login`) |
| Login page | Front login UI | 📦 `archived` (`login`) |
| Login progress | Progress / callback UX | 📦 `archived` (`login`) |

---

## `02.EPIC-ANGULAR-CODIFICATION.md`

Epic id: EPIC-002 · Highest: ✅ `applied` · Last updated: 2026-11-03

### Sections

| Section | Item | Status |
| --- | --- | --- |
| Division / structure | Pages, panels, section modules | 📦 `archived` (`front-angular-structure`) |
| Node | Node MVC, render registry, viewer | 📦 `archived` (`front-node-render`) |
| Synchronous processing / asynchronous rendering | Front async SSE + adapter cache | 📦 `archived` (`front-async-sse`) |
| Async infra (extract `.async-infra`) | Persistence / Redis companion | 📦 `archived` (`infra-async-persistence`, `back-async-sse`) |
| Related — pilot panel | `v1-pilot-panel` / HEADER variants | 📦 `archived` (`front-pilot-panel`) |
| Related — pilot definition | NeoCom pilot nodes | 📦 `archived` (`front-pilot`) |
| Related — app shell | Canvas chrome | 📝 `registered` (`front-app-shell` 0/3) |
| Related — dashboard | Dashboard feature | 📦 `archived` (`front-dashboard-shell`) |
| Related — infrastructure | Toolchain / WireMock | 📦 `archived` (`front-infrastructure`) |

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

---

## `04.EPIC-MODELS.md`

Epic id: EPIC-004 · Highest: ✅ `applied` · Last updated: 2026-11-06 (`domain-module` DOMAIN-003 closed; §21 applied)

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
| 10 | BlueprintV1 | ✅ `applied` (✅ `duplicated`) / DOM-BP-001) |
| 11 | ProcessedBlueprintSummaryV1 | ⏳ `to review` |
| 12 | ProcessedBlueprintV1 | ⏳ `to review` |
| 12 | ResourceV1 | ⏳ `to review` |
| 13 | IndustryResourceV1 | ⏳ `to review` |
| 14 | BOMResourceV1 | ⏳ `to review` |
| 15 | BuildActionDtoV1 | ⏳ `to review` |
| 16 | BOMGroupV1 | ⏳ `to review` |
| 18 | ApplicationInfoV1 | ✅ `applied` |
| 19 | ServerStatusV1 | ✅ `applied` (✅ `duplicated`, ✅ `to review`) |
| 20 | SpaceLocationV1 | ✅ `applied` |
| 21 | neocom-domain deploy | 📦 `archived` (`domain-module`) |
| 22 | `jsonClass` interchange | ✅ `applied` (✅ `duplicated`)) |
| — | EveItem / ESI type mirrors | 🚫 `out of scope` |
| — | ESI corp / alliance / race | 🚫 `out of scope` |

---

## `05.EPIC-ESI-UNIVERSE.md`

Epic id: EPIC-005 · Highest: ⚪ `none` · Last updated: 2026-10-19

### Sections

| Section | Item | Status |
| --- | --- | --- |
| — | (no Review register extracted yet; SDE / universe notes stay on L1) | ⚪ `none` |

---

## `06.EPIC-USER-INTERFACE.md`

Epic id: EPIC-006 · Highest: ✅ `applied` · Last updated: 2026-11-06 (leftover UI-DASH to review; OpenSpec for cited changes archived)

### Sections

| Section | Item | Status |
| --- | --- | --- |
| [Page register](./06.EPIC-USER-INTERFACE.md#page-register) | Dashboard | 🔁 `duplicated` → [00.DUPLICATES](./00.DUPLICATES.md) |
| [Page register](./06.EPIC-USER-INTERFACE.md#page-register) | Feature dashboard | 🔁 `duplicated` → [00.DUPLICATES](./00.DUPLICATES.md) |
| [Page register](./06.EPIC-USER-INTERFACE.md#page-register) | Authentication pages | imported (not extractable) |
| [Page geometry](./06.EPIC-USER-INTERFACE.md#page-geometry-shared-styles) | UI-GEO-001 | 📦 `archived` → [`front-dashboard-shell`](../../openspec/changes/archive/2026-11-06-front-dashboard-shell/) ·  (DEF-IB-006 token) |
| [Page geometry](./06.EPIC-USER-INTERFACE.md#page-geometry-shared-styles) | UI-GEO-002 | 📦 `archived` → [`front-dashboard-shell`](../../openspec/changes/archive/2026-11-06-front-dashboard-shell/) ·  (DEF-BLP-005) |
| [Versioned panels](./06.EPIC-USER-INTERFACE.md#versioned-panels-and-renders-vn-) | UI-VER-001…004 | 📦 `archived` → [`front-dashboard-shell`](../../openspec/changes/archive/2026-11-06-front-dashboard-shell/) ·  |
| [Front domain NeoCom nodes](./06.EPIC-USER-INTERFACE.md#front-domain-neocom-nodes-file-alias-render-key) | UI-DOM-001…005 | 📦 `archived` → [`front-domain-nodes`](../../openspec/changes/archive/2026-11-06-front-domain-nodes/) ·  (`@domain`) |
| [Media (EVE Image Server)](./06.EPIC-USER-INTERFACE.md#media-from-the-eve-image-server) | UI-MED-001…008 | 📦 `archived` → [`front-dashboard-shell`](../../openspec/changes/archive/2026-11-06-front-dashboard-shell/) ·  |
| [Common header](./06.EPIC-USER-INTERFACE.md#common-header-element-app-page-header) | UI-HDR-001…011 | 📦 `archived` → [`front-dashboard-shell`](../../openspec/changes/archive/2026-11-06-front-dashboard-shell/) ·  |
| [Application info panel](./06.EPIC-USER-INTERFACE.md#application-info-panel-v1-application-info-render) | UI-AIP-001…006 | 📦 `archived` → [`front-dashboard-shell`](../../openspec/changes/archive/2026-11-06-front-dashboard-shell/) ·  |
| [Server status panel](./06.EPIC-USER-INTERFACE.md#server-status-panel-v1-server-status-render) | UI-SSP-001…007 | 📦 `archived` → [`front-dashboard-shell`](../../openspec/changes/archive/2026-11-06-front-dashboard-shell/) ·  |
| [Corporation panel](./06.EPIC-USER-INTERFACE.md#corporation-panel-v1-corporation-render) | UI-CORP-001…014 | 📦 `archived` → [`front-dashboard-shell`](../../openspec/changes/archive/2026-11-06-front-dashboard-shell/) ·  (014 = DEF-BLP-004) |
| [Dashboard](./06.EPIC-USER-INTERFACE.md#dashboard-landing-page) | UI-DASH-001…005, 007…010, 012…015 | 📦 `archived` → [`front-dashboard-shell`](../../openspec/changes/archive/2026-11-06-front-dashboard-shell/) ·  |
| [Dashboard requirements](./06.EPIC-USER-INTERFACE.md#dashboard-requirements) | UI-DASH-006, 011 | ⏳ `[ ] to review` |
| [Character selection](./06.EPIC-USER-INTERFACE.md#character-selection-login-006--ui) | UI-CHAR-002 | 📦 `archived` → [`front-dashboard-shell`](../../openspec/changes/archive/2026-11-06-front-dashboard-shell/) ·  |

---

## `07.EPIC-NEOCOM-API.md`

Epic id: EPIC-007 · Highest: ⚪ `none` (flows Review-gated; related back work under other epics) · Last updated: 2026-10-19

### Sections

| Section | Item | Status |
| --- | --- | --- |
| API flows | Flow 06 — GET industry blueprints (async) | 👀 `reviewed` |
| API flows | Flow 07 — GET industry blueprints SSE | 👀 `reviewed` |

---

## `08.EPIC-LOCATIONS.md`

Epic id: EPIC-008 · Highest: ✅ `applied` · Last updated: 2026-11-06 (leftover Lookup*/KnownSystem/§15 register; space-location-service archived)

### Sections

| Section | Item | Status |
| --- | --- | --- |
| 01 | LOC-001 location kind | 📤 `extracted` → 📦 `archived` (`domain-locations` / `back-spacelocations`) |
| 01 | LOC-002 ancestor place | 📤 `extracted` → 📦 `archived` |
| 01 | LOC-003 planets/ships/holds | 🚫 `out of scope` |
| 03 | SpaceLocation (LOC-010) | 📤 `extracted` → 📦 `archived` via OpenSpec |
| 03 | LOC-011 callers use SpaceLocation | 🚫 `out of scope` |
| 04 | Region (LOC-020) | 📤 `extracted` → 📦 `archived` via OpenSpec |
| 05 | Constellation (LOC-030) | 📤 `extracted` → 📦 `archived` via OpenSpec |
| 06 | Solar system (LOC-040) | 📤 `extracted` → 📦 `archived` via OpenSpec |
| 07 | Station (LOC-050, LOC-051) | 📤 `extracted` → 📦 `archived` via OpenSpec |
| 08 | Structure (LOC-060) | 📤 `extracted` → 📦 `archived` via OpenSpec |
| 09 | LocationAssetContainer | 🚫 `out of scope` |
| 10 | ShippingYardLocation | 🚫 `out of scope` |
| 11 | LookupRegion (LOC-090) | ⏳ `to review` |
| 12 | LookupSolarSystem (LOC-100) | ⏳ `to review` |
| 13 | KnownSystem (LOC-110) | 📝 `registered` → `front-known-system` |
| 14 | Front stubs (LOC-120, LOC-121) | 🚫 `out of scope` |
| 15 | Space location service LOC-130…142 (BACK-229) | 📦 `archived` → `back-space-location-service`|
| 15 | Space location service register row | ⏳ `to review` |

---

## `09.EPIC-BACKEND-SERVICES.md`

Epic id: EPIC-009 · Highest: 📦 `archived` · Last updated: 2026-11-06 (Release-0.1.0 archive) · **source-archived** → [`archive/09.EPIC-BACKEND-SERVICES.md`](./archive/09.EPIC-BACKEND-SERVICES.md)

### Sections

| Section | Item | Status |
| --- | --- | --- |
| 01–02 | BACK-SVC-001…004, 010…013 (layout / Record / V1) | 📤 `extracted` → 📦 `archived` (`domain-layout`) |
| 03–04 | BACK-SVC-020…022, 030…032 (ports) | 📤 `extracted` → 📦 `archived` (`domain-ports`) |
| 05–06 | BACK-SVC-040…042, 050…052 (deprecations) | 📤 `extracted` → 📦 `archived` (`domain-deprecations`) |
| 07 | BACK-SVC-060…063 (OpenAPI) | 📤 `extracted` → 📦 `archived` (`back-openapi`) |
| 08 | BACK-SVC-070…072 (industry blueprints API) | 📤 `extracted` → 📦 `archived` (`back-industry-blueprints`) |

---

## `10.EPIC-INDUSTRY-BLUEPRINTS.md`

Epic id: EPIC-010 · Highest: 📦 `archived` · Last updated: 2026-11-06 (Release-0.1.0 archive) · **source-archived** → [`archive/10.EPIC-INDUSTRY-BLUEPRINTS.md`](./archive/10.EPIC-INDUSTRY-BLUEPRINTS.md)

### Sections

| Section | Item | Status |
| --- | --- | --- |
| [01](./archive/10.EPIC-INDUSTRY-BLUEPRINTS.md#section-01--spec-model-strip-page) | IND-BP-001…007 (model-strip page) | 📦 `archived` → [`front-industry-blueprints`](../../openspec/changes/archive/2026-11-06-front-industry-blueprints/) ·  |
| [02](./archive/10.EPIC-INDUSTRY-BLUEPRINTS.md#section-02--spec-featurev1-display-element) | IND-BP-010…012 (FeatureV1 / `v1-feature-button`) | 📦 `archived` → [`front-industry-blueprints`](../../openspec/changes/archive/2026-11-06-front-industry-blueprints/) ·  |
| [03](./archive/10.EPIC-INDUSTRY-BLUEPRINTS.md#section-03--dashboard-feature-panel-procedural-population) | IND-BP-020…023 (Feature panel population) | 📦 `archived` → [`front-industry-blueprints`](../../openspec/changes/archive/2026-11-06-front-industry-blueprints/) ·  |
| [04](./archive/10.EPIC-INDUSTRY-BLUEPRINTS.md#section-04--spec-v1-blueprint-by-location-page) | IND-BP-030…036 (v1-blueprint-by-location page) | 📦 `archived` → [`front-industry-blueprints`](../../openspec/changes/archive/2026-11-06-front-industry-blueprints/) ·  |
| [05](./archive/10.EPIC-INDUSTRY-BLUEPRINTS.md#section-05--spec-v1-region-render) | IND-BP-060…063, 070…072 (v1-region render) | 📦 `archived` → [`front-industry-blueprints`](../../openspec/changes/archive/2026-11-06-front-industry-blueprints/) ·  |
| [06](./archive/10.EPIC-INDUSTRY-BLUEPRINTS.md#section-06--spec-color-table-support-page) | IND-BP-040…042 (color-table support page) | 📦 `archived` → [`front-industry-blueprints`](../../openspec/changes/archive/2026-11-06-front-industry-blueprints/) ·  |
| [07](./archive/10.EPIC-INDUSTRY-BLUEPRINTS.md#section-07--spec-shared-ui-definitions) | IND-BP-080…083, 088 (shared UI) | 📦 `archived` → [`front-industry-blueprints`](../../openspec/changes/archive/2026-11-06-front-industry-blueprints/) ·  |
| [07](./archive/10.EPIC-INDUSTRY-BLUEPRINTS.md#expandable-items) | IND-BP-084…087 (expand/collaborate) | 🔁 `duplicated` → [00.DUPLICATES](./00.DUPLICATES.md) |
| [08](./archive/10.EPIC-INDUSTRY-BLUEPRINTS.md#section-08--spec-v1-blueprint-render) | IND-BP-090…095 (v1-blueprint render) | 📦 `archived` → [`front-industry-blueprints`](../../openspec/changes/archive/2026-11-06-front-industry-blueprints/) ·  |
| [09](./archive/10.EPIC-INDUSTRY-BLUEPRINTS.md#section-09--spec-v1-system-render) | IND-BP-100…105 (v1-system render) | 📦 `archived` → [`front-industry-blueprints`](../../openspec/changes/archive/2026-11-06-front-industry-blueprints/) ·  |
| [10](./archive/10.EPIC-INDUSTRY-BLUEPRINTS.md#section-10--spec-process-blueprints-into-the-location-hierarchy) | IND-BP-110…118 (hierarchy aggregation / SSE feed) | 📦 `archived` → [`front-industry-blueprints`](../../openspec/changes/archive/2026-11-06-front-industry-blueprints/) ·  |

---

## `11.EPIC-BLUEPRINT-LIST-PROCESSING.md`

Epic id: EPIC-011 · Highest: 📦 `archived` · Last updated: 2026-11-06 (Release-0.1.0 archive) · **source-archived** → [`archive/11.EPIC-BLUEPRINT-LIST-PROCESSING.md`](./archive/11.EPIC-BLUEPRINT-LIST-PROCESSING.md)

### Sections

| Section | Item | Status |
| --- | --- | --- |
| [01](./archive/11.EPIC-BLUEPRINT-LIST-PROCESSING.md#section-01--pilot-blueprint-feed-into-blueprint-by-location-panel) | BLP-001…003, 009…013, 024…025 | 📦 `archived` → [`front-blueprint-list-processing`](../../openspec/changes/archive/2026-11-06-front-blueprint-list-processing/) ·  |
| [02](./archive/11.EPIC-BLUEPRINT-LIST-PROCESSING.md#section-02--aggregate-into-systems-and-regions-sort-and-node-render) | BLP-004…008 | 📦 `archived` → [`front-blueprint-list-processing`](../../openspec/changes/archive/2026-11-06-front-blueprint-list-processing/) ·  |
| [03](./archive/11.EPIC-BLUEPRINT-LIST-PROCESSING.md#section-03--blueprint-location-catalog--spacelocationv1dto--spacelocationnodev1) | BLP-014…015, 018…020, 026…030 (back); BLP-016…017 (front) | 📦 `archived` → [`back-blueprint-list-processing`](../../openspec/changes/archive/2026-11-06-back-blueprint-list-processing/) + [`front-blueprint-list-processing`](../../openspec/changes/archive/2026-11-06-front-blueprint-list-processing/) |
| [04](./archive/11.EPIC-BLUEPRINT-LIST-PROCESSING.md#section-04--real-time-provider--panel-integration-design) | BLP-021…023 | 📦 `archived` → [`front-blueprint-list-processing`](../../openspec/changes/archive/2026-11-06-front-blueprint-list-processing/) ·  (SSE approach A deferred via BLP-034) |
| [01 interim](./archive/11.EPIC-BLUEPRINT-LIST-PROCESSING.md#interim--park-front-sse-http-back-endpoints-def-blp-003) | BLP-031…033 | 📦 `archived` → [`front-blueprint-list-processing`](../../openspec/changes/archive/2026-11-06-front-blueprint-list-processing/) ·  (DEF-BLP-003) |
| [04](./archive/11.EPIC-BLUEPRINT-LIST-PROCESSING.md#section-04--real-time-provider--panel-integration-design) | BLP-034 | 📦 `archived` → [`front-blueprint-list-processing`](../../openspec/changes/archive/2026-11-06-front-blueprint-list-processing/) ·  (DEF-BLP-003) |

---

## How agents update this file

1. **`/epic`:** add a new `## \`NN.EPIC-NAME.md\`` section (Highest ⚪ `none`), empty **Sections** placeholder only, Last updated today; **refresh the Table of contents** row for that epic. Do **not** add `### L2 delivery`.
2. **`/epic:extract`:** upsert **Sections** rows (Review → 📝 `registered` or 🔁 `duplicated`) and name the OpenSpec change on the row; sync epic `## Spec traceability` and `openspec/CHANGE-STATUS.md`. Do **not** recreate `### L2 delivery` or `sources/L2/`. Do not update `SPEC-EPIC-INDEX.md`.
3. **Apply start (`/neocom-code`):** bump epic **Highest** / Spec traceability to 🔨 `applying` when that is the furthest status; sync Sections as needed. Delivery evidence → `DELIVERY-INDEX.md` / `CHANGE-STATUS.md`.
4. **PR merge → develop (`/neocom-git`):** Sections / Highest → ✅ `applied` where appropriate; record Delivery in `DELIVERY-INDEX.md`; sync Spec traceability Highest.
5. **Validate on develop:** keep `DELIVERY-INDEX.md` Validated column current.
6. **OpenSpec archive:** Sections / Highest → 📦 `archived`; source-archive eligible L1 (§6.7); update Spec traceability paths.
7. Do **not** invent a second dashboard. **Sections** plus CHANGE-STATUS / DELIVERY-INDEX **are** the Review/pipeline records. Do not recreate `### L2 delivery` or `sources/L2/`. Do not update deprecated `SPEC-EPIC-INDEX.md`.
8. Authored L1 sections stay as written. Only Review cells and `## Spec traceability` change on the epic file.
