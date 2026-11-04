# front/blueprint-list-processing Specification

## Purpose

Redesign pilot blueprint feed into `blueprint-by-location-panel`: local provider, per-pilot cache, NeoCom hierarchy nodes, shared Observable real-time updates. Source: BLP-001…013, 016…017, 021…025 in `L2/FRONT/21.BLUEPRINT-LIST-PROCESSING.md` (EPIC-011).

## ADDED Requirements

### Requirement: Local provider owns the feed

Processing for `blueprint-by-location-panel` SHALL obtain the selected pilot’s blueprints from a **local provider** (BLP-001). That provider SHALL implement **SSE management** of the pilot blueprints (BLP-002). The process SHALL **start** with retrieval from that provider (BLP-003). The provider SHALL be **`PilotBlueprintProviderService`** under `modules/services/` (`.service` suffix) and available to **all panels** (BLP-009).

#### Scenario: Panel uses provider not raw SSE

- **WHEN** `blueprint-by-location-panel` starts for a pilot
- **THEN** it obtains blueprints from `PilotBlueprintProviderService`
- **AND** it does not open the blueprint SSE client itself

### Requirement: Per-pilot cache with ESI TTL

The local provider SHALL **cache** elements from the SSE feed (BLP-010). When a pilot’s cache **expires**, the provider SHALL be able to **initiate a new retrieval** for that pilot (BLP-011). Retrieved elements SHALL be uniquely identified by the **`id` attribute**; merge SHALL upsert by `id` (BLP-012). Cached lists SHALL be **keyed by pilot** so multiple pilots’ lists coexist, each with its own expiration; expiry for one pilot SHALL NOT clear another (BLP-024). Per-pilot expiration SHALL be **60 minutes**, matching ESI Get character blueprints (BLP-025). Elements from the provider SHALL **always** be `neocom-front` domain models that **inherit from `NeoCom`** (BLP-013).

#### Scenario: Two pilots cached independently

- **WHEN** pilot A and pilot B both have cached blueprint lists
- **THEN** each entry has its own 60-minute TTL
- **AND** expiry/re-fetch for A leaves B’s cache intact

### Requirement: Shared Observable real-time updates (approach A)

Real-time updates from the provider to representation panels SHALL use a **shared `Observable`** owned by `PilotBlueprintProviderService`, multicasted with **`shareReplay` and/or `refCount`**, emitting **`NeoCom[]` snapshots and/or upsert events** (BLP-021). On each relevant emission, `blueprint-by-location-panel` SHALL **re-aggregate / re-sort** and **`notifyDataChanged`** (BLP-022). Delivery SHALL include provider stream API, NeoCom nodes, aggregation helper, panel subscription, and tests; `NodeListAdapterService` SSE use for this panel SHALL be removed or superseded when the provider lands (BLP-023).

#### Scenario: Second subscriber shares one SSE

- **WHEN** two panels subscribe to `observeBlueprints` for the same pilot
- **THEN** they share one multicasted Observable / one SSE while refCount > 0
- **AND** each emission triggers panel rebuild via `notifyDataChanged`

### Requirement: NeoCom hierarchy nodes and aggregation

Blueprint hierarchy leaves SHALL use **`BlueprintNodeV1`** inheriting from `NeoCom` (BLP-007). Region and System nodes SHALL likewise be new `NeoCom` subclasses (BLP-008). Blueprints from the provider SHALL be aggregated into Systems and Regions per EPIC-010 **IND-BP-033** and **IND-BP-112…115**, **IND-BP-117** (BLP-004). After aggregation, Region roots SHALL be **sorted by name** (BLP-005). Sorted Region roots SHALL be provided to the node-rendering path (EPIC-002 / IND-BP-116) (BLP-006).

#### Scenario: Sorted Region roots

- **WHEN** aggregation completes for a pilot blueprint set
- **THEN** panel roots are Region nodes sorted by name
- **AND** Systems/Blueprints nest per the cited IND-BP hierarchy rules

### Requirement: SpaceLocationNodeV1 on the blueprint

On reception, `SpaceLocationV1Dto` SHALL be transformed to `neocom-front` **`SpaceLocationNodeV1`** (inherits from `NeoCom`) (BLP-016). `SpaceLocationNodeV1` SHALL be **tied to the blueprint** so processing can extract **region** and **system** identifiers for aggregation (BLP-017).

#### Scenario: Location drives aggregation keys

- **WHEN** a blueprint arrives with a tied `SpaceLocationNodeV1`
- **THEN** aggregation uses region and system identifiers from that node
- **AND** does not invent locations without a mapped blueprint (IND-BP-117)
