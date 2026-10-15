# front/universe Specification

## Purpose

Unauthenticated ESI reference data that completes the Pilot model. Source: `L2/FRONT/02.UNIVERSE.md`.

## ADDED Requirements

### Requirement: Universe is public ESI data

The Universe SHALL be the ESI data that can be downloaded with no authentication (UNIV-001).

#### Scenario: No token required

- **WHEN** the application downloads a Universe dataset from the initial operation list
- **THEN** the request does not send an access token

### Requirement: Initial operations for the Pilot model

The initial Universe operations required to complete the Pilot data model SHALL be GetUniverseAncestries, GetUniverseBloodlines, GetUniverseFactions, GetUniverseGraphics, GetUniverseGroups, GetUniverseGroupsGroupId, GetUniverseCategories, and GetUniverseCategoriesCategoryId, as published in the EVE API explorer (UNIV-002).

#### Scenario: Pilot reference data is available

- **WHEN** a Pilot character payload contains ids that these operations describe
- **THEN** the application can obtain the matching Universe records from those operations

### Requirement: Front-end adapter and client cache

`neocom-front` SHALL read ESI universe data directly, with no authentication, through an adapter. Retrieved data SHALL be cacheable on the client because it usually does not change over time or across pilots (UNIV-003).

#### Scenario: Cached universe read

- **WHEN** the front end needs a Universe record that does not require authentication
- **THEN** it obtains the record through the adapter and may serve a later read from the client cache
