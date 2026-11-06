# Proposal

## Why

Clients need one lookup call for any space location kind. EPIC-008 states `GET /api/v1/universe/spacelocations/{locationId}`.

## What Changes

- Register LOC-010 lookup endpoint returning one SpaceLocation

## Capabilities

### New Capabilities

- `back/spacelocations`: Universe space location lookup API

### Modified Capabilities

- *(none)*

## Impact

- **`neocom-back`**
- Related: `domain-locations`
- L2 id: LOC-010 from 
