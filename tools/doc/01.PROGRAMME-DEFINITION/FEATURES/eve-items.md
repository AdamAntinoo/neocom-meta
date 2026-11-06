# Eve items (back)

Status: recorded. OpenSpec change: `back-eve-items`.

`neocom-back` interchange for EVE universe item class definitions: ESI type → `EveItemV1Dto` (group/category/`iconUrl` expansions) → `PricedItemV1Dto` extending EveItem with hub buy/sell and nested `marketHub` (`EveLocationV1Dto`).

Source: EPIC-013 `13.EPIC-EVE-ITEMS.md` (ITEM-001…007, ITEM-010…013). Use cases / HTTP / Redis / auth (ITEM-014…021) remain on L1 until reviewed.
