# Proposal

## Why

`neocom-back` needs a published interchange for **pilot-owned asset instances**: map ESI character asset rows (and personal names) into `EveAssetV1Dto`, expand type into nested `PricedItemV1Dto` and place into nested `EveLocationV1Dto` when the location is not another asset, and represent asset containers that hold nested contents as `LocatedAssetContainerV1Dto`. Authenticated programme HTTP exposes the full list and a by-location filter via the pilot controller / use case / `PilotPort`, with Redis write-through caching. Source: EPIC-014 (`14.EPIC-ASSETS.md`).

## What Changes

- Programme **EveAssetV1**: instanced item belonging to a Pilot on a location; raw ESI asset/type/location payloads stay server-internal (AST-001)
- Back defines `EveAssetV1Dto` with instance fields from ESI assets + optional personal name + `ownerPilotId` (AST-002, AST-005)
- ESI `type_id` expands into nested `item` as `PricedItemV1Dto` (AST-003; depends on EPIC-013 / `back-eve-items`)
- ESI `location_id` expands into nested `location` as `EveLocationV1Dto` when `location_type` is not an asset reference; when `location_type` is `item`, do not expand — use LocatedAssetContainerV1 (AST-004)
- Back get-assets obtains the character asset list from ESI `GET /characters/{character_id}/assets` and maps into `EveAssetV1Dto` / located containers; personal names from ESI `POST …/assets/names` (AST-005, AST-006)
- **LocatedAssetContainerV1** / `LocatedAssetContainerV1Dto`: an EveAssetV1 in a location that contains other assets; `contents` array of nested assets/containers (AST-010…012)
- Authenticated programme HTTP full list of assets; new use case; new `PilotPort` entry; extend `V1PilotController` (AST-007…009)
- Secondary authenticated by-location endpoint: filter full list to assets matching that location (AST-013)
- After obtain/expand, write-through cache expanded EveAsset in Redis under `pilot/asset` key space, TTL **60 minutes** (AST-014)

## Capabilities

### New Capabilities

- `back/assets`: EveAssetV1Dto / LocatedAssetContainerV1Dto interchange, ESI get-assets + names join, type/location expansions, container nesting, authenticated pilot HTTP (full + by-location), PilotPort + use case, Redis TTL 60m

### Modified Capabilities

- *(none)*

## Impact

- Owner: **`neocom-back`** (also `PilotPort` signature on **`neocom-domain`** when the port entry is published there)
- Nested `PricedItemV1Dto` owned by EPIC-013 / `back-eve-items`; nested `EveLocationV1Dto` owned by EPIC-012 §09 (compose shape only as stated)
- Out of scope for this change: ShippingYardLocation (LOC-080 still `to review`); inventing ESI names request body or `"None"` name mapping beyond L1 gaps; exact Redis key string beyond `pilot/asset` key space
