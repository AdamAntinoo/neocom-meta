# Tasks

## Feature entry

- [x] Add Dashboard Feature for assets by location (`PAGEROUTE` → assets-by-location page) (FAL-001, FAL-003)
- [x] Set interim Feature `imageRef` to `/media/blueprints-feature.jpeg` (FAL-002)

## Pilot module and page

- [x] Introduce/extend `pilot` Angular module with lazy `/pilot` routes (FAL-014)
- [x] Move `v1-pilot-panel` and `v1-corporation-panel` into `pilot`; keep secured Pilot & corporation row composition (FAL-015)
- [x] Provide `assets-by-location-page` at `/pilot/assets-by-location` with `app-page-header` + secured chrome (FAL-010, FAL-011)
- [x] Host panel for Region / Unidentified → System → Asset/Container hierarchy; reuse `v1-region-render` / `v1-system-render` (FAL-012, FAL-013)

## Feed and aggregation

- [x] Load complete selected-pilot asset list from `GET /v1/pilots/{pilotId}/assets` before aggregation (FAL-020, FAL-029)
- [x] Aggregate by `locationId`; optional nullify nested `location` after id taken (FAL-021, FAL-033)
- [x] Resolve new place ids via location service → `GET /api/v1/universe/spacelocations/{locationId}` (FAL-034, FAL-035)
- [x] Unidentified location roots when no usable region/system chain; render similar to Region/System with id + count; icon deferred (FAL-022…025)
- [x] Asset containers as hierarchy under place; expand shows `contents` (recursive) (FAL-026…028, FAL-032)

## Asset leaf render

- [x] Paint leaves with `v1-asset-render` / `EveAssetV1` against delivered wire model (FAL-030, FAL-031)
- [x] ITEM VALUE = `item.sellPrice`; TOTAL VALUE = item value × `quantity`; VOLUME = `item.volume` × `quantity` (FAL-036, FAL-037)
- [x] Keep model-strip specimen `v1-asset` and Appearance PNG `media/v1-asset-render.png` aligned
