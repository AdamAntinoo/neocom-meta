# front/jsonclass Specification

## Purpose
Front consumers of published domain model payloads from the back select renders via `jsonClass` (same contract as NeoCom nodes / EPIC-002). Source: DOM-JSONCLASS-002 in .

## Requirements

### Requirement: Front render selection uses jsonClass

Front render selection for those payloads SHALL use `jsonClass` (same contract as NeoCom nodes / EPIC-002). Consumers MUST NOT guess the type from URL alone when `jsonClass` is present (DOM-JSONCLASS-002).

#### Scenario: Render looks up jsonClass

- **WHEN** a published domain model payload includes `jsonClass`
- **THEN** the front selects the render using that `jsonClass` value

#### Scenario: No URL-only type guess

- **WHEN** `jsonClass` is present on the payload
- **THEN** the consumer does not determine the model type from the request URL alone
