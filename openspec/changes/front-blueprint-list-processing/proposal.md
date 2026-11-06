# Proposal

## Why

EPIC-011 redesigns how `blueprint-by-location-panel` obtains and paints pilot blueprints: a shared local provider owns cache and NeoCom nodes. Front SSE is not ready for product integration (DEF-BLP-003), so the live path parks SSE and loads from back HTTP until an SSE PoC re-integrates.

## What Changes

- Introduce **`PilotBlueprintProviderService`** (`modules/services/`) as the local provider for all panels
- Per-pilot cache with **60-minute** ESI TTL; upsert merge by `id`; shared **`observeBlueprints`** stream (`shareReplay` / `refCount`) on the **HTTP** path while SSE is parked
- Front hierarchy nodes **`BlueprintNodeV1`** (+ Region/System `NeoCom` subclasses) and **`SpaceLocationNodeV1`** tied to blueprints
- Aggregate Region → System → Blueprint (cite EPIC-010 IND-BP-033 / 112…117), sort Regions by name, `notifyDataChanged`
- Supersede panel use of `NodeListAdapterService` SSE for this page when the provider lands
- **Amend 2026-11-06:** register BLP-031…034 — park front SSE; HTTP back endpoints; defer SSE approach A (DEF-BLP-003)

## Capabilities

### New Capabilities

- `front/blueprint-list-processing` — provider, cache, NeoCom nodes, aggregation, real-time Observable → panel

### Modified Capabilities

- (none at main-spec path yet; may later MODIFY applied `front/blueprint-by-location` feed rules when this change archives)

## Impact

- Owner: **`neocom-front`**
- Branch: prefer `feature/blueprint-list-processing` from `develop` (ask before stacking on `feature/industry-blueprints`)
- L2: `FRONT/21.BLUEPRINT-LIST-PROCESSING.md` (+ cleared EPIC-011 extract)
- Depends on: applied `front-node-render`, `front-async-sse`; back change `back-blueprint-list-processing` for `BlueprintV1Dto` / `SpaceLocationV1Dto` wire
- May deprecate parts of EPIC-010 §10 / `front-industry-blueprints` load path once applied
