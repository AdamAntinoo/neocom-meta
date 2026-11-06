# Proposal

## Why

Legacy domain DTOs and `src/esi-api` must leave the active interchange path so ports and `src/domain` models are the only shared contracts; ESI types stay back-internal.

## What Changes

- Treat domain DTOs as deprecated; mark them in code; keep them for templates or later removal (BACK-SVC-040…042)
- Treat `neocom-domain` `src/esi-api` as deprecated; do not export ESI DTOs/API classes outside `neocom-back` via domain; allow removal from the domain package (BACK-SVC-050…052)

## Capabilities

### New Capabilities

- `domain/deprecations`: Deprecate domain DTOs and domain `esi-api`

### Modified Capabilities

- *(none)*

## Impact

- Owner: **`neocom-domain`** (mark/remove); **`neocom-back`** keeps ESI types internally
- Out of scope: inventing replacement DTO shapes; deleting every consumer in the same change; Industry HTTP endpoint (see `back-industry-blueprints`)
- L2 ids: BACK-SVC-040…042, BACK-SVC-050…052 from  
