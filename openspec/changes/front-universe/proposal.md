# Proposal

## Why

Pilot details such as bloodline and race are ids until the unauthenticated ESI reference data is available. That reference data is the Universe and has to be specified before the Pilot model can be completed.

## What Changes

- Treat Universe as ESI data that can be downloaded without authentication
- Require the initial ESI operations listed for completing the Pilot data model: ancestries, bloodlines, factions, graphics, groups, group by id, categories, and category by id
- Read that data from the front end through an adapter, and allow a client cache because it usually does not change over time or across pilots

## Capabilities

### New Capabilities

- `front/universe`: Unauthenticated ESI reference data required to complete a Pilot

### Modified Capabilities

- *(none)*

## Impact

- Consumers: **`neocom-front`** and the Pilot model in **`neocom-domain`**
- Out of scope: authenticated ESI routes, market data, and any Universe endpoint not listed in `L2/FRONT/02.UNIVERSE.md`
