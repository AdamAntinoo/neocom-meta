# domain/locations Specification

## Purpose

Space location identity and hierarchy levels. Source: `L2/DOMAIN/06.LOCATIONS.md` (from `L2/08.EPIC-LOCATIONS.md`).

## ADDED Requirements

### Requirement: Published location names its kind

A published location SHALL name its kind. Infinity does this with `locationType` (`LocationIdentifierType`) and uses the most specific id as `locationId` (LOC-001).

#### Scenario: Kind and id pair

- **WHEN** a location is published
- **THEN** it has a `locationType` and a `locationId` for the most specific level

### Requirement: Ancestor chain on deeper locations

A deeper location SHALL carry its ancestor place (region, and constellation or system when those levels exist) so a render can show the chain without a second lookup (LOC-002).

#### Scenario: Station carries system chain

- **WHEN** a station location is published
- **THEN** system, constellation, and region ancestors are present on the same object

### Requirement: Location chain identity table

A location is one node in a chain. The most specific level supplied sets `locationType` and `locationId`. Ancestor levels are copied onto the same object. `locationType` values: `REGION`, `CONSTELLATION`, `SOLAR_SYSTEM`, `STATION`, `STRUCTURE`, with ancestor fields as in the EPIC-008 identity table (DOM-LOC-001).

#### Scenario: STRUCTURE includes corporation and chain

- **WHEN** `locationType` is `STRUCTURE`
- **THEN** structure and corporation fields plus station/system/constellation/region ancestors follow the identity table

### Requirement: SpaceLocation node fields

**SpaceLocation** lookup node SHALL expose `locationType` and `locationId` (id of the most specific level). Domain type in the library: `org.dimensinfin.eveonline.neocom.domain.space.SpaceLocation` / `SpaceLocationImplementation` (DOM-LOC-002).

#### Scenario: Node exposes kind and id

- **WHEN** a SpaceLocation node is read
- **THEN** `locationType` and `locationId` are available

### Requirement: Region level

A region location SHALL expose `regionId` and `regionName`, and `locationId` SHALL be the region id (`locationType = REGION`) (LOC-020).

#### Scenario: Region locationId matches regionId

- **WHEN** a REGION location is built
- **THEN** `locationId` equals `regionId`

### Requirement: Constellation level

A constellation location SHALL expose constellation id and name plus the parent region (`locationType = CONSTELLATION`) (LOC-030).

#### Scenario: Constellation includes parent region

- **WHEN** a CONSTELLATION location is built
- **THEN** constellation id/name and region id/name are present

### Requirement: Solar system level

A solar-system location SHALL expose system id, name, `securityClass`, and `securityStatus`, plus constellation and region (`locationType = SOLAR_SYSTEM`) (LOC-040).

#### Scenario: Solar system includes security

- **WHEN** a SOLAR_SYSTEM location is built
- **THEN** `securityClass` and `securityStatus` are present with constellation and region

### Requirement: Station level

A station location SHALL expose station id and name plus the system, constellation, and region it sits in (`locationType = STATION`) (LOC-050).

#### Scenario: Station includes system chain

- **WHEN** a STATION location is built
- **THEN** station id/name and system/constellation/region ancestors are present

### Requirement: Shipping yard and home station resolve to Station

A shipping yard and a corporation home station SHALL resolve to a **Station**, not to a bare id (LOC-051).

#### Scenario: Home station is a Station

- **WHEN** a corporation home station is resolved
- **THEN** the result is a Station location, not a bare numeric id

### Requirement: Structure level

A structure location SHALL expose structure id, name, type id, owner id, and corporation id and name, plus the system chain (`locationType = STRUCTURE`) (LOC-060).

#### Scenario: Structure includes corporation

- **WHEN** a STRUCTURE location is built
- **THEN** structure id/name, type id, owner id, corporation id/name, and the system chain are present
