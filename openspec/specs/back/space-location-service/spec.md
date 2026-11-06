# back/space-location-service Specification

## Purpose
NestJS space-location application service (BACK-229). Sources: LOC-130…142 in . Lookup HTTP path remains as applied `back-spacelocations` (LOC-010); this capability owns catalog resolve, ESI, Redis, and compose rules.

## Requirements

### Requirement: Space-location application service

The NestJS backend SHALL expose a space-location application service that resolves a location id to a `SpaceLocation` (`GetSpaceLocationUseCase` over the `LocationCatalog` port), preserving the infinity facade → catalog split (LOC-130).

#### Scenario: Resolve by location id

- **WHEN** a client or another use case requests a location by id through the application service
- **THEN** resolution runs through `GetSpaceLocationUseCase` over the `LocationCatalog` port and returns a `SpaceLocation`

### Requirement: Public ESI resolve by id range

Public (non-structure) resolution SHALL build the ancestor chain from ESI Universe endpoints selected by id range (region < 20M, constellation < 30M, system < 40M, station < 61M), matching `LocationFactory` (LOC-131).

#### Scenario: Public id uses range-selected ESI

- **WHEN** the location id falls in a public range
- **THEN** the catalog builds the ancestor chain from the ESI Universe endpoint for that range

### Requirement: Structure resolve via ESI structures API

Game and public structures SHALL resolve via the official ESI Universe structures API (`getUniverseStructuresStructureId` / equivalent), then the system → constellation → region chain. When ESI requires authentication, use the request access cookie (LOC-135). Structure results SHALL follow the complete payload and Redis hierarchy write-through rules (LOC-132, LOC-141).

#### Scenario: Structure id resolves through ESI then chain

- **WHEN** the location id is a game or public structure
- **THEN** the catalog calls the ESI structures API and then builds the system → constellation → region chain

### Requirement: Absence maps to not found

The catalog port SHALL signal absence without throwing; the use case SHALL map absence to `LOCATION_NOT_FOUND` (HTTP 404). The Nest use case SHALL NOT propagate Java `null` (LOC-133).

#### Scenario: Unknown id returns 404

- **WHEN** the catalog signals that the location id is absent
- **THEN** the HTTP response is `LOCATION_NOT_FOUND` with status 404

### Requirement: Cache adapter and Redis downtime

Location storage/cache SHALL be an injectable adapter behind the catalog; when Redis is inactive or unavailable, lookups SHALL still build from ESI and SHALL NOT require a preloaded list (LOC-134).

#### Scenario: Resolve without Redis

- **WHEN** Redis is inactive or unavailable
- **THEN** a lookup still builds the location from ESI without requiring a preloaded list

### Requirement: Access cookie for authenticated structure ESI

Front requests carry authentication in the access cookie (implicit on the request — not a separate API parameter). When the location id range requires authenticated ESI (structure path) and the cookie is missing or invalid, the backend SHALL return HTTP 401 UNAUTHORIZED; the front SHALL treat that as a signal to return to login and obtain a new valid authentication. Public (unauthenticated) id ranges do not require a valid cookie for resolution (LOC-135).

#### Scenario: Missing cookie on authenticated structure range

- **WHEN** a structure resolve needs authenticated ESI and the access cookie is missing or invalid
- **THEN** the backend returns HTTP 401 UNAUTHORIZED

#### Scenario: Public range without cookie

- **WHEN** the location id is in a public unauthenticated range
- **THEN** resolution proceeds without requiring a valid access cookie

### Requirement: Hexagonal Nest layout

Nest implementation SHALL follow hexagonal layout: inbound controller, use case, domain port, outbound ESI and Redis cache adapters under `neocom-back`; no Guice / `neocom-datamanagement` runtime dependency (LOC-136).

#### Scenario: No Guice datamanagement at runtime

- **WHEN** the space-location service runs in Nest
- **THEN** adapters live under `neocom-back` and do not depend on Guice or `neocom-datamanagement` at runtime

### Requirement: ESI plus Redis only; remove in-memory catalog

Catalog runtime SHALL use ESI resolve + Redis persistence only. `InMemoryLocationCatalog` SHALL be removed. Tests SHALL preload locations into Redis (or the Redis-backed adapter) rather than a separate in-memory map (LOC-137; closes DEF-BLP-001).

#### Scenario: No in-memory catalog at runtime

- **WHEN** the catalog is wired for runtime or tests
- **THEN** there is no `InMemoryLocationCatalog`; tests preload Redis or the Redis-backed adapter

### Requirement: Compose shared space-location use case

Other Nest use cases that need a place SHALL compose `GetSpaceLocationUseCase` (or the shared catalog port) and SHALL NOT copy id-range / ESI factory logic (LOC-138).

#### Scenario: Consumer reuses use case

- **WHEN** another Nest use case needs a space location
- **THEN** it invokes `GetSpaceLocationUseCase` (or the shared catalog port) instead of reimplementing id-range or ESI factory logic

### Requirement: Domain field names without HAL

Wire and domain shapes SHALL keep EPIC-008 / `domain-locations` field names (`solarSystemId` / `solarSystemName`, `locationType`, `jsonClass`); the location body SHALL NOT include HAL links (LOC-139).

#### Scenario: Response uses domain location field names

- **WHEN** a SpaceLocation is returned on the wire
- **THEN** it uses `solarSystemId` / `solarSystemName`, `locationType`, and `jsonClass` as applicable and does not include HAL links on the location body

### Requirement: Redis write-through by location id

Resolved space locations SHALL be stored in Redis keyed by location id: on hit return the cached complete `SpaceLocation`; on miss build from ESI, then write through to Redis. Public region/constellation/system/station entries are treated as long-lived. Redis uses the existing `neocom-back` `REDIS_URL`. Cache miss and Redis downtime MUST still satisfy the ESI-without-preload rule (LOC-140, LOC-134).

#### Scenario: Cache hit returns complete location

- **WHEN** Redis holds a complete SpaceLocation for the requested id
- **THEN** the service returns that cached payload without a new ESI build

#### Scenario: Cache miss writes through

- **WHEN** Redis misses for the requested id
- **THEN** the service builds from ESI and writes the complete SpaceLocation through to Redis

### Requirement: Complete payload and hierarchy cache

Location resolution SHALL return a complete `SpaceLocation`: `locationType`, `locationId`, `jsonClass`, and every ancestor/kind field required for that type (LOC-001–002). The Redis entry for that id SHALL be that same complete payload. When writing through after a resolve, hierarchy dependencies SHALL also be resolved and stored under their own location ids so later ancestor lookups can hit Redis without a second ESI build (LOC-141).

#### Scenario: Station resolve caches ancestors

- **WHEN** a station (or deeper) location is resolved and written through
- **THEN** Redis also stores the solar system, constellation, and region entries under their own location ids

### Requirement: Evaluate external structure fallback

When the official ESI structures API fails for a structure id (error, empty, or inaccessible), the programme SHALL evaluate external structure information sources — at minimum Adam4EVE Structure Search — as a fallback. Evaluation SHALL cover access method, ToS/licensing, data completeness vs ESI, mapping into `SpaceLocation`, and whether a Nest outbound adapter is justified. A third-party source SHALL NOT be wired into production until that evaluation is recorded; ESI remains the primary path (LOC-142, LOC-132).

#### Scenario: ESI structure failure triggers evaluation, not silent third-party wire

- **WHEN** the ESI structures API fails for a structure id
- **THEN** the programme records an evaluation of external sources (including Adam4EVE Structure Search) and does not put a third-party adapter into production until that evaluation is recorded
