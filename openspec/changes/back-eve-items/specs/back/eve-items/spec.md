# back/eve-items Specification

## Purpose

Back interchange for EVE universe item class definitions: ESI type → `EveItemV1Dto` (with expansions) → `PricedItemV1Dto` (extends EveItem with hub prices and nested market hub location). Source: `sources/L1/13.EPIC-EVE-ITEMS.md` (ITEM-001…007, ITEM-010…013).

## ADDED Requirements

### Requirement: Item class starts from ESI universe type

The programme item **class** definition SHALL start from ESI `GET /universe/types/{type_id}/` (universe type) (ITEM-001). Back mapping SHALL treat the ESI field set for that operation as the baseline type payload (required + optional as returned) (ITEM-002).

#### Scenario: Type endpoint is the baseline

- **WHEN** the back builds an item class definition for a `type_id`
- **THEN** it starts from ESI `GET /universe/types/{type_id}/`
- **AND** it treats the ESI type field set as the baseline payload

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
