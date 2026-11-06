# Proposal

## Why

Published domain models returned by the back must carry a stable `jsonClass` on the wire so the front can select the correct render without guessing from the URL. EPIC-004 Section 22 defines that interchange contract (DOM-JSONCLASS-001…003).

## What Changes

- Require `jsonClass` on back payloads for published domain models (single object or list element)
- Require front consumers of those payloads to select renders via `jsonClass` (not URL alone)
- Align `jsonClass` values with `neocom-domain` exports and the EPIC-004 register

## Capabilities

### New Capabilities

- `domain/jsonclass`: Programme type names used as `jsonClass` values for published models
- `back/jsonclass`: Back responses emit `jsonClass` for published domain models
- `front/jsonclass`: Front render selection for those payloads uses `jsonClass`

### Modified Capabilities

- *(none)* — related `front-node-render` already owns the registry mechanism; this change states the domain-API interchange rules

## Impact

- **`neocom-back`**: serializers / response shaping for published domain models
- **`neocom-front`**: consumers of those payloads (complements EPIC-002 node render registry)
- **`neocom-domain`**: type names / `jsonClass` alignment with EPIC-004 register
- L2 ids: DOM-JSONCLASS-001…003 from  → placed 
