# Tasks

- [x] Expose `GetSpaceLocationUseCase` over `LocationCatalog` (LOC-130); hexagonal inbound → use case → port → ESI/Redis adapters (LOC-136)
- [x] Public id-range ESI resolve matching LocationFactory ranges (LOC-131); structures via ESI structures API + cookie when required (LOC-132, LOC-135)
- [x] Map catalog absence to `LOCATION_NOT_FOUND` / HTTP 404 without propagating null (LOC-133); HTTP 401 when authenticated structure range lacks valid cookie (LOC-135)
- [x] Redis write-through keyed by location id with complete `SpaceLocation` + ancestor hierarchy cache (LOC-140, LOC-141); work when Redis inactive via ESI-only (LOC-134)
- [x] Remove `InMemoryLocationCatalog`; tests preload Redis / Redis-backed adapter (LOC-137 / DEF-BLP-001)
- [x] Keep wire/domain field names per `domain-locations`; no HAL links on location body (LOC-139)
- [x] Ensure other Nest use cases compose `GetSpaceLocationUseCase` / shared catalog port (LOC-138)
- [x] Record evaluation of external structure sources (Adam4EVE at minimum) without wiring production until decided (LOC-142)
