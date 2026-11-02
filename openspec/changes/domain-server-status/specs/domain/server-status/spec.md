# domain/server-status Specification

## Purpose

ServerStatusV1 for header EVE server info. Source: DOM-SRV-001…003 in `L2/DOMAIN/05.SERVER-STATUS.md`.

## ADDED Requirements

### Requirement: ServerStatusV1 published model

**ServerStatusV1** SHALL be the published domain model for EVE Online server information in the application header (`jsonClass = "ServerStatusV1"`). Infinity legacy class `ServerStatus.domain.ts`. Legacy `server-info-panel` superseded by provider → **`v1-server-status-render`**. ESI server status shape is **internal**; ServerStatusV1 may add NeoCom fields not in ESI alone (DOM-SRV-001).

#### Scenario: Programme type is ServerStatusV1

- **WHEN** header server info is modelled
- **THEN** the programme type is **ServerStatusV1**

### Requirement: ServerStatusV1 fields

ServerStatusV1 SHALL expose `server` (`getServerName()`), `players` (`getPlayersCount()`, default `0`), `start_time` (`getStartTime()`), `backendVersion`, `SDEVersion`, `startAgo` (`getStartedAgo`), `nextDowntime` (DOM-SRV-002).

#### Scenario: Players default

- **WHEN** players count is missing
- **THEN** `getPlayersCount()` defaults to `0`

### Requirement: v1-server-status-render contract

Header provider obtains ServerStatusV1; `v1-server-status-render` SHALL show at least server name, ONLINE/OFFLINE (ONLINE when status instance present), capsuleer count, backend version, SDE version, next downtime; loading while request in flight. ONLINE/OFFLINE is UI derivation (`getServerStatus()`), not a stored field (DOM-SRV-003).

#### Scenario: ONLINE when instance present

- **WHEN** a ServerStatusV1 instance is present for the header
- **THEN** the render treats the server as ONLINE
