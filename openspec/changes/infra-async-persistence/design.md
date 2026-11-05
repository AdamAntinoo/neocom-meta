# Design

## Approach

- Treat persistence as durable application storage for processed/calculated nodes, distinct from front cache and HTTP caches.
- Prefer PostgreSQL unless programme infra already standardises another engine.
- Provision Redis for BullMQ and optional SSE fan-out pub/sub.
- Nest owns schema/migrations; this change owns provision and the persistence contract.

## Decisions

| Topic | Decision |
| --- | --- |
| Engine | Prefer PostgreSQL |
| Broker | Redis (queue + optional pub/sub) |
| Migrations | Live in `neocom-back` |
| Delivery branch | `feature/async-persistence` from `develop` (meta) / infra apply via programme |

## Risks

- Exact ORM package is chosen in `back-async-sse` apply; infra must not hard-lock a package here beyond Nest-supported options.
