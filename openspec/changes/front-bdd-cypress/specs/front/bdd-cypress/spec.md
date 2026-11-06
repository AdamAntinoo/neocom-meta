# front/bdd-cypress Specification

## Purpose

SDD→BDD→TDD methodology and Cypress validation of navigation, content, and UI via documented `cy-*` attributes. Source: BDD-001 … BDD-004 in .

## ADDED Requirements

### Requirement: SDD to BDD to TDD design model

The project SHALL follow an SDD→BDD→TDD design model: from spec, create Gherkin scenarios that SHALL be validated before the feature is considered complete (BDD-001).

#### Scenario: Feature blocked without Gherkin pass

- **WHEN** a feature has OpenSpec or L2 acceptance scenarios
- **THEN** those Gherkin scenarios are run and pass before the feature is considered complete

### Requirement: Cypress validates flows, contents, and UI aspects

Cypress SHALL validate navigation flows and also the **contents** of panels and items and their **UI aspects**, including colour and other visual or structural properties that the application publishes for tests through documented `cy-*` attributes (for example `cy-section-name`, `cy-field-value`, `cy-field-label`, `cy-name`, and any further catalogued Cypress properties) (BDD-002).

#### Scenario: Content checked via cy-* attribute

- **WHEN** a Cypress scenario covers a panel field
- **THEN** it locates the field through a documented `cy-*` attribute
- **AND** it asserts the published content or UI property

### Requirement: Gherkin asserts published properties

Gherkin scenarios that cover a page or panel SHALL assert against those published properties so content and UI validity are checked with stable selectors before the feature is considered complete (BDD-003).

#### Scenario: Scenario uses stable selectors

- **WHEN** a Gherkin scenario covers a page or panel
- **THEN** steps assert against published `cy-*` properties
- **AND** they do not rely on brittle CSS that is not part of the catalog

### Requirement: Pages and panels expose cy-* properties

Pages and panels under test SHALL expose the relevant `cy-*` properties so Cypress can locate and verify them (BDD-004).

#### Scenario: Panel under test is addressable

- **WHEN** a page or panel is covered by acceptance tests
- **THEN** it exposes the relevant documented `cy-*` properties for Cypress
