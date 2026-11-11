# L1 epic → OpenSpec traceability

Authoritative central record of epic → **Sections** (Review / pipeline). Agents **skip** material already `applied` / `archived` on later `/epic:extract` runs. Each epic file also carries a `## Spec traceability` header that must stay in sync with this file’s epic section (Highest status, OpenSpec names).

Delivery SHAs / PR numbers live in [`openspec/DELIVERY-INDEX.md`](../../openspec/DELIVERY-INDEX.md) (owned by `/neocom-git`). Prefer that index and graphify over live GitHub.

Companions: `openspec/CHANGE-STATUS.md` (OpenSpec programme status), `openspec/DELIVERY-INDEX.md` (commits/PRs). **Removed (do not recreate):** `sources/L2/`, `SPEC-EPIC-INDEX.md`, and **`### L2 delivery`**.

Last refreshed: 2026-11-11 (`/epic:extract 17` → SemVer F/B-130…133; `front-cicd` 0/87 + `back-cicd` 0/72; leftover `[ ]` only F-045…047).

## Table of contents

Epic sections and the Table of contents are listed in **reverse epic number order** (highest `NN` first) so the most recent / active epics appear above older archived ones.

**Sections** column: per-status counts as `icon` + number only (see legend under How to read).

| Epic | Sections |
| --- | --- |
| [`17.EPIC-CICD.md`](#17epic-cicdmd) | 📝 2 · ⏳ 10 · ⚪ 1 |
| [`16.EPIC-OPTIMIZATIONS.md`](#16epic-optimizationsmd) | 📝 1 |
| [`15.EPIC-FRONT-PAGE-ASSETS-BY-LOCATION.md`](#15epic-front-page-assets-by-locationmd) | ✅ 4 |
| [`14.EPIC-ASSETS.md`](#14epic-assetsmd) | ✅ 3 · ⚪ 1 · ⏳ 1 |
| [`13.EPIC-EVE-ITEMS.md`](#13epic-eve-itemsmd) | ✅ 5 · ➡️ 1 |
| [`12.EPIC-PROCESSED-BLUEPRINT.md`](#12epic-processed-blueprintmd) | 👀 1 · ⏳ 9 · 🚫 1 |
| [`11.EPIC-BLUEPRINT-LIST-PROCESSING.md`](#11epic-blueprint-list-processingmd) | 📦 6 |
| [`10.EPIC-INDUSTRY-BLUEPRINTS.md`](#10epic-industry-blueprintsmd) | 📦 10 · 🔁 1 |
| [`09.EPIC-BACKEND-SERVICES.md`](#09epic-backend-servicesmd) | 📦 5 |
| [`08.EPIC-LOCATIONS.md`](#08epic-locationsmd) | 📝 1 · ⏳ 3 · 📦 9 · ➡️ 2 · 🚫 3 |
| [`07.EPIC-NEOCOM-API.md`](#07epic-neocom-apimd) | ⏳ 2 · 📦 2 · ⚪ 1 |
| [`06.EPIC-USER-INTERFACE.md`](#06epic-user-interfacemd) | ⏳ 6 · 📦 11 · 🔁 2 · ➡️ 1 · 📥 2 |
| [`05.EPIC-ESI-UNIVERSE.md`](#05epic-esi-universemd) | ⚪ 1 |
| [`04.EPIC-MODELS.md`](#04epic-modelsmd) | ⏳ 2 · ✅ 7 · 📦 1 · ➡️ 5 · 🚫 1 |
| [`03.EPIC-TESTING.md`](#03epic-testingmd) | ➡️ 7 |
| [`02.EPIC-ANGULAR-CODIFICATION.md`](#02epic-angular-codificationmd) | 📝 1 · ⏳ 1 · 📦 8 |
| [`01.EPIC-LOGIN-PROCEDURE.md`](#01epic-login-proceduremd) | 📦 8 |

Also: [How to read](#how-to-read) · [How agents update this file](#how-agents-update-this-file)

## How to read

Each epic is a section headed with the L1 filename (for example `## \`01.EPIC-LOGIN-PROCEDURE.md\``) containing:

1. **Sections** — L1 register / requirement slices and their status (Review gate and/or pipeline). **This is the active record.** The Table of contents **Sections** cell summarises those rows as icon counts.
2. Delivery evidence lives in `openspec/DELIVERY-INDEX.md` and `openspec/CHANGE-STATUS.md`. Do not recreate an L2 delivery section.

| Column (Sections) | Meaning |
| --- | --- |
| **Section** | L1 section id or heading slice |
| **Item** | Register row / requirement group under that section |
| **Status** | ⏳ `to review` · 👀 `reviewed` · 📤 `extracted` · 📝 `registered` · 🔨 `applying` · ✅ `applied` · 📦 `archived` · 🚫 `out of scope` · ⚪ `none` · 🔁 `duplicated` · 📥 `imported` |

Pipeline: `none` → `registered` → `applying` → `applied` → `archived`. Legacy rows may still say `extracted` (the removed L2 copy). `/epic:extract` does not write that status.

### Develop tips (reference)

| Repo | Develop tip | PR note |
| --- | --- | --- |
| `neocom-back` | `3317849` | **PR `#4`** (industry / async / spacelocations / openapi) |
| `neocom-front` | `e3356db` | tip commit (no PR id in index for some stacks) |
| `neocom-domain` | `477ee33` | tip commit |


## `17.EPIC-CICD.md`

Epic id: EPIC-017 · Highest: 🔨 `applying` · Last updated: 2026-11-11 (`front-cicd` applying 87/87 on `feature/cicd`; `back-cicd` 0/72 registered)

### Sections

| Section | Item | Status |
| --- | --- | --- |
| OpenSpec sets | `front-cicd` (`CICD-F-*`) | 🔨 `applying` 87/87 |
| OpenSpec sets | `back-cicd` (`CICD-B-*`) | 📝 `registered` 0/72 |
| [01](./17.EPIC-CICD.md#section-01--cypress-ui-and-content-validation) | CICD-F-001…004 (was BDD-001…004) | 📝 `registered` → `front-cicd` |
| [02](./17.EPIC-CICD.md#section-02--mock-data-from-real-runs) | CICD-F-010…016 | 📝 `registered` → `front-cicd` |
| [03](./17.EPIC-CICD.md#section-03--coverage-control-and-quality-gates) | CICD-F/B-020…024 (was COV-001…005) | 📝 `registered` → `front-cicd` + `back-cicd` |
| [04](./17.EPIC-CICD.md#section-04--cicd-test-jobs-and-sonar-gate-order) | CICD-F/B-030…032 (was GATE-001…003) | 📝 `registered` → `front-cicd` + `back-cicd` |
| [05](./17.EPIC-CICD.md#section-05--testing-command-catalog) | CICD-F/B-040…044 (was INFRA-060…064) | 📝 `registered` → `front-cicd` + `back-cicd` |
| [05](./17.EPIC-CICD.md#section-05--testing-command-catalog) | CICD-F-045…047 (SDD: full integration on development deployment; Gherkin; one feature file per page initially) | ⏳ `[ ] to review` |
| [06](./17.EPIC-CICD.md#section-06--backend-testing) | CICD-B-001…017 | 📝 `registered` → `back-cicd` |
| [07](./17.EPIC-CICD.md#section-07--domain-node-unit-tests) | CICD-F-050…053 | 📝 `registered` → `front-cicd` |
| [08](./17.EPIC-CICD.md#section-08--deployment) | CICD-F/B-080…082 + F/B-130…133 (SemVer) | 📝 `registered` → `front-cicd` + `back-cicd` |
| [09](./17.EPIC-CICD.md#section-09--logging) | CICD-F-110…122 + F-124 / CICD-B-110…111 + B-113…127 | 📝 `registered` → `front-cicd` + `back-cicd` |
| [10](./17.EPIC-CICD.md#section-10--gherkin-step-catalogs-front-and-back) | CICD-F-060…067 / CICD-B-060…061 | 📝 `registered` → `front-cicd` + `back-cicd` |
| [11](./17.EPIC-CICD.md#section-11--continuous-integration-pipeline) | CICD-F/B-070…079 + F/B-083…089 | 📝 `registered` → `front-cicd` + `back-cicd` |
| [12](./17.EPIC-CICD.md#section-12--developer-install) | CICD-F-092…095 + F-097…098 | 📝 `registered` → `front-cicd` |
| [13](./17.EPIC-CICD.md#section-13--local-configuration) | CICD-F-101…103 + F-105…108 | 📝 `registered` → `front-cicd` |

---

## `16.EPIC-OPTIMIZATIONS.md`

Epic id: EPIC-016 · Highest: 📝 `registered` · Last updated: 2026-11-09 (`/epic:extract` → `back-eve-item-dogma-drop`)

### Sections

| Section | Item | Status |
| --- | --- | --- |
| [01](./16.EPIC-OPTIMIZATIONS.md#section-01--drop-unused-dogma-fields-from-eveitemv1dto) | Drop unused dogma fields from EveItemV1Dto (OPT-001…003) | 📝 `registered` → `back-eve-item-dogma-drop` |

---

## `15.EPIC-FRONT-PAGE-ASSETS-BY-LOCATION.md`

Epic id: EPIC-015 · Highest: ✅ `applied` · Last updated: 2026-11-09 ([neocom-front#7](https://github.com/AdamAntinoo/neocom-front/pull/7) merged; develop @ `d1fed92`; openspec validate passed)

### Sections

| Section | Item | Status |
| --- | --- | --- |
| [01](./15.EPIC-FRONT-PAGE-ASSETS-BY-LOCATION.md#section-01--dashboard-feature-entry--icon) | Dashboard Feature entry + icon (FAL-001…003) | ✅ `applied` → `front-assets-by-location` |
| [02](./15.EPIC-FRONT-PAGE-ASSETS-BY-LOCATION.md#section-02--assets-by-location-page) | Assets by location page + pilot module (FAL-010…015) | ✅ `applied` → `front-assets-by-location` |
| [03](./15.EPIC-FRONT-PAGE-ASSETS-BY-LOCATION.md#section-03--pilot-assets-feed-and-region--system-aggregation) | Pilot assets feed + aggregate via locationId + spacelocations service (FAL-020…029, 033…035) | ✅ `applied` → `front-assets-by-location` |
| [04](./15.EPIC-FRONT-PAGE-ASSETS-BY-LOCATION.md#section-04--asset-render-v1-asset-render) | Asset render `v1-asset-render` (FAL-030…032, 036…037) | ✅ `applied` → `front-assets-by-location` |

---

## `14.EPIC-ASSETS.md`

Epic id: EPIC-014 · Highest: ✅ `applied` · Last updated: 2026-11-09 ([neocom-back#9](https://github.com/AdamAntinoo/neocom-back/pull/9) merged; develop @ `63a2098`; openspec validate passed)

### Sections

| Section | Item | Status |
| --- | --- | --- |
| [01](./14.EPIC-ASSETS.md#section-01--esi-character-assets-specimen) | ESI character assets specimen + related ESI outputs | ⚪ `none` |
| [02](./14.EPIC-ASSETS.md#section-02--eveassetv1) | EveAssetV1 / expansions / AST-001…006 | ✅ `applied` → `back-assets` |
| [02](./14.EPIC-ASSETS.md#section-02--eveassetv1) | Programme HTTP list + by-location + Redis `pilot/asset` TTL 60m / AST-007…009, AST-013…014 | ✅ `applied` → `back-assets` |
| [03](./14.EPIC-ASSETS.md#section-03--locatedassetcontainerv1) | LocatedAssetContainerV1 / AST-010…012 (was LocationAssetContainer / LOC-070) | ✅ `applied` → `back-assets` |
| [04](./14.EPIC-ASSETS.md#section-04--shippingyardlocation) | ShippingYardLocation / LOC-080 (from EPIC-008 §10) | ⏳ `[ ] to review` |

---

## `13.EPIC-EVE-ITEMS.md`

Epic id: EPIC-013 · Highest: ✅ `applied` · Last updated: 2026-11-09 ([neocom-back#8](https://github.com/AdamAntinoo/neocom-back/pull/8)+[#9](https://github.com/AdamAntinoo/neocom-back/pull/9) merged; develop @ `63a2098`; openspec validate passed)

### Sections

| Section | Item | Status |
| --- | --- | --- |
| [01](./13.EPIC-EVE-ITEMS.md#section-01--hierarchy-esi-type--eveitemv1dto--priceditemv1dto) | Hierarchy ESI → EveItemV1Dto → PricedItemV1Dto · ITEM-023 outbound by function | ✅ `applied` → `back-eve-items` |
| [02](./13.EPIC-EVE-ITEMS.md#section-02--esi-universe-type-fields) | ESI universe type fields / ITEM-001…002 · ITEM-022 types pairing | ✅ `applied` → `back-eve-items` |
| [03](./13.EPIC-EVE-ITEMS.md#section-03--eveitemv1dto-back-interchange) | EveItemV1Dto / ITEM-003…007 (group→category ESI; iconUrl) | ✅ `applied` → `back-eve-items` |
| [04](./13.EPIC-EVE-ITEMS.md#section-04--priceditemv1dto-extends-eveitemv1dto) | PricedItemV1Dto extends EveItemV1Dto / ITEM-010…013 | ✅ `applied` → `back-eve-items` |
| [05](./13.EPIC-EVE-ITEMS.md#section-05--back-use-cases-get-by-item-id) | eveitems (public) + pricedeveitems (auth); Redis; compose / ITEM-014…021 · ITEM-024 Jita orders · ITEM-025…026 TTL caches | ✅ `applied` → `back-eve-items` |
| — | EveAssetV1 | ➡️ moved → [EPIC-014 §02](./14.EPIC-ASSETS.md#section-02--eveassetv1) |

---

## `12.EPIC-PROCESSED-BLUEPRINT.md`

Epic id: EPIC-012 · Highest: ⚪ `none` · Last updated: 2026-11-06 (ProcessedBlueprintV1 rename; former BOM detail discarded; Jita market §02)

### Sections

| Section | Item | Status |
| --- | --- | --- |
| [01](./12.EPIC-PROCESSED-BLUEPRINT.md#section-01--processedblueprintv1) | ProcessedBlueprintV1 / IND-BP-001, 005…012 · `v1-processed-blueprint-render` | ⏳ `[ ] to review` (was Summary; name reassigned; model-strip specimen) |
| [02](./12.EPIC-PROCESSED-BLUEPRINT.md#section-02--market-pricing-jita-buy--sell) | MKT-001…007 Jita buy/sell | ⏳ `[ ] to review` |
| [03](./12.EPIC-PROCESSED-BLUEPRINT.md#section-03--resourcev1) | ResourceV1 | ⏳ `[ ] to review` (from EPIC-004 §13) |
| [04](./12.EPIC-PROCESSED-BLUEPRINT.md#section-04--industryresourcev1) | IndustryResourceV1 | ⏳ `[ ] to review` (from EPIC-004 §14) |
| [05](./12.EPIC-PROCESSED-BLUEPRINT.md#section-05--bomresourcev1) | BOMResourceV1 | ⏳ `[ ] to review` (from EPIC-004 §15) |
| [06](./12.EPIC-PROCESSED-BLUEPRINT.md#section-06--buildactiondtov1) | BuildActionDtoV1 | ⏳ `[ ] to review` (from EPIC-004 §16) |
| [07](./12.EPIC-PROCESSED-BLUEPRINT.md#section-07--bomgroupv1) | BOMGroupV1 / IND-BP-003…004 | ⏳ `[ ] to review` (from EPIC-004 §17) |
| [08](./12.EPIC-PROCESSED-BLUEPRINT.md#section-08--blueprint-render-runs-v1-blueprint-render) | UI-BP-001…003 | ⏳ `[ ] to review` (from EPIC-006) |
| [09](./12.EPIC-PROCESSED-BLUEPRINT.md#section-09--evelocationv1dto) | EveLocationV1Dto / ELOC-001…008 (back Dto; front mapper WIP) | ⏳ `[ ] to review` |
| — | Former §02 BOM ProcessedBlueprint / IND-BP-002 | 🚫 `discarded` |
| — | Flow 06 / 07 (EPIC-007) | 👀 `reviewed` — pending move confirm |
| — | EPIC-002 ProcessedBlueprint prose | applied narrative — pending move confirm |

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


## `08.EPIC-LOCATIONS.md`

Epic id: EPIC-008 · Highest: ✅ `applied` · Last updated: 2026-11-07 (LocatedAssetContainerV1 + ShippingYard → EPIC-014)

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
| 09 | LocationAssetContainer → LocatedAssetContainerV1 | ➡️ moved → [EPIC-014 §03](./14.EPIC-ASSETS.md#section-03--locatedassetcontainerv1) |
| 10 | ShippingYardLocation | ➡️ moved → [EPIC-014 §04](./14.EPIC-ASSETS.md#section-04--shippingyardlocation) |
| 11 | LookupRegion (LOC-090) | ⏳ `to review` |
| 12 | LookupSolarSystem (LOC-100) | ⏳ `to review` |
| 13 | KnownSystem (LOC-110) | 📝 `registered` → `front-known-system` |
| 14 | Front stubs (LOC-120, LOC-121) | 🚫 `out of scope` |
| 15 | Space location service LOC-130…142 (BACK-229) | 📦 `archived` → `back-space-location-service`|
| 15 | Space location service register row | ⏳ `to review` |

---


## `07.EPIC-NEOCOM-API.md`

Epic id: EPIC-007 · Highest: ⚪ `none` · Last updated: 2026-11-09 (section model + Review normalize; leftovers `[ ] to review`)

### Sections

| Section | Item | Status |
| --- | --- | --- |
| [01](./07.EPIC-NEOCOM-API.md#section-01--contract-inventory-and-flow-rules) | API-BASE-001…003 | ⏳ `[ ] to review` |
| [02](./07.EPIC-NEOCOM-API.md#section-02--authentication-flows-0104) | API-AUTH-001…002, Flows 01–04, cookies / 401 | 📦 `archived` → [`login`](../../openspec/changes/archive/2026-11-06-login/) |
| [03](./07.EPIC-NEOCOM-API.md#section-03--pilot-data-access-flow-05) | API-PILOT-001…002 (Nest GET pilot + private ESI gap) | ⏳ `[ ] to review` |
| [04](./07.EPIC-NEOCOM-API.md#section-04--industry-blueprints-list-and-events-flows-0607) | API-IND-BP-001…002 (Flows 06–07) | 📦 `archived` → industry-blueprints / async-sse |
| [05](./07.EPIC-NEOCOM-API.md#section-05--further-flows) | Further flows (Flow 08+) | ⚪ `none` (placeholder) |

---


## `06.EPIC-USER-INTERFACE.md`

Epic id: EPIC-006 · Highest: 📦 `archived` · Last updated: 2026-11-09 (section model + Review normalize; leftovers `[ ] to review`)

### Sections

| Section | Item | Status |
| --- | --- | --- |
| [01](./06.EPIC-USER-INTERFACE.md#section-01--page-register) | Page register — Dashboard / Feature dashboard | 🔁 `duplicated` → [00.DUPLICATES](./00.DUPLICATES.md) |
| [01](./06.EPIC-USER-INTERFACE.md#section-01--page-register) | Page register — Model strip | ⏳ `[ ] to review` |
| [01](./06.EPIC-USER-INTERFACE.md#section-01--page-register) | Page register — Authentication pages | 📥 imported (not extractable) |
| [02](./06.EPIC-USER-INTERFACE.md#section-02--shell-and-page-header) | UI-SHELL-001…002 | ⏳ `[ ] to review` |
| [02](./06.EPIC-USER-INTERFACE.md#section-02--shell-and-page-header) | UI-VAR-001…002 | ⏳ `[ ] to review` |
| [02](./06.EPIC-USER-INTERFACE.md#section-02--shell-and-page-header) | UI-GEO-001…002 | 📦 `archived` → [`front-dashboard-shell`](../../openspec/changes/archive/2026-11-06-front-dashboard-shell/) |
| [02](./06.EPIC-USER-INTERFACE.md#section-02--shell-and-page-header) | UI-VER-001…004 | 📦 `archived` → [`front-dashboard-shell`](../../openspec/changes/archive/2026-11-06-front-dashboard-shell/) |
| [02](./06.EPIC-USER-INTERFACE.md#section-02--shell-and-page-header) | UI-DOM-001…005 | 📦 `archived` → [`front-domain-nodes`](../../openspec/changes/archive/2026-11-06-front-domain-nodes/) |
| [02](./06.EPIC-USER-INTERFACE.md#section-02--shell-and-page-header) | UI-MED-001…008 | 📦 `archived` → [`front-dashboard-shell`](../../openspec/changes/archive/2026-11-06-front-dashboard-shell/) |
| [02](./06.EPIC-USER-INTERFACE.md#section-02--shell-and-page-header) | UI-HDR-001…011 | 📦 `archived` → [`front-dashboard-shell`](../../openspec/changes/archive/2026-11-06-front-dashboard-shell/) |
| [03](./06.EPIC-USER-INTERFACE.md#section-03--application-info-panel-v1-application-info-render) | UI-AIP-001…006 | 📦 `archived` → [`front-dashboard-shell`](../../openspec/changes/archive/2026-11-06-front-dashboard-shell/) |
| [04](./06.EPIC-USER-INTERFACE.md#section-04--server-status-panel-v1-server-status-render) | UI-SSP-001…007 | 📦 `archived` → [`front-dashboard-shell`](../../openspec/changes/archive/2026-11-06-front-dashboard-shell/) |
| [05](./06.EPIC-USER-INTERFACE.md#section-05--corporation-panel-v1-corporation-render) | UI-CORP-001…014 | 📦 `archived` → [`front-dashboard-shell`](../../openspec/changes/archive/2026-11-06-front-dashboard-shell/) |
| [06](./06.EPIC-USER-INTERFACE.md#section-06--blueprint-render-v1-blueprint-render) | UI-BP-001…003 | ➡️ moved → [EPIC-012 §08](./12.EPIC-PROCESSED-BLUEPRINT.md#section-08--blueprint-render-runs-v1-blueprint-render) |
| [07](./06.EPIC-USER-INTERFACE.md#section-07--style-catalog-programme) | UI-STYLE-001…005 | ⏳ `[ ] to review` |
| [08](./06.EPIC-USER-INTERFACE.md#section-08--model-strip-model-strip-page) | UI-MS-001…007 | ⏳ `[ ] to review` |
| [09](./06.EPIC-USER-INTERFACE.md#section-09--authentication-and-login-pages-imported) | Auth / login / callback / exception / UI-CHAR-001 | 📥 imported (not extractable) |
| [09](./06.EPIC-USER-INTERFACE.md#character-selection-login-006--ui) | UI-CHAR-002 | 📦 `archived` → [`front-dashboard-shell`](../../openspec/changes/archive/2026-11-06-front-dashboard-shell/) |
| [10](./06.EPIC-USER-INTERFACE.md#section-10--dashboard-landing-page) | UI-DASH-001…005, 007…010, 012…015 | 📦 `archived` → [`front-dashboard-shell`](../../openspec/changes/archive/2026-11-06-front-dashboard-shell/) |
| [10](./06.EPIC-USER-INTERFACE.md#dashboard-requirements) | UI-DASH-006, 011 | ⏳ `[ ] to review` |

---


## `05.EPIC-ESI-UNIVERSE.md`

Epic id: EPIC-005 · Highest: ⚪ `none` · Last updated: 2026-10-19

### Sections

| Section | Item | Status |
| --- | --- | --- |
| — | (no Review register extracted yet; SDE / universe notes stay on L1) | ⚪ `none` |

---


## `04.EPIC-MODELS.md`

Epic id: EPIC-004 · Highest: ✅ `applied` · Last updated: 2026-11-07 (EveAssetV1 → EPIC-014)

### Sections

| Section | Item | Status |
| --- | --- | --- |
| 03 | PricedItemV1Dto | ➡️ moved → [EPIC-013 §04](./13.EPIC-EVE-ITEMS.md#section-04--priceditemv1dto-extends-eveitemv1dto) |
| 04 | EveLocationV1Dto | ➡️ moved → [EPIC-012 §09](./12.EPIC-PROCESSED-BLUEPRINT.md#section-09--evelocationv1dto) |
| 05 | EveAssetV1 | ➡️ moved → [EPIC-014 §02](./14.EPIC-ASSETS.md#section-02--eveassetv1) |
| 06 | PublicPilotV1 | ✅ `applied` |
| 07 | PilotV2 | ✅ `applied` |
| 08 | ShipV1 | ⏳ `to review` |
| 09 | PilotShipV1 | ⏳ `to review` |
| 10 | BlueprintV1 | ✅ `applied` (✅ `duplicated`) / DOM-BP-001) |
| 11–17 | Processed blueprint / BOM stack | ➡️ moved → [EPIC-012](./12.EPIC-PROCESSED-BLUEPRINT.md) |
| 18 | ApplicationInfoV1 | ✅ `applied` |
| 19 | ServerStatusV1 | ✅ `applied` (✅ `duplicated`, ✅ `to review`) |
| 20 | SpaceLocationV1 | ✅ `applied` |
| 21 | neocom-domain deploy | 📦 `archived` (`domain-module`) |
| 22 | `jsonClass` interchange | ✅ `applied` (✅ `duplicated`)) |
| — | EveItem / ESI type → EveItemV1Dto | ➡️ moved → [EPIC-013](./13.EPIC-EVE-ITEMS.md) |
| — | ESI corp / alliance / race | 🚫 `out of scope` |

---


## `03.EPIC-TESTING.md`

Epic id: EPIC-003 · Highest: 📦 `archived` · Last updated: 2026-11-09 · **source-archived** → [`archive/03.EPIC-TESTING.md`](./archive/03.EPIC-TESTING.md) · contents → [`17.EPIC-CICD.md`](./17.EPIC-CICD.md)

### Sections

| Section | Item | Status |
| --- | --- | --- |
| Cypress UI and content validation | BDD-001…004 | ➡️ moved → [EPIC-017 §01](./17.EPIC-CICD.md#section-01--cypress-ui-and-content-validation) |
| Mock data from real runs | FIX-001…004 | ➡️ moved → [EPIC-017 §02](./17.EPIC-CICD.md#section-02--mock-data-from-real-runs) |
| Coverage control and quality gates | COV-001…005 | ➡️ moved → [EPIC-017 §03](./17.EPIC-CICD.md#section-03--coverage-control-and-quality-gates) |
| CI/CD test jobs and Sonar gate order | GATE-001…003 | ➡️ moved → [EPIC-017 §04](./17.EPIC-CICD.md#section-04--cicd-test-jobs-and-sonar-gate-order) |
| Testing command catalog | INFRA-060…064 | ➡️ moved → [EPIC-017 §05](./17.EPIC-CICD.md#section-05--testing-command-catalog) |
| Backend testing | BTEST-001…005 | ➡️ moved → [EPIC-017 §06](./17.EPIC-CICD.md#section-06--backend-testing) |
| Domain node unit tests | DNODE-001…004 | ➡️ moved → [EPIC-017 §07](./17.EPIC-CICD.md#section-07--domain-node-unit-tests) |

---


## `02.EPIC-ANGULAR-CODIFICATION.md`

Epic id: EPIC-002 · Highest: ✅ `applied` · Last updated: 2026-11-06 (Domain module ANG-DOM-001…006 `[ ] to review`; innovative-core deprecated)

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
| [Domain module](./02.EPIC-ANGULAR-CODIFICATION.md#domain-module-neocom-nodes) | ANG-DOM-001…006 (`modules/domain`, flat nodes, deprecate innovative-core) | ⏳ `[ ] to review` |

---


## `01.EPIC-LOGIN-PROCEDURE.md`

Epic id: EPIC-001 · Highest: 📦 `archived` · Last updated: 2026-11-09 · **source-archived** → [`archive/01.EPIC-LOGIN-PROCEDURE.md`](./archive/01.EPIC-LOGIN-PROCEDURE.md)

### Sections

| Section | Item | Status |
| --- | --- | --- |
| Login flow | SSO / Authorization Code procedure | 📦 `archived` → [`login`](../../openspec/changes/archive/2026-11-06-login/) |
| Development registration | Dev app registration + callback | 📦 `archived` → [`login`](../../openspec/changes/archive/2026-11-06-login/) |
| Environment | Front/back env for SSO | 📦 `archived` → [`login`](../../openspec/changes/archive/2026-11-06-login/) |
| Proposed solution | Token storage / refresh on back | 📦 `archived` → [`login`](../../openspec/changes/archive/2026-11-06-login/) |
| State flow | Auth state machine | 📦 `archived` → [`login`](../../openspec/changes/archive/2026-11-06-login/) |
| How the code follows the states | Implementation mapping | 📦 `archived` → [`login`](../../openspec/changes/archive/2026-11-06-login/) |
| Login page | Front login UI | 📦 `archived` → [`login`](../../openspec/changes/archive/2026-11-06-login/) |
| Login progress | Progress / callback UX | 📦 `archived` → [`login`](../../openspec/changes/archive/2026-11-06-login/) |

---


## How agents update this file

1. **`/epic`:** add a new `## \`NN.EPIC-NAME.md\`` section (Highest ⚪ `none`) **at the top of the epic list** (reverse number order — newest `NN` first), empty **Sections** placeholder only, Last updated today; **refresh the Table of contents** row at the top (recompute **Sections** icon counts). Do **not** add `### L2 delivery`.
2. **`/epic:extract`:** upsert **Sections** rows (Review → 📝 `registered` or 🔁 `duplicated`) and name the OpenSpec change on the row; sync epic `## Spec traceability` and `openspec/CHANGE-STATUS.md`. Do **not** recreate `### L2 delivery` or `sources/L2/`. Do not update `SPEC-EPIC-INDEX.md`.
3. **Apply start (`/neocom-code`):** bump epic **Highest** / Spec traceability to 🔨 `applying` when that is the furthest status; sync Sections as needed. Delivery evidence → `DELIVERY-INDEX.md` / `CHANGE-STATUS.md`.
4. **PR merge → develop (`/neocom-git`):** Sections / Highest → ✅ `applied` where appropriate; record Delivery in `DELIVERY-INDEX.md`; sync Spec traceability Highest.
5. **Validate on develop:** keep `DELIVERY-INDEX.md` Validated column current.
6. **OpenSpec archive:** Sections / Highest → 📦 `archived`; source-archive eligible L1 (§6.7); update Spec traceability paths.
7. Do **not** invent a second dashboard. **Sections** plus CHANGE-STATUS / DELIVERY-INDEX **are** the Review/pipeline records. Do not recreate `### L2 delivery` or `sources/L2/`. Do not update deprecated `SPEC-EPIC-INDEX.md`.
8. Authored L1 sections stay as written. Only Review cells and `## Spec traceability` change on the epic file.
