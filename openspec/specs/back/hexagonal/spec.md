# back/hexagonal Specification

## Purpose

Hexagonal NestJS backend whose first endpoint returns the Pilot model. Source: `L2/BACK/BACK.md`.

## Requirements

### Requirement: Hexagonal NestJS layout

The NestJS backend SHALL follow hexagonal architecture (BACK-001). It SHALL have `application`, `domain`, and `infrastructure` directories (BACK-002). `infrastructure` SHALL contain `adapters/inbound`, which processes REST input requests (BACK-003).

#### Scenario: REST input has an inbound adapter

- **WHEN** a REST request is processed
- **THEN** that processing is an inbound adapter under `infrastructure/adapters`

### Requirement: OpenAPI defines the API

A controller SHALL implement the API definition declared in an OpenAPI document that describes the endpoints and DTOs (BACK-004). The API interface and the DTOs SHALL be generated from that OpenAPI document with openapi-generator (BACK-005). The controller SHALL follow the supplied sample: it implements the generated API interface and delegates to an injected use case (BACK-010).

#### Scenario: A controller delegates to a use case

- **WHEN** a generated API operation is called
- **THEN** the controller delegates to an injected use case

### Requirement: Pilot is the first endpoint

The publication SHALL be a port with the endpoints and the business-object models used to retrieve the information. That service SHALL be stored in `neocom-back` (BACK-006). The first endpoint SHALL be Pilot (BACK-007).

#### Scenario: The port's first endpoint is Pilot

- **WHEN** the backend port is published
- **THEN** it lives in `neocom-back`
- **AND** its first endpoint is Pilot

### Requirement: Pilot endpoint returns a PilotDto

The Pilot endpoint SHALL return a `PilotDto`, a JSON view of the Pilot model in `L2/DOMAIN/MODELS/Pilot.md` (BACK-007). The endpoint SHALL accept the pilot identifier as a parameter (BACK-008).

#### Scenario: A pilot identifier returns the model

- **WHEN** the Pilot endpoint is called with a pilot identifier
- **THEN** the response is a `PilotDto` for that identifier

### Requirement: Private pilot data stays out when not logged in

If the system is not logged in and the private part is not accessible, the response SHALL NOT include the private section of the pilot data (BACK-009).

#### Scenario: Anonymous pilot response

- **WHEN** the Pilot endpoint is called and the system is not logged in and the private part is not accessible
- **THEN** the response does not include the private section
