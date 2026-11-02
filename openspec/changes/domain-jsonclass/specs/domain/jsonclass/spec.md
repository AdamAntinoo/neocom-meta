# domain/jsonclass Specification

## Purpose

Align `jsonClass` values for published programme domain models with `neocom-domain` and EPIC-004. Source: DOM-JSONCLASS-003 in `L2/DOMAIN/08.JSONCLASS.md`.

## ADDED Requirements

### Requirement: jsonClass values match programme type names

`jsonClass` values for published models SHALL align with `neocom-domain` exports and the EPIC-004 register (e.g. **PilotV2**, not an unversioned `Pilot`, when the programme type is PilotV2). The value of `jsonClass` SHALL match the type name published for that model in `neocom-domain`. The back SHALL NOT invent a different discriminator name, or use an ESI-only type name when a programme domain type exists (DOM-JSONCLASS-003).

#### Scenario: Pilot uses PilotV2

- **WHEN** the payload is a published Pilot for new work
- **THEN** `jsonClass` is `PilotV2` (not an unversioned `Pilot`) when the programme type is PilotV2

#### Scenario: No ESI-only type name

- **WHEN** a programme domain type exists for the payload
- **THEN** `jsonClass` is that programme type name, not an ESI-only type name
