# Proposal

## Why

Published Pilot types (**PublicPilotV1**, **PilotV2**) must live in `neocom-domain` so front and back share one programme model. EPIC-004 extracted the contracts; `front-pilot` remains the front apply change.

## What Changes

- Register PublicPilotV1 base, accessors, and `v1-public-pilot` HEADER contract (DOM-PILOT-001…003)
- Register PilotV2 published type, fields, `v2-pilot` HEADER, and complements PilotShipV1 / EveLocationV1 (DOM-PILOT-004…007)

## Capabilities

### New Capabilities

- `domain/pilot`: PublicPilotV1 and PilotV2 domain models

### Modified Capabilities

- *(none)*

## Impact

- **`neocom-domain`** publishes the types
- **`neocom-front`** / **`neocom-back`** consume via package dependency
- Related: `front-pilot` (front apply), `domain-module` (package)
- L2 ids: DOM-PILOT-001…007 from 
