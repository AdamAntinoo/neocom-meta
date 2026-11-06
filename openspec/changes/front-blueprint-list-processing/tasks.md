# Tasks

## Provider and cache

- [x] Add `PilotBlueprintProviderService` under `modules/services/` (BLP-009)
- [ ] Park front SSE on the blueprint product path; provider retrieves via back HTTP only (BLP-031, BLP-032 / DEF-BLP-003)
- [ ] BLP consumers use HTTP-backed provider path; no live front SSE (BLP-033)
- [ ] Defer SSE approach A / shareReplay real-time correctness to SSE PoC (BLP-034)
- [x] Cache list elements; upsert merge by `id` (BLP-012); HTTP cache source while SSE parked
- [x] Cache keyed by pilot; independent expiry; 60-minute TTL (BLP-024, BLP-025, BLP-011)
- [x] Expose elements only as `NeoCom` domain models (BLP-013)

## Stream → panel

- [x] `observeBlueprints(pilotId)` shared Observable with `shareReplay` / `refCount` (HTTP interim)
- [x] `blueprint-by-location-panel` starts from provider retrieval; no direct SSE (BLP-001, BLP-003)
- [x] On emission: re-aggregate / sort Regions / `notifyDataChanged` (BLP-022)
- [x] Deliver artefacts set; remove/supersede panel `NodeListAdapterService` SSE for this page

## NeoCom hierarchy and location

- [x] `BlueprintNodeV1` + Region/System `NeoCom` subclasses (BLP-007, BLP-008)
- [x] Map `SpaceLocationV1Dto` → `SpaceLocationNodeV1`; tie to blueprint; extract region/system ids (BLP-016, BLP-017)
- [x] Aggregate into Systems/Regions per IND-BP-033 / 112…115 / 117; sort Region roots by name; hand off to node render (BLP-004…006)
