# front/blueprint-by-location Specification

## Purpose

Industry page listing pilot blueprints by location, with Region / System / Blueprint renders and hierarchy aggregation from sync/SSE. Source: IND-BP-030…036, 060…072, 090…095, 100…105, 110…118 in .

## ADDED Requirements

### Requirement: Blueprint-by-location page

The application SHALL provide page **v1-blueprint-by-location** (`v1-blueprint-by-location-page`) at `/industry/blueprints-by-location`, reachable from Feature `blueprint-analysis` / `blueprint-by-location` (IND-BP-030). The page SHALL use the common `<app-page-header />` (IND-BP-031). The page SHALL be reachable **with authentication** (IND-BP-032). The page SHALL host a panel whose hierarchy is **Region → System → Blueprint** (IND-BP-033). The panel SHALL paint Region nodes with **`v1-region-render`** (IND-BP-034), System nodes with **`v1-system-render`** (IND-BP-036), and Blueprint nodes with **`v1-blueprint-render`** (IND-BP-035).

#### Scenario: Authenticated hierarchy host

- **WHEN** an authenticated user opens `/industry/blueprints-by-location`
- **THEN** the page shows `app-page-header`
- **AND** the host panel presents Region → System → Blueprint

### Requirement: v1-region render

Each Region node SHALL be rendered with **`v1-region-render`** (IND-BP-060). A `v1-region` specimen SHALL exist on `model-strip-page` (IND-BP-061). Region card SHALL show icon, uppercase region name, and systems count; name and count share Elemental 14px on the same row (IND-BP-062). Region icon SHALL use a standard size token ≤ label+name height; default **`neo-icon-md` (24px)** (IND-BP-063). Region children SHALL be the distinct Systems in that region that contain pilot blueprints (IND-BP-070). System children SHALL be the Blueprints in that system (IND-BP-071). Region SHALL follow the shared expandable contract (IND-BP-072).

#### Scenario: Region row shows name and systems count

- **WHEN** a Region node is painted
- **THEN** the card shows the systems icon at `neo-icon-md`
- **AND** the uppercase name and systems count share the Elemental 14px name row

### Requirement: v1-system render

Each System node SHALL be rendered with **`v1-system-render`** (IND-BP-100). A `v1-system` specimen SHALL exist on `model-strip-page` at the top per Section 01 rules (IND-BP-101). System card SHALL follow the same visual structure as Region: icon, uppercase system name, and blueprints count sharing Elemental 14px on the name row (IND-BP-102). System icon default **`neo-icon-md` (24px)** (IND-BP-103). System panel frame SHALL use **`panel-orange`** (Region remains `panel-yellow`) (IND-BP-104). System SHALL follow the shared expandable contract (IND-BP-105).

#### Scenario: System uses orange panel

- **WHEN** a System node is painted in the by-location hierarchy
- **THEN** the frame uses `panel-orange`
- **AND** the layout matches Region (icon + SYSTEM label + name/count row)

### Requirement: v1-blueprint base identity render

Each Blueprint node SHALL be rendered with **`v1-blueprint-render`** for base **BlueprintV1** identity (IND-BP-090). A `v1-blueprint` specimen SHALL be kept on `model-strip-page` (IND-BP-091). Blueprint row layout SHALL be: declared-size **icon left** · **`BLUEPRINT NAME`** label + name (**Open Sans bold**) · **`ME/TE`** in Elemental with no label · optional **`runs/maxRuns`** in Elemental (IND-BP-092). Blueprint icon default **`neo-icon-lg` (32px)** (IND-BP-093). Material and time efficiency SHALL display as `materialEfficiency`/`timeEfficiency` in Elemental with no field label (IND-BP-094). When the blueprint is **not** a master (original), SHALL show `runs`/`maxRuns` in Elemental with no field label; master blueprints SHALL omit runs/maxRuns (IND-BP-095).

#### Scenario: Copy shows runs; master omits

- **WHEN** a BlueprintV1 with runs ≥ 0 is painted
- **THEN** ME/TE and runs/maxRuns appear in Elemental without field labels
- **WHEN** runs < 0 (master)
- **THEN** runs/maxRuns are omitted

### Requirement: Hierarchy aggregation from blueprint feed

On page start, the **v1-blueprint-by-location** page controller SHALL request the selected pilot’s industry blueprints from the NeoCom back (EPIC-007 Flow 06 / `GET /v1/pilots/{pilotId}/industry/blueprints`) (IND-BP-110). The blueprint list MAY arrive **partially** and MAY continue to be **fed over SSE** (EPIC-007 Flow 07 / `.../blueprints/events`); the front SHALL process blueprints **when available**, not only after a final complete list (IND-BP-111). While processing each available blueprint, the controller SHALL **aggregate** it as a **child of its System** node (create the System node if missing) (IND-BP-112). System nodes SHALL be **aggregated as children of their Region** nodes (create the Region node if missing) (IND-BP-113). The host panel’s root nodes for rendering SHALL be the aggregated **Region** nodes (hierarchy Region → System → Blueprint per Section 04) (IND-BP-114). Region and System child counts used by **`v1-region-render`** / **`v1-system-render`** SHALL follow the aggregated children (IND-BP-115). After aggregation changes (including SSE updates), the panel SHALL rebuild the render list so expanded/collapsed views stay consistent with the tree (EPIC-002 `notifyDataChanged`) (IND-BP-116). Grouping uses each blueprint’s **location chain** (system → region); the front does not invent regions/systems without a blueprint that maps to them (IND-BP-117). Front SHALL NOT call ESI to obtain the pilot blueprint list or to build the hierarchy — NeoCom back / SSE supply the blueprint feed (IND-BP-118).

#### Scenario: Partial SSE updates grow the tree

- **WHEN** a blueprint arrives over SSE for a system not yet in the tree
- **THEN** the controller creates the System (and Region if needed) and attaches the blueprint
- **AND** Region/System counts and the render list refresh without waiting for a final complete list
