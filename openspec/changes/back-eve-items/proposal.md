# Proposal

## Why

`neocom-back` needs a published interchange for EVE universe **item class** definitions: map ESI universe types into `EveItemV1Dto` (with group/category/`iconUrl` expansions), and a priced extension `PricedItemV1Dto` that adds hub buy/sell plus nested `EveLocationV1Dto` market hub JSON. Source: EPIC-013 (`13.EPIC-EVE-ITEMS.md`).

## What Changes

- Item class definition starts from ESI `GET /universe/types/{type_id}/` (ITEM-001…002)
- Back defines `EveItemV1Dto` with full type field set plus group → category expansions and `iconUrl` (ITEM-003…007)
- `PricedItemV1Dto` extends `EveItemV1Dto` with `buyPrice`, `sellPrice`, and nested `marketHub` (`EveLocationV1Dto`) (ITEM-010…013)

## Capabilities

### New Capabilities

- `back/eve-items`: EveItemV1Dto / PricedItemV1Dto interchange from ESI type hierarchy

### Modified Capabilities

- *(none)*

## Impact

- Owner: **`neocom-back`**
- Related L1 (not in this change — still `[ ] to review`): GetEveItemById / GetPricedItemById use cases, authenticated HTTP endpoints, Redis permanent EveItem cache (ITEM-014…021)
- Market hub location shape owned by EPIC-012 `EveLocationV1Dto`; market data source/TTL gaps stay in EPIC-012
- Out of scope: inventing ESI order aggregation, front domain mappers, unauthenticated public item APIs
