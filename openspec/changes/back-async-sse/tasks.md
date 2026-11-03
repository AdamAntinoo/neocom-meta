# Tasks

<!-- REAPPLY 2026-11-03: integrated a6028c7 onto side/industry @ 2c14f3c (adapter restructure + Flyway/docker). Manufacture path kept as /v1/pilots/:pilotId/manufacture/* per BASSE-006 (not /industry — that collides with sync industry blueprints). Re-validate before PR. -->

- [ ] Add Nest `@Sse()` routes per list scope returning RxJS Observables (BASSE-001, BASSE-007)
- [ ] Implement list HTTP path: persistence → stale refresh / ESI miss → partial return + start background (BASSE-002, BASSE-003, BASSE-005)
- [ ] Add ORM persistence module for processed/calculated records + migrations in `neocom-back` (BASSE-008, BASSE-012)
- [ ] Add BullMQ + Redis workers for one-by-one enrichment; emit SSE on completion (BASSE-004, BASSE-009)
- [ ] Add Redis pub/sub (or BullMQ events) for multi-replica SSE fan-out (BASSE-010)
- [ ] Wire ESI (`@lgriffin/esi.ts`) on persistence miss into list/enrichment services (BASSE-011)
- [ ] Implement manufacture blueprint list + index enrichment example on the back (BASSE-006)
