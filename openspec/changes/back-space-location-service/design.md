# Design

## Approach

- Keep applied lookup path (`GET …/spacelocations/{locationId}`) as the inbound face; deepen catalog behind `GetSpaceLocationUseCase` → `LocationCatalog`
- Public ids: ESI Universe by range (region < 20M, constellation < 30M, system < 40M, station < 61M)
- Structures: official ESI structures API; access cookie when ESI requires auth; 401 when cookie missing/invalid for those ranges
- Redis keyed by location id: hit → complete `SpaceLocation`; miss → ESI then write-through including ancestor ids
- No `InMemoryLocationCatalog`; tests preload Redis (or the Redis-backed adapter)
- Other use cases compose `GetSpaceLocationUseCase` (already assumed by `back-blueprint-list-processing`)

## Decisions

| Topic | Decision |
| --- | --- |
| Layout | Hexagonal under `neocom-back`: controller → use case → port → ESI / Redis adapters |
| Absence | Catalog signals absence without throw; use case → `LOCATION_NOT_FOUND` (HTTP 404) |
| Redis down | Still build from ESI; no required preloaded list (LOC-134) |
| Wire shape | `domain-locations` names (`solarSystemId` / `solarSystemName`, `locationType`, `jsonClass`); no HAL on body |
| Fallback | Adam4EVE (and similar) = evaluate only (LOC-142); ESI remains primary |
| Delivery | Prefer `feature/space-location-service` from `develop` in `neocom-back` |

## Risks

- Structure ESI auth and cookie plumbing must align with existing login cookie contract
- Hierarchy write-through can amplify ESI calls on cold cache; Redis hit path must dominate after warm
- LOC-142 evaluation may conclude no third-party adapter — keep production path ESI-only until recorded
