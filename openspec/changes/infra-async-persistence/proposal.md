# Proposal

## Why

The async/SSE enrichment path needs provisioned durable storage and a queue broker (PostgreSQL and Redis) plus a clear persistence shape so Nest and the front can share processed node data across restarts.

## What Changes

- Require a relational persistence store (prefer PostgreSQL) for extended/calculated node data and staleness
- Define minimum record contents and operations (list read, item upsert, incomplete/stale query)
- Provision PostgreSQL and Redis; document env secrets and SSE base path for front
- Record the infrastructure checklist for async enrichment

## Capabilities

### New Capabilities

- `infra/async-persistence`: PostgreSQL/Redis provision and persistence contract for async enrichment

### Modified Capabilities

- *(none)*

## Impact

- Owning docs: **`neocom-meta`**; runtime provision used by **`neocom-back`** (and front SSE URL config)
- Requirement ids: INFRA-050 … INFRA-055 ( §H)
- Companions: `back-async-sse`, `front-async-sse`
