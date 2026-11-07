# Eve items (back)

Status: recorded. OpenSpec change: `back-eve-items`.

`neocom-back` interchange for EVE universe item class definitions: ESI **universe types** → `EveItemV1Dto` (group/category/`iconUrl` expansions) → `PricedItemV1Dto` extending EveItem with hub buy/sell and nested `marketHub` (`EveLocationV1Dto`). ESI source is types only (not an ESI eve-item resource); HTTP `eveitems` is the programme path (ITEM-022 / DEF-EI-001).

Source: EPIC-013 `13.EPIC-EVE-ITEMS.md` (ITEM-001…007, ITEM-010…022).
