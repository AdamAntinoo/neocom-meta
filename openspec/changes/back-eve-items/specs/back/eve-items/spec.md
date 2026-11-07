# back/eve-items Specification

## Purpose

Back interchange for EVE universe item class definitions: ESI type → `EveItemV1Dto` (with expansions) → `PricedItemV1Dto` (extends EveItem with hub prices and nested market hub location), plus get-by-id use cases, HTTP, and Redis. Source: `sources/L1/13.EPIC-EVE-ITEMS.md` (ITEM-001…007, ITEM-010…022).

## ADDED Requirements

### Requirement: Item class starts from ESI universe type

The programme item **class** definition SHALL start from ESI `GET /universe/types/{type_id}/` (universe type) (ITEM-001). Back mapping SHALL treat the ESI field set for that operation as the baseline type payload (required + optional as returned) (ITEM-002).

#### Scenario: Type endpoint is the baseline

- **WHEN** the back builds an item class definition for a `type_id`
- **THEN** it starts from ESI `GET /universe/types/{type_id}/`
- **AND** it treats the ESI type field set as the baseline payload

### Requirement: EveItem ESI source is universe types only

EveItem miss-path / ESI source SHALL pair to **universe types** only (`GET /universe/types/{type_id}/` plus group/category expansions). The back SHALL NOT use or name an ESI “eve item” resource adapter. Programme HTTP `…/eveitems/{itemId}` remains the public NeoCom path (ITEM-022 / DEF-EI-001).

#### Scenario: Types adapter is the only ESI EveItem source

- **WHEN** GetEveItemById misses Redis and resolves from ESI
- **THEN** the outbound adapter calls ESI universe **types** (and group/category as required)
- **AND** no ESI “eve item” resource adapter is used or retained

### Requirement: Outbound adapters grouped by function

Back hexagonal outbound adapters SHALL be packaged by **function** under `adapters/outbound` — `universe` (ESI universe / locations), `persistence` (Redis and stores), `market`, `industry` (blueprint-list and industry ESI) — not under a result-type folder such as `outbound/eveitem/` or `outbound/blueprint-list/` (ITEM-023 / DEF-EI-002). Redis-backed adapters SHALL live under **`persistence`**.

#### Scenario: EveItem adapters live in function packages

- **WHEN** the back wires EveItem source, Redis type/price caches, market hub prices, and blueprint-list services
- **THEN** they reside under function packages (`universe`, `persistence`, `market`, `industry` as applicable)
- **AND** they are not grouped solely by the result type folder
- **AND** Redis adapters are under `persistence`, not a separate result-type or deprecated memory-universe cache package

### Requirement: EveItemV1Dto carries full ESI type fields

Backend SHALL define `EveItemV1Dto` containing the full ESI universe-type field set for one `type_id` (ITEM-003).

#### Scenario: DTO holds the type payload

- **WHEN** a universe type is mapped to back interchange
- **THEN** the result is an `EveItemV1Dto` that contains the full ESI type field set for that `type_id`

### Requirement: Group name expansion

From type `group_id`, the back SHALL call ESI `GET /universe/groups/{group_id}/` (or equivalent) and set `groupName` on `EveItemV1Dto` (ITEM-004).

#### Scenario: Group name is resolved

- **WHEN** an `EveItemV1Dto` is built from a type that has `group_id`
- **THEN** the back resolves the group (ESI or equivalent)
- **AND** sets `groupName` on the DTO

### Requirement: Category id and name expansion

From that group’s `category_id`, the back SHALL call ESI `GET /universe/categories/{category_id}/` (or equivalent) and set `categoryId` and `categoryName` on `EveItemV1Dto` (ITEM-005).

#### Scenario: Category is resolved from the group

- **WHEN** the group for a type yields a `category_id`
- **THEN** the back resolves the category (ESI or equivalent)
- **AND** sets `categoryId` and `categoryName` on the DTO

### Requirement: iconId and iconUrl

When ESI type returns `icon_id`, `EveItemV1Dto` SHALL keep `iconId` and SHALL add `iconUrl` — the resolved EVE Image Server URL for that icon (URL string only; client loads the image) (ITEM-006).

#### Scenario: Icon URL is added when icon_id is present

- **WHEN** the ESI type returns `icon_id`
- **THEN** `EveItemV1Dto` keeps `iconId`
- **AND** adds `iconUrl` as the resolved Image Server URL string

