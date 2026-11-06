# back/blueprint-list-processing Specification

## Purpose
ESI pilot blueprints → `neocom-back` interchange DTOs with embedded catalog location. Source: BLP-014, 015, 018…020 in  (EPIC-011).

## Requirements

### Requirement: ESI payload to BlueprintV1Dto

Backend blueprint contents SHALL be obtained from the **ESI API** with fields including `item_id`, `location_flag`, `location_id`, `material_efficiency`, `quantity`, `runs`, `time_efficiency`, `type_id`, and **transformed** to **`neocom-back` `BlueprintV1Dto`** (BLP-018). Back blueprints SHALL include **location** information from ESI `location_id` / related fields (BLP-014).

#### Scenario: ESI row maps to DTO

- **WHEN** an ESI character blueprint row is processed
- **THEN** the back produces a `BlueprintV1Dto`
- **AND** location fields from ESI are present for catalog lookup

### Requirement: Catalog SpaceLocationV1Dto on the blueprint DTO

During backend processing, the blueprint location SHALL be obtained via the **space-location use case** (catalog logic stays there — not reimplemented in the blueprints use case) and represented as **`SpaceLocationV1Dto`** on `neocom-back` (BLP-015 / BLP-030). **`BlueprintV1Dto` SHALL contain the instance of `SpaceLocationV1Dto`** derived from that use-case result (BLP-019).

#### Scenario: DTO carries resolved location

- **WHEN** the space-location use case succeeds for a blueprint `location_id`
- **THEN** `BlueprintV1Dto` embeds the resulting `SpaceLocationV1Dto`

### Requirement: Use cases compose other use cases

Back use cases for this flow MAY **call other use cases** to obtain additional information so shared behaviour lives in **one** place and is **not copied** at every consumer (BLP-030). Example: pilot-blueprints use case → space-location use case.

#### Scenario: Blueprints reuse space-location use case

- **WHEN** a blueprint DTO needs its location resolved
- **THEN** the blueprints use case invokes the space-location use case
- **AND** it does not call the location catalog port directly for that lookup

### Requirement: Dto suffix on neocom-back only

Back ↔ front interchange types for this flow SHALL be **`neocom-back` classes with the `Dto` suffix**; they SHALL **not** be defined in `neocom-domain` (BLP-020).

#### Scenario: Interchange types are back DTOs

- **WHEN** the industry blueprint list/SSE payload is serialized for the front
- **THEN** types are `*Dto` classes owned by `neocom-back`
- **AND** they are not published as `neocom-domain` models for this flow

### Requirement: DTOs under adapters top-level dto package

`neocom-back` interchange **`*Dto` classes** for this flow SHALL live in the **infrastructure layer** at the **adapters top level** package **`infrastructure/adapters/dto`** — not under `inbound/` or `outbound/` subtrees (BLP-026).

#### Scenario: DTO package location

- **WHEN** a `*Dto` interchange type for this flow is added or moved
- **THEN** it is defined under `src/infrastructure/adapters/dto/`
- **AND** it is not placed under `adapters/inbound/**` or `adapters/outbound/**`

### Requirement: Aggregated static DTO converter beside DTOs

Origin→DTO mappings for this flow SHALL be **aggregated into a single static converter class** colocated in **`infrastructure/adapters/dto`** (BLP-027 / BLP-029). That class SHALL expose **static methods** for each conversion (e.g. ESI library blueprint → `BlueprintV1Dto`, catalog `SpaceLocation` → `SpaceLocationV1Dto`); it SHALL **not** be instantiated; there SHALL **not** be one converter class per mapping. ESI → DTO input SHALL be the **ESI library** result type (e.g. `EsiClient.characters.getCharacterBlueprints` element), not a hand-rolled row interface. Example class: `BlueprintListDtoConverter`.

#### Scenario: Single static converter

- **WHEN** ESI library character blueprints or catalog `SpaceLocation` values are transformed to interchange DTOs
- **THEN** conversion is performed via static methods on one converter class under `src/infrastructure/adapters/dto/`
- **AND** call sites do not `new` that converter
- **AND** the ESI → DTO input type is derived from `@lgriffin/esi.ts` (not a local ESI row duplicate)

### Requirement: DTOs extend back-owned Record

Interchange `*Dto` classes on `neocom-back` SHALL **inherit from** the **`Record`** base class owned by **`neocom-back`** under **`infrastructure/adapters/dto`** (BLP-028). That `Record` base (formerly `neocom-domain` `src/interfaces/Record.interface.ts`) is the home for DTO `jsonClass` / field-assign construction for this flow; it SHALL **not** be imported from `neocom-domain` for new `*Dto` types.

#### Scenario: DTO inherits back Record

- **WHEN** a `BlueprintV1Dto` or `SpaceLocationV1Dto` instance is constructed
- **THEN** its class extends `neocom-back` `Record` from `infrastructure/adapters/dto`
- **AND** it does not extend `neocom-domain` `Record` for that inheritance
