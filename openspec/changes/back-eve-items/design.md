# Design

## Approach

- Treat ESI universe **type** as the item-class source of truth; map into back `EveItemV1Dto`.
- Expand `group_id` → group name + `category_id` → category name via ESI Universe (or cached/SDE equivalent supplying the same fields).
- When `icon_id` is present, keep it and add Image Server `iconUrl` (URL string only).
- `PricedItemV1Dto` **extends** `EveItemV1Dto` (full payload + hub prices); serialise `marketHub` as a nested JSON object (`EveLocationV1Dto`).

## Decisions

| Topic | Decision |
| --- | --- |
| Owner | `neocom-back` interchange DTOs (`Dto` suffix) |
| Hierarchy | ESI type → `EveItemV1Dto` → `PricedItemV1Dto` extends EveItem |
| Classification | ESI groups + categories (or equivalent) for `groupName` / `categoryId` / `categoryName` |
| Icon | `iconId` + resolved `iconUrl` (Image Server URL; client loads image) |
| Hub on priced | Nested `marketHub` object; not a bare location id |
| Delivery branch | `feature/eve-items` from `develop` in `neocom-back` |

## Risks

- Exact Image Server path keyed by `icon_id` vs `types/{type_id}/icon` remains as stated in L1; prefer programme type-icon form until a dedicated icon_id path is confirmed.
- Market search source / TTL for prices is an EPIC-012 gap; this change only defines the priced DTO shape.
- Get-by-id use cases, HTTP, Redis, and auth are authored on EPIC-013 §05 but not registered in this change until Review is checked.
