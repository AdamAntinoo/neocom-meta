# domain/ports Specification

## Purpose

Pilot and Industry ports in `neocom-domain`, implemented by back. Source: BACK-SVC-020…022, BACK-SVC-030…032.

## ADDED Requirements

### Requirement: Ports under src/ports

Existing ports SHALL be created or moved under `neocom-domain` `src/ports` (BACK-SVC-020).

#### Scenario: Port home

- **WHEN** a port interface is added or relocated
- **THEN** it lives under `src/ports`

### Requirement: Keep Pilot port

The Pilot port SHALL be kept as a separate port (not merged into Industry) and live under `neocom-domain` `src/ports` (BACK-SVC-021).

#### Scenario: Pilot stays separate

- **WHEN** industry endpoints are added
- **THEN** the Pilot port remains a distinct interface under `src/ports`

### Requirement: Industry port for non-pilot endpoints

Non-pilot service endpoints in this epic’s scope SHALL be exposed through an Industry port under `neocom-domain` `src/ports` (create new or move/extend an existing industry interface) (BACK-SVC-022).

#### Scenario: Non-pilot via Industry

- **WHEN** a non-pilot service endpoint in scope is defined
- **THEN** it is exposed on the Industry port under `src/ports`

### Requirement: Back implements ports

Ports SHALL be interfaces implemented by `neocom-back` services (adapters) and consumed by use cases (BACK-SVC-030).

#### Scenario: Adapter in back

- **WHEN** a use case needs a port
- **THEN** a `neocom-back` adapter implements that interface

### Requirement: Domain models only in signatures

Port signatures SHALL use exclusively models available in `neocom-domain` (BACK-SVC-031).

#### Scenario: No foreign types on ports

- **WHEN** a port method is declared
- **THEN** every parameter and return type is a model available in `neocom-domain`

### Requirement: Stop when model missing

When a model needed by a port is missing from `neocom-domain`, work SHALL stop and more information SHALL be requested (no invented substitute type) (BACK-SVC-032).

#### Scenario: Missing model blocks

- **WHEN** a port needs a type not present in `neocom-domain`
- **THEN** implementation stops and further information is requested instead of inventing a substitute
