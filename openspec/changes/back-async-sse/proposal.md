# Proposal

## Why

Nest must return partial or stored node lists quickly, enrich items one-by-one in the background, persist results, and push updates over SSE so the front can refresh rows without blocking the HTTP response.

## What Changes

- HTTP list API: persistence first, ESI on miss, return partial/stored lists, start background enrichment without blocking
- Persist processed/calculated records via ORM; prefer PostgreSQL (provisioned by infra)
- Background jobs via BullMQ + Redis; Redis pub/sub for multi-replica SSE fan-out
- Nest `@Sse` streams per list scope; emit node-updated (or patch) events
- Keep ESI client for persistence misses

## Capabilities

### New Capabilities

- `back/async-sse`: Nest list persistence, background enrichment, and SSE push

### Modified Capabilities

- *(none)*

## Impact

- Owning repository: **`neocom-back`**
- Requirement ids: BASSE-001 … BASSE-012 
- Companions: `front-async-sse`, `infra-async-persistence`
