# Tasks

## Provider and cache

- [ ] Add `PilotBlueprintProviderService` under `modules/services/` (BLP-009)
- [ ] Provider owns SSE management for pilot blueprints (BLP-002)
- [ ] Cache SSE/list elements; upsert merge by `id` (BLP-010, BLP-012)
- [ ] Cache keyed by pilot; independent expiry; 60-minute TTL (BLP-024, BLP-025, BLP-011)
- [ ] Expose elements only as `NeoCom` domain models (BLP-013)

## Stream → panel

- [ ] `observeBlueprints(pilotId)` shared Observable with `shareReplay` / `refCount` (BLP-021)
- [ ] `blueprint-by-location-panel` starts from provider retrieval; no direct SSE (BLP-001, BLP-003, BLP-021)
- [ ] On emission: re-aggregate / sort Regions / `notifyDataChanged` (BLP-022)
- [ ] Deliver artefacts set; remove/supersede panel `NodeListAdapterService` SSE for this page (BLP-023)

## NeoCom hierarchy and location

- [ ] `BlueprintNodeV1` + Region/System `NeoCom` subclasses (BLP-007, BLP-008)
- [ ] Map `SpaceLocationV1Dto` → `SpaceLocationNodeV1`; tie to blueprint; extract region/system ids (BLP-016, BLP-017)
- [ ] Aggregate into Systems/Regions per IND-BP-033 / 112…115 / 117; sort Region roots by name; hand off to node render (BLP-004…006)
