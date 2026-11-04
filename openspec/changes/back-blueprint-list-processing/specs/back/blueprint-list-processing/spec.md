# back/blueprint-list-processing Specification

## Purpose

ESI pilot blueprints → `neocom-back` interchange DTOs with embedded catalog location. Source: BLP-014, 015, 018…020 in `L2/BACK/BACK-BLUEPRINT-LIST-PROCESSING.md` (EPIC-011).

## ADDED Requirements

### Requirement: ESI payload to BlueprintV1Dto

Backend blueprint contents SHALL be obtained from the **ESI API** with fields including `item_id`, `location_flag`, `location_id`, `material_efficiency`, `quantity`, `runs`, `time_efficiency`, `type_id`, and **transformed** to **`neocom-back` `BlueprintV1Dto`** (BLP-018). Back blueprints SHALL include **location** information from ESI `location_id` / related fields (BLP-014).

#### Scenario: ESI row maps to DTO

- **WHEN** an ESI character blueprint row is processed
- **THEN** the back produces a `BlueprintV1Dto`
- **AND** location fields from ESI are present for catalog lookup

### Requirement: Catalog SpaceLocationV1Dto on the blueprint DTO

During backend processing, the blueprint location SHALL be **looked up on the location catalog** and represented as **`SpaceLocationV1Dto`** on `neocom-back` (BLP-015). **`BlueprintV1Dto` SHALL contain the instance of `SpaceLocationV1Dto`** derived from that lookup (BLP-019).

#### Scenario: DTO carries resolved location

- **WHEN** catalog lookup succeeds for a blueprint `location_id`
- **THEN** `BlueprintV1Dto` embeds the resulting `SpaceLocationV1Dto`

### Requirement: Dto suffix on neocom-back only

Back ↔ front interchange types for this flow SHALL be **`neocom-back` classes with the `Dto` suffix**; they SHALL **not** be defined in `neocom-domain` (BLP-020).

#### Scenario: Interchange types are back DTOs

- **WHEN** the industry blueprint list/SSE payload is serialized for the front
- **THEN** types are `*Dto` classes owned by `neocom-back`
- **AND** they are not published as `neocom-domain` models for this flow
