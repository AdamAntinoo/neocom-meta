# Proposal

## Why

Service APIs need ports in `neocom-domain`: keep Pilot separate, expose other endpoints through Industry, and have `neocom-back` implement those interfaces using domain models only.

## What Changes

- Create or move existing ports under `src/ports` (BACK-SVC-020)
- Keep the Pilot port separate under `src/ports` (BACK-SVC-021)
- Expose non-pilot endpoints through an Industry port under `src/ports` (BACK-SVC-022)
- Ports are interfaces implemented by back adapters and consumed by use cases (BACK-SVC-030)
- Port signatures use only `neocom-domain` models; stop and ask if a model is missing (BACK-SVC-031…032)

## Capabilities

### New Capabilities

- `domain/ports`: Pilot and Industry ports; back adapters; domain-model-only signatures

### Modified Capabilities

- *(none)*

## Impact

- Owners: **`neocom-domain`** (interfaces), **`neocom-back`** (adapters)
- Out of scope: Industry HTTP path details and Blueprint list endpoint (see `back-industry-blueprints`); OpenAPI update rules (see `back-openapi`)
- L2 ids: BACK-SVC-020…022, BACK-SVC-030…032 from  
