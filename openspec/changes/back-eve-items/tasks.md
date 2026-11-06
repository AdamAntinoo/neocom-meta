# Tasks

- [ ] Treat ESI `GET /universe/types/{type_id}/` as the item-class baseline field set (ITEM-001, ITEM-002)
- [ ] Define back `EveItemV1Dto` with the full ESI universe-type field set for one `type_id` (ITEM-003)
- [ ] Expand `group_id` via ESI groups (or equivalent) and set `groupName` on `EveItemV1Dto` (ITEM-004)
- [ ] Expand group `category_id` via ESI categories (or equivalent) and set `categoryId` / `categoryName` (ITEM-005)
- [ ] When ESI returns `icon_id`, keep `iconId` and add resolved Image Server `iconUrl` (ITEM-006)
- [ ] Ensure front/other consumers obtain full type definitions via back `EveItemV1Dto` (or later published domain mapped from it), not browser ESI types/groups/categories (ITEM-007)
- [ ] Define `PricedItemV1Dto` extending `EveItemV1Dto` with `buyPrice`, `sellPrice`, and `marketHub` (`EveLocationV1Dto`) (ITEM-010, ITEM-011)
- [ ] Interpret buy/sell only together with `marketHub` (EPIC-012 hub / Jita semantics) (ITEM-012)
- [ ] Serialise `PricedItemV1Dto` with inherited EveItem fields plus prices and nested `marketHub` JSON object (not bare location id) (ITEM-013)
