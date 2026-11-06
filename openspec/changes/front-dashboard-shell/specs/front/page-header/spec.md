# front/page-header Specification

## Purpose

Shared page header controller and Appearances for ApplicationInfo / ServerStatus renders. Source: UI-VER / UI-HDR / UI-AIP / UI-SSP in  (EPIC-006).

## ADDED Requirements

### Requirement: Versioned panel and render names

Panels and renders bound to domain models SHALL use a lowercase **`vn-`** prefix in public selector and path names that tracks the domain type version (UI-VER-001, UI-VER-002). Unversioned legacy panels `app-info-panel` and `server-info-panel` SHALL NOT be used for new work (UI-VER-003).

#### Scenario: Application info uses v1 render

- **WHEN** the header paints ApplicationInfoV1
- **THEN** the render selector is `v1-application-info-render`
- **AND** pages do not compose `app-info-panel` for new work

### Requirement: Page hosts stay unversioned

**Page** hosts (`*-page` selectors, folders, classes) SHALL **not** use a `vn-` prefix (e.g. `dashboard-home-page`, `character-selection-page`, `login-page`, `model-strip-page`, `blueprint-by-location-page`) (UI-VER-004). Versionability stays on panels/renders (UI-VER-001…003). Existing versioned page names SHALL be migrated (e.g. `v1-blueprint-by-location-page` → `blueprint-by-location-page`). Route URL paths SHALL stay stable unless a later requirement says otherwise.

#### Scenario: Dashboard page has no vn- prefix

- **WHEN** the Dashboard page host is named
- **THEN** the selector / folder / class use `dashboard-home-page` (or equivalent unversioned `*-page`)
- **AND** they do not use a `v1-` / `vn-` page prefix

### Requirement: Default panel gap (page geometry)

Secured chrome that places NeoCom panels side by side or stacked SHALL separate them (and inset from the page/band border) using the programme **default panel gap** (`$panel-margin` / `$panel-padding`, today `2px`) — not a larger page-local spacing scale (UI-GEO-001).

#### Scenario: Adjacent panels use default gap

- **WHEN** two NeoCom panels sit side by side or stacked in secured chrome
- **THEN** separation uses `$panel-margin` / `$panel-padding`
- **AND** the page does not invent a larger local gutter for that separation

### Requirement: Section/row gap uses section-padding

Gap between **rows** or **sections** SHALL use the default **`$section-padding`**; that token’s default SHALL equal **`$panel-padding`** (UI-GEO-002 / DEF-BLP-005).

#### Scenario: Section gap equals panel padding

- **WHEN** page geometry spaces rows or sections
- **THEN** the gap is `$section-padding`
- **AND** `$section-padding` defaults to the same value as `$panel-padding`

### Requirement: app-page-header is the header controller

Pages that need a header SHALL put `<app-page-header …>` as the first element in the page HTML (UI-HDR-001). Page templates SHALL NOT compose header renders or legacy `app-info-panel` / `server-info-panel` directly (UI-HDR-002). `app-page-header` SHALL own `cy-section-name="header"` and host the render slots (UI-HDR-005). The exception region SHALL stay under the header, owned by the page (UI-HDR-006). The header host SHALL be named consistently `app-page-header` across selector, folder/file basename, component class, and primary CSS class; source artefacts SHALL NOT remain named only `page-header` while the programme name is `app-page-header` (UI-HDR-010).

#### Scenario: Secured page inserts the header once

- **WHEN** a secured page template is authored
- **THEN** the first child is `app-page-header`
- **AND** the page does not name inner header renders

#### Scenario: Header host identity is app-page-header

- **WHEN** the header host artefacts are inspected
- **THEN** selector, folder/file basename, component class, and primary CSS class use `app-page-header`
- **AND** they are not left as `page-header` only

### Requirement: Header variants and providers

Variant **`-APP-`** (default, secured pages) SHALL provide ApplicationInfoV1 and ServerStatusV1 (+ application menu when specified) to their `v1` renders (UI-HDR-003). Variant **`-AUTH-`** SHALL provide ApplicationInfoV1 only — no ServerStatusV1, no application menu (UI-HDR-004). The header controller SHALL locate those domain instances via data providers and inject each node into the render resolved by `jsonClass`; renders SHALL call node accessors only (UI-HDR-007, UI-HDR-008, UI-HDR-009).

#### Scenario: Auth page shows app info only

- **WHEN** `app-page-header` uses variant `-AUTH-`
- **THEN** ApplicationInfoV1 is painted
- **AND** ServerStatusV1 is not shown

### Requirement: Header first-line width and responsive stack

On `-APP-`, the header first line (application-info + server-info) SHALL span the **full page width**; **server-info** SHALL sit on the **right**, sized to its **content**; **app-info** SHALL use the **remaining** width; when horizontal space is insufficient, stack **app-info above server-info** (each full width of the band) (UI-HDR-011). On `-AUTH-`, app-info alone SHALL still span the band.

#### Scenario: Wide layout keeps server-info on the right

- **WHEN** `-APP-` header has enough horizontal space
- **THEN** app-info and server-info share one full-width first line
- **AND** server-info is content-sized on the right

#### Scenario: Narrow layout stacks app-info above server-info

- **WHEN** `-APP-` header horizontal space is insufficient
- **THEN** app-info stacks above server-info
- **AND** each spans the full width of the band

### Requirement: Application info Appearance

Application info in the header SHALL be painted by **`v1-application-info-render`** (UI-AIP-001). The render SHALL use **`neocom-panel panel-white`** and `cy-section-name="app-info"` (UI-AIP-002). Contents SHALL show **name** (uppercase), **version**, and **copyright** from ApplicationInfoV1 (UI-AIP-003). Name uses Elemental (large, white); version uses Elemental (smaller, yellow); copyright uses Open Sans (small) (UI-AIP-004). On `-AUTH-` the header hosts this panel only; on `-APP-` it hosts this panel together with the server-status panel (UI-AIP-005). When the user activates the application **name** control (`cy-field-value="app-name"`), the app SHALL navigate to the **character selection** route (`/character-selection`); activation is the **name** only (not version, not copyright) (UI-AIP-006).

#### Scenario: Strip specimen matches header paint

- **WHEN** ApplicationInfoV1 is shown in the header
- **THEN** name, version, and copyright follow the model-strip Appearance typography

#### Scenario: App name navigates to character selection

- **WHEN** the user activates `cy-field-value="app-name"` in `v1-application-info-render`
- **THEN** the app navigates to `/character-selection`
- **AND** activating version or copyright does not perform that navigation

### Requirement: Server status Appearance

Server status in the header (`-APP-`) SHALL be painted by **`v1-server-status-render`** (UI-SSP-001). The render SHALL use **`neocom-panel panel-blue`** and `cy-section-name="server-info"` (UI-SSP-002). Line 1: server name left and status right, both Elemental 14px (UI-SSP-003). Metric lines SHALL use Open Sans, labels left and values right (UI-SSP-004). Metric labels SHALL use orange `#ffa500` (UI-SSP-005). Panel height SHALL match the application-info panel (UI-SSP-006). Line 2 (`CAPSULEERS`) SHALL show SDE version and players count on the same line; line 3 is NEXT DT; SHALL NOT show Backend or a separate SDE VERSION line (UI-SSP-007).

#### Scenario: Capsuleers line combines SDE and count

- **WHEN** ServerStatusV1 is painted on `-APP-`
- **THEN** CAPSULEERS shows SDE version and players on one line
- **AND** NEXT DT is the following metric line
