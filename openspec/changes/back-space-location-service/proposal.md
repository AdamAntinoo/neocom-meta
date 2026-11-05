# Proposal

## Why

Applied `back-spacelocations` covers only LOC-010 (HTTP lookup path). Runtime still uses `InMemoryLocationCatalog` (Amarr fixture), which fails real ids (DEF-BLP-001). EPIC-008 Section 15 / BACK-229 requires a Nest hexagonal space-location service: ESI resolve by id range, Redis write-through, structure ESI + auth cookie, and compose-from-use-case for other Nest flows.

## What Changes

- Register LOC-130…142: `GetSpaceLocationUseCase` over `LocationCatalog`, ESI public + structures resolution, Redis cache, 404/401 mapping, hexagonal adapters, remove `InMemoryLocationCatalog`, field-name parity with `domain-locations`, complete payload + hierarchy write-through, evaluate external structure fallback (no production wire until recorded)

## Capabilities

### New Capabilities

- `back/space-location-service` — Nest space-location application service (catalog + ESI + Redis)

### Modified Capabilities

- *(none at main-spec path yet; may later MODIFY applied `back/spacelocations` when this change archives if the endpoint implementation is replaced)*

## Impact

- Owner: **`neocom-back`**
- L2: `BACK/BACK-SPACE-LOCATION-SERVICE.md` (from `L2/08.EPIC-LOCATIONS.space-location-service.md`)
- Depends on: applied `domain-locations`, `back-spacelocations` (path), Redis via `REDIS_URL` / tools docker
- Unblocks: blueprint list location resolve (DEF-BLP-001 / BLP compose of `GetSpaceLocationUseCase`)
- LOC-142 is evaluation-only until a recorded decision; do not ship a third-party adapter in this change’s apply without that record
