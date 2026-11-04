# Proposal

## Why

EPIC-011 requires back interchange as **`neocom-back` `*Dto` classes** (not `neocom-domain`): ESI blueprint payloads become `BlueprintV1Dto` that embed catalog-resolved `SpaceLocationV1Dto` for front aggregation.

## What Changes

- Transform ESI character blueprints payload into **`BlueprintV1Dto`** on `neocom-back`
- Look up `location_id` in the location catalog → **`SpaceLocationV1Dto`**
- **`BlueprintV1Dto` contains** that `SpaceLocationV1Dto` instance
- Interchange types use the **`Dto` suffix** and live on **`neocom-back`**, not `neocom-domain`

## Capabilities

### New Capabilities

- `back/blueprint-list-processing` — ESI → `BlueprintV1Dto` + embedded `SpaceLocationV1Dto`

### Modified Capabilities

- (none required at main-spec path for this registration; may later MODIFY applied `back/industry-blueprints` response shape when archived)

## Impact

- Owner: **`neocom-back`**
- Branch: `feature/blueprint-list-processing` from `develop` (coordinate with front change of the same feature name)
- L2: `BACK/BACK-BLUEPRINT-LIST-PROCESSING.md`
- Depends on: applied `back-spacelocations` / location catalog; ESI blueprints access
- Front consumer: `front-blueprint-list-processing`
