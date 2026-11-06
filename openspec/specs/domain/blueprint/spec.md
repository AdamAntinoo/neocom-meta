# domain/blueprint Specification

## Purpose
BlueprintV1 base domain model. Source: DOM-BP-001…003 in .

## Requirements

### Requirement: BlueprintV1 base model

Base blueprint model SHALL be published as **BlueprintV1** with raw ESI blueprint data (IND-BP-000 / DOM-BP-001). Parent for **ProcessedBlueprintSummaryV1** and **ProcessedBlueprintV1**. No BOM, no cost index on this base.

#### Scenario: Base has no BOM

- **WHEN** a BlueprintV1 instance is created from ESI blueprint data
- **THEN** it carries identity and efficiency fields without BOM or cost index

### Requirement: BlueprintV1 fields

BlueprintV1 SHALL expose `blueprintId`, `blueprintTypeId`, `blueprintTypeName`, `blueprintTypeIconURL` (or `types/{blueprintTypeId}/bp`), `outputTypeId`, `outputTypeName`, `outputTypeIconURL` (or `types/{outputTypeId}/icon`), `runs`, `materialEfficiency` (0–10), `timeEfficiency` (0–20), `maxRuns` (DOM-BP-002).

#### Scenario: Efficiency bounds

- **WHEN** material and time efficiency are set on BlueprintV1
- **THEN** materialEfficiency is in 0–10 and timeEfficiency is in 0–20

### Requirement: v1-blueprint identity card

Render `v1-blueprint` SHALL be the base identity card (`media/v1-blueprint.png`) (DOM-BP-003).

#### Scenario: Base render named

- **WHEN** a BlueprintV1 is shown as a base card
- **THEN** the render selector is `v1-blueprint`
