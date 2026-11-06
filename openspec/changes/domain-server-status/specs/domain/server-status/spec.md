# domain/server-status Specification

## Purpose

ServerStatusV1 for header EVE server info. Source: DOM-SRV-* in ; panel Appearance owned by EPIC-006 UI-SSP.

**Evolution:** the applied ADDED field/render contract that included `start_time`, `backendVersion`, and `startAgo` (and Backend on the render) is **superseded** by the EPIC-006 panel field set. On L1 that is Review=`superseded`. In OpenSpec, replace it with a follow-up delta using **`## MODIFIED Requirements`** and/or **`## REMOVED Requirements`** (below records the intent against the applied text).

## ADDED Requirements

### Requirement: ServerStatusV1 published model

**ServerStatusV1** SHALL be the published domain model for EVE Online server information in the application header (`jsonClass = "ServerStatusV1"`). Infinity legacy class `ServerStatus.domain.ts`. Legacy `server-info-panel` superseded by provider → **`v1-server-status-render`**. ESI server status shape is **internal** (DOM-SRV-001).

#### Scenario: Programme type is ServerStatusV1

- **WHEN** header server info is modelled
- **THEN** the programme type is **ServerStatusV1**

## REMOVED Requirements

### Requirement: ServerStatusV1 fields

**Reason:** superseded by EPIC-006 / DOM-SRV-004. Former requirement exposed `server`, `players`, `start_time`, `backendVersion`, `SDEVersion`, `startAgo`, `nextDowntime` (DOM-SRV-002). Dropped from published contract: `start_time`, `backendVersion`, `startAgo`.

### Requirement: v1-server-status-render contract

**Reason:** superseded by EPIC-006 UI-SSP / DOM-SRV-005. Former requirement required Backend on the card and the wide enrichment set (DOM-SRV-003).

## ADDED Requirements (replacement field / render contract)

### Requirement: ServerStatusV1 fields (header panel)

Published **ServerStatusV1** SHALL expose **only** `server` (`getServerName`), `players` (`getPlayersCount`, default `0`), `SDEVersion` (`getSDEVersion`), `nextDowntime` (`getNextDowntime`) (DOM-SRV-004 / EPIC-004 SRV-005).

#### Scenario: Players default

- **WHEN** players count is missing
- **THEN** `getPlayersCount` defaults to `0`

#### Scenario: No Backend on published contract

- **WHEN** ServerStatusV1 is published for the header panel
- **THEN** `backendVersion`, `start_time`, and `startAgo` are not required fields of the published model

### Requirement: v1-server-status-render contract (EPIC-006)

Header provider obtains ServerStatusV1; **`v1-server-status-render`** SHALL show server name, ONLINE/OFFLINE (ONLINE when a status instance is present), CAPSULEERS line with **SDE version** and **players count**, and NEXT DT — per EPIC-006 UI-SSP. ONLINE/OFFLINE is UI derivation, not a stored field (DOM-SRV-005).

#### Scenario: ONLINE when instance present

- **WHEN** a ServerStatusV1 instance is present for the header
- **THEN** the render treats the server as ONLINE

#### Scenario: No Backend on panel

- **WHEN** the header paints `v1-server-status-render`
- **THEN** Backend is not shown
