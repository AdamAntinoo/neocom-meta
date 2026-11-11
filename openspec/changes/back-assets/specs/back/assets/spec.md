# back/assets Specification

## Purpose

Back interchange for pilot-owned asset instances: ESI character assets (+ personal names) → `EveAssetV1Dto` with nested `PricedItemV1Dto` and conditional `EveLocationV1Dto`, plus `LocatedAssetContainerV1Dto` for assets that contain other assets; authenticated pilot HTTP (full list + by-location filter), `PilotPort` / use case wiring, and Redis write-through cache (TTL 60 minutes). Source: `sources/L1/14.EPIC-ASSETS.md` (AST-001…009, AST-010…014).

## ADDED Requirements

### Requirement: EveAssetV1 is an instanced pilot-owned item on a location

**EveAssetV1** SHALL represent an **instanced** item that belongs to a **Pilot** and is on a location; raw ESI asset/type/location payloads stay server-internal (AST-001).

#### Scenario: Instance belongs to a pilot at a place

- **WHEN** the programme models a character asset instance
- **THEN** it is an EveAssetV1: instanced item, owned by a Pilot, on a location
- **AND** raw ESI asset/type/location payloads are not exposed as the public interchange

### Requirement: EveAssetV1Dto instance field set

Backend SHALL define `EveAssetV1Dto` with the proposed instance fields: `jsonClass`, `itemId`, `typeId`, `quantity`, `locationId`, `locationType`, `locationFlag`, `isSingleton`, optional `isBlueprintCopy`, optional `name`, and `ownerPilotId` (AST-002).

#### Scenario: DTO carries ESI-mapped instance keys plus owner

- **WHEN** an ESI character asset row is mapped to back interchange
- **THEN** the result is an `EveAssetV1Dto` with `jsonClass` `"EveAssetV1Dto"`, `itemId`, `typeId`, `quantity`, `locationId`, `locationType`, `locationFlag`, `isSingleton`, and `ownerPilotId`
- **AND** `isBlueprintCopy` is present when ESI provides `is_blueprint_copy`
- **AND** `name` is present when a personal name is joined onto the instance

### Requirement: type_id expands into nested PricedItemV1Dto item

ESI `type_id` SHALL be **expanded** into nested `EveAssetV1Dto.item` as `PricedItemV1Dto` (EPIC-013) — a JSON object, not a bare type id alone (AST-003).

#### Scenario: Nested item is a full priced-item object

- **WHEN** an `EveAssetV1Dto` is built from an asset row
- **THEN** `item` is a nested JSON `PricedItemV1Dto` object expanded from `typeId`
- **AND** `item` is not represented solely as a bare type id
- **AND** `typeId` MAY remain alongside the nested `item`

### Requirement: location expansion depends on location_type

When ESI `location_type` is **not** an asset reference (`item`), ESI `location_id` SHALL be **expanded** into nested `EveAssetV1Dto.location` as `EveLocationV1Dto` (EPIC-012 §09); when `location_type` is `item`, do **not** expand location — use LocatedAssetContainerV1 (AST-004).

#### Scenario: Station (or non-item) location expands to EveLocationV1Dto

- **WHEN** an asset row has `location_type` other than `item` (e.g. `station`)
- **THEN** `EveAssetV1Dto.location` is a nested `EveLocationV1Dto` expanded from `locationId`
- **AND** `locationId` MAY remain alongside the nest

#### Scenario: Item location_type does not expand to EveLocationV1Dto

- **WHEN** an asset row has `location_type` = `item`
- **THEN** `EveAssetV1Dto.location` is omitted (or left unset)
- **AND** the parent container is represented as LocatedAssetContainerV1 with this row in `contents`

### Requirement: Personal name from ESI assets/names

Personal name for an asset instance SHALL come from ESI `POST /characters/{character_id}/assets/names` response objects `{ item_id, name }` joined by `item_id`, and SHALL populate `EveAssetV1Dto.name` from that `name` (AST-005).

#### Scenario: Names response joins by item_id

- **WHEN** the back has asset list rows and a names response array of `{ item_id, name }`
- **THEN** each matching `item_id` populates `EveAssetV1Dto.name` from that object's `name`
- **AND** the names source is ESI `POST /characters/{character_id}/assets/names`

### Requirement: Get assets from ESI character assets list

Back **get assets** SHALL obtain the character asset list from ESI `GET /characters/{character_id}/assets` and map rows into `EveAssetV1Dto` / located containers (AST-006).

#### Scenario: Character assets list is the source

