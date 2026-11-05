# Proposal

## Why

EPIC-008 defines the infinity space-location chain (identity + Region…Structure). Publish that contract in `neocom-domain` so serializers and consumers share one model. Lookup HTTP is `back-spacelocations`.

## What Changes

- Register location identity (LOC-001, LOC-002, DOM-LOC-001)
- Register SpaceLocation node fields (DOM-LOC-002)
- Register Region, Constellation, Solar system, Station, Structure requirements (LOC-020…060)

## Capabilities

### New Capabilities

- `domain/locations`: Space location identity and hierarchy levels

### Modified Capabilities

- *(none)*

## Impact

- **`neocom-domain`**
- Related: `back-spacelocations` (LOC-010), `domain-spacelocation` (thin V1 interface)
- L2 ids from `L2/DOMAIN/06.LOCATIONS.md`
