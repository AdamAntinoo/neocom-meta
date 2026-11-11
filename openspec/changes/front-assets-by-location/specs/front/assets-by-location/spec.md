# front/assets-by-location Specification

## Purpose

Dashboard Feature and pilot page that list a pilot’s assets aggregated by region and system (plus unidentified locations), with expandable asset containers and leaf Appearance `v1-asset-render`. Source: EPIC-015 `15.EPIC-FRONT-PAGE-ASSETS-BY-LOCATION.md` (FAL-001…037).

## ADDED Requirements

### Requirement: Dashboard Feature for assets by location

The Dashboard Feature catalog SHALL include a Feature for **assets by location** (label e.g. **Assets by Location** / **Assets**), `interaction: PAGEROUTE`, route targeting the assets-by-location page (FAL-001). That Feature SHALL use `/media/blueprints-feature.jpeg` as interim `imageRef` (same as Blueprint Availability); a dedicated assets icon (e.g. programme copy of infinity `res-sde/drawable/assets.png`) MAY replace it later (FAL-002). Selecting the enabled Feature SHALL navigate to the assets-by-location page (FAL-003).

#### Scenario: Feature opens assets-by-location

- **WHEN** the user selects the enabled assets-by-location Feature on the Dashboard
- **THEN** the application navigates to the assets-by-location page
- **AND** the Feature `imageRef` is `/media/blueprints-feature.jpeg` until a dedicated icon is substituted

### Requirement: Assets-by-location page and pilot module

Front SHALL provide page **assets-by-location** (`assets-by-location-page`) under the **`pilot`** module at **`/pilot/assets-by-location`**, reachable from the Dashboard Feature (FAL-010). The page SHALL use the common `<app-page-header />` and secured chrome consistent with other dashboard feature pages (same class as blueprint-by-location) (FAL-011). The page SHALL host a panel that **renders the list of pilot assets** aggregated **by region and system**, with **unidentified-location roots** when location expansion is missing, and **asset-container** nesting from the wire tree (FAL-012). Hierarchy presentation SHALL be **Region → System → Asset/Container** (plus **Unidentified location → Asset/Container** roots); a **LocatedAssetContainer** under an Eve location expands to its **contents** children; reuse `v1-region-render` / `v1-system-render` where they fit; asset / container leaf-or-row render per the asset Appearance (FAL-013). Front SHALL introduce (or extend) a **`pilot` Angular module** as the home for **pilot belongings / pilot-data pages** (assets-by-location first; later pilot-data pages join the same module), wired as a lazy route tree under `/pilot` (same pattern as `industry` under `/industry`) (FAL-014). **`v1-pilot-panel` and `v1-corporation-panel` SHALL live in the `pilot` module** (moved from `modules/header/`); secured pages keep the Pilot & corporation row composition, importing those panels from `pilot` rather than owning them under `header` (FAL-015).

#### Scenario: Pilot module hosts the page

- **WHEN** an authenticated user opens `/pilot/assets-by-location`
- **THEN** the page shows `app-page-header` and secured chrome
- **AND** the host panel is prepared to render Region / Unidentified → System → Asset/Container

### Requirement: Pilot assets feed and locationId aggregation

Front SHALL load the authenticated pilot asset list from **`GET /v1/pilots/{pilotId}/assets`** (FAL-020). Rendering SHALL **start** by loading the **complete** asset list for the **selected pilot** from that endpoint before aggregation (FAL-029). Front SHALL **aggregate** the complete pilot asset list into the hierarchy using each place-level asset’s `locationId` (Region → System → Asset/Container when the location service returns a usable chain) (FAL-021). Aggregation SHALL key place grouping on `locationId`; after that id is taken, Front MAY **nullify** the asset’s nested `location` field to reduce space (FAL-033). When aggregation **adds a new location** (`locationId` not yet in the aggregate), Front SHALL resolve full place information (region, system, or unidentified) via a **location service** calling the backend **`GET /api/v1/universe/spacelocations/{locationId}`** endpoint — **not** by reading nested `location` data stored on the asset (FAL-034). Region / System / Unidentified classification for hierarchy roots and systems SHALL come from that location-service result, not from per-asset embedded location payloads (FAL-035).

