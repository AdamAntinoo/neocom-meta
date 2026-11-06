# back/jsonclass Specification

## Purpose

Back responses for published domain models identify the programme type on the wire via `jsonClass`. Source: DOM-JSONCLASS-001 in .

## ADDED Requirements

### Requirement: jsonClass on published domain model payloads

When the back returns a published domain model (single object or list element), the payload SHALL include a field named **`jsonClass`** whose value is the programme domain type name for that instance. The back SHALL NOT omit `jsonClass` for those payloads (DOM-JSONCLASS-001).

#### Scenario: Single object includes jsonClass

- **WHEN** the back returns one published domain model instance
- **THEN** the payload includes `jsonClass` set to that instance’s programme type name

#### Scenario: List element includes jsonClass

- **WHEN** the back returns a list of published domain model instances
- **THEN** each list element includes `jsonClass` set to that element’s programme type name
