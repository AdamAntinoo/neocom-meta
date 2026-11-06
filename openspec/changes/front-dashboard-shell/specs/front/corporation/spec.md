# front/corporation Specification

## Purpose

Corporation information panel and `v1-corporation-render`. Source: UI-CORP-001…014 in EPIC-006.

## ADDED Requirements

### Requirement: Placement and pilot corporation id

Corporation information panel SHALL sit to the **right** of the pilot panel on the Pilot & corporation row (not inside `app-page-header`) (UI-CORP-001). Corporation id SHALL come from the selected Pilot (`getCorporationId` / PilotV2 corporation link) (UI-CORP-003).

#### Scenario: Right of pilot

- **WHEN** the Pilot & corporation row is shown
- **THEN** the corporation panel is to the right of the pilot panel

### Requirement: Obtain public corporation data via NeoCom back

First implementation task: obtain public corporation data for the selected pilot’s `corporation_id` from ESI `GET /corporations/{corporation_id}/` via the NeoCom public corporation back endpoint / provider — front does not call ESI directly (UI-CORP-002). Front SHALL NOT call ESI for corporation, alliance, or location enrichment (UI-CORP-012). The ESI field set consumed is at least `name`, `ticker`, `member_count`, `tax_rate`, `ceo_id`, `home_station_id`, and `alliance_id` when present (UI-CORP-004).

#### Scenario: Provider supplies enriched node

- **WHEN** the corporation panel loads
- **THEN** it receives data from a NeoCom provider
- **AND** it does not call ESI from the browser

### Requirement: v1-corporation-render Appearance

New work SHALL paint with versioned **`v1-corporation-render`** (UI-CORP-006). Panel chrome SHALL use **`neocom-panel panel-orange`** (UI-CORP-007). HEADER SHALL show logo, name, ticker in brackets beside the name, member_count, and tax_rate as percent (UI-CORP-008). Logo URL uses Image Server `corporations/{id}/logo`; missing id → `1` (UI-CORP-010). When `alliance_id` is present, show alliance name from ESI Get alliance information enrichment; otherwise omit (UI-CORP-009). When `home_station_id` is present, show home as `name >> system >> constellation >> region`; otherwise omit (UI-CORP-011). `model-strip-page` SHALL host a `v1-corporation-render` specimen (UI-CORP-005). Dashboard host MAY still show a CEO column from `ceo_id`; alliance name belongs on the corporation card (UI-CORP-013).

#### Scenario: HEADER shows name and ticker

- **WHEN** a corporation node is painted
- **THEN** the name line shows `Name [TICKER]`
- **AND** members and tax percent appear as meta lines

### Requirement: HEADER identity flex row 3 → 2 → 1

On `v1-corporation-render` HEADER, identity lines **1** (name/ticker), **2** (members), and **3** (tax) SHALL sit on **one flex row** in content order **3 → 2 → 1** (left to right); column gap on that row SHALL be **double** the common panel column gap (UI-CORP-014 / DEF-BLP-004).

#### Scenario: Compact identity row

- **WHEN** the corporation HEADER paints name, members, and tax
- **THEN** those three contents share one flex row ordered tax → members → name/ticker
- **AND** the column gap is twice the common panel column gap
