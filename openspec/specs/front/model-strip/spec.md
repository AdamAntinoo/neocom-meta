# front/model-strip Specification

## Purpose
Support / documentation page that catalogues render specimens. Source: IND-BP-001…007 in .

## Requirements

### Requirement: model-strip page without auth

The application SHALL provide support page **model-strip** (`model-strip-page`) at `/model-strip` without authentication (IND-BP-001).

#### Scenario: Open strip without login

- **WHEN** a developer navigates to `/model-strip`
- **THEN** the page loads without an authentication guard

### Requirement: Validated specimen index and marker

A new index file under `neocom-front/docs/` SHALL list which model previews are validated (IND-BP-002). Each specimen listed as validated SHALL show a green check-mark icon at the top-right of its preview (IND-BP-003).

#### Scenario: Validated specimen shows check

- **WHEN** a specimen is listed as validated in the docs index
- **THEN** its preview frame shows a green check at the top-right

### Requirement: Specimen layout and font baseline

New specimens added to `model-strip-page` SHALL be placed at the **top** of the strip (IND-BP-004). Each specimen row SHALL show the **render name** to the right of the visual; a style/font-size reference MAY appear with it (IND-BP-005). The strip SHALL show a **14px** Elemental + Open Sans font baseline sample (IND-BP-006).

#### Scenario: New specimen appears first

- **WHEN** a new specimen is added to the strip
- **THEN** it is placed above older specimens
- **AND** its row shows the render name to the right of the visual

### Requirement: Appearance capture authorization

Agents MAY add a strip specimen and capture PNG into `sources/L1/media/` when documenting a visual Appearance (IND-BP-007).

#### Scenario: Capture from live strip

- **WHEN** an Appearance is being documented
- **THEN** a live strip specimen MAY be captured into `sources/L1/media/`
