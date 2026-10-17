# front/angular-structure Specification

## Purpose

Application structure for pages, panels, section modules, and shared modules. Source: STRUCT-001 … STRUCT-007 in `L2/FRONT/07.ANGULAR-STRUCTURE.md`.

## ADDED Requirements

### Requirement: Page, panel, and section definitions

A page SHALL be a routed screen. A panel SHALL be a piece of a page with no route of its own. A section SHALL be an Angular module under `app/modules` that owns that section's pages and panels. The root router SHALL load a section with `loadChildren`. The section module SHALL register its routes with `RouterModule.forChild` (STRUCT-001).

#### Scenario: Section loads as a child module

- **WHEN** the user navigates to a section root path
- **THEN** the root router lazy-loads that section module
- **AND** the section registers its routes with `RouterModule.forChild`

### Requirement: Shell pages under app/pages

`app/pages` SHALL hold the application shell screens. The root SHALL route `login` to `login-page`, `login-callback` to `login-callback-page`, and `dashboard` to `dashboard-home-page`. `dashboard` SHALL be behind `authGuard`. The empty path SHALL redirect to `dashboard` (STRUCT-002).

#### Scenario: Empty path goes to dashboard

- **WHEN** the user opens the application at the empty path
- **THEN** they are redirected to `dashboard`
- **AND** `dashboard` is guarded by `authGuard`

### Requirement: Core-only panels under app/panels

`app/panels` SHALL hold panels used only by core pages. Those panels SHALL NOT be routes. The login validation page SHALL be built from `login-validation-progress` and `login-validation-exception` (STRUCT-003).

#### Scenario: Core panel is not a route

- **WHEN** a panel lives under `app/panels`
- **THEN** it has no route of its own
- **AND** it is composed into a core page

### Requirement: Shared panels in modules/header

A panel used on core pages and on other pages SHALL belong in `modules/header`, declared and exported there, not in `app/panels`. `app-info-panel`, `server-info-panel`, and `v1-pilot-panel` SHALL follow that rule. Core pages and section pages MAY host them (STRUCT-004).

#### Scenario: Header panel on a section page

- **WHEN** a section page needs `app-info-panel` or `server-info-panel`
- **THEN** it composes the panel from `modules/header`
- **AND** the panel is not declared under `app/panels`

### Requirement: Industry and manufacture section modules

Only industry (including manufacture) SHALL be in scope for this epic. Industry SHALL be `modules/industry` at path `industry` with pages in `modules/industry/pages`. Manufacture SHALL be `modules/industry/manufacture` at path `industry/manufacture` with pages in `modules/industry/manufacture/pages`. Both SHALL use folder names `pages` and `panels`. Each section page SHALL compose its own panels and MAY compose shared header panels. Planetary, loyalty, fittings, and later sections SHALL remain deferred (STRUCT-005).

#### Scenario: Manufacture is nested under industry

- **WHEN** the industry section is created
- **THEN** manufacture lives under `modules/industry/manufacture`
- **AND** its root path is `industry/manufacture`

### Requirement: Non-section support modules

`modules/header`, `modules/shared`, `modules/renders`, `modules/common`, and `modules/innovative-core` SHALL supply pieces to pages. They SHALL NOT represent an application section and SHALL NOT own a root route (STRUCT-006).

#### Scenario: Shared module has no section route

- **WHEN** a developer adds a shared render or pipe under these modules
- **THEN** no new root `loadChildren` section route is required for that module alone

### Requirement: Placement rules for new screens and panels

New core screens SHALL go in `app/pages`. New panels used only by core pages SHALL go in `app/panels`. New panels used on core pages and on other pages SHALL go in `modules/header`. A screen that belongs to a section SHALL go in that section module, with that section's panels beside it (STRUCT-007).

#### Scenario: New industry page placement

- **WHEN** a new industry screen is added
- **THEN** it is placed under the industry section's `pages` folder
- **AND** its section-specific panels live beside it under that section's `panels`
