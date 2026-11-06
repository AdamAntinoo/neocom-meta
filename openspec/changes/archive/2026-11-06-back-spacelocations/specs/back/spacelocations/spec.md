# back/spacelocations Specification

## Purpose

Universe space location lookup. Source: LOC-010 in .

## ADDED Requirements

### Requirement: Lookup SpaceLocation by id

`GET /api/v1/universe/spacelocations/{locationId}` SHALL return one `SpaceLocation` for that id (`SpaceLocationControllerV1` → `LocationCatalogService.searchLocation4Id`). Kind is not part of the path. Response kind depends on what the catalog stored for that id (LOC-010).

#### Scenario: Lookup returns one node

- **WHEN** a client requests `/api/v1/universe/spacelocations/{locationId}` for a known id
- **THEN** the response is one SpaceLocation whose kind matches the catalog entry for that id

#### Scenario: Kind not in path

- **WHEN** a client looks up a location
- **THEN** the request path does not include a location kind segment
