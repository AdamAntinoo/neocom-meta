# front/page-header Specification

## Purpose

Shared page header controller and Appearances for ApplicationInfo / ServerStatus renders. Source: UI-VER / UI-HDR / UI-AIP / UI-SSP in `L2/FRONT/12.PAGE-HEADER.md` (EPIC-006).

## ADDED Requirements

### Requirement: Versioned panel and render names

Panels and renders bound to domain models SHALL use a lowercase **`vn-`** prefix in public selector and path names that tracks the domain type version (UI-VER-001, UI-VER-002). Unversioned legacy panels `app-info-panel` and `server-info-panel` SHALL NOT be used for new work (UI-VER-003).

#### Scenario: Application info uses v1 render

- **WHEN** the header paints ApplicationInfoV1
- **THEN** the render selector is `v1-application-info-render`
- **AND** pages do not compose `app-info-panel` for new work

### Requirement: app-page-header is the header controller

Pages that need a header SHALL put `<app-page-header …>` as the first element in the page HTML (UI-HDR-001). Page templates SHALL NOT compose header renders or legacy `app-info-panel` / `server-info-panel` directly (UI-HDR-002). `app-page-header` SHALL own `cy-section-name="header"` and host the render slots (UI-HDR-005). The exception region SHALL stay under the header, owned by the page (UI-HDR-006).

#### Scenario: Secured page inserts the header once

- **WHEN** a secured page template is authored
- **THEN** the first child is `app-page-header`
- **AND** the page does not name inner header renders

### Requirement: Header variants and providers

Variant **`-APP-`** (default, secured pages) SHALL provide ApplicationInfoV1 and ServerStatusV1 (+ application menu when specified) to their `v1` renders (UI-HDR-003). Variant **`-AUTH-`** SHALL provide ApplicationInfoV1 only — no ServerStatusV1, no application menu (UI-HDR-004). The header controller SHALL locate those domain instances via data providers and inject each node into the render resolved by `jsonClass`; renders SHALL call node accessors only (UI-HDR-007, UI-HDR-008, UI-HDR-009).

#### Scenario: Auth page shows app info only

- **WHEN** `app-page-header` uses variant `-AUTH-`
- **THEN** ApplicationInfoV1 is painted
- **AND** ServerStatusV1 is not shown

### Requirement: Application info Appearance

Application info in the header SHALL be painted by **`v1-application-info-render`** (UI-AIP-001). The render SHALL use **`neocom-panel panel-white`** and `cy-section-name="app-info"` (UI-AIP-002). Contents SHALL show **name** (uppercase), **version**, and **copyright** from ApplicationInfoV1 (UI-AIP-003). Name uses Elemental (large, white); version uses Elemental (smaller, yellow); copyright uses Open Sans (small) (UI-AIP-004). On `-AUTH-` the header hosts this panel only; on `-APP-` it hosts this panel together with the server-status panel (UI-AIP-005).

#### Scenario: Strip specimen matches header paint

- **WHEN** ApplicationInfoV1 is shown in the header
- **THEN** name, version, and copyright follow the model-strip Appearance typography

### Requirement: Server status Appearance

Server status in the header (`-APP-`) SHALL be painted by **`v1-server-status-render`** (UI-SSP-001). The render SHALL use **`neocom-panel panel-blue`** and `cy-section-name="server-info"` (UI-SSP-002). Line 1: server name left and status right, both Elemental 14px (UI-SSP-003). Metric lines SHALL use Open Sans, labels left and values right (UI-SSP-004). Metric labels SHALL use orange `#ffa500` (UI-SSP-005). Panel height SHALL match the application-info panel (UI-SSP-006). Line 2 (`CAPSULEERS`) SHALL show SDE version and players count on the same line; line 3 is NEXT DT; SHALL NOT show Backend or a separate SDE VERSION line (UI-SSP-007).

#### Scenario: Capsuleers line combines SDE and count

- **WHEN** ServerStatusV1 is painted on `-APP-`
- **THEN** CAPSULEERS shows SDE version and players on one line
- **AND** NEXT DT is the following metric line
