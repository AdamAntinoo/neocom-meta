# back/industry-blueprints Specification

## Purpose
Industry API pilot blueprints endpoint. Source: BACK-SVC-070…072.

## Requirements

### Requirement: Industry starts with pilot blueprints

The new Industry API SHALL start with an endpoint that retrieves the blueprints belonging to a pilot (BACK-SVC-070).

#### Scenario: First Industry endpoint

- **WHEN** the Industry API is introduced
- **THEN** its first endpoint retrieves blueprints for a pilot

### Requirement: Pilot id in, BlueprintV1 list out

That endpoint SHALL take the pilot unique identifier as input and return a list of `BlueprintV1` (BACK-SVC-071).

#### Scenario: Typed list response

- **WHEN** a caller supplies a pilot unique identifier
- **THEN** the response is a list of `BlueprintV1`

### Requirement: ESI plus model-only fields

Each `BlueprintV1` SHALL map all fields available from the ESI blueprints API plus the `BlueprintV1` fields not present on ESI (names, icons, output type, and other model-only fields), with the detailed field mapping to be reviewed (BACK-SVC-072).

#### Scenario: Enrichment groups stated

- **WHEN** a BlueprintV1 is built for the Industry response
- **THEN** it includes ESI blueprint fields and model-only fields such as names, icons, and output type, pending a reviewed detailed field map
