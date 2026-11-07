# Design

## Approach

- Treat ESI universe **type** as the item-class source of truth; map into back `EveItemV1Dto`.
- Outbound ESI adapter for EveItem is **types-named** (`EsiUniverseTypeSource`); do not keep an eve-item-named ESI source (ITEM-022 / DEF-EI-001). Programme HTTP `eveitems` is NeoCom-only.
- Outbound packages by **function**: `universe`, `cache`, `persistence`, `market` — not `outbound/eveitem/` (ITEM-023 / DEF-EI-002).
- Expand `group_id` → group name + `category_id` → category name via ESI Universe (or cached/SDE equivalent supplying the same fields).
- When `icon_id` is present, keep it and add Image Server `iconUrl` (URL string only).
- `PricedItemV1Dto` **extends** `EveItemV1Dto` (full payload + hub prices); serialise `marketHub` as a nested JSON object (`EveLocationV1Dto`).
- **GetEveItemById** resolves via Redis (permanent, keyed by item id) with ESI/SDE miss write-through; exposed on **unauthenticated** `GET /api/v1/universe/eveitems/{itemId}`.
- **GetPricedItemById** is **authenticated**; composes GetEveItemById then searches hub prices; exposed on **authenticated** `GET /api/v1/universe/pricedeveitems/{itemId}`.
- Hub prices from ESI The Forge orders filtered to Jita 4-4 (ITEM-024). ESI market-order payload and calculated hub quotes are write-through cached with **TTL 5 minutes** (ITEM-025…026).

## Decisions

| Topic | Decision |
| --- | --- |
| Owner | `neocom-back` interchange DTOs (`Dto` suffix) |
| Hierarchy | ESI type → `EveItemV1Dto` → `PricedItemV1Dto` extends EveItem |
| Classification | ESI groups + categories (or equivalent) for `groupName` / `categoryId` / `categoryName` |
| Icon | `iconId` + resolved `iconUrl` (Image Server URL; client loads image) |
| Hub on priced | Nested `marketHub` object; not a bare location id |
| EveItem HTTP | Public — no access cookie |
| Priced HTTP / UC | Authenticated — access cookie / session |
| EveItem Redis | Permanent cache by item id; hit skips ESI |
| Market-order cache | Write-through; TTL 5 minutes (ITEM-025) |
| Calculated hub quote Redis | Keyed by type id; TTL 5 minutes (ITEM-026) |
| Delivery branch | `feature/eve-items` from `develop` in `neocom-back` |

## Risks

- Exact Image Server path keyed by `icon_id` vs `types/{type_id}/icon` remains as stated in L1; prefer programme type-icon form until a dedicated icon_id path is confirmed.
- If Redis is unavailable, price search MUST still succeed from ESI; cache writes MAY be skipped until Redis is back (L1 §05).
