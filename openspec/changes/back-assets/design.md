# Design

## Approach

- Treat ESI `GET /characters/{character_id}/assets` as the instance-row source; map each row into back `EveAssetV1Dto` (AST-006).
- Join personal names from ESI `POST /characters/{character_id}/assets/names` response objects `{ item_id, name }` by `item_id` onto `EveAssetV1Dto.name` (AST-005). Names request body shape and ESI literal `"None"` → omit vs store remain apply-time (L1 gaps).
- Always expand `type_id` into nested `item` as `PricedItemV1Dto` (EPIC-013); keep `typeId` alongside the nest (AST-003).
- When `location_type` is **not** `item` (e.g. `station`), expand `location_id` into nested `location` as `EveLocationV1Dto` (EPIC-012 §09); keep `locationId` alongside (AST-004).
- When `location_type` is `item`, do **not** expand into `EveLocationV1Dto`; keep `locationId` as the parent asset’s `item_id` and hang the child under that parent’s `LocatedAssetContainerV1Dto.contents` (AST-004, AST-012).
- `LocatedAssetContainerV1Dto` **is** an asset (EveAssetV1Dto field set) plus `contents` as a JSON array of nested asset / located-container objects (AST-010, AST-011).
- Owner on the wire is only `ownerPilotId` — no nested Pilot object (AST-001 / L1 field table).
- Authenticated programme HTTP: extend `V1PilotController`; new get-pilot-assets use case; new `PilotPort` entry for assets (AST-007…009). Suggested paths: `GET /v1/pilots/{pilotId}/assets` (full list) and `GET /v1/pilots/{pilotId}/assets/locations/{locationId}` (filter full list — AST-013).
- After obtain + expand, write-through Redis under `pilot/asset` key space, TTL **60 minutes**; hit returns cache; miss expands then writes; Redis down → still succeed from ESI (AST-014). By-location MAY filter a warm full-list cache.

## Decisions

| Topic | Decision |
| --- | --- |
| Owner | `neocom-back` interchange DTOs (`Dto` suffix); `PilotPort` entry may land in `neocom-domain` |
| Instance source | ESI character assets list + names join |
| Type expansion | Always → nested `PricedItemV1Dto` |
| Location expansion | Only when `locationType` ≠ `item` → nested `EveLocationV1Dto` |
| Asset-ref location | Parent is `LocatedAssetContainerV1Dto`; child in `contents` |
| Owner field | `ownerPilotId` only |
| Programme HTTP | Authenticated full list + by-location filter on `V1PilotController` |
| Port / UC | New `PilotPort` assets entry + new retrieve-assets use case |
| Redis | `pilot/asset` key space; TTL 60 minutes; write-through expanded EveAsset |
| Delivery branch | `feature/assets` from `develop` in `neocom-back` |

## Risks

- `EveLocationV1Dto` (EPIC-012 §09) may still be unregistered at apply time; use the L1-stated nest shape and do not invent location fields beyond that epic.
- ESI names POST body and `"None"` handling are apply-time decisions; do not invent beyond specimens in EPIC-014 §01.
- Exact Redis key string and nested-content match for by-location filter are apply-time (L1 gaps).
