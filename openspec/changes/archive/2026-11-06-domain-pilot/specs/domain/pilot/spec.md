# domain/pilot Specification

## Purpose

PublicPilotV1 and PilotV2 domain models for `neocom-domain`. Source: DOM-PILOT-001…007 in  .

## ADDED Requirements

### Requirement: PublicPilotV1 base type

**PublicPilotV1** SHALL be the public-only Pilot base (legacy / unauthenticated), kept for compatibility. Infinity: `PublicPilotV1.domain.ts`; `extends NeoComDelayed`; `jsonClass = 'PublicPilotV1'`. **PilotV2** extends it (DOM-PILOT-001).

#### Scenario: Programme names the public base

- **WHEN** a developer reads the public Pilot type
- **THEN** the programme type is **PublicPilotV1** with `jsonClass = 'PublicPilotV1'`

### Requirement: PublicPilotV1 accessors and fields

PublicPilotV1 SHALL expose `getPilotId`, `getCorporationId` (or `-1` when missing), `getPilotIcon` → `https://images.evetech.net/characters/{pilotId}/portrait?size=64` (character id `1` when `pilotId` missing). Corporation logo when needed: `corporations/{corporationId}/logo`. Fields: `pilotId`, `name`, `corporation` (PublicCorporationV1 summary), `birthday`, `description`, `gender`, `securityStatus`, `url4Icon` (new renders ignore; use `getPilotIcon`), `raceData` / `ancestryData` / `bloodlineData` (name summaries; ESI-shaped types stay internal) (DOM-PILOT-002).

#### Scenario: Portrait URL from pilot id

- **WHEN** `getPilotIcon` is called for a known pilot id
- **THEN** the URL is the Eve images character portrait size 64 for that id

### Requirement: v1-public-pilot HEADER

Appearance `v1-public-pilot` HEADER variant SHALL use fixture **93813310** (Perico Tuerto). Ancestry line: `raceData.name + ' - ' + ancestryData.name + ' - ' + bloodlineData.name`. HEADER uses at least: pilotId, name, gender (uppercase), ancestry line (DOM-PILOT-003).

#### Scenario: HEADER shows ancestry line

- **WHEN** a PublicPilotV1 is rendered with the HEADER variant
- **THEN** pilotId, name, uppercase gender, and the ancestry line are shown

### Requirement: PilotV2 published type

**PilotV2** SHALL be the published Pilot for new development. Extends **PublicPilotV1**. Infinity: `PilotV2.domain.ts`; `jsonClass = 'Pilot'` in infinity; programme type is **PilotV2**. Unversioned `Pilot` is legacy (DOM-PILOT-004).

#### Scenario: New work uses PilotV2

- **WHEN** new development references the Pilot programme type
- **THEN** the type name is **PilotV2**

### Requirement: PilotV2 fields

PilotV2 SHALL add `totalSkillpoints`, `walletBalance`, `currentShipName`, `currentShipTypeName`, `lastKnownLocation` (infinity `SpaceLocationV1`; new work: derive from **EveLocationV1**). Base accessors stay on PublicPilotV1. `getLastKnownLocation` string helper over location. Pilot belongs to a credential (up to 3 pilots); ESI payloads are server-internal; fixture **93813310** (DOM-PILOT-005).

#### Scenario: V2-only fields present

- **WHEN** a PilotV2 instance is built for the fixture character
- **THEN** the V2-only fields listed above are part of the model contract

### Requirement: v2-pilot HEADER

Appearance `v2-pilot` HEADER SHALL show the same public lines as `v1-public-pilot`, plus skill points, wallet, current ship name. Render binds `@Input node: PilotV2` (DOM-PILOT-006).

#### Scenario: HEADER adds wallet and skills

- **WHEN** a PilotV2 is rendered with the HEADER variant
- **THEN** skill points, wallet, and current ship name appear in addition to the public lines

### Requirement: Complements PilotShipV1 and EveLocationV1

Complements for new work: boarded ship as **PilotShipV1** (HEADER MAY keep `currentShipName` until updated); current location as **EveLocationV1** (replaces opaque `lastKnownLocation`). Compatibility fields remain until migrate (DOM-PILOT-007).

#### Scenario: Complements named without forcing migration

- **WHEN** new work plans boarded ship and current location
- **THEN** the target types are **PilotShipV1** and **EveLocationV1** while compatibility fields may remain
