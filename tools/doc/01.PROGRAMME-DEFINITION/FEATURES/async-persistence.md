# Async persistence

Status: registered. OpenSpec change: `infra-async-persistence`.

Provision PostgreSQL (preferred) and Redis for durable processed/calculated node data and BullMQ / SSE fan-out. Persistence contract: scope key, node identity, simplified and calculated fields, readiness, staleness; list read, item upsert, incomplete/stale query. Migrations in `neocom-back`.

Requirement ids: INFRA-050 … INFRA-055. Source: L1 §H (EPIC-002). Companions: `front-async-sse`, `back-async-sse`.
