# Proposal

## Why

Programme front does not read dogma attributes or effects on items/assets. Carrying optional `dogmaAttributes` / `dogmaEffects` on back `EveItemV1Dto` (and therefore nested `PricedItemV1Dto`) inflates wire size with no consumer. Source: EPIC-016 §01 (`16.EPIC-OPTIMIZATIONS.md`, OPT-001…003).

## What Changes

- Remove `dogmaAttributes` and `dogmaEffects` from `EveItemV1Dto` and stop mapping them in the Eve item converter (OPT-001)
- Delete related DTO/converter types (`EveItemDogmaAttribute` / `EveItemDogmaEffect` and branches) when nothing else references them (OPT-002)
- Do not reintroduce dogma on the wire unless a later reviewed L1 requirement needs them (OPT-003)

## Capabilities

### New Capabilities

- *(none)*

### Modified Capabilities

- `back/eve-items`: drop unused dogma fields from `EveItemV1Dto` / nested priced payloads

## Impact

- Owner: **`neocom-back`**
- Affects item / priced-item / nested asset `item` JSON payloads
- Does not change ESI type fetch behaviour beyond omitting dogma from the mapped DTO
