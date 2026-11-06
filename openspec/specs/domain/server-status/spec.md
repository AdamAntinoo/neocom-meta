# domain/server-status Specification

## Purpose
ServerStatusV1 for header EVE server info. Source: DOM-SRV-* in ; panel Appearance owned by EPIC-006 UI-SSP.

**Evolution:** the applied ADDED field/render contract that included `start_time`, `backendVersion`, and `startAgo` (and Backend on the render) is **superseded** by the EPIC-006 panel field set. On L1 that is Review=`superseded`. In OpenSpec, replace it with a follow-up delta using **`## MODIFIED Requirements`** and/or **`## REMOVED Requirements`** (below records the intent against the applied text).

## Requirements

### Requirement: ServerStatusV1 published model

**ServerStatusV1** SHALL be the published domain model for EVE Online server information in the application header (`jsonClass = "ServerStatusV1"`). Infinity legacy class `ServerStatus.domain.ts`. Legacy `server-info-panel` superseded by provider → **`v1-server-status-render`**. ESI server status shape is **internal** (DOM-SRV-001).

#### Scenario: Programme type is ServerStatusV1

- **WHEN** header server info is modelled
- **THEN** the programme type is **ServerStatusV1**
