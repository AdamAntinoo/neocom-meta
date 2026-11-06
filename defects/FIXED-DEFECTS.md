# Fixed defects

Archive of defects whose product fix the developer has **validated**. Entries are **moved** here from `FEATURE-<stem>_DEFECTS.md` via `/defect:fixed`. Structure matches the open register (Register row + defect section).

## Contents

- [Register](#register)
- [DEF-BLP-001 — Location lookup uses InMemoryLocationCatalog mock instead of ESI](#def-blp-001-location-lookup-uses-inmemorylocationcatalog-mock-instead-of-esi)
- [DEF-BLP-006 — Dashboard feature catalog; move blueprint page; drop industry/manufacture homes](#def-blp-006-dashboard-feature-catalog-move-blueprint-page-drop-industry-manufacture-homes)

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