- **WHEN** the back builds pilot asset interchange for a character
- **THEN** it obtains rows from ESI `GET /characters/{character_id}/assets`
- **AND** maps those rows into `EveAssetV1Dto` and/or `LocatedAssetContainerV1Dto` as required by location nesting

### Requirement: LocatedAssetContainerV1 is an asset that contains assets

**LocatedAssetContainerV1** SHALL be an **EveAssetV1** that is **in a location** and **contains other assets** inside it (former LocationAssetContainer concept, renamed) (AST-010).

#### Scenario: Container is itself an asset at a place

- **WHEN** an asset has other assets whose ESI `location_id` equals its `item_id`
- **THEN** that parent is a LocatedAssetContainerV1: an EveAssetV1 in a location with nested contents

### Requirement: LocatedAssetContainerV1Dto field set plus contents

Backend SHALL define `LocatedAssetContainerV1Dto` that includes the EveAssetV1Dto field set plus a `contents` array of nested `EveAssetV1Dto` / `LocatedAssetContainerV1Dto` objects (AST-011).

#### Scenario: Wire shape nests contents as objects

- **WHEN** a located asset container is serialised
- **THEN** `jsonClass` is `"LocatedAssetContainerV1Dto"`
- **AND** EveAssetV1Dto fields are present
- **AND** `contents` is a JSON array of nested asset or located-container objects
- **AND** `contents` is not only bare `item_id`s

### Requirement: Item location_type children hang under parent container

When ESI `location_type` is `item`, the child’s `location_id` SHALL identify the parent container asset’s `itemId`; that parent SHALL be represented as a **LocatedAssetContainerV1** with the child in `contents` (AST-012).

#### Scenario: Contained stack nests under parent itemId

- **WHEN** a child asset row has `location_type` = `item` and `location_id` equal to a parent asset’s `item_id`
- **THEN** the parent is a `LocatedAssetContainerV1Dto`
- **AND** the child appears in that parent’s `contents`

### Requirement: Authenticated programme HTTP returns asset list

Backend SHALL expose a **new authenticated** programme HTTP endpoint that returns the **list of assets** for the pilot (`EveAssetV1Dto` / `LocatedAssetContainerV1Dto`); unauthenticated callers SHALL be rejected (AST-007).

#### Scenario: Authenticated caller gets the list

- **WHEN** an authenticated client requests the pilot assets programme endpoint
- **THEN** the response is the list of assets for that pilot as `EveAssetV1Dto` / `LocatedAssetContainerV1Dto`
- **AND** an unauthenticated caller is rejected

### Requirement: New use case retrieves pilot assets

Backend SHALL add a **new use case** to retrieve the pilot’s assets (ESI → mapped asset / located-container list) (AST-008).

#### Scenario: Use case maps ESI into asset interchange

- **WHEN** the retrieve-pilot-assets use case runs for a pilot
- **THEN** it obtains ESI asset data via the port path
- **AND** returns the mapped `EveAssetV1Dto` / `LocatedAssetContainerV1Dto` list

### Requirement: PilotPort entry and V1PilotController extension

Backend SHALL add a **new entry on `PilotPort`** for retrieving that pilot’s assets, and SHALL **extend `V1PilotController`** to expose the authenticated list-assets endpoint (AST-009).

#### Scenario: Controller and port wire the list endpoint

- **WHEN** the authenticated list-assets HTTP route is invoked
- **THEN** `V1PilotController` handles it
- **AND** the use case obtains assets through the new `PilotPort` assets entry

### Requirement: Secondary authenticated by-location filter

Backend SHALL expose a **secondary authenticated** programme HTTP endpoint that returns **only assets from a given location**: the full pilot asset list SHALL be **filtered** to assets that match that location (AST-013).

#### Scenario: By-location returns a filtered subset

- **WHEN** an authenticated client requests assets for a pilot and a location id
- **THEN** the response is the full pilot asset list filtered to assets that match that location
- **AND** an unauthenticated caller is rejected

### Requirement: Redis write-through cache under pilot/asset TTL 60 minutes

Once assets are obtained they SHALL be **expanded into EveAsset** and **write-through cached in Redis** under the **`pilot/asset`** key space for fast retrieval; asset cache **TTL SHALL be 60 minutes** (AST-014).

#### Scenario: Miss expands then caches for 60 minutes

- **WHEN** the Redis `pilot/asset` cache misses for a pilot
- **THEN** assets are obtained and expanded into EveAsset
- **AND** the expanded list is write-through cached under the `pilot/asset` key space with TTL 60 minutes

#### Scenario: Hit returns cache without ESI

- **WHEN** the Redis `pilot/asset` cache hits for a pilot within the TTL
- **THEN** the cached expanded EveAsset list is returned
- **AND** ESI is not re-called for that list