### Requirement: Consumers use back EveItemV1Dto not browser ESI

Front / other consumers that need a full type definition SHALL obtain it via back `EveItemV1Dto` (or a later published domain type mapped from it), not by calling ESI types / groups / categories from the browser (ITEM-007).

#### Scenario: No browser ESI type/group/category calls for full definition

- **WHEN** a front or other consumer needs a full item type definition
- **THEN** it obtains it via back `EveItemV1Dto` (or a later published domain type mapped from it)
- **AND** it does not call ESI types, groups, or categories from the browser for that definition

### Requirement: PricedItemV1Dto extends EveItemV1Dto

`PricedItemV1Dto` SHALL **extend EveItemV1Dto** (inherit full type + expansions); it SHALL NOT be only type id/name without the EveItem payload (ITEM-010).

#### Scenario: Priced item carries full EveItem payload

- **WHEN** a priced item interchange is produced
- **THEN** it is a `PricedItemV1Dto` that extends `EveItemV1Dto`
- **AND** it is not limited to type id/name without the EveItem payload

### Requirement: Hub buy/sell and marketHub on PricedItemV1Dto

`PricedItemV1Dto` SHALL add `buyPrice`, `sellPrice`, and `marketHub` (`EveLocationV1Dto`) for the hub those prices apply to (ITEM-011). Buy/sell on `PricedItemV1Dto` SHALL be interpreted only together with `marketHub` (same hub semantics as EPIC-012 market / Jita rules) (ITEM-012).

#### Scenario: Prices are hub-scoped

- **WHEN** a `PricedItemV1Dto` is produced
- **THEN** it includes `buyPrice`, `sellPrice`, and `marketHub` as `EveLocationV1Dto`
- **AND** buy/sell are interpreted only together with that `marketHub`

### Requirement: Serialised marketHub is a nested JSON object

When serialised, `PricedItemV1Dto` SHALL expose inherited `EveItemV1Dto` fields plus `buyPrice`, `sellPrice`, and `marketHub` as a nested JSON object (`EveLocationV1Dto` properties); location SHALL NOT be serialised as a bare id in place of that object (ITEM-013).

#### Scenario: Wire shape nests marketHub

- **WHEN** a `PricedItemV1Dto` is serialised to JSON
- **THEN** inherited EveItem fields and `buyPrice` / `sellPrice` are present
- **AND** `marketHub` is a nested JSON object with EveLocationV1Dto properties
- **AND** location is not serialised as a bare id in place of that object

### Requirement: GetEveItemById use case

Backend SHALL provide a use case `GetEveItemById` returning `EveItemV1Dto` by item id (`typeId`) (ITEM-014).

#### Scenario: Resolve EveItem by type id

- **WHEN** a caller invokes GetEveItemById with an item id
- **THEN** the use case returns `EveItemV1Dto` for that `typeId`

### Requirement: GetPricedItemById use case

Backend SHALL provide a use case `GetPricedItemById` returning `PricedItemV1Dto` by item id (`typeId`), including nested `marketHub` location JSON (ITEM-015).

#### Scenario: Resolve priced EveItem by type id

- **WHEN** a caller invokes GetPricedItemById with an item id
- **THEN** the use case returns `PricedItemV1Dto` for that `typeId`
- **AND** the payload includes nested `marketHub` location JSON

### Requirement: GetPricedItemById is authenticated

`GetPricedItemById` use case SHALL be authenticated (pilot session / access identity required); unauthenticated invocation SHALL be rejected (ITEM-021).

#### Scenario: Unauthenticated priced lookup is rejected

- **WHEN** GetPricedItemById is invoked without a pilot session / access identity
- **THEN** the invocation is rejected

### Requirement: Priced HTTP authenticated; EveItem HTTP public

HTTP endpoint for **pricedeveitems** SHALL be authenticated (access cookie / session); **eveitems** SHALL remain unauthenticated (ITEM-016).

#### Scenario: Auth differs by resource

- **WHEN** a client calls `…/eveitems/{itemId}`
- **THEN** no access cookie / session is required
- **WHEN** a client calls `…/pricedeveitems/{itemId}` without auth
- **THEN** the call is rejected

### Requirement: Public eveitems HTTP endpoint

Backend SHALL expose GetEveItemById on unauthenticated `GET /api/v1/universe/eveitems/{itemId}` returning `EveItemV1Dto` (ITEM-017). That endpoint SHALL NOT be authenticated.

