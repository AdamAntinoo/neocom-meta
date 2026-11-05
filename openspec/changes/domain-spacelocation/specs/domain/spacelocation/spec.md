# domain/spacelocation Specification

## Purpose

Thin SpaceLocationV1 interface artifact. Source: DOM-SLOCV1-001…003 in `L2/DOMAIN/07.SPACELOCATION-V1.md`.

## ADDED Requirements

### Requirement: SpaceLocationV1 interface artifact

**SpaceLocationV1** SHALL be an interface artifact for referencing any location kind (region, constellation, system, station, structure). It SHALL NOT invent fields beyond what L1 states for this artifact (DOM-SLOCV1-001).

#### Scenario: No invented field list

- **WHEN** SpaceLocationV1 is published in `neocom-domain`
- **THEN** it does not add a field list that L1 did not state for this artifact

### Requirement: EveLocationV1 for broader location needs

L1 states SpaceLocationV1 as the former `lastKnownLocation` type that declared no fields; text says superseded by **EveLocationV1** and “do not extend SpaceLocationV1”. New work SHALL treat **EveLocationV1** as the broader location model; corporation home station needs SHALL use **EveLocationV1**, not a Station ESI mirror (DOM-SLOCV1-002).

#### Scenario: Corporation home uses EveLocationV1

- **WHEN** a corporation home station location is modelled for new work
- **THEN** the type is **EveLocationV1**, not a Station ESI mirror

### Requirement: Historical ESI mirrors stay internal

Historical ESI-matching field lists under former `L2/DOMAIN/MODELS/` stay out of scope / server-internal; L2 pointers only (DOM-SLOCV1-003).

#### Scenario: No public ESI Station mirror required

- **WHEN** the domain package publishes location interfaces
- **THEN** historical ESI Station / related mirrors are not required as public exports solely because ESI returns them
