# Tasks

- [x] Keep synchronous full-list path (`completeDowload` once list ready) (FASSE-001)
- [x] Implement front adapter: cache first, then HTTP, then SSE merge into panel (FASSE-002, FASSE-004, FASSE-007, FASSE-008)
- [x] Implement first-party adapter cache (session memory + optional longer retention) (FASSE-003, FASSE-010)
- [x] Wire SSE merge → `dataModelRoot` / `notifyDataChanged` in-place row refresh; support leave/return (FASSE-005)
- [x] Render delayed / not-ready nodes safely (`NeoComDelayed` / `isReady()`) (FASSE-007)
- [x] Add authenticated SSE client (EventSource or fetch-based) with RxJS bridge (FASSE-009)
- [x] Apply manufacture blueprint list + index enrichment example on the front (FASSE-006)
