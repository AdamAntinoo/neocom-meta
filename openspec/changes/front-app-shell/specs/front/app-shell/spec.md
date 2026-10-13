# front/app-shell Specification

## Purpose

Full-canvas frame for the Angular application. Source: SHELL-001 … SHELL-003 in `L2/FRONT/03.APP-SHELL.md`.

## ADDED Requirements

### Requirement: Router outlet uses the canvas

The page where rendering happens SHALL be an Angular `router-outlet` with 0 margins and 0 borders, using the most space available on the HTML canvas (SHELL-001).

#### Scenario: Outlet has no frame

- **WHEN** the application shell is shown
- **THEN** the `router-outlet` has no margin and no border

### Requirement: Pages inside the outlet are frameless

Angular pages inside the `router-outlet` SHALL have zero margins and zero borders, so div components inside them can use all of that space (SHELL-002).

#### Scenario: A page does not inset its children

- **WHEN** a page is rendered in the outlet
- **THEN** that page has no margin and no border

### Requirement: Body has no margin or padding

The document `body` SHALL have margin 0px and padding 0px (SHELL-003).

#### Scenario: Body box is flush

- **WHEN** the application document is loaded
- **THEN** `body` margin is 0
- **AND** `body` padding is 0
