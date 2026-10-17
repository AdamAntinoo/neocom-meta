# Tasks

- [x] Add Nest `@Sse()` routes per list scope returning RxJS Observables (BASSE-001, BASSE-007)
- [x] Implement list HTTP path: persistence → stale refresh / ESI miss → partial return + start background (BASSE-002, BASSE-003, BASSE-005)
- [x] Add ORM persistence module for processed/calculated records + migrations in `neocom-back` (BASSE-008, BASSE-012)
- [x] Add BullMQ + Redis workers for one-by-one enrichment; emit SSE on completion (BASSE-004, BASSE-009)
- [x] Add Redis pub/sub (or BullMQ events) for multi-replica SSE fan-out (BASSE-010)
- [x] Wire ESI (`@lgriffin/esi.ts`) on persistence miss into list/enrichment services (BASSE-011)
- [x] Implement manufacture blueprint list + index enrichment example on the back (BASSE-006)
