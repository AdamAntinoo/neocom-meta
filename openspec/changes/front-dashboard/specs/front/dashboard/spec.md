# front/dashboard Specification

## Purpose

Landing dashboard, pilot cookie, and the shared page sections. Source: DASH-001 … DASH-009 in `L2/FRONT/04.DASHBOARD.md`.

## ADDED Requirements

### Requirement: Dashboard is the landing page

After `index.html`, the application SHALL open the initial landing page. That page SHALL be the dashboard under `app/pages` (DASH-001, DASH-002). The page SHALL sit under the authentication protocol. At this stage every page SHALL be treated as authenticated, and the Angular filter SHALL return a successful authentication (DASH-001).

#### Scenario: Startup opens the dashboard

- **WHEN** the application finishes loading `index.html`
- **THEN** the dashboard page is shown
- **AND** the authentication filter allows the navigation

### Requirement: Pilot identifier cookie

The dashboard SHALL receive a Pilot identifier for data operations and display. The identifier SHALL NOT be a route parameter. It SHALL be stored in a cookie named `neocom-pilot-id`. Until login is operative, that cookie SHALL be initialized to `93813310` (DASH-003).

#### Scenario: Test pilot id comes from the cookie

- **WHEN** the dashboard loads and login is not operative
- **THEN** the pilot identifier is the cookie `neocom-pilot-id`
- **AND** its value is `93813310`

### Requirement: Dashboard sections

The dashboard page SHALL have 2 rows, 2 sections, and 3 components (DASH-004). The top row SHALL be a borderless section named `header` containing `app-info-panel` and, next to it, `server-info-panel` (DASH-005). The second row SHALL be the section named `pilot-dashboard` containing `pilot-public-info` (DASH-006).

#### Scenario: Header and pilot dashboard

- **WHEN** the dashboard is shown without an exception
- **THEN** `header` contains `app-info-panel` and `server-info-panel` and has no border
- **AND** `pilot-dashboard` contains `pilot-public-info`

### Requirement: Exception under the header

When a page receives an exception, that page SHALL show an exception component named `exception` under the `header` section. This SHALL apply to every page. How the exception is passed is not part of this requirement (DASH-007).

#### Scenario: Exception replaces the page body under the header

- **WHEN** a page has an exception
- **THEN** `exception` is shown under `header`

### Requirement: Panel colour and section gap

Panels and components SHALL declare their box with a class `panel-` followed by a colour (DASH-008). `app-info-panel` SHALL use white, `server-info-panel` SHALL use blue, and the pilot panel SHALL use green (DASH-009). Sections SHALL decompose into rows or columns, and that decomposition SHALL define the gap (DASH-008).

#### Scenario: Named panel colours

- **WHEN** the dashboard panels are shown
- **THEN** the app info panel uses `panel-white`
- **AND** the server info panel uses `panel-blue`
- **AND** the pilot panel uses `panel-green`