#### Scenario: Public EveItem by id

- **WHEN** an unauthenticated client requests `GET /api/v1/universe/eveitems/{itemId}`
- **THEN** the response is `EveItemV1Dto` for that item id (or not-found when absent)

### Requirement: Authenticated pricedeveitems HTTP endpoint

Backend SHALL expose GetPricedItemById on its own authenticated endpoint `GET /api/v1/universe/pricedeveitems/{itemId}` returning `PricedItemV1Dto` (separate from eveitems) (ITEM-020).

#### Scenario: Authenticated priced EveItem by id

- **WHEN** an authenticated client requests `GET /api/v1/universe/pricedeveitems/{itemId}`
- **THEN** the response is `PricedItemV1Dto` for that item id (or not-found when absent)

### Requirement: Permanent Redis cache for EveItem

Backend SHALL cache `EveItemV1Dto` in Redis keyed by item id, permanently (no TTL): hit returns cache; miss resolves then write-through (ITEM-018).

#### Scenario: Cache hit and miss

- **WHEN** GetEveItemById runs for an item id already in Redis
- **THEN** the cached `EveItemV1Dto` is returned without re-calling ESI
- **WHEN** the item id is not in Redis
- **THEN** the type is resolved (ESI/SDE) and written through to Redis under that item id

### Requirement: GetPricedItemById composes GetEveItemById

GetPricedItemById SHALL compose GetEveItemById for the type payload, then search hub price data and attach buy/sell + `marketHub` — it SHALL NOT duplicate EveItem resolve/cache logic (ITEM-019).

#### Scenario: Composition then price search

- **WHEN** GetPricedItemById runs for an item id
- **THEN** it obtains the EveItem payload via GetEveItemById
- **AND** it searches hub price data and attaches buy/sell + nested `marketHub`
- **AND** it does not re-implement EveItem resolve/cache logic

### Requirement: Hub prices from The Forge orders at Jita 4-4

Hub price search SHALL use ESI `GET /markets/10000002/orders` (The Forge region), filter orders to `location_id` **60003760** (Jita IV - Moon 4 - Caldari Navy Assembly Plant), set `buyPrice` / `sellPrice` from `is_buy_order` (best bid = max buy price, best ask = min sell price), and set `marketHub` for station `60003760` / system `30000142` / region `10000002`. The back SHALL NOT use seedable hub price tables as the primary source (ITEM-024 / DEF-EI-003).

#### Scenario: Jita 4-4 order book drives buy/sell

- **WHEN** GetPricedItemById searches hub prices for a type id
- **THEN** the market adapter reads ESI region orders for region `10000002`
- **AND** only orders with `location_id` `60003760` are used
- **AND** `buyPrice` is the best (max) buy order price and `sellPrice` is the best (min) sell order price at that station
- **AND** `marketHub` identifies that Jita 4-4 station (region / system / station ids above)
- **AND** a seedable in-memory price table is not the primary source

### Requirement: Write-through cache for ESI market-order data (TTL 5 minutes)

ESI market-order data used for hub price processing SHALL be write-through cached with TTL **5 minutes** (market volatility); miss fetches ESI then writes cache (ITEM-025).

#### Scenario: Market-order cache hit and miss

- **WHEN** hub price processing needs The Forge / Jita 4-4 order data and a valid cache entry exists
- **THEN** the cached market-order payload is used (no ESI re-fetch within the TTL)
- **WHEN** the cache misses or has expired
- **THEN** ESI is fetched and the payload is write-through cached with TTL 5 minutes

### Requirement: Write-through Redis cache for calculated hub prices (TTL 5 minutes)

After buy/sell are calculated for a type, the back SHALL write-through cache those calculated hub prices (`buyPrice`, `sellPrice`, hub identity) in Redis keyed by item type id, TTL **5 minutes**; hit returns the cached quote without recomputing or re-fetching orders (ITEM-026).

#### Scenario: Calculated hub-price cache hit and miss

- **WHEN** GetPricedItemById (or hub price search) needs buy/sell for a type id and a valid Redis quote exists
- **THEN** the cached `buyPrice` / `sellPrice` / hub identity are returned without recomputing or re-fetching orders
- **WHEN** the quote cache misses or has expired
- **THEN** prices are calculated from (cached or fresh) market-order data and write-through cached in Redis under that type id with TTL 5 minutes
