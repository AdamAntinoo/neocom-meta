# Fixed defects

Archive of defects whose product fix the developer has **validated**. Entries are **moved** here from `FEATURE-<stem>_DEFECTS.md` via `/defect:fixed`. Structure matches the open register (Register row + defect section).

## Contents

- [Register](#register)
- [DEF-BLP-001 — Location lookup uses InMemoryLocationCatalog mock instead of ESI](#def-blp-001-location-lookup-uses-inmemorylocationcatalog-mock-instead-of-esi)
- [DEF-BLP-006 — Dashboard feature catalog; move blueprint page; drop industry/manufacture homes](#def-blp-006-dashboard-feature-catalog-move-blueprint-page-drop-industry-manufacture-homes)
- [DEF-BLP-003 — Park front SSE; load blueprints from back HTTP endpoints](#def-blp-003-park-front-sse-load-blueprints-from-back-http-endpoints)
- [DEF-BLP-005 — Row/section gap uses `$section-padding` (= `$panel-padding`)](#def-blp-005-row-section-gap-uses-section-padding-panel-padding)
- [DEF-BLP-007 — Aggregate invents LookupRegion/System nodes instead of Region/SolarSystem domain nodes](#def-blp-007-aggregate-invents-lookupregion-system-nodes-instead-of-region-solarsystem-domain-nodes)
- [DEF-BLP-008 — RegionLookupNode jsonClass `LookupRegion` is not the domain/render identity](#def-blp-008-regionlookupnode-jsonclass-lookupregion-is-not-the-domain-render-identity)
- [DEF-BLP-009 — Front domain node file naming, module location, and `@domain` path alias](#def-blp-009-front-domain-node-file-naming-module-location-and-domain-path-alias)
- [DEF-BLP-010 — Overlapping Blueprint front domain types (NodeV1 / V1Node / ProcessedBlueprint)](#def-blp-010-overlapping-blueprint-front-domain-types-nodev1-v1node-processedblueprint)
- [DEF-BLP-011 — Render registration name SHALL equal the domain node `jsonClass`](#def-blp-011-render-registration-name-shall-equal-the-domain-node-jsonclass)
- [DEF-BLP-012 — Hierarchy uses NeoCom children on domain Region/SolarSystem; no Lookup or Listing subclass](#def-blp-012-hierarchy-uses-neocom-children-on-domain-region-solarsystem-no-lookup-or-listing-subclass)
- [DEF-BLP-013 — Published `BlueprintV1` (neocom-domain) is redundant for front nodes; use `BlueprintV1DtoWire`](#def-blp-013-published-blueprintv1-neocom-domain-is-redundant-for-front-nodes-use-blueprintv1dtowire)
- [DEF-BLP-014 — v2-node-container expand toggle size/centering; node body fills row](#def-blp-014-v2-node-container-expand-toggle-size-centering-node-body-fills-row)
- [DEF-IB-001 — App name click → character selection](#def-ib-001-app-name-click-returns-to-character-selection)
- [DEF-IB-002 — Header host named `page-header` not `app-page-header`](#def-ib-002-header-host-named-page-header-instead-of-app-page-header)
- [DEF-IB-003 — `cy-section-name` must match component name minus type suffix](#def-ib-003-cy-section-name-matches-component-name-without-type-suffix)
- [DEF-IB-004 — Pages must not use `vn-` version prefix](#def-ib-004-pages-must-not-use-vn-version-prefix)
- [DEF-IB-005 — Header app-info / server-info row width + stack](#def-ib-005-header-app-info-server-info-row-width-and-responsive-stack)
- [DEF-IB-006 — Pilot row spacing must use default panel gap](#def-ib-006-pilot-row-spacing-must-use-default-panel-gap)
- [DEF-IB-008 — Breadcrumb: small Elemental in full-width white panel, flush to neighbours](#def-ib-008-breadcrumb-small-elemental-in-full-width-white-panel)
- [DEF-IB-009 — Feature list flex layout + icon border + Elemental white name](#def-ib-009-feature-list-flex-layout-icon-name-appearance)

## How entries land here

1. Defect lived on `defects/FEATURE-<STEM>_DEFECTS.md`.
2. Developer validated the product fix.
3. `/defect:fixed DEF-…` sets status `fixed` (or `closed`), appends the same row + section here, and removes them from the open feature page.

Statuses on this page: `fixed` · `closed` · (rarely) `wontfix`.

---

## Register

| ID | Title | Status | Owning epic / capability | OpenSpec (when known) | Found | Source feature |
| --- | --- | --- | --- | --- | --- | --- |
| DEF-BLP-001 | Location lookup uses InMemoryLocationCatalog mock instead of ESI | `fixed` | EPIC-011 · BLP location / EPIC-008 spacelocation | TBD — amend `back-blueprint-list-processing` and/or `back-spacelocations` | 2026-11-04 | feature/blueprint-list-processing |
| DEF-BLP-006 | Dashboard feature catalog; move blueprint page; drop industry/manufacture homes | `fixed` | Dashboard · feature list / industry pages | TBD — EPIC-006 / UI-DASH / EPIC-010 | 2026-11-05 | feature/blueprint-list-processing |
| DEF-BLP-003 | Park front SSE; load blueprints from back HTTP endpoints | `fixed` | EPIC-011 §01 interim · BLP-031…034 | `front-blueprint-list-processing` (BLP-031…034 registered) | 2026-11-05 | feature/blueprint-list-processing |
| DEF-BLP-005 | Row/section gap uses `$section-padding` (= `$panel-padding`) | `fixed` | EPIC-006 · UI-GEO-002 | `front-dashboard-shell` | 2026-11-05 | feature/blueprint-list-processing |
| DEF-BLP-007 | Aggregate invents LookupRegion/System nodes instead of Region/SolarSystem domain nodes | `fixed` | EPIC-006 · UI-DOM-004 | `front-domain-nodes` | 2026-11-05 | feature/blueprint-list-processing |
| DEF-BLP-008 | RegionLookupNode jsonClass `LookupRegion` is not the domain/render identity | `fixed` | EPIC-006 · UI-DOM-003 / 004 | `front-domain-nodes` | 2026-11-05 | feature/blueprint-list-processing |
| DEF-BLP-009 | Front domain node file naming, module location, and `@domain` path alias | `fixed` | EPIC-006 · UI-DOM-001…002 | `front-domain-nodes` | 2026-11-05 | feature/blueprint-list-processing |
| DEF-BLP-010 | Overlapping Blueprint front domain types (NodeV1 / V1Node / ProcessedBlueprint) | `fixed` | EPIC-006 · UI-DOM-001 / 005 | `front-domain-nodes` | 2026-11-05 | feature/blueprint-list-processing |
| DEF-BLP-011 | Render registration name SHALL equal the domain node `jsonClass` | `fixed` | EPIC-006 · UI-DOM-003 | `front-domain-nodes` | 2026-11-05 | feature/blueprint-list-processing |
| DEF-BLP-012 | Hierarchy uses NeoCom children on domain Region/SolarSystem; no Lookup or Listing subclass | `fixed` | EPIC-006 · UI-DOM-004 | `front-domain-nodes` | 2026-11-05 | feature/blueprint-list-processing |
| DEF-BLP-013 | Published `BlueprintV1` (neocom-domain) is redundant for front nodes; use `BlueprintV1DtoWire` | `fixed` | EPIC-006 · UI-DOM-005 | `front-domain-nodes` | 2026-11-05 | feature/blueprint-list-processing |
| DEF-BLP-014 | v2-node-container expand toggle size/centering; node body fills row | `fixed` | EPIC-006 · domain-node container | TBD — `front-domain-nodes` / UI render | 2026-11-06 | feature/blueprint-list-processing |
| DEF-IB-001 | App name click → character selection | `fixed` | EPIC-006 · **UI-AIP-006** `[ ]` | after review → extract / amend `front-dashboard-shell` | 2026-11-03 | feature/industry-blueprints |
| DEF-IB-002 | Header host named `page-header` not `app-page-header` | `fixed` | EPIC-006 · **UI-HDR-010** `[ ]` | after review → extract / amend `front-dashboard-shell` | 2026-11-03 | feature/industry-blueprints |
| DEF-IB-003 | `cy-section-name` must match component name minus type suffix | `fixed` | EPIC-003 / EPIC-006 · BDD `cy-*` + UI hosts | TBD — BDD catalog + dashboard-shell / industry specs | 2026-11-03 | feature/industry-blueprints |
| DEF-IB-004 | Pages must not use `vn-` version prefix | `fixed` | EPIC-006 · **UI-VER-004** `[ ] to review` | after review → extract / amend industry page name | 2026-11-03 | feature/industry-blueprints |
| DEF-IB-005 | Header app-info / server-info row width + stack | `fixed` | EPIC-006 · **UI-HDR-011** `[ ]` | after review → extract / amend `front-dashboard-shell` | 2026-11-03 | feature/industry-blueprints |
| DEF-IB-006 | Pilot row spacing must use default panel gap | `fixed` | EPIC-006 · **UI-GEO-001** + **UI-DASH-015** `[ ]` | after review → extract / amend `front-dashboard-shell` | 2026-11-03 | feature/industry-blueprints |
| DEF-IB-008 | Breadcrumb: small Elemental in full-width white panel, flush to neighbours | `fixed` | EPIC-006 · UI-DASH breadcrumb Appearance | TBD — `front-dashboard-shell` amend or follow-up fix | 2026-11-03 | feature/industry-blueprints |
| DEF-IB-009 | Feature list flex layout + icon border + Elemental white name | `fixed` | EPIC-006 · UI-DASH feature list / feature button Appearance | TBD — `front-dashboard-shell` amend or follow-up fix | 2026-11-03 | feature/industry-blueprints |

---

## DEF-BLP-001 — Location lookup uses InMemoryLocationCatalog mock instead of ESI

| Field | Value |
| --- | --- |
| Status     | `fixed`                                                                                                                                      |
| Severity | `TBD` |
| Surfaces | `GetSpaceLocationUseCase`; `LocationCatalog` / `InMemoryLocationCatalog`; blueprint list embed (`GetPilotBlueprintsUseCase` → space-location use case) |
| Found on | Validating `GET /v1/pilots/:pilotId/blueprints` — `location` unset for real ESI `location_id` values (e.g. `60006907`); catalog only seeds Amarr fixture |
| Branch tip | `neocom-back` `feature/blueprint-list-processing` |
| L1 | TBD — EPIC-011 §03 / EPIC-008 catalog vs ESI |

### Observed

Location search for blueprint (and universe) resolution does **not** use the **ESI API** (or available ESI location / universe links). It serves **mock / fixture** data from `InMemoryLocationCatalog` only (hard-coded Amarr / Domain chain). Real ESI `location_id` values therefore miss the catalog and blueprints leave embedded `location` unset.

### Expected

Location lookup SHALL resolve via the **ESI API** (using the ESI client / available location–universe operations and links), not by generating or returning only in-memory mock catalog entries from `InMemoryLocationCatalog`.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`11.EPIC-BLUEPRINT-LIST-PROCESSING.md`](../sources/L1/11.EPIC-BLUEPRINT-LIST-PROCESSING.md) §03; [`08.EPIC-LOCATIONS.md`](../sources/L1/08.EPIC-LOCATIONS.md) | Require ESI-backed location resolution for blueprint `location_id` |
| OpenSpec | `back-blueprint-list-processing` · `back-spacelocations` | Replace or supplement in-memory adapter |
| Code | `in-memory-location-catalog.adapter.ts`; `LocationCatalog` port binding in `spacelocation.module.ts`; `get-space-location.usecase.ts` | ESI-backed `LocationCatalog` implementation |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and applies the flow through OpenSpec
- [x] Developer validates the fix is resolved — mark this defect `fixed` / `closed`

### Notes

Validated 2026-11-05 — moved to FIXED-DEFECTS.md

Found while debugging blueprint-list-processing DTO apply: sync blueprints return `locationId` from ESI but `location` stays null because catalog lookup never hits ESI.

---


## DEF-BLP-006 — Dashboard feature catalog; move blueprint page; drop industry/manufacture homes

| Field | Value |
| --- | --- |
| Status     | `fixed`                                                                                                                                      |
| Severity | `TBD` |
| Surfaces | Dashboard feature list (`feature-list-panel`); `feature-catalog.provider.ts`; `blueprint-by-location-page` (today under `industry/manufacture/pages/`); `industry-home-page`; `manufacture-home-page`; routes `model-strip`, `color-table`, blueprint list |
| Found on | Project start — pages not all reachable from dashboard; blueprint page nested under manufacture; industry/manufacture home dashboards still present |
| Branch tip | `neocom-front` `feature/blueprint-list-processing` `@ 8030666` |
| L1 | TBD — EPIC-006 / UI-DASH feature catalog; EPIC-010 industry page placement |

### Observed

At project start, **not all pages are accessible from the dashboard**. `FeatureCatalogProvider` currently exposes only **Industry** at root (and Blueprint Availability under industry). Missing dashboard feature entries for:

- **blueprint list** (blueprint list / Blueprint Availability path)
- **model-strip** (`/model-strip`)
- **colour table** (`/color-table`)

The blueprint list page still lives under `industry/manufacture/pages/blueprint-by-location-page`. Intermediate **industry** and **manufacture** home dashboards are still in the tree even though they are **not required at this stage**.

### Expected

1. At the start of the project, **all** those pages SHALL be **accessible from the dashboard**.
2. `FeatureCatalogProvider` SHALL include **feature entries** for:
   - the **blueprint list**
   - **model-strip**
   - the **colour table**
3. Those entries SHALL appear in the dashboard feature list so navigation reaches the corresponding pages/routes.
4. `blueprint-by-location-page` **SHALL be moved** from `industry/manufacture/pages/` to `industry` **module** `pages/` (remain under the industry module; not under manufacture).
5. The **industry** and **manufacture** dashboard/home pages SHALL be **removed** for this stage (no longer required).

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | TBD — EPIC-006 / UI-DASH; EPIC-010 | Catalog entries; page placement; drop interim homes |
| OpenSpec | TBD — `front-dashboard-shell` / `front-industry-blueprints` | Feature catalog; routing; remove home dashboards |
| Code | `feature-catalog.provider.ts`; move `blueprint-by-location-page` → `modules/industry/pages/`; `industry.module.ts` / `manufacture.module.ts`; remove `industry-home-page` / `manufacture-home-page` | Routes + catalog + delete unused homes |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and authorizes `/fix:defect`
- [x] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Validated 2026-11-05 — moved to FIXED-DEFECTS.md

Routes already exist for `model-strip` and `color-table`. Blueprint page move + removal of industry/manufacture homes keep early navigation flat: dashboard feature entries → pages directly.

`/fix:defect` 2026-11-05: root catalog → blueprint list, model-strip, colour table; page moved to `industry/pages/`; industry/manufacture homes removed; `/industry` redirects to blueprints-by-location.

---

## DEF-BLP-003 — Park front SSE; load blueprints from back HTTP endpoints

| Field      | Value                                                                                                                                           |
| ---------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| Status     | `fixed`                                                                                                                                   |
| Severity   | `HIGH`                                                                                                                                          |
| Surfaces   | Front SSE / async client used by blueprint list processing; `PilotBlueprintProviderService` (or equivalent); blueprint-by-location UI data path |
| Found on   | Validation: SSE is not operative; product decision to move SSE to a proof of concept before project integration                                 |
| Branch tip | `neocom-front` `feature/blueprint-list-processing` `@ 8030666`                                                                                  |
| L1         | [`11.EPIC-BLUEPRINT-LIST-PROCESSING.md`](../sources/L1/11.EPIC-BLUEPRINT-LIST-PROCESSING.md) §01 interim — **BLP-031…033** (+ **BLP-034** §04) `registered` → `front-blueprint-list-processing` |

### Observed

Front **SSE is not operative**. Blueprint list processing still depends on (or is wired toward) the front SSE implementation, which is not ready for project integration. SSE work is to move to a **proof of concept** before it is integrated again.

### Expected

1. **Park** all front implementations related to the **SSE** path used for blueprints (disable / isolate / stop calling them in the product feature path — do not keep them as the live data source).
2. Blueprint list processing SHALL **load blueprints from the current back HTTP endpoints** (existing REST/API surfaces), not from the front SSE stream, until an SSE PoC is accepted and re-integrated.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`11.EPIC-BLUEPRINT-LIST-PROCESSING.md`](../sources/L1/11.EPIC-BLUEPRINT-LIST-PROCESSING.md) §01 / §04 | **BLP-031…034** `[ ] to review`; BLP-002 / BLP-010 / BLP-021 / BLP-023 → `superseded` |
| OpenSpec | `front-blueprint-list-processing`; related `front-async-sse` / back SSE | Amend front BLP to HTTP-only; park SSE wiring |
| Code | Front provider / SSE clients under blueprint list + industry blueprints UI | Use back blueprint list endpoint; park SSE listeners/providers |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`) — EPIC-011 **BLP-031…034**
- [x] Mark to run the process — sets Review to `[x] reviewed` and authorizes `/fix:defect`
- [x] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Validated 2026-11-06 — moved to FIXED-DEFECTS.md

SSE remains a future PoC; product BLP path resorts to current back endpoints for blueprints until that PoC is integrated. Owning L1 is **EPIC-011**.

`/fix:defect` 2026-11-05: parked SSE in `PilotBlueprintProviderService` + `available-blueprints-panel`; HTTP `GET /v1/pilots/:id/blueprints` only.

`/epic:extract` 2026-11-06: BLP-031…034 → `registered` in `front-blueprint-list-processing` (3 apply tasks open).

---

## DEF-BLP-005 — Row/section gap uses `$section-padding` (= `$panel-padding`)

| Field | Value |
| --- | --- |
| Status | `fixed` |
| Severity | `TBD` |
| Surfaces | Dashboard / page geometry gaps between **rows** and **sections**; tokens `$section-padding`, `$panel-padding` (`_tokens.scss`, `geometry.scss`, page SCSS e.g. `dashboard-home-page`) |
| Found on | Dashboard layout spacing — row/section gaps not tied to the panel padding token |
| Branch tip | `neocom-front` `feature/blueprint-list-processing` `@ 8030666` |
| L1 | EPIC-006 **UI-GEO-002** `registered` → `front-dashboard-shell` |

### Observed

Gaps between **rows** or **sections** do not consistently use the default `$section-padding` token, and that spacing is not aligned to `$panel-padding`. Geometry currently often uses `gap: 0` or ad-hoc values (e.g. `$panel-margin` on local rows) instead of a single section-padding default equal to panel padding.

### Expected

1. The gap between **rows** or **sections** SHALL be the **default value of** `$section-padding`.
2. That `$section-padding` default SHALL be the **same value as** `$panel-padding` (section padding equals panel padding).

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | TBD — EPIC-006 / UI geometry | Section/row gap = `$section-padding` = `$panel-padding` |
| OpenSpec | TBD — `front-dashboard-shell` / geometry | Token + geometry defaults |
| Code | `src/styles/_tokens.scss`; `geometry.scss`; page/panel SCSS using row/section gaps | Introduce/align `$section-padding`; apply as row/section `gap` |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and authorizes `/fix:defect`
- [x] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Validated 2026-11-06 — moved to FIXED-DEFECTS.md

Related to dashboard spacing next to DEF-BLP-004; `$panel-padding` is currently `2px` in `_tokens.scss`.

`/fix:defect` 2026-11-05: added `$section-padding: $panel-padding`; geometry `.neo-page` / `.section` / `.row` / `.column` use it; dashboard pilot row uses `$section-padding`.

`/epic:extract` 2026-11-06: UI-GEO-002 → `front-dashboard-shell` (1 apply task open).

---

## DEF-BLP-007 — Aggregate invents LookupRegion/System nodes instead of Region/SolarSystem domain nodes

| Field | Value |
| --- | --- |
| Status | `fixed` |
| Severity | `TBD` |
| Surfaces | `BlueprintLocationAggregate`; `RegionLookupNode`; `SystemLookupNode`; blueprint-by-location hierarchy; missing `Region` / `SolarSystem` v1 domain nodes |
| Found on | Validating provider → aggregate → panel: HTTP returns domain-shaped blueprints, aggregate synthesises parallel “Lookup*” types |
| Branch tip | `neocom-front` `feature/blueprint-list-processing` |
| L1 | EPIC-006 **UI-DOM-004** (+ peers) `registered` → [`front-domain-nodes`](../openspec/changes/front-domain-nodes/) |

### Observed

`PilotBlueprintProviderService` correctly maps endpoint DTOs via wire types (e.g. `BlueprintV1DtoWire`) into front domain nodes such as `BlueprintNodeV1` / space location. That DTO→domain step is accepted.

`BlueprintLocationAggregate` then **invents hierarchy containers** `RegionLookupNode` and `SystemLookupNode` instead of using proper versioned domain nodes for **Region** and **SolarSystem** (e.g. `Region` v1 / `SolarSystem` v1). There is **no** matching `Region` domain node in the expected naming; the aggregate therefore diverges from the domain model the provider already uses.

### Expected

1. Hierarchy aggregation SHALL compose **real domain nodes** for Region and SolarSystem (versioned), not ad-hoc Lookup* stand-ins.
2. Those types SHALL follow the same front domain-node convention as Blueprint (DEF-BLP-009 / DEF-BLP-011).
3. `RegionLookupNode` / `SystemLookupNode` SHALL be removed or superseded once the proper domain nodes exist.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md); [`11.EPIC-BLUEPRINT-LIST-PROCESSING.md`](../sources/L1/11.EPIC-BLUEPRINT-LIST-PROCESSING.md) | Norm + hierarchy uses domain Region / SolarSystem nodes |
| OpenSpec | TBD — `front-blueprint-list-processing` | Aggregate + node types |
| Code | `blueprint-location-aggregate.ts`; `region-lookup.node.ts`; `system-lookup.node.ts`; renders consuming Lookup* | Replace with `region-v1.node.ts` / `solar-system-v1.node.ts` (names per DEF-BLP-009) |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and authorizes `/fix:defect`
- [x] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Validated 2026-11-06 — moved to FIXED-DEFECTS.md

`/fix:defect` 2026-11-05: domain RegionV1/SolarSystemV1 + NeoCom children aggregate; single BlueprintV1Node + BlueprintV1DtoWire; render keys = jsonClass; Lookup* / npm BlueprintV1 wrapper removed.

`/epic:extract` 2026-11-06: UI-DOM-001…005 → `front-domain-nodes` (alias `@domain`).

DTO wire mapping (`*DtoWire` → domain node) remains valid; only the aggregate’s invented hierarchy types are in scope here. Sharpened by [DEF-BLP-012](#def-blp-012--hierarchy-uses-neocom-children-on-domain-regionsolarsystem-no-lookup-or-listing-subclass): no Listing subclass either — use `NeoCom` children on domain Region / SolarSystem.

---

## DEF-BLP-008 — RegionLookupNode jsonClass `LookupRegion` is not the domain/render identity

| Field | Value |
| --- | --- |
| Status | `fixed` |
| Severity | `TBD` |
| Surfaces | `region-lookup.node.ts` (`jsonClass = 'LookupRegion'`); likewise `system-lookup.node.ts` (`LookupSolarSystem`); render registry resolution |
| Found on | Inspecting `RegionLookupNode` constructor registration vs domain/render naming norm |
| Branch tip | `neocom-front` `feature/blueprint-list-processing` |
| L1 | EPIC-006 **UI-DOM-003 / 004** `registered` → [`front-domain-nodes`](../openspec/changes/front-domain-nodes/) |

### Observed

`RegionLookupNode` registers `jsonClass = 'LookupRegion'` (legacy infinity name). That is **not** the correct identity for a Region domain object. The same pattern appears on `SystemLookupNode` (`LookupSolarSystem`). Render lookup then cannot match the domain class that should represent Region / SolarSystem.

### Expected

1. The domain node that represents Region (and SolarSystem) SHALL set `jsonClass` to that type’s correct domain identity (per DEF-BLP-007 / DEF-BLP-009), **not** `LookupRegion` / `LookupSolarSystem`.
2. Render registration for that node SHALL use **exactly the same string** as that class’s `jsonClass` (DEF-BLP-011).
3. Legacy `LookupRegion` / `LookupSolarSystem` SHALL NOT remain the registered identity for new hierarchy work.
4. The norm SHALL be authored on [EPIC-006](../sources/L1/06.EPIC-USER-INTERFACE.md) (Review gate) before `/fix:defect` applies code.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) | Author jsonClass = render registration identity |
| OpenSpec | TBD | |
| Code | successor Region / SolarSystem domain nodes; `render-registry.ts` / region-system renders | Drop Lookup*; `registerRender(node.jsonClass, …)` |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and authorizes `/fix:defect`
- [x] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Validated 2026-11-06 — moved to FIXED-DEFECTS.md

`/fix:defect` 2026-11-05: domain RegionV1/SolarSystemV1 + NeoCom children aggregate; single BlueprintV1Node + BlueprintV1DtoWire; render keys = jsonClass; `-domain-` alias; Lookup* / npm BlueprintV1 wrapper removed.

Pairs with DEF-BLP-007 (replace Lookup* types) and DEF-BLP-011 (render name ≡ `jsonClass`).

---

## DEF-BLP-009 — Front domain node file naming, module location, and `@domain` path alias

| Field | Value |
| --- | --- |
| Status | `fixed` |
| Severity | `TBD` |
| Surfaces | `innovative-core/domain/nodes/*`; industry `domain/`; `tsconfig` / Angular path aliases; imports across front |
| Found on | Comparing `blueprint-v1.node.ts`, `blueprint-node-v1.ts`, `region-lookup.node.ts`, pilot/corporation nodes |
| Branch tip | `neocom-front` `feature/blueprint-list-processing` |
| L1 | EPIC-006 **UI-DOM-001 / 002** `registered` → [`front-domain-nodes`](../openspec/changes/front-domain-nodes/) |

### Observed

Front domain NeoCom classes that represent domain objects are **inconsistently named and placed**:

- File names mix `blueprint-v1.node.ts`, `blueprint-node-v1.ts`, `region-lookup.node.ts`, etc.
- Class names mix `BlueprintV1Node`, `BlueprintNodeV1`, `RegionLookupNode`, `SpaceLocationNodeV1`.
- There was **no** Angular / TypeScript path alias for importing these nodes (now `@domain` per UI-DOM-002).

### Expected

1. Norms SHALL be recorded on [EPIC-006](../sources/L1/06.EPIC-USER-INTERFACE.md).
2. A front domain NeoCom class that represents a domain object SHALL use file name `<object>-v<n>.node.ts` (object lower-case/kebab; version `v1`, `v2`, …) — example: Blueprint → `blueprint-v1.node.ts`.
3. Those classes SHALL live under a module folder named `domain` (not required to re-export every type from a barrel for consumers).
4. Angular / TS config SHALL register a **path alias** whose name is `@domain` pointing at that domain roots so imports do not use deep relative paths.
5. The same convention SHALL apply to all current domain objects in use (at least Blueprint, Pilot, Corporation, Region, SolarSystem, SpaceLocation, and peers already under `domain/nodes`).

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) | Author file/class/alias norms |
| OpenSpec | TBD | |
| Code | `tsconfig*.json` / `angular.json` paths; rename/move node files; update imports | Alias `@domain`; rename to `*-vN.node.ts` |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and authorizes `/fix:defect`
- [x] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Validated 2026-11-06 — moved to FIXED-DEFECTS.md

`/fix:defect` 2026-11-05: domain RegionV1/SolarSystemV1 + NeoCom children aggregate; single BlueprintV1Node + BlueprintV1DtoWire; render keys = jsonClass; Lookup* / npm BlueprintV1 wrapper removed.

`/epic:extract` 2026-11-06: UI-DOM-001…002 → `front-domain-nodes` with alias `@domain`.

`neocom-domain` npm package (published Record types) stays separate from these front NeoCom node wrappers; this defect is front NeoCom layout/naming only.

---

## DEF-BLP-010 — Overlapping Blueprint front domain types (NodeV1 / V1Node / ProcessedBlueprint)

| Field | Value |
| --- | --- |
| Status | `fixed` |
| Severity | `TBD` |
| Surfaces | `BlueprintNodeV1`; `BlueprintV1Node`; `ProcessedBlueprint`; `BlueprintV1DtoWire`; aggregate `toBlueprintV1Node`; available-blueprints vs by-location panels |
| Found on | Tracing provider → aggregate → renders: multiple Blueprint-shaped types with different names/features |
| Branch tip | `neocom-front` `feature/blueprint-list-processing` |
| L1 | EPIC-006 **UI-DOM-001 / 005** `registered` → [`front-domain-nodes`](../openspec/changes/front-domain-nodes/) |

### Observed

Too many similar Blueprint front types coexist and **do not match in names or features**:

- Provider / HTTP path uses `BlueprintNodeV1` (+ accepted `BlueprintV1DtoWire` mapping).
- Aggregate adapts again into `BlueprintV1Node` for leaves / existing render path.
- Manufacture list still has `ProcessedBlueprint` as another list node shape.

That duplication causes mismatched features and unclear which type is the canonical front domain Blueprint node.

### Expected

1. One canonical front domain Blueprint node SHALL exist per the DEF-BLP-009 file/class rule (`blueprint-v1.node.ts`).
2. `BlueprintV1DtoWire` (or equivalent) MAY remain as the DTO→domain mapper only — that role is accepted.
3. Aggregate, panels, and renders SHALL consume that single Blueprint domain node; redundant `BlueprintNodeV1` / `BlueprintV1Node` / `ProcessedBlueprint` overlaps SHALL be removed or reduced to thin aliases only during migration.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | EPIC-006; EPIC-011 | Single Blueprint front node |
| OpenSpec | TBD — `front-blueprint-list-processing` | |
| Code | `blueprint-node-v1.ts`; `blueprint-v1.node.ts`; `processed-blueprint.ts`; aggregate; panels; renders | Consolidate |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and authorizes `/fix:defect`
- [x] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Validated 2026-11-06 — moved to FIXED-DEFECTS.md

`/fix:defect` 2026-11-05: domain RegionV1/SolarSystemV1 + NeoCom children aggregate; single BlueprintV1Node + BlueprintV1DtoWire; render keys = jsonClass; `-domain-` alias; Lookup* / npm BlueprintV1 wrapper removed.

Does not dispute DTO wire types; only overlapping NeoCom/list domain classes. See [DEF-BLP-013](#def-blp-013--published-blueprintv1-neocom-domain-is-redundant-for-front-nodes-use-blueprintv1dtowire): published `BlueprintV1` is redundant vs `BlueprintV1DtoWire`.

---

## DEF-BLP-011 — Render registration name SHALL equal the domain node `jsonClass`

| Field | Value |
| --- | --- |
| Status | `fixed` |
| Severity | `TBD` |
| Surfaces | `render-registry.ts`; `jsonClass` on domain nodes; `v1-*-render` registrations (Blueprint, Pilot, Corporation, Region, SolarSystem, …) |
| Found on | Clarifying earlier hyphenated-key idea: registration must match the representing class’s `jsonClass` |
| Branch tip | `neocom-front` `feature/blueprint-list-processing` |
| L1 | EPIC-006 **UI-DOM-003** `registered` → [`front-domain-nodes`](../openspec/changes/front-domain-nodes/) |

### Observed

Render registration today uses mixed keys (`BlueprintV1`, `ProcessedBlueprint`, `LookupRegion`, `PublicPilotV1`, …) that are not consistently tied to a single rule. An earlier draft proposed hyphenated names such as `-Blueprint-`; the authoritative rule is simpler and stricter.

### Expected

1. EPIC-006 SHALL state: the **render registration name** for a domain object SHALL be **the same string** as the `jsonClass` of the front domain class that represents that object.
2. `registerRender(jsonClass, component)` (and collaborate / lookup) SHALL use that class’s `jsonClass` only — no parallel alias registry key.
3. Domain nodes (Blueprint, Pilot, Corporation, Region, SolarSystem, …) SHALL set `jsonClass` once to the correct domain identity (DEF-BLP-008 / DEF-BLP-009 / DEF-BLP-010); renders register under that exact value.
4. Versionability stays on the **render** UI (`vn-` selector / folder per UI-VER-*); it does **not** invent a second registration key different from `jsonClass`.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) | Author: render registration name ≡ representing class `jsonClass` |
| OpenSpec | TBD | |
| Code | `render-registry.ts`; each `v*-*-render` `registerRender(...)`; domain node `jsonClass` setters | One key = `jsonClass` |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and authorizes `/fix:defect`
- [x] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Validated 2026-11-06 — moved to FIXED-DEFECTS.md

`/fix:defect` 2026-11-05: domain RegionV1/SolarSystemV1 + NeoCom children aggregate; single BlueprintV1Node + BlueprintV1DtoWire; render keys = jsonClass; `-domain-` alias; Lookup* / npm BlueprintV1 wrapper removed.

Update 2026-11-05: supersedes the earlier “`-Blueprint-` hyphenated registration” wording in this defect. Path alias `@domain` (DEF-BLP-009 / UI-DOM-002) is a separate import-path concern and is not the render key.

---

## DEF-BLP-012 — Hierarchy uses NeoCom children on domain Region/SolarSystem; no Lookup or Listing subclass

| Field | Value |
| --- | --- |
| Status | `fixed` |
| Severity | `TBD` |
| Surfaces | `RegionLookupNode`; `SystemLookupNode`; `BlueprintLocationAggregate`; `NeoCom.getChildren` / `addChild`; Region / SolarSystem domain nodes; region/system renders |
| Found on | Clarifying DEF-BLP-007: Lookup* is an invention; Listing subclass also unnecessary because NeoCom already owns children |
| Branch tip | `neocom-front` `feature/blueprint-list-processing` |
| L1 | EPIC-006 **UI-DOM-004** `registered` → [`front-domain-nodes`](../openspec/changes/front-domain-nodes/) |

### Observed

`RegionLookupNode` is another invention standing in for **Region**. A conceivable alternative would be a **Listing** subclass that inherits from Region (same render) and adds countable children so counts come from `children.length` while aggregation targets that Region extension — not an unrelated Lookup class.

Even that Listing approach is **not required**: `NeoCom` already provides `getChildren` / `addChild` (and `children`). Aggregation can build Region → SolarSystem → Blueprint **on the domain Region and domain SolarSystem nodes** with **no further classes or modifications** to NeoCom or to those domain types for hierarchy.

### Expected

1. Blueprint-by-location hierarchy SHALL aggregate onto **domain Region** and **domain SolarSystem** nodes (per DEF-BLP-007 / DEF-BLP-009 naming).
2. Parent/child links SHALL use existing `NeoCom` **children** (`addChild` / `getChildren`); counts for rendering SHALL be derived from children when needed (real-time from `children.length` / equivalent), not from a parallel Lookup model.
3. `RegionLookupNode` **/** `SystemLookupNode` **SHALL NOT** remain as hierarchy types.
4. A **Listing** subclass of Region (or SolarSystem) is **optional and not required** for this fix; do not introduce Listing types unless a later requirement explicitly needs them.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | EPIC-006; EPIC-011 | Hierarchy = domain nodes + NeoCom children |
| OpenSpec | TBD — `front-blueprint-list-processing` | |
| Code | `blueprint-location-aggregate.ts`; remove/supersede `region-lookup.node.ts` / `system-lookup.node.ts`; region/system renders read counts via children | Use `NeoCom.addChild` / `getChildren` |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and authorizes `/fix:defect`
- [x] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Validated 2026-11-06 — moved to FIXED-DEFECTS.md

`/fix:defect` 2026-11-05: domain RegionV1/SolarSystemV1 + NeoCom children aggregate; single BlueprintV1Node + BlueprintV1DtoWire; render keys = jsonClass; `-domain-` alias; Lookup* / npm BlueprintV1 wrapper removed.

Complements DEF-BLP-007 (replace Lookup* with domain Region/SolarSystem) and DEF-BLP-008 (wrong `LookupRegion` jsonClass). Explicitly rejects inventing Listing* unless later required.

---

## DEF-BLP-013 — Published `BlueprintV1` (neocom-domain) is redundant for front nodes; use `BlueprintV1DtoWire`

| Field | Value |
| --- | --- |
| Status | `fixed` |
| Severity | `TBD` |
| Surfaces | `blueprint-v1.node.ts` (`BlueprintV1` from `neocom-domain`); `BlueprintV1Node`; `BlueprintV1DtoWire` in `blueprint-node-v1.ts`; provider / aggregate / `v1-blueprint-render` |
| Found on | Front NeoCom Blueprint path wrapping npm `BlueprintV1` while HTTP already maps via internal `BlueprintV1DtoWire` |
| Branch tip | `neocom-front` `feature/blueprint-list-processing` |
| L1 | EPIC-006 **UI-DOM-005** `registered` → [`front-domain-nodes`](../openspec/changes/front-domain-nodes/) |

### Observed

Front render/list code uses published `neocom-domain` ****`BlueprintV1` inside `BlueprintV1Node` (Record wrapper). That package domain class is **redundant** for front NeoCom use: the list pipeline already has an internal DTO shape `BlueprintV1DtoWire` for endpoint mapping into NeoCom nodes (`BlueprintNodeV1.fromDto`). Requiring `BlueprintV1` adds a second, overlapping representation.

### Expected

1. Front NeoCom Blueprint handling SHALL **not** require the published `neocom-domain` `BlueprintV1` class.
2. When a DTO / wire shape is needed, the front SHALL use the **internal** `BlueprintV1DtoWire` (or successor wire type colocated with the front node), not `BlueprintV1` from npm.
3. `BlueprintV1Node`’s dependency on `import { BlueprintV1 } from 'neocom-domain'` SHALL be removed as part of consolidating to the single front Blueprint node (DEF-BLP-010).
4. This does **not** forbid `neocom-domain` elsewhere where the published Record is genuinely needed; it forbids treating `BlueprintV1` as required for front node / render / aggregate paths that already have DTO wire + NeoCom.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | EPIC-006; EPIC-011 | Front NeoCom + internal DTO wire; npm Record optional |
| OpenSpec | TBD — `front-blueprint-list-processing` | |
| Code | `blueprint-v1.node.ts`; `v1-blueprint-render`; aggregate `toBlueprintV1Node`; keep/use `BlueprintV1DtoWire` | Drop `BlueprintV1` import from front Blueprint NeoCom path |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and authorizes `/fix:defect`
- [x] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Validated 2026-11-06 — moved to FIXED-DEFECTS.md

`/fix:defect` 2026-11-05: domain RegionV1/SolarSystemV1 + NeoCom children aggregate; single BlueprintV1Node + BlueprintV1DtoWire; render keys = jsonClass; `-domain-` alias; Lookup* / npm BlueprintV1 wrapper removed.

Narrows DEF-BLP-010: of the overlapping Blueprint types, published `BlueprintV1` / `BlueprintV1Node(record)` is explicitly unnecessary when `BlueprintV1DtoWire` exists.

---

## DEF-BLP-014 — v2-node-container expand toggle size/centering; node body fills row

| Field | Value |
| --- | --- |
| Status | `fixed` |
| Severity | `TBD` |
| Surfaces | `v2-node-container.component.html` (expand toggle ~L7–23); `v2-node-container.component.scss` (`.expand-toggle`, `.node-body`, `.node-row`); blueprint-by-location / hierarchy rows |
| Found on | Validating expand/collapse chrome on hierarchy node rows |
| Branch tip | `neocom-front` `feature/blueprint-list-processing` |
| L1 | TBD — EPIC-006 UI / domain-node container |

### Observed

On `v2-node-container`, the expand/collapse control (button + arrow icon) is too small and not centered horizontally in its column. The rendered node content (`.node-body` / outlet) does not expand to use the remaining width of the row.

### Expected

1. The expand toggle SHALL be a little larger than today and centered horizontally in its column.
2. The node being rendered SHALL expand to fill the rest of the row width (toggle fixed; body flexes to remaining space).

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | TBD — EPIC-006 | Domain-node container / expand chrome layout |
| OpenSpec | TBD | |
| Code | `neocom-front` `src/app/modules/renders/v2-node-container/` (HTML/SCSS; possibly icon size class) | Larger + centered toggle; `.node-body` fills remaining row |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; selecting this assumes Review accepted → `[x] reviewed`)
- [x] Mark to run the process — authorizes `/fix:defect`
- [x] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Validated 2026-11-06 — moved to FIXED-DEFECTS.md

Layout already uses Bootstrap `.row` plus `.node-body { flex: 1 1 auto; min-width: 0 }`; fix likely needs toggle sizing/alignment (and confirm flex/width on the row so the body actually stretches).

`/fix:defect` 2026-11-06: `v2-node-container` — arrow `neo-icon-md`; toggle fixed gutter centered; `:host`/`.node-body` fill remaining row width. L1/OpenSpec still TBD (not invented).

---

## DEF-IB-001 — App name click returns to character selection

| Field | Value |
| --- | --- |
| Status | `fixed` |
| Severity | UX / navigation gap (no alternate path to character selection from secured pages) |
| Surfaces | `v1-application-info-render` (and transitional `app-info-panel` if still painted) inside `app-page-header` |
| Found on | Secured pages after Industry / Dashboard (e.g. Blueprint Availability) |
| Branch tip | `neocom-front` `feature/industry-blueprints` |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) **UI-AIP-006** Review `[ ]` — check to `[x]` when ready for `/epic:extract` |

### Observed

There is **no** navigation control back to the **character selection** page from the secured application chrome. The application **name** in the application-info panel is display-only (`cy-field-value="app-name"`); clicking it does nothing.

### Expected

When the user **clicks the application name** in the application-info panel (`v1-application-info-render` / `cy-field-value="app-name"`), the app SHALL navigate to the **character selection** route (programme path: `/character-selection`, UI-CHAR / LOGIN-006 UI).

Scope note (prep): activation is the **name** control only (not version, not copyright), unless L1 later widens it.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) — Application info panel (UI-AIP-*) and/or Character selection (UI-CHAR-*) | Add a Review row for name → character-selection navigation; leave Appearance rows intact unless they conflict |
| OpenSpec | `front-dashboard-shell` specs `front/page-header` or `front/character-selection` (or a small fix change) | Delta: clickable name → `/character-selection` |
| Code | `neocom-front` `v1-application-info-render` (+ router link / click handler); ensure auth guard still applies | Do not invent SSO behaviour |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and applies the flow through OpenSpec
- [x] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Validated 2026-11-06 — moved to FIXED-DEFECTS.md

Found while exercising Industry blueprints secured chrome; root cause is header/ApplicationInfo behaviour (EPIC-006), not Blueprint Availability aggregation itself.

2026-11-05 `/fix:defect`: front already navigates app-name → `/character-selection` (`v1-application-info-render`); L1 UI-AIP-006 already extracted. Status applying — validate in UI then `/defect:fixed`.

---

## DEF-IB-002 — Header host named `page-header` instead of `app-page-header`

| Field | Value |
| --- | --- |
| Status | `fixed` |
| Severity | Naming / consistency (breaks programme naming consistency with UI-HDR-001) |
| Surfaces | Header host component folder, class, SCSS class; L2 / OpenSpec capability id may also say `page-header` |
| Found on | `neocom-front` header module while validating secured chrome |
| Branch tip | `neocom-front` `feature/industry-blueprints` |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) **UI-HDR-010** Review `[ ]` — check to `[x]` when ready for `/epic:extract` |

### Observed

Programme and specs name the common header host `**app-page-header**` (UI-HDR-001; pages use `<app-page-header />`). The Angular **selector** already matches (`selector: 'app-page-header'`), but other artefacts are still named `**page-header`**:

| Artefact | Current name | Programme name |
| --- | --- | --- |
| Folder / files | `modules/header/page-header/page-header.component.*` | expect `app-page-header` |
| Class | `PageHeaderComponent` | expect `AppPageHeaderComponent` (or equivalent `app-page-header` alignment) |
| Host CSS class | `page-header` on the section | expect `app-page-header` (or document intentional short class) |
| L2 / OpenSpec | `FRONT/12.PAGE-HEADER.md`, capability `front/page-header` | programme short name is `app-page-header` |

This split breaks naming consistency: docs and templates say `app-page-header`; source paths and types say `page-header`.

### Expected

The header host SHALL be named consistently as `**app-page-header**` across selector, folder/file basename, component class, and (unless L1 explicitly keeps a short CSS token) the primary CSS class. Spec / OpenSpec capability paths SHOULD use the same programme name when next amended (or record an explicit alias if `page-header` remains as a legacy path).

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) — Common header (`app-page-header`, UI-HDR-*) | Add a naming-consistency row (suggested `UI-HDR-010`) or clarify that folder/class MUST match the selector |
| OpenSpec | `front-dashboard-shell` → `specs/front/page-header/` (rename or alias to `app-page-header`) | Delta + tasks for rename |
| Code | Rename `page-header/` → `app-page-header/`, class → `AppPageHeaderComponent`, CSS `page-header` → `app-page-header`; update imports | Keep selector `app-page-header` (already correct) |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and applies the flow through OpenSpec
- [x] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Validated 2026-11-06 — moved to FIXED-DEFECTS.md

Selector already complies with UI-HDR-001; defect is **identifier drift** in source layout and secondary names, not a missing header host.

2026-11-05 `/fix:defect`: host renamed to `app-page-header` on tip; L1 UI-HDR-010 already extracted. Status applying — validate naming then `/defect:fixed`.

---

## DEF-IB-003 — `cy-section-name` matches component name without type suffix

| Field | Value |
| --- | --- |
| Status | `fixed` |
| Severity | Test / catalog consistency (Cypress `cy-section-name` drift from component identity) |
| Surfaces | Host components that publish `cy-section-name` (pages, panels, headers; renders as applicable) |
| Found on | Header / dashboard / industry chrome while validating secured pages |
| Branch tip | `neocom-front` `feature/industry-blueprints` |

### Observed

`cy-section-name` values do **not** consistently derive from the component selector / short name. Some are abbreviated or invented (`header`, `pilot-dashboard`, `blueprint-by-location-hierarchy`), while others already follow a cleaner pattern (`feature-list`, `character-selection`, `color-table`).

Programme docs (UI-HDR-005, UI-AIP-002, UI-SSP-002) currently **encode** some of the mismatched values (e.g. `app-page-header` owns `cy-section-name="header"`), so fixing this is both a **code** and a **spec** change — prior rows that mandate the old markers become incomplete / superseded by the naming rule.

### Expected

For a component whose selector / programme short name ends with a **type suffix** (`panel`, `header`, or `page`), `cy-section-name` SHALL equal that name **with the suffix removed**.

Examples (target):

| Component selector | Strip suffix | Expected `cy-section-name` | Current (examples) |
| --- | --- | --- | --- |
| `app-page-header` | `header` | `app-page` | `header` |
| `app-info-panel` | `panel` | `app-info` | `app-info` ✓ |
| `server-info-panel` | `panel` | `server-info` | `server-info` ✓ |
| `feature-list-panel` | `panel` | `feature-list` | `feature-list` ✓ |
| `v1-pilot-panel` | `panel` | `v1-pilot` | `pilot` |
| `v1-corporation-panel` | `panel` | `v1-corporation` | (render uses `corporation`) |
| `character-selection-page` | `page` | `character-selection` | `character-selection` ✓ |
| `color-table-page` | `page` | `color-table` | `color-table` ✓ |
| `blueprint-by-location-page` (after DEF-IB-004; today `v1-blueprint-by-location-page`) | `page` | `blueprint-by-location` | `v1-blueprint-by-location` (will change with page rename) |
| `blueprint-by-location-panel` | `panel` | `blueprint-by-location` | `blueprint-by-location-hierarchy` |
| `dashboard-home-page` | `page` | `dashboard-home` | (page body uses `pilot-dashboard` / `exception`) |

Prep clarification: if the selector has **multiple** trailing type tokens (e.g. `app-page-header`), strip **only the last** type suffix (`header` → `app-page`), not every occurrence of `page`. Confirm in L1 when authoring.

Out of scope until stated: inventing rules for `-render` / other suffixes; nested child sections that are not the component root may keep distinct names only if L1 allows an exception list.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | EPIC-003 testing / Cypress catalog; EPIC-006 UI-HDR / UI-AIP / UI-SSP rows that hard-code `header`, `app-info`, `server-info` | Add global `cy-section-name` derivation rule; mark UI-HDR-005 (and similar) superseded or amended where they force `header` |
| OpenSpec | `front-bdd-cypress` and/or `front-dashboard-shell` / `front-industry-blueprints` deltas | Catalog + concrete host markers |
| Code | Align root `cy-section-name` on each host; update Vitest/Cypress queries | Mechanical rename; keep field-level `cy-field-*` unchanged |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and applies the flow through OpenSpec
- [x] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Validated 2026-11-06 — moved to FIXED-DEFECTS.md

Related to DEF-IB-002 (host identity): once the host is consistently `app-page-header`, its section marker should be `app-page`, not `header`.

2026-11-05 `/fix:defect`: aligned root markers (`app-page`, `dashboard-home`, `v1-pilot`, `blueprint-by-location`); Vitest + Cypress steps updated. Renders kept as-is (out of suffix rule). Status applying.

---

## DEF-IB-004 — Pages must not use `vn-` version prefix

| Field | Value |
| --- | --- |
| Status | `fixed` |
| Severity | Naming / versionability consistency (pages stay unversioned; panels/renders stay versioned) |
| Surfaces | Page component selectors, folders, classes under `neocom-front` `pages/` and feature `…/pages/` |
| Found on | Secured and support pages while validating Industry / Dashboard chrome |
| Branch tip | `neocom-front` `feature/industry-blueprints` |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) **UI-VER-004** Review `[ ] to review` — mark `[x] reviewed` when ready for `/epic:extract` |

### Observed

Most **page** hosts correctly have **no** version prefix (`vn-` / `v1-`…). Programme UI versionability (UI-VER) requires `vn-` on **domain-bound panels/renders**, not on pages. One industry page incorrectly uses a versioned page name:

| Current selector | Versioned? |
| --- | --- |
| `dashboard-home-page` | no (correct) |
| `industry-home-page` | no (correct) |
| `manufacture-home-page` | no (correct) |
| `character-selection-page` | no (correct) |
| `login-page` / `login-callback-page` | no (correct) |
| `model-strip-page` / `color-table-page` | no (correct) |
| `v1-blueprint-by-location-page` | yes (`v1-`) — **incorrect for a page** |

So page naming is **inconsistent**: one feature page was versioned by mistake; the rest match the intended unversioned page rule.

### Expected

**Page hosts SHALL NOT carry a** `vn-` **version prefix** on selector / folder / class. Use unversioned `*-page` names (e.g. `dashboard-home-page`, `character-selection-page`, `blueprint-by-location-page`). Versionability stays on panels/renders (`v1-…-render`, `v1-…-panel`), not on pages.

Prep clarifications for L1 (do not invent beyond this defect until authored):

- Apply to **all** `*-page` **hosts** under the page register (feature, auth, and support pages alike).
- Shell-only hosts such as `app-page-header` remain unversioned (unchanged).
- Migrate the outlier: `v1-blueprint-by-location-page` → `blueprint-by-location-page` (and matching folder / class / short name without `v1-`).
- After rename, DEF-IB-003 `cy-section-name` derivation uses the unversioned selector (strip final `page` → e.g. `blueprint-by-location`).
- Route **URL paths** stay stable (`/industry/blueprints-by-location`, `/dashboard`, …) unless a later requirement says otherwise.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) **UI-VER-004**; [`10.EPIC-INDUSTRY-BLUEPRINTS.md`](../sources/L1/10.EPIC-INDUSTRY-BLUEPRINTS.md) Section 04 page short name / selector | UI-VER: pages unversioned; EPIC-010: drop `v1-` from page name (panels/renders keep `vn-`) |
| OpenSpec | `front-industry-blueprints` (page rename); shell only if any page was wrongly versioned | Delta + rename tasks; keep URL paths |
| Code | Rename `v1-blueprint-by-location-page` → `blueprint-by-location-page`; update imports/tests | Prefer keep URL paths stable |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and applies the flow through OpenSpec
- [x] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Validated 2026-11-06 — moved to FIXED-DEFECTS.md

Earlier prep wrongly proposed versioning all pages to match industry. **Correct direction is the opposite:** strip `v1-` from the industry **page** host; leave most pages as they are. Domain-bound panels/renders on that page stay versioned.

2026-11-05 `/fix:defect`: `blueprint-by-location-page` already unversioned on tip; L1 UI-VER-004 extracted. Status applying — validate then `/defect:fixed`.

---

## DEF-IB-005 — Header app-info / server-info row width and responsive stack

| Field | Value |
| --- | --- |
| Status | `fixed` |
| Severity | Layout / responsive gap (header first line does not use full page width correctly) |
| Surfaces | `app-page-header` first line: `v1-application-info-render` + `v1-server-status-render` (via `standalone-node-panel`); global `.row` / render `:host` flex |
| Found on | Dashboard (and any `-APP-` secured page with the same header) |
| Branch tip | `neocom-front` `feature/industry-blueprints` |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) **UI-HDR-011** Review `[ ]` — check to `[x]` when ready for `/epic:extract` |

### Observed

On the dashboard (and other `-APP-` pages), the **first header line** hosts application-info and server-info side by side inside `app-page-header` (`class="row section page-header"`).

Current flex behaviour does **not** match the intended chrome:

| Piece | Current | Problem |
| --- | --- | --- |
| Header `.row` | `width: 100%`, `flex-wrap: nowrap` (`geometry.scss`) | Row is full width, but children never wrap when space is tight |
| `v1-application-info-render` `:host` | `flex-grow: 4` | Grows, but not explicitly “remaining space after server” |
| `v1-server-status-render` `:host` | `flex: 1`; inner panel `width: 100%` | Server **shares** row flex instead of sizing to its **content** and sitting on the **right** |
| Narrow viewports | `nowrap` | Panels stay side-by-side and compress; they do **not** stack (app above server) |

Result: the pair does not clearly span the page as “app fills remainder + server content-width on the right”, and there is no fallback stack when horizontal space is insufficient.

### Expected

The header first line (app-info + server-info on `-APP-`) SHALL:

1. **Span the complete width** of the page / header band.
2. Place **server-info on the right**, sized to the **space its contents require** (content-sized / `flex: 0 0 auto` or equivalent — not an equal flex share).
3. Place **app-info on the left**, using the **remaining** horizontal space.
4. When there is **not enough** horizontal space for that arrangement, **stack** vertically: **app-info on top**, **server-info below** (each then full width of the band).

`-AUTH-` (app-info only) is unchanged: single panel still full width of the header band.

Prep clarifications for L1 (do not invent beyond this defect until authored):

- Owner is `**app-page-header` layout** (and/or the two render hosts’ flex contract), not page-specific dashboard CSS.
- “Not enough space” may be implemented via wrap + min-widths, a CSS breakpoint, or `flex-wrap` with full-width children when wrapped — L1 should state the behaviour, not a specific breakpoint px value, unless the user sets one.
- Panel chrome / field Appearance (UI-AIP / UI-SSP) stay as-is; this defect is **row geometry** only.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) — Common header (UI-HDR-*) and/or UI-AIP / UI-SSP | Add layout row requirement (suggested `UI-HDR-010` or `UI-HDR-011` if 010 used by DEF-IB-002 naming); leave Appearance rows intact |
| OpenSpec | `front-dashboard-shell` → `front/page-header` (or small fix change) | Delta: full-width band; server content-right; app fill; stack when narrow |
| Code | `page-header.component.scss` (facade today); `v1-application-info-render` / `v1-server-status-render` `:host` flex; optionally `.row--wrap` / header-specific modifier | Avoid breaking other `.row` consumers; prefer header-scoped rules |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and applies the flow through OpenSpec
- [x] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Validated 2026-11-06 — moved to FIXED-DEFECTS.md

Related to UI-HDR-003 / UI-AIP-005 / UI-SSP (both panels on `-APP-`). Found while validating dashboard chrome on the industry-blueprints stack tip; root cause is header row flex, not Blueprint Availability.

2026-11-05 `/fix:defect`: `app-page-header` SCSS already full-width / server content-right / stack @720px; render hosts width-aligned. Status applying — validate responsive then `/defect:fixed`.

---

## DEF-IB-006 — Pilot row spacing must use default panel gap

| Field | Value |
| --- | --- |
| Status | `fixed` |
| Severity | Layout / spacing inconsistency (pilot row uses ad-hoc `0.75rem` instead of programme panel gap) |
| Surfaces | Dashboard pilot & corporation row; `app-page-header` sibling spacing; shared panel tokens (`$panel-margin` / `$panel-padding`) |
| Found on | Dashboard first content after header (`v1-pilot-panel` + `v1-corporation-panel`) |
| Branch tip | `neocom-front` `feature/industry-blueprints` |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) **UI-GEO-001** + **UI-DASH-015** Review `[ ]` — check to `[x]` when ready for `/epic:extract` |

### Observed

The **pilot panel** sits in a second dashboard band under `app-page-header`. That band is visually **too far** from the header first line (app-info / server-info).

Current dashboard styles (`dashboard-home-page.component.scss` → `.pilot-corporation-row`) apply:

| Property | Current value | Effect |
| --- | --- | --- |
| `padding` | `0.75rem` | Large inset from the page edge and from the header above |
| `gap` | `0.75rem` | Large separation between pilot and corporation |

Meanwhile the programme’s **default panel / application gap** in common styles is the token pair in `styles/_tokens.scss`:

- `$panel-margin: 2px`
- `$panel-padding: 2px`

and the app-info render already uses a `**2px**` right margin toward server-info (`v1-application-info-render` `:host { margin-right: 2px }`). Geometry classes themselves use **zero** gap (`geometry.scss`); panel separation is meant to come from that panel token, not from page-local `0.75rem`.

So spacing is inconsistent: header panels use ~`2px`; the pilot row invents a larger gutter and also pads the whole band away from the header and the page border.

### Expected

All of the following separations SHALL use the **same predefined default application / panel gap** from common styles (today: `**$panel-margin` / `$panel-padding` → `2px`**, or the CSS variable equivalent when one is published):

1. **Vertical** gap between the **header first line** (app-info / server-info) and the **pilot panel** (pilot & corporation row) — minimal; only that default gap, not an extra page padding band.
2. **Horizontal** gap between **app-info** and **server-info** (same token — aligns with DEF-IB-005 row geometry).
3. **Inset from the page / band border** around these panels — same as the app-info panel’s border separation (panel margin), not a larger local padding.
4. **Horizontal** gap between the **pilot panel** and the **corporation panel** — same predefined gap.

No inventing a second spacing scale on the dashboard page. If geometry stays flush (`gap: 0`), panels SHALL own the `2px` margin (or the row SHALL use the token as `gap` / edge inset consistently).

Prep clarifications for L1 (do not invent beyond this defect until authored):

- Token name in L1 should point at the common styles token (`$panel-margin` / programme “default panel gap”), not hard-code `0.75rem`.
- Breadcrumb / feature-list rows are **out of scope** unless the user later says they must share the same rule; this defect is header → pilot/corporation chrome.
- Related to DEF-IB-005 (header row width/stack); spacing between app and server is the **same token**, not a separate invent.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) — Page geometry + UI-DASH / Pilot and corporation row | Add spacing rule: secured chrome panels use default panel gap for inter-panel and border inset |
| OpenSpec | `front-dashboard-shell` (`front/dashboard`, `front/page-header`) | Delta: remove `0.75rem` pilot-row padding/gap; use `$panel-margin` |
| Code | `dashboard-home-page.component.scss` (drop/replace `0.75rem`); ensure header row + renders use the same token; optionally publish `--neo-panel-margin` if not already | Keep Appearance chrome intact |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and applies the flow through OpenSpec
- [x] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Validated 2026-11-06 — moved to FIXED-DEFECTS.md

Found while validating dashboard chrome after DEF-IB-005. Root cause is **page-local spacing** on `.pilot-corporation-row`, not pilot/corporation Appearance content.

2026-11-05 `/fix:defect`: dashboard pilot row already uses `$panel-margin` / `$panel-padding`; L1 UI-GEO-001 + UI-DASH-015 extracted. Status applying — validate spacing then `/defect:fixed`.

---

## DEF-IB-008 — Breadcrumb: small Elemental in full-width white panel

| Field | Value |
| --- | --- |
| Status | `fixed` |
| Severity | Appearance / layout gap (breadcrumb typography, chrome, width, and neighbour spacing undefined / wrong) |
| Surfaces | `app-breadcrumb` on Dashboard and secured feature pages |
| Found on | Dashboard breadcrumb row (and same host on Industry / Manufacture pages) |
| Branch tip | `neocom-front` `feature/industry-blueprints` |

### Observed

Breadcrumb **Appearance is not defined** in L1 beyond navigable links (UI-DASH-008 / UI-DASH-010; epic text: “Detailed breadcrumb component behaviour … MAY be refined later”).

Current implementation:

| Aspect | Current | Problem |
| --- | --- | --- |
| Typography | Open Sans 12px (`app-breadcrumb.component.scss`) | Not programme **Elemental** |
| Chrome | Bare `<nav class="section row breadcrumb">` — no `neocom-panel` / `panel-white` | Not encased in a white NeoCom panel |
| Width | Row may not read as a full page-width band | Should span **all page width** |
| Spacing | Local padding (`0.5rem 0.75rem`) and page gaps leave separation from neighbours | Should have **no separation** from the **previous** panel (pilot/corporation row) **nor** the **next** panel (feature list) |

### Expected

1. **Typography:** crumb text SHALL use **Elemental** in a **small** size (same family as app name/version chrome, smaller than title sizes).
2. **Chrome:** the breadcrumb SHALL be **encased** in a `**neocom-panel panel-white`** (white NeoCom panel).
3. **Width:** the panel SHALL span the **full page width**.
4. **Neighbour spacing:** there SHALL be **no separation** (extra gap / margin) between this breadcrumb panel and the **previous** panel band, and **no separation** between it and the **next** panel band. Flush stacking — only the shared default panel gap token applies if panels themselves own `$panel-margin` (see DEF-IB-006); do not add an extra gutter around the breadcrumb band.

Prep clarifications for L1 (do not invent beyond this defect until authored):

- Face: **Elemental** (not Open Sans); size: **small** Elemental — exact px MAY be authored in L1.
- Colour / link / current / separator styling MAY stay until separately specified; this defect covers **font**, **white panel chrome**, **full width**, and **flush to previous/next**.
- “No separation” means no extra page/band gutter above or below the breadcrumb panel relative to its neighbours; panel border chrome itself remains.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) — Breadcrumb row / UI-DASH-* | Add Appearance: Elemental small; `neocom-panel panel-white`; full width; flush to previous/next |
| OpenSpec | `front-dashboard-shell` (breadcrumb / dashboard capability) | Delta: typography + white panel + width + flush stacking |
| Code | `app-breadcrumb.component.html` / `.scss`; dashboard (and feature) page stacking | Add `neocom-panel panel-white`; Elemental small; width 100%; remove extra gutters vs pilot row / feature list |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and applies the flow through OpenSpec
- [x] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Validated 2026-11-06 — moved to FIXED-DEFECTS.md

L1 already deferred detailed breadcrumb styling; this defect **supplies** the missing Appearance (type + chrome + layout) rather than contradicting an existing row. Related to DEF-IB-006 (shared gap token).

2026-11-05 `/fix:defect`: breadcrumb now `neocom-panel panel-white`, Elemental 12px, full width, `$panel-margin` flush. Status applying — validate Appearance then `/defect:fixed`.

---

## DEF-IB-009 — Feature list flex layout + icon/name Appearance

| Field | Value |
| --- | --- |
| Status | `fixed` |
| Severity | Appearance / layout gap (feature list distribution and feature-button chrome undefined / wrong) |
| Surfaces | `feature-list-panel` + `v1-feature-button` (legacy) on Dashboard and feature dashboards |
| Found on | Dashboard feature list row |
| Branch tip | `neocom-front` `feature/industry-blueprints` |

### Observed

Feature list **layout Appearance** is not specified beyond “listing panel + feature render” (UI-DASH-004 / Feature list row). Live UI:

| Aspect | Current | Problem |
| --- | --- | --- |
| Distribution | `.feature-list` is a wrapping flex row with `gap: 0.75rem` and padding; slots pack from the start | Not a balanced flex presentation across the page width |
| Icon | `.neocom-icon` has size/object-fit only; hover border on `.feature-box` is blue | Icons lack a **fine white** border |
| Feature name | `.feature-label` is 12px uppercase bold — no Elemental, no white colour | Name should be **small Elemental**, **white** |

### Expected

1. **Flex presentation** of feature slots across the band width:
   - **One** feature → **centered** on the width.
   - **Two** features → equally separated from **each other** and from the **left/right borders** (symmetric gutters).
   - **More** → same rule generalised: even distribution with equal space between items and equal space to the band edges (e.g. `justify-content: space-evenly` or equivalent).
2. **Icons** SHALL be bordered with a **fine white line**.
3. **Feature name** SHALL use **small Elemental** font in **white** colour.

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and applies the flow through OpenSpec
- [x] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Validated 2026-11-06 — moved to FIXED-DEFECTS.md

Not in this L1 batch (prep Author L1 still unchecked). Distinct from DEF-IB-008 (breadcrumb).

2026-11-05 `/fix:defect`: feature-list `justify-content: space-evenly` + token gap; feature-button fine white icon border + Elemental white label. Status applying — validate then `/defect:fixed`.

---

