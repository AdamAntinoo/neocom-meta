# back/service Specification

## Purpose

The pilot use case reads public ESI information through the installed ESI tool and converts it into the pilot DTO. Source: `L2/BACK/BACK-SERVICE.md`.

## ADDED Requirements

### Requirement: Pilot use case reads public ESI information

The pilot use case SHALL use the ESI tool installed in `neocom-back` to retrieve the public information from ESI and convert that result into the pilot DTO model (BACK-011).

#### Scenario: Public ESI information becomes the pilot DTO

- **WHEN** the pilot use case retrieves a pilot
- **THEN** it reads the public information from ESI with the installed ESI tool
- **AND** it converts that result into the pilot DTO

### Requirement: Missing character is not found

If the character is not found on the ESI platform, the pilot use case SHALL return a not found (BACK-012).

#### Scenario: ESI has no character

- **WHEN** the ESI platform has no character for the requested pilot
- **THEN** the pilot use case returns a not found

### Requirement: Exceptions use NeocomBackendError

Exception raising SHALL use an exception class that can contain a payload with additional fields. The format of the exception content SHALL be `NeocomBackendError` (BACK-013).

#### Scenario: A raised exception carries the error format

- **WHEN** the backend raises an exception
- **THEN** the exception class can contain a payload with additional fields
- **AND** the exception content uses the `NeocomBackendError` format
