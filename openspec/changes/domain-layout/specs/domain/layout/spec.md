# domain/layout Specification

## Purpose

Truth layout for interchange models and ports in `neocom-domain`. Source: BACK-SVC-001…004, BACK-SVC-010…013.

## ADDED Requirements

### Requirement: Domain truth repository

`neocom-domain` SHALL be the truth repository for domain elements used by backend services: interchange classes between back and front, and port interfaces for service API implementations (BACK-SVC-001).

#### Scenario: Shared truth for services

- **WHEN** a backend service needs an interchange model or a port interface
- **THEN** that artifact is defined in `neocom-domain`, not invented only in `neocom-back` or `neocom-front`

### Requirement: Interchange under src/domain

Interchange models SHALL be created under `neocom-domain` `src/domain` (BACK-SVC-002).

#### Scenario: New interchange model path

- **WHEN** a new interchange class is added
- **THEN** it is placed under `src/domain`

### Requirement: Ports under src/ports

Port interfaces SHALL be created under `neocom-domain` `src/ports` (BACK-SVC-003).

#### Scenario: New port path

- **WHEN** a new port interface is added
- **THEN** it is placed under `src/ports`

### Requirement: Deferred further classification

Further classification of contents under `src/domain` / `src/ports` MAY be determined later; until then use only that split (BACK-SVC-004).

#### Scenario: No extra taxonomy yet

- **WHEN** placing domain or port artifacts
- **THEN** only the `src/domain` vs `src/ports` split is required

### Requirement: Existing classes under src/domain

Already implemented domain interchange classes SHALL be placed under `neocom-domain` `src/domain` (BACK-SVC-010).

#### Scenario: Existing interchange relocated

- **WHEN** an interchange class already exists outside `src/domain`
- **THEN** it is moved under `src/domain`

### Requirement: Inherit from Record

Those domain interchange classes SHALL inherit from `Record` (`neocom-domain` `src/interfaces/Record.interface.ts`) (BACK-SVC-011).

#### Scenario: Record base

- **WHEN** an interchange class is published under `src/domain`
- **THEN** it inherits from `Record`

### Requirement: Version suffix naming

Implementation type names for those classes SHALL use a version suffix (e.g. `BlueprintV1`), not an unversioned bare name (BACK-SVC-012).

#### Scenario: Versioned type name

- **WHEN** an interchange implementation type is named
- **THEN** the name includes a version suffix such as `V1`

### Requirement: Initial version V1

Initially copied classes SHALL start at version **V1** (name suffix `V1`) (BACK-SVC-013).

#### Scenario: First copy is V1

- **WHEN** an existing class is first copied into the versioned layout
- **THEN** its name suffix is `V1`
