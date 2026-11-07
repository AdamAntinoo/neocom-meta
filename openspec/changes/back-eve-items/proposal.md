# Proposal

## Why

`neocom-back` needs a published interchange for EVE universe **item class** definitions: map ESI universe types into `EveItemV1Dto` (with group/category/`iconUrl` expansions), and a priced extension `PricedItemV1Dto` that adds hub buy/sell plus nested `EveLocationV1Dto` market hub JSON. Callers also need get-by-id use cases and HTTP: public EveItem lookup with Redis cache, and authenticated priced-item lookup that composes the EveItem path. Source: EPIC-013 (`13.EPIC-EVE-ITEMS.md`).

## What Changes

- Item class definition starts from ESI `GET /universe/types/{type_id}/` (ITEM-001…002); EveItem ESI source is types-only (ITEM-022 / DEF-EI-001); outbound adapters by function (ITEM-023 / DEF-EI-002)
- Back defines `EveItemV1Dto` with full type field set plus group → category expansions and `iconUrl` (ITEM-003…007)
- `PricedItemV1Dto` extends `EveItemV1Dto` with `buyPrice`, `sellPrice`, and nested `marketHub` (`EveLocationV1Dto`) (ITEM-010…013)
- `GetEveItemById` / `GetPricedItemById` use cases; public `GET …/eveitems/{itemId}`; authenticated `GET …/pricedeveitems/{itemId}`; permanent Redis EveItem cache (ITEM-014…021)
- Hub prices from The Forge orders at Jita 4-4 (ITEM-024); write-through caches for ESI market-order data and calculated hub quotes, TTL 5 minutes (ITEM-025…026)

## Capabilities

### New Capabilities

- `back/eve-items`: EveItemV1Dto / PricedItemV1Dto interchange, get-by-id use cases, HTTP, Redis, hub price caches

### Modified Capabilities

- *(none)*

## Impact

- Owner: **`neocom-back`**
- Market hub location shape owned by EPIC-012 `EveLocationV1Dto`; hub order source and price TTLs owned here (ITEM-024…026)
- Out of scope: inventing ESI order aggregation details beyond L1; front domain mappers
