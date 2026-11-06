# Proposal

## Why

EPIC-008 Section 13 defines the KnownSystem planetary card. Pilots need a card that surfaces system identity and security/planet counts without a second lookup.

## What Changes

- Register LOC-110: known-system card content (system name, `region > constellation`, security class and level, planet count)

## Capabilities

### New Capabilities

- `front/known-system` — KnownSystem / `v1-planetary-system` card fields

### Modified Capabilities

- *(none)*

## Impact

- Owner: **`neocom-front`**
- Related: applied `domain-locations` / solar-system identity fields; planetary list (not universe catalog `locationType`)
