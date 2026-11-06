# front/dashboard Specification

## Purpose
Application Dashboard and feature dashboards (provider-driven feature lists). Source: UI-DASH-* in  (EPIC-006). Legacy DASH-001…009 retained only where they do not conflict.

## Requirements

### Requirement: Dashboard is the secured landing page

Dashboard SHALL be the application landing page after successful login and character selection (UI-DASH-001). Dashboard SHALL be secured; unauthenticated users or users without a selected character SHALL NOT see it as the post-login home (UI-DASH-002).

#### Scenario: Home after character selection

- **WHEN** the user has logged in and selected a character
- **THEN** Dashboard is the landing page
- **AND** unauthenticated users do not receive it as home

### Requirement: Dashboard layout rows

Dashboard layout rows SHALL be, in order: `app-page-header`; pilot & corporation; breadcrumb (from Dashboard); feature list listing panel (UI-DASH-003). Dashboard SHALL start with `<app-page-header />` (`-APP-` variant); the header controller provides ApplicationInfoV1 and ServerStatusV1 to their `v1` renders (UI-DASH-005). The second row SHALL include the pilot information panel and the corporation information panel (UI-DASH-007). On the Dashboard (and secured pages that reuse the same chrome), separations between **header first line** and **pilot & corporation** row, between **pilot** and **corporation**, between **app-info** and **server-info**, and the **border inset** of those panels SHALL use **UI-GEO-001** (default panel gap) — no larger page-local padding/gap on the pilot row (UI-DASH-015).

#### Scenario: Header then pilot row

- **WHEN** Dashboard is shown
- **THEN** the first row is `app-page-header` in `-APP-` variant
- **AND** the next content row includes pilot and corporation panels

#### Scenario: Pilot row uses default panel gap

- **WHEN** Dashboard (or secured chrome reusing it) lays out header, pilot, and corporation panels
- **THEN** separations and border insets use the UI-GEO-001 default panel gap
- **AND** the pilot row does not use a larger page-local padding/gap

### Requirement: Navigation breadcrumb

Third row SHALL be the navigation **breadcrumb**, starting at the Dashboard; each crumb SHALL be a **link** to its page reference so the trail is usable for navigation (UI-DASH-008). Breadcrumb trail on non-Dashboard secured pages SHALL reflect Dashboard → … and each step SHALL remain a navigable link to that page (UI-DASH-010).

#### Scenario: Crumbs are links

- **WHEN** Dashboard is shown
- **THEN** the breadcrumb starts at Dashboard
- **AND** each crumb navigates to its page
- **WHEN** a secured non-Dashboard page is shown
- **THEN** the trail includes Dashboard as an ancestor link

### Requirement: Feature list listing panel

The feature list row SHALL be a listing panel: a data provider supplies feature domain data; each item is shown with a feature render like other renders (UI-DASH-004). Feature list SHALL NOT permanently hard-code feature slots in the page template; it consumes the provider list through the standard listing + render path (UI-DASH-009).

#### Scenario: Provider drives feature cards

- **WHEN** the feature provider returns a list of features
- **THEN** each feature is painted with the feature render
- **AND** the page template does not hard-code permanent feature slots

### Requirement: Feature dashboards and nesting

Selecting a parent feature (e.g. Industry) SHALL navigate to that feature’s dashboard/page; that page SHALL show a new feature list for Industry subfeatures (UI-DASH-012). Feature dashboards SHALL reuse the secured page chrome pattern (header, breadcrumb reflecting Dashboard → parent → …, feature list row) as applicable (UI-DASH-013). Subfeature nesting SHALL follow the navigation structure; each level’s provider SHALL supply only the features for the current parent context (UI-DASH-014).

#### Scenario: Industry opens a scoped feature list

- **WHEN** the user selects the Industry parent feature
- **THEN** the Industry feature dashboard is shown
- **AND** its feature list provider is scoped to Industry subfeatures

### Requirement: Pilot identifier cookie (retained)

The dashboard SHALL receive a Pilot identifier for data operations and display. The identifier SHALL NOT be a route parameter. It SHALL be stored in a cookie named `neocom-pilot-id`. Until login is operative, that cookie SHALL be initialized to `93813310` (DASH-003).

#### Scenario: Test pilot id comes from the cookie

- **WHEN** the dashboard loads and login is not operative
- **THEN** the pilot identifier is the cookie `neocom-pilot-id`
- **AND** its value is `93813310`

### Requirement: Exception under the header (retained)

When a page receives an exception, that page SHALL show an exception component named `exception` under the `header` section. This SHALL apply to every page. How the exception is passed is not part of this requirement (DASH-007).

#### Scenario: Exception under header

- **WHEN** a page has an exception
- **THEN** `exception` is shown under `header`
