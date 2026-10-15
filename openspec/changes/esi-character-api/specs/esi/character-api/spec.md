# esi/character-api Specification

## Purpose

`neocom-esi` drops the generated Character API and uses `@lgriffin/esi.ts` for high-level data. ESI-001, ESI-002, ESI-003, and ESI-004 are cancelled. Source: `L2/ESI/ESI-SPECS.md`.

## ADDED Requirements

### Requirement: Remove generated Character API code

`neocom-esi` SHALL remove the OpenAPI document and the code generated from it. The library SHALL focus on high-level data based on `@lgriffin/esi.ts` (ESI-011).

#### Scenario: Generated Character API code is gone

- **WHEN** `neocom-esi` is built for high-level ESI data
- **THEN** the OpenAPI document and the code generated from it are not part of the package

### Requirement: Compose higher-level domain objects

Generated files SHALL be treated as DTO classes. A service SHALL use them to compose higher-level DTOs or business objects, and those composed types SHALL also be published on `neocom-esi` (ESI-005).

#### Scenario: A composed type is published

- **WHEN** a service builds a higher-level DTO or business object from the generated character DTOs
- **THEN** that type is part of the published `neocom-esi` package
