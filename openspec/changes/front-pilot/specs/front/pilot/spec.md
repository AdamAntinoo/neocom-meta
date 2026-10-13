# front/pilot Specification

## Purpose

Define the Pilot as the Eve Online user's game presence and the public Character data that fills it. Source: `L2/FRONT/01.PILOT-DEFINITION.md`.

## ADDED Requirements

### Requirement: Pilot is the user's game presence

A pilot SHALL represent the Eve Online user's interaction with the game environment (PILOT-001). Inside this concept the ESI entity SHALL be named Character (PILOT-004).

#### Scenario: Programme name and ESI name

- **WHEN** a developer reads the Pilot model
- **THEN** the programme concept is Pilot
- **AND** the ESI record it is built from is a Character

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

### Requirement: Pilot model matches the supplied character

The Pilot data model SHALL be created from the public character information (PILOT-006). Development and standalone tests SHALL use the supplied ESI sample as the WireMock response for character id `93813310` (PILOT-005): birthday `2013-09-09T19:40:09Z`, bloodline_id `6`, corporation_id `1000077`, gender `male`, name `Perico Tuerto`, race_id `4`, achievement_score `0`, an empty description, and security_status `0`.

#### Scenario: WireMock returns Perico Tuerto

- **WHEN** a standalone test requests character `93813310` from WireMock
- **THEN** the response body is the supplied public character JSON
- **AND** the Pilot model can be built from that body
