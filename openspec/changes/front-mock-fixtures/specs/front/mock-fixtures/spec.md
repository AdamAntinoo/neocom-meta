# front/mock-fixtures Specification

## Purpose

Mocked scenarios and fixtures from real runs for Cypress, with replaceable test adapters. Source: FIX-001 … FIX-004 in .

## ADDED Requirements

### Requirement: Configurable replaceable test adapters

The system SHALL provide mocked scenarios and configurations that allow testing elements with predefined and stable data; adapters SHALL be configurable and replaceable on the testing environment (FIX-001).

#### Scenario: Test environment uses replaceable adapter

- **WHEN** acceptance tests run in the testing environment
- **THEN** HTTP or data adapters can be replaced with mocks
- **AND** data served to the UI is predefined and stable

### Requirement: Mock data from real runs

Testing SHALL use **mock data extracted from real runs** so scenarios can cover realistic variations and UI aspects, including the appearance of **errors** and the presentation of **stale** or **incorrect** data, not only happy-path payloads (FIX-002).

#### Scenario: Error presentation fixture

- **WHEN** a scenario covers an error presentation
- **THEN** the fixture was derived from a real or production-like run
- **AND** Cypress can validate how the UI shows that error

### Requirement: Stable fixtures reflecting edge cases

Captured fixtures SHALL be stable and predefined for the test environment (via configurable, replaceable adapters) while still reflecting shapes and edge cases observed in production-like or developer runs (FIX-003).

#### Scenario: Fixture is stable across runs

- **WHEN** the same Gherkin scenario runs twice against the test environment
- **THEN** the fixture payload shape remains the same
- **AND** it still reflects an observed edge case or variation

### Requirement: Gherkin selects fixtures for Cypress

Gherkin scenarios SHALL be able to select those fixtures so Cypress can validate how pages and panels render each variation (FIX-004).

#### Scenario: Scenario picks a fixture set

- **WHEN** a Gherkin scenario names or tags a fixture variation
- **THEN** Cypress runs against that fixture set
- **AND** the page or panel rendering for that variation is asserted
