# front/node-render Specification

## Purpose
Node MVC, render registry, hierarchy flattening, viewer, and panel roles. Source: NODE-001 … NODE-017 in .

## Requirements

### Requirement: Node MVC trio

A node SHALL be a renderable item whose source data lives on a business object that shapes UI values. The node SHALL NOT read the raw source past those methods. The business object SHALL be the model; the render SHALL be the view (Angular component template); the Part SHALL be the controller that chooses the render and calls node methods. Extra controllers MAY attach to the Part sideways and SHALL NOT add another level of children (NODE-001, NODE-011).

#### Scenario: Display reads only through the node

- **WHEN** a render displays a field
- **THEN** it calls methods exposed by the node
- **AND** it does not reach past the node into raw source data

### Requirement: Render registry replaces hard-coded maps

`jsonClass` SHALL identify which render to use; the variant SHALL pick which layout of that render is used. Hard-coded `*ngIf` branches in `v2-node-container` SHALL be replaced by a render registry. Each render SHALL register which `jsonClass` values it accepts. At paint time the container SHALL look up the registry and place that render via `NgComponentOutlet` or `ViewContainerRef.createComponent`, passing `container`, `node`, and `variant`. Shared attribute names across several `jsonClass` values SHALL register the same render for each of those classes (NODE-002, NODE-010).

#### Scenario: Container has no per-class HTML branches

- **WHEN** a node with a registered `jsonClass` is painted
- **THEN** the container resolves the render from the registry
- **AND** the container template does not list class-to-render `*ngIf` pairs

### Requirement: Hierarchy flattens to a render list

Nodes SHALL form a hierarchy. Rendering SHALL convert that hierarchy into a list rebuilt when visibility or expansion changes. Invisible nodes SHALL NOT contribute. A collapsed node SHALL contribute itself only; an expanded node SHALL contribute itself and its visible children. `collaborate2View` SHALL perform that conversion. `AppPanelComponent.notifyDataChanged` SHALL walk the root, call `collaborate2View` with the current variant, and store the result in `renderNodeList`. Expanding SHALL call `toggleExpanded` then `notifyDataChanged` (NODE-003, NODE-013).

#### Scenario: Collapse hides children from the list

- **WHEN** a node is collapsed and `notifyDataChanged` runs
- **THEN** the node appears in `nodes2render`
- **AND** its children do not

### Requirement: Container panel and viewer

A container panel SHALL own the nodes it shows and feed the viewer `nodes2render` and a `variant`. When a page hosts `neocom-viewer-panel` (or `viewer-panel`), that viewer SHALL process the flat list and place one node container per entry. Identification SHALL use `jsonClass` via the render registry. Panels SHALL bind `[nodes2render]="getNodes2Render"` and `[variant]="getVariant"`. The viewer SHALL NOT walk the hierarchy (NODE-004, NODE-009).

#### Scenario: Viewer iterates only the flat list

- **WHEN** the panel has rebuilt `nodes2render`
- **THEN** the viewer places one node container per entry
- **AND** the viewer does not traverse child nodes itself

### Requirement: Standalone panel

A standalone panel SHALL receive one node and one variant with no hierarchy and no viewer list. Its Part SHALL use the same registry lookup to select the render. The render SHALL NOT fetch the model on its own (NODE-007, NODE-012).

#### Scenario: Single-node card

- **WHEN** a standalone panel is given one `ProcessedBlueprint` and variant `-AVAILABLE-BLUEPRINTS-`
- **THEN** the Part selects the blueprint render
- **AND** the display is one detailed card without a viewer list

### Requirement: UI and domain class roles

The page SHALL host panels and receive selection signals and SHALL NOT own `dataModelRoot` or the render list. `BackgroundEnabledComponent` SHALL hold backend `Subscription`s and clean them on destroy. `AppPanelComponent` SHALL implement `IViewer` and own `dataModelRoot`, `renderNodeList`, download flag, variant, and selection manager. Feature panels SHALL extend it, download domain nodes, set variant, call `completeDowload`, and host the viewer. Viewer panels SHALL be presentational. Feature renders SHALL extend the node container and expose display helpers. Domain nodes SHALL implement `INode`, `ICollaboration`, `IExpandable`, and `ISelectable` via `NeoCom` / `NeoComDelayed` with `jsonClass` and getters for the render (NODE-006, NODE-014, NODE-015, NODE-016).

#### Scenario: Panel owns roots; viewer does not

- **WHEN** download completes
- **THEN** the panel stores `dataModelRoot` and runs `notifyDataChanged`
- **AND** the viewer only receives the resulting flat list

### Requirement: Blueprint list reference flow

The manufacture blueprint list flow SHALL follow: page hosts available-blueprints (and optional BOM) panel; panel sets variant, downloads, transforms to `ProcessedBlueprint`, `completeDowload` → `notifyDataChanged` → viewer → registry resolve → render; selection and expand/hide re-run the flat list path; the viewer never walks the hierarchy. `v1-blueprint-render` SHALL use detailed layout for `-AVAILABLE-BLUEPRINTS-` and short layout otherwise, registered for `ProcessedBlueprint` and `ProcessedBlueprintSummary` (NODE-005, NODE-008, NODE-017).

#### Scenario: Expand rebuilds the list

- **WHEN** the user expands a node in the blueprint list
- **THEN** `toggleExpanded` and `notifyDataChanged` run
- **AND** the viewer paints the updated flat list without walking the hierarchy
