# Proposal

## Why

Heavy industry pages must paint a partial node list immediately and enrich rows in place over SSE, using a front adapter with cache + HTTP + authenticated SSE, without blocking on full synchronous generation.

## What Changes

- Keep a fast synchronous path when the full list is ready in one response
- For heavy lists: cache-first adapter, HTTP to Nest, open scoped SSE, merge events into cache and panel
- Render delayed / not-ready nodes safely; update the same row on readiness
- Prefer an authenticated SSE client (EventSource or fetch-based helper) bridged into RxJS

## Capabilities

### New Capabilities

- `front/async-sse`: Front adapter cache, SSE consumer, and in-place panel enrichment

### Modified Capabilities

- *(none)*

## Impact

- Owning repository: **`neocom-front`**
- Requirement ids: FASSE-001 … FASSE-010 
- Companions: `back-async-sse`, `infra-async-persistence`
- Reuses `front-node-render` viewer/registry pipeline
