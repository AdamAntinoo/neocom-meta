# front/pilot Specification

## Purpose

Define the Pilot as the Eve Online user's game presence. The field model is `L2/DOMAIN/MODELS/Pilot.md`. PILOT-004 is cancelled. Source: `L2/FRONT/01.PILOT-DEFINITION.md`.

## ADDED Requirements

### Requirement: Pilot is the user's game presence

A pilot SHALL represent the Eve Online user's interaction with the game environment (PILOT-001). PILOT-004 is cancelled: ESI models are outside the project, and a library encapsulates its own data domain.

#### Scenario: Programme name

- **WHEN** a developer reads the Pilot model
- **THEN** the programme concept is Pilot

### Requirement: Credential pilot limit

A pilot SHALL belong to a game credential, and that credential SHALL have at most 3 pilots (PILOT-002).

#### Scenario: Fourth pilot is rejected

- **WHEN** a credential already has 3 pilots
- **THEN** another pilot is not added to that credential

### Requirement: Public character source

Pilot public contents SHALL come from ESI Get character's public information, `GET https://esi.evetech.net/characters/{character_id}` (PILOT-003).

#### Scenario: Public character request

- **WHEN** the application loads a pilot's public information for a character id
- **THEN** the request is the ESI characters detail operation for that id

### Requirement: Pilot fields follow the versioned model

The pilot field model SHALL be the versioned model in `L2/DOMAIN/MODELS/Pilot.md` (PILOT-007). The Pilot data model SHALL be created from the public character information (PILOT-006).

#### Scenario: Fields come from the Pilot model

- **WHEN** a developer reads the pilot fields
- **THEN** they are the versioned model in `L2/DOMAIN/MODELS/Pilot.md`

### Requirement: Pilot model matches the supplied character

Development and standalone tests SHALL use the supplied ESI sample as the WireMock response for character id `93813310` (PILOT-005).

#### Scenario: WireMock returns Perico Tuerto

- **WHEN** a standalone test requests character `93813310` from WireMock
- **THEN** the response is birthday `2013-09-09T19:40:09Z`, bloodline_id `6`, corporation_id `1000077`, gender `male`, name `Perico Tuerto`, race_id `4`, achievement_score `0`, an empty description, and security_status `0`
- **AND** the Pilot model can be built from that body
