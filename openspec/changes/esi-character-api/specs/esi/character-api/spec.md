# esi/character-api Specification

## Purpose

TypeScript DTOs for the EVE Online Character API, generated into `neocom-esi` and published for `neocom-front`. Source: `L2/ESI/ESI-SPECS.md`.

## ADDED Requirements

### Requirement: Character API lives in the domain package

The Character API implementation SHALL live in `neocom-esi` under `src/esi-api/characters` (ESI-001).

#### Scenario: Source location

- **WHEN** the Character API types are added
- **THEN** they are under `neocom-esi/src/esi-api/characters`

### Requirement: Generate from the Character API OpenAPI

The generator input SHALL be the EVE Online Character API OpenAPI document, which declares 28 operations, at https://raw.githubusercontent.com/api-evangelist/eve-online/refs/heads/main/openapi/eve-online-character-api-openapi.yml (ESI-002). The agent MAY use openapi-generator to produce the TypeScript DTO classes (ESI-003).

#### Scenario: DTOs come from that document

- **WHEN** the character DTO classes are generated
- **THEN** their source is that OpenAPI document

### Requirement: Publish generated DTOs to the front

Generated code SHALL be registered under `src/esi-api/characters` and made available to `neocom-front` by publishing `neocom-esi` (ESI-004).

#### Scenario: Front depends on the published package

- **WHEN** `neocom-front` needs a Character API DTO
- **THEN** it obtains it from the published `neocom-esi` package

### Requirement: Compose higher-level domain objects

Generated files SHALL be treated as DTO classes. A service SHALL use them to compose higher-level DTOs or business objects, and those composed types SHALL also be published on `neocom-esi` (ESI-005).

#### Scenario: A composed type is published

- **WHEN** a service builds a higher-level DTO or business object from the generated character DTOs
- **THEN** that type is part of the published `neocom-esi` package
