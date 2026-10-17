# Design

## Approach

- Nest HTTP list handlers return what persistence has (or a simplified ESI-built partial list) immediately.
- BullMQ workers enrich one item at a time, upsert persistence, publish SSE events.
- Multi-replica: Redis pub/sub (or BullMQ events) so any instance can push to connected SSE clients.
- ORM/package choice (Prisma vs TypeORM) deferred to apply-time design; prefer PostgreSQL.

## Decisions

| Topic | Decision |
| --- | --- |
| Push | Nest `@Sse()` returning RxJS `Observable` |
| Queue | BullMQ + Redis (in-process only for local spikes) |
| Persistence | Durable DB of processed/expanded items; not an HTTP cache |
| Stale data | Return immediately; refresh in background + SSE |
| ESI | `@lgriffin/esi.ts` on persistence miss |
| Delivery branch | `feature/async-sse` from `develop` |

## Risks

- Needs PostgreSQL and Redis from `infra-async-persistence` before production apply.
