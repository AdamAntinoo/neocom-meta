# Proposal

## Why

Pilots need a dashboard Feature and page that browse belongings by region and system (plus unidentified places), consuming the delivered `GET /v1/pilots/{pilotId}/assets` feed — parallel to blueprint-by-location, with a dedicated asset leaf Appearance.

## What Changes

- Dashboard Feature for **assets by location** (interim Blueprint Availability icon; dedicated assets icon later)
- New **`pilot` Angular module** hosting **assets-by-location** page at `/pilot/assets-by-location`, with `v1-pilot-panel` / `v1-corporation-panel` moved into that module
- Front aggregation: complete assets list → Region / Unidentified roots → System → Asset / AssetContainer (`contents` expand); place info from spacelocations service keyed by `locationId`
- Asset leaf render **`v1-asset-render`** (`EveAssetV1`) with model-strip specimen and locked value/volume rules

## Capabilities

### New Capabilities

- `front/assets-by-location`: Dashboard Feature, pilot module + page, hierarchy aggregation/feed, and `v1-asset-render` leaf Appearance (FAL-001…003, 010…015, 020…037)

### Modified Capabilities

- (none)

## Impact

- Owner: **`neocom-front`**
- Branch: `feature/assets-by-location` from `develop`
- L1: `sources/L1/15.EPIC-FRONT-PAGE-ASSETS-BY-LOCATION.md` (EPIC-015)
- Depends on: applying/applied `back-assets` (pilot assets HTTP); universe spacelocations lookup already delivered; reuse `v1-region-render` / `v1-system-render`
- Out of scope: inventing Unidentified-location icon drawable; back assets endpoint (already `back-assets`); dedicated final Feature icon (interim jpeg only)
