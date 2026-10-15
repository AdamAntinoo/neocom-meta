# front/pilot-panel Specification

## Purpose

A panel that renders the Pilot model. Source: `L2/FRONT/05.PILOT-PANEL.md`.

## ADDED Requirements

### Requirement: Pilot panel shows the Pilot model

The application SHALL define a panel that renders the UI of the Pilot model (PANEL-001). The panel input SHALL be the unique identifier of an EVE character (PANEL-002). The panel SHALL be able to render the public and the private sides of the pilot data. If the credential is not available, the private data MAY be hidden (PANEL-003). The panel SHALL conform to the neocom panel model (PANEL-004).

#### Scenario: Public data without a credential

- **WHEN** the panel is given a character identifier and no credential is available
- **THEN** it can render the public pilot data
- **AND** the private data can be hidden

### Requirement: Panel variants and color

The panel color SHALL be white with the standard background (PANEL-005). The public render code SHALL be `-PILOT-PUBLIC-VARIANT-` (PANEL-006). The private render that complements the public data SHALL be `-PILOT-VARIANT-` (PANEL-007). Pilot listings SHALL use `-PILOT-LIST-VARIANT-` and that render SHALL show only a partial of the data available (PANEL-008). On pilot listings the current active pilot SHALL be rendered with a greenish background (PANEL-009).

#### Scenario: Listing marks the active pilot

- **WHEN** a pilot listing renders the current active pilot
- **THEN** the variant is `-PILOT-LIST-VARIANT-`
- **AND** that pilot has a greenish background

### Requirement: Panel markup for tests

The panel SHALL be a `div` with `cy-element-name=pilot` and `cy-element-type=panel` (PANEL-010). Rows SHALL be `div`s that add the pilot attribute fields and their contents (PANEL-011). Field tags SHALL be `cy-field-label` and `cy-field-value` (PANEL-012).

#### Scenario: A field is marked for Cypress

- **WHEN** a pilot attribute is rendered in the panel
- **THEN** its label carries `cy-field-label` and its value carries `cy-field-value`
