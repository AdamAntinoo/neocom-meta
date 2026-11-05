# Back — space location service (EPIC-008 / BACK-229)

<!-- L2-STATUS: placed -->

| Field | Value |
| --- | --- |
| Status | 📌 `placed` |
| Kind | placed |
| Epic | EPIC-008 |
| OpenSpec | `back-space-location-service` |
| Unregistered | 0 |
| Next | See `openspec/CHANGE-STATUS.md` |
| Index | [`L2/INDEX.md`](../INDEX.md) |

System: `back`. Feature: `space-location-service`.  
OpenSpec: `openspec/changes/back-space-location-service/specs/back/space-location-service/spec.md`.  
Source extract: `L2/08.EPIC-LOCATIONS.space-location-service.md` (Section 15).  
Related applied: `back-spacelocations` (LOC-010 endpoint only); `domain-locations` (field names).

| ID | Status | Requirement |
| --- | --- | --- |
| LOC-130 | registered | The NestJS backend SHALL expose a space-location application service that resolves a location id to a `SpaceLocation` (`GetSpaceLocationUseCase` over the `LocationCatalog` port), preserving the infinity facade → catalog split |
| LOC-131 | registered | Public (non-structure) resolution SHALL build the ancestor chain from ESI Universe endpoints selected by id range (region < 20M, constellation < 30M, system < 40M, station < 61M), matching `LocationFactory` |
| LOC-132 | registered | **Game and public structures** SHALL resolve via the official ESI Universe **structures** API (`getUniverseStructuresStructureId` / equivalent), then the system → constellation → region chain. When ESI requires authentication, use the request access cookie (LOC-135). Structure results follow LOC-141 (complete payload + Redis hierarchy write-through) |
| LOC-133 | registered | The catalog port SHALL signal absence without throwing; the use case SHALL map absence to `LOCATION_NOT_FOUND` (HTTP 404). Do not propagate Java `null` from the Nest use case |
| LOC-134 | registered | Location storage/cache SHALL be an injectable adapter behind the catalog; when Redis is inactive or unavailable, lookups SHALL still build from ESI and SHALL NOT require a preloaded list |
| LOC-135 | registered | Front requests carry authentication in the access **cookie** (implicit on the request — not a separate API parameter). When the location id range requires authenticated ESI (LOC-132) and the cookie is missing or invalid, the backend SHALL return standard **HTTP 401 UNAUTHORIZED**; the front SHALL treat that as a signal to return to login and obtain a new valid authentication. Public (unauthenticated) id ranges (LOC-131) do not require a valid cookie for resolution |
| LOC-136 | registered | Nest implementation SHALL follow hexagonal layout: inbound controller, use case, domain port, outbound ESI and Redis cache adapters under `neocom-back`; no Guice / `neocom-datamanagement` runtime dependency |
| LOC-137 | registered | Catalog runtime SHALL use ESI resolve + Redis persistence only. **`InMemoryLocationCatalog` SHALL be removed** — it is not usable for real ids and is prone to silent misses. Tests SHALL preload locations into Redis (or the Redis-backed adapter) rather than a separate in-memory map (closes DEF-BLP-001) |
| LOC-138 | registered | Other Nest use cases that need a place SHALL compose `GetSpaceLocationUseCase` (or the shared catalog port) and SHALL NOT copy id-range / ESI factory logic |
| LOC-139 | registered | Wire and domain shapes SHALL keep EPIC-008 / `domain-locations` field names (`solarSystemId` / `solarSystemName`, `locationType`, `jsonClass`); no HAL links for the location body |
| LOC-140 | registered | Resolved space locations SHALL be stored in a **Redis** database keyed by location id: on hit return the cached complete `SpaceLocation` (LOC-141); on miss build from ESI (LOC-131/132), then write through to Redis. Public region/constellation/system/station entries are treated as long-lived (most never change). Redis uses the existing `neocom-back` `REDIS_URL` (tools/docker Redis). Cache miss path and Redis downtime MUST still satisfy LOC-134 |
| LOC-141 | registered | Location resolution SHALL return a **complete** `SpaceLocation`: `locationType`, `locationId`, `jsonClass`, and every ancestor/kind field required for that type (Sections 01–08 / LOC-001–002). The Redis entry for that id SHALL be that same complete payload. When writing through after a resolve, hierarchy dependencies SHALL also be resolved and stored under their own location ids (e.g. resolving a station also caches the solar system, constellation, and region entries), so later lookups by ancestor id can hit Redis without a second ESI build |
| LOC-142 | registered | When the official ESI structures API fails for a structure id (error, empty, or inaccessible), the programme SHALL **evaluate** external structure information sources — at minimum **Adam4EVE Structure Search** — as a fallback. Evaluation SHALL cover access method, ToS/licensing, data completeness vs ESI, mapping into `SpaceLocation` (LOC-141), and whether a Nest outbound adapter is justified. Do **not** wire a third-party source into production until that evaluation is recorded; ESI remains the primary path (LOC-132) |
