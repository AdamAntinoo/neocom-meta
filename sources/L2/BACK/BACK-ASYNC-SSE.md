# Back async / SSE enrichment

<!-- L2-STATUS: placed -->

| Field | Value |
| --- | --- |
| Status | 📌 `placed` |
| Kind | placed |
| Epic | — |
| OpenSpec | `back-async-sse` |
| Unregistered | 0 |
| Next | See `openspec/CHANGE-STATUS.md` |
| Index | [`L2/INDEX.md`](../INDEX.md) |

System: `back`. Feature: `async-sse`.
OpenSpec change: `back-async-sse` → `specs/back/async-sse/spec.md`.

Source: `L2/02.EPIC-ANGULAR-CODIFICATION.async-sse.md`, `L2/02.EPIC-ANGULAR-CODIFICATION.async-infra.md` (EPIC-002). Companion: `front-async-sse`, `infra-async-persistence`.

| ID | Status | Requirement |
| --- | --- | --- |
| BASSE-001 | registered | When enrichment is too slow to block the page, Nest exposes an SSE stream for push updates; requests that start work stay on normal HTTP. The client listens; the server sends. |
| BASSE-002 | registered | Backend stores of truth for heavy pages: (1) backend persistence — database on the Nest side; durable store of processed and expanded items (not a short-lived HTTP cache); survives restarts; source of truth for "we already computed this"; (2) ESI (CCP) — authoritative raw game data when persistence has nothing yet; (3) background process — Nest worker / job that completes expensive per-item work one by one, writes persistence, and emits SSE events. |
| BASSE-003 | registered | Nest request path: look in persistence — on hit, return what persistence has (may be partial or stale), check staleness, and if stale start or continue background refresh without blocking the HTTP response on a full recompute; on miss, call ESI, build a simplified/partial node list, start a background process that completes items one by one, and return the partial list on HTTP. |
| BASSE-004 | registered | Enrichment path: background process completes items one by one. When an item is done, the service stores the full result in persistence and sends an SSE event with the updated node (or a patch keyed by node id). |
| BASSE-005 | registered | Repeat Nest list request: prefer persistence over ESI when data is already stored; return that data on the HTTP response; evaluate staleness; if stale, kick the background update again and push fresh fields over SSE as they complete. Stale persistence data is still returned immediately. |
| BASSE-006 | registered | Blueprint list with manufacture index (back): load from persistence when available, otherwise ESI for the pilot's blueprints; return a simplified list (identity and basic fields; index missing or placeholder); background computes manufacture cost, market cost, and index per blueprint, persists, and SSE-pushes the enriched node. |
| BASSE-007 | registered | Backend SSE endpoints: expose Nest `@Sse()` routes that stream enrichment events for a list scope. Built into `@nestjs/common` / platform HTTP — no extra SSE package required. Handlers return RxJS `Observable`. HTTP list API returns partial or stored lists. |
| BASSE-008 | registered | Backend persistence access: read/write processed and calculated records. Add DB driver + ORM/client (e.g. `pg` + Prisma or TypeORM — exact package at design time). Config via `@nestjs/config`. Schema and migrations live in `neocom-back` (or a shared infra repo if one is adopted later). |
| BASSE-009 | registered | Backend background jobs: complete items one by one without blocking the HTTP request. Prefer BullMQ (`@nestjs/bullmq`, `bullmq`) with Redis as the broker. In-process async is acceptable only for local/dev spikes, not as the production design. |
| BASSE-010 | registered | Backend multi-instance SSE: if more than one Nest replica runs, a job on instance A must reach an SSE client on instance B. Add Redis pub/sub (or BullMQ events + Redis) so enrichment completion publishes to all SSE subscribers. |
| BASSE-011 | registered | Backend ESI: fetch raw data on persistence miss. Keep `@lgriffin/esi.ts`; enrichment jobs call domain services that use it. |
| BASSE-012 | registered | Async workflow requires Nest capabilities not yet in the baseline: durable DB access and a background queue (Nest 12, Express, RxJS today; no DB or queue packages yet). |

## UNREGISTERED REQUIREMENTS
