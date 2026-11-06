# front/blueprint-list-processing Specification

## Purpose

Redesign pilot blueprint feed into `blueprint-by-location-panel`: local provider, per-pilot cache, NeoCom hierarchy nodes. Interim product path parks front SSE and loads from back HTTP (BLP-031…034 / DEF-BLP-003). Source: EPIC-011.

## ADDED Requirements

### Requirement: Local provider owns the feed

Processing for `blueprint-by-location-panel` SHALL obtain the selected pilot’s blueprints from a **local provider** (BLP-001). The process SHALL **start** with retrieval from that provider (BLP-003). The provider SHALL be **`PilotBlueprintProviderService`** under `modules/services/` (`.service` suffix) and available to **all panels** (BLP-009). **SSE management (BLP-002) is superseded** while BLP-031…033 apply — see interim park / HTTP requirements below.

#### Scenario: Panel uses provider not raw SSE

- **WHEN** `blueprint-by-location-panel` starts for a pilot
- **THEN** it obtains blueprints from `PilotBlueprintProviderService`
- **AND** it does not open the blueprint SSE client itself

### Requirement: Interim — park front SSE; HTTP back endpoints

Front **SSE** implementations used for the blueprint product path SHALL be **parked** (disabled / isolated / not the live data source) until an SSE proof of concept is accepted and re-integrated (BLP-031 / DEF-BLP-003). `PilotBlueprintProviderService` SHALL **retrieve** the selected pilot’s blueprints from the **current neocom-back HTTP endpoints** (not from front SSE) while SSE remains parked (BLP-032). `blueprint-by-location-panel` (and other BLP consumers) SHALL consume blueprints via that provider’s **HTTP-backed** path; they SHALL **not** open or depend on front SSE for the live blueprint list until SSE PoC re-integration (BLP-033). Section 04 **approach A** (provider-owned SSE + shareReplay/refCount real-time) SHALL remain **deferred to the SSE proof of concept**; product BLP SHALL not require live SSE for correctness while BLP-031…033 apply (BLP-034).

#### Scenario: Live path is HTTP only

- **WHEN** the product blueprint-by-location path loads blueprints
- **THEN** `PilotBlueprintProviderService` uses back HTTP endpoints
- **AND** front SSE is not the live data source

### Requirement: Per-pilot cache with ESI TTL

The local provider SHALL **cache** elements from the **HTTP** retrieval (BLP-010 superseded for SSE source; cache source is HTTP while BLP-032 applies). When a pilot’s cache **expires**, the provider SHALL be able to **initiate a new retrieval** for that pilot (BLP-011). Retrieved elements SHALL be uniquely identified by the **`id` attribute**; merge SHALL upsert by `id` (BLP-012). Cached lists SHALL be **keyed by pilot** so multiple pilots’ lists coexist, each with its own expiration; expiry for one pilot SHALL NOT clear another (BLP-024). Per-pilot expiration SHALL be **60 minutes**, matching ESI Get character blueprints (BLP-025). Elements from the provider SHALL **always** be `neocom-front` domain models that **inherit from `NeoCom`** (BLP-013).

#### Scenario: Two pilots cached independently

- **WHEN** pilot A and pilot B both have cached blueprint lists
- **THEN** each entry has its own 60-minute TTL
- **AND** expiry/re-fetch for A leaves B’s cache intact

### Requirement: Shared Observable updates (HTTP interim; SSE approach A deferred)

While BLP-031…034 apply, `PilotBlueprintProviderService` SHALL expose a **shared `Observable`** for blueprint list updates fed by the **HTTP** retrieval path (multicasted with **`shareReplay` and/or `refCount`** as needed), emitting **`NeoCom[]` snapshots and/or upsert events**. On each relevant emission, `blueprint-by-location-panel` SHALL **re-aggregate / re-sort** and **`notifyDataChanged`** (BLP-022). Full **SSE approach A** (BLP-021 / BLP-023 SSE ownership) remains **deferred** to the SSE PoC (BLP-034); `NodeListAdapterService` SSE use for this panel SHALL remain removed or superseded.

#### Scenario: Panel rebuilds on provider emission

- **WHEN** the provider emits an updated blueprint snapshot for a pilot
- **THEN** `blueprint-by-location-panel` re-aggregates / sorts and notifies data changed
- **AND** the emission source is the HTTP-backed provider path while SSE is parked

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
