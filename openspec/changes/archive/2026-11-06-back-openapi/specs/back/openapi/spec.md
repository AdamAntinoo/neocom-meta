# back/openapi Specification

## Purpose

OpenAPI-first rules for `neocom-back`. Source: BACK-SVC-060…063.

## ADDED Requirements

### Requirement: OpenAPI first when applicable

The first development stage for new back code SHALL update the OpenAPI specification for the port being updated when OpenAPI applies (BACK-SVC-060).

#### Scenario: Spec before implementation

- **WHEN** new back code updates a port that uses OpenAPI
- **THEN** the OpenAPI specification for that port is updated as the first development stage

### Requirement: Schemas named after domain models

OpenAPI schemas SHALL be named after their domain model names (BACK-SVC-061).

#### Scenario: Schema name matches model

- **WHEN** an OpenAPI schema is declared for a domain model
- **THEN** the schema name matches that domain model name

### Requirement: Versioned path prefix

Endpoints SHALL be versioned with a path prefix (e.g. `v1`) (BACK-SVC-062).

#### Scenario: Path carries version

- **WHEN** an endpoint is published
- **THEN** its path includes a version prefix such as `v1`

### Requirement: Domain model wins over OpenAPI

When OpenAPI and domain model fields or names differ, the domain model SHALL take precedence and supersede the OpenAPI (BACK-SVC-063).

#### Scenario: Conflict resolved to model

- **WHEN** an OpenAPI field or name disagrees with the domain model
- **THEN** the domain model wins and OpenAPI is corrected to match
