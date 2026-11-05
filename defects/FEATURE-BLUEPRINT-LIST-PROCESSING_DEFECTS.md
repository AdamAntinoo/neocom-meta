# Defects — `feature/blueprint-list-processing`

Register of defects found while validating the current implementation on `feature/blueprint-list-processing` (primarily `neocom-back`). This file is the **intake log** only until a defect is promoted into the OpenSpec / epic flow.

Related OpenSpec (applying): [`back-blueprint-list-processing`](../openspec/changes/back-blueprint-list-processing/), [`front-blueprint-list-processing`](../openspec/changes/front-blueprint-list-processing/) (registered).  
Related epics: [EPIC-011](../sources/L1/11.EPIC-BLUEPRINT-LIST-PROCESSING.md), [EPIC-008](../sources/L1/08.EPIC-LOCATIONS.md) (spacelocation / catalog).

## Contents

- [Register](#register)
- [DEF-BLP-001 — Location lookup uses InMemoryLocationCatalog mock instead of ESI](#def-blp-001--location-lookup-uses-inmemorylocationcatalog-mock-instead-of-esi)

## How defects resolve (intended programme flow)

1. **Record here** — `/defect`; status `open` (or `prep`).
2. **Register the spec on the epic** — author or amend the L1 requirement on the owning epic with Review `[ ] to review`. Prefer **not** inventing behaviour beyond what the defect states.
3. **Mark to run the process** (developer, manual) — checking that mark sets Review to `[x] reviewed` and authorizes `/fix:defect`.
4. `/fix:defect` — list defects + actions; wait for go-ahead; then implement Expected. Status `applying`. No commit.
5. **Developer validates** the product fix — then `/defect:fixed DEF-…` moves the defect (same row + section) to [`FIXED-DEFECTS.md`](./FIXED-DEFECTS.md) and removes it from this page.

Statuses: `open` · `prep` · `in openspec` · `applying` · `fixed` · `closed` · `wontfix`.

---

## Register

| ID | Title | Status | Owning epic / capability | OpenSpec (when known) | Found |
| --- | --- | --- | --- | --- | --- |
| DEF-BLP-001 | Location lookup uses InMemoryLocationCatalog mock instead of ESI | `open` | EPIC-011 · BLP location / EPIC-008 spacelocation | TBD — amend `back-blueprint-list-processing` and/or `back-spacelocations` | 2026-11-04 |

---

## DEF-BLP-001 — Location lookup uses InMemoryLocationCatalog mock instead of ESI

| Field | Value |
| --- | --- |
| Status | `open` |
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
| L2 | `BACK/BACK-BLUEPRINT-LIST-PROCESSING` / spacelocations | TBD after L1 |
| OpenSpec | `back-blueprint-list-processing` · `back-spacelocations` | Replace or supplement in-memory adapter |
| Code | `in-memory-location-catalog.adapter.ts`; `LocationCatalog` port binding in `spacelocation.module.ts`; `get-space-location.usecase.ts` | ESI-backed `LocationCatalog` implementation |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and applies the flow through OpenSpec
- [x] Developer validates the fix is resolved — mark this defect `fixed` / `closed`

### Notes

Found while debugging blueprint-list-processing DTO apply: sync blueprints return `locationId` from ESI but `location` stays null because catalog lookup never hits ESI.

---