#### Scenario: New locationId triggers spacelocations lookup

- **WHEN** aggregation first encounters a `locationId` not yet in the aggregate
- **THEN** Front resolves place information via the location service / spacelocations endpoint
- **AND** does not classify region/system/unidentified from the asset’s embedded `location`

### Requirement: Unidentified location roots

When the location service **does not** return a usable region/system chain for an asset’s `locationId`, Front SHALL **aggregate those assets under that location identifier** as an **Unidentified location** root — **not** skip them and **not** use the blueprint “no location chain → skip / empty” handling (FAL-022). Hierarchy **roots** SHALL include both **Region** nodes and **Unidentified location** nodes (grouped by the unresolved `locationId`) (FAL-024). The panel SHALL render the aggregated hierarchy so the pilot can browse assets by region and system **and** by unidentified location roots on the new page, including expandable **asset containers** (FAL-023). Each Unidentified location node SHALL be painted with a render **similar to** Region or System (expandable hierarchy row), showing at least identity for that location id and the **count of assets** under it; **icon SHALL be defined later** (do not invent the drawable in this change) (FAL-025).

#### Scenario: Unresolved place becomes Unidentified root

- **WHEN** spacelocations lookup yields no usable region/system chain for a `locationId`
- **THEN** assets for that id aggregate under an Unidentified location root
- **AND** that root shows identity and asset count (icon deferred)

### Requirement: Asset container hierarchy

An **asset container** (`LocatedAssetContainerV1Dto`) SHALL appear as a hierarchy level under its Eve location (System or Unidentified location): it is itself an asset **located on** that place and **contains** other assets (FAL-026). When an asset container is **expanded**, the panel SHALL show its **asset children** from wire `contents` (nested `EveAssetV1Dto` / `LocatedAssetContainerV1Dto`); when **collapsed**, those children SHALL not appear (FAL-027). Nested containers inside `contents` SHALL follow the same expand → show contents rule (recursive); plain `EveAssetV1Dto` nodes under a place or container are leaves for this hierarchy (FAL-028). When a node is `LocatedAssetContainerV1Dto`, the render/model path SHALL treat `contents` as the container’s **asset children** for expand/collaborate, distinct from Region/System hierarchy children (FAL-032).

#### Scenario: Expand container reveals contents

- **WHEN** a LocatedAssetContainerV1Dto node is expanded
- **THEN** its `contents` children appear in the hierarchy
- **WHEN** it is collapsed
- **THEN** those children do not appear

### Requirement: v1-asset-render leaf Appearance

Asset leaf presentation SHALL be defined against the **delivered** `GET /v1/pilots/{pilotId}/assets` wire model (`EveAssetV1Dto` / `LocatedAssetContainerV1Dto` and nested `item` / `location` fields) — not against raw ESI (FAL-030). Assets-by-location leaf rows SHALL use **`v1-asset-render`** registered to `jsonClass` **`EveAssetV1`** (Appearance / model-strip specimen `v1-asset`; PNG `media/v1-asset-render.png`) — do not invent a parallel ad-hoc asset row layout (FAL-031). Painted DEFAULT fields: type icon `neo-icon-xl` (64); line 1 name left and `[itemId]` right; line 2 `{groupName} / {categoryName}`; ITEM VALUE / TOTAL VALUE / NO. ITEMS / VOLUME as below.

`v1-asset-render` **ITEM VALUE** SHALL come from the nested priced item (`item.sellPrice` on `PricedItemV1Dto`); **TOTAL VALUE** SHALL be that item value **multiplied by** the asset stack `quantity` (FAL-036). `v1-asset-render` **VOLUME** SHALL be the nested item unit volume (`item.volume`) **multiplied by** the asset stack `quantity` (M3) (FAL-037).

#### Scenario: Stack multiplies value and volume

- **WHEN** an EveAssetV1 leaf with priced item sell price P, volume V, and quantity Q is painted
- **THEN** ITEM VALUE shows P
- **AND** TOTAL VALUE shows P × Q
- **AND** VOLUME shows V × Q M3
