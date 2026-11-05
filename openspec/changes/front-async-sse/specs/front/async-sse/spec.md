# front/async-sse Specification

## Purpose

Front adapter cache, SSE consumption, and in-place enrichment for heavy node lists. Source: FASSE-001 … FASSE-010 in `L2/FRONT/09.ASYNC-SSE.md`.

## ADDED Requirements

### Requirement: Synchronous path when generation is fast

When generation is fast, opening or refreshing a panel SHALL use one request (or a short chain) that returns the full set of nodes; `completeDowload` SHALL run only when the list is ready; one `notifyDataChanged` SHALL then paint the full flat list. The user SHALL see a download state until the list is complete (FASSE-001).

#### Scenario: Full list paints once

- **WHEN** the backend returns a complete node list quickly
- **THEN** the viewer paints the full flat list after a single `notifyDataChanged`
- **AND** the user is not shown a partial enrichment path

### Requirement: Asynchronous model without blocking the page

When building or enriching nodes would block the page, the UI SHALL NOT wait for complete synchronous generation. The front SHALL accept a simplified list as soon as possible, open an SSE channel, and apply each event to the cache and the panel's node list without reload or navigation. Work-start requests SHALL stay on normal HTTP (FASSE-002).

#### Scenario: First paint does not wait for enrichment

- **WHEN** a heavy list opens
- **THEN** a partial or cached list paints first
- **AND** SSE updates arrive afterward without navigation

### Requirement: Front adapter cache

The front adapter cache SHALL be a store of truth for heavy pages: fast return on leave/return; holds the latest list including SSE enrichments; not durable across devices. The cache SHALL survive leave/return on the same browser without waiting for Nest. Implementation SHALL be a first-party cache service (memory plus optional `localStorage` / IndexedDB) (FASSE-003, FASSE-010).

#### Scenario: Return visit paints from cache

- **WHEN** the user leaves and returns to the same list on the same browser
- **THEN** the adapter returns the cached list immediately
- **AND** SSE may still refresh unfinished or stale items

### Requirement: Front request and enrichment path

The page SHALL ask the front adapter for the node list. On cache hit, the adapter SHALL return the cache and still open (or keep) SSE. On miss, it SHALL HTTP GET Nest, feed the panel (`completeDowload` / merge into `dataModelRoot`), paint via the normal viewer path, use `NeoComDelayed` / `isReady()` for not-ready nodes, and open a scoped SSE channel. On each SSE event the adapter SHALL merge into cache and notify the panel so `notifyDataChanged` re-runs and the row updates in place (FASSE-004, FASSE-005).

#### Scenario: SSE merges update a row in place

- **WHEN** an enrichment event arrives for a node id
- **THEN** the adapter merges into cache and the panel
- **AND** the viewer refreshes that row without a page reload

### Requirement: Adapter is the single entry; delayed nodes are safe

The front adapter SHALL be the single entry for list fetch: cache first, then Nest HTTP, then merge SSE into cache and UI. Opening a heavy page SHALL NOT block until every node is fully computed. A delayed / not-ready node SHALL be renderable in a safe partial state; when it becomes ready via SSE, the same row SHALL update. The same node → collaboration → viewer → registry → render pipeline SHALL be reused (FASSE-007, FASSE-008).

#### Scenario: Partial row becomes ready

- **WHEN** a delayed node receives an SSE readiness/enrichment update
- **THEN** the same row updates in place
- **AND** no route change is required

### Requirement: Authenticated SSE client

The front SHALL open a scoped event stream and apply `node-updated` (and similar) events to cache and panel. The client SHALL support auth headers/cookies reliably. Native `EventSource` is enough only if cookie auth on the stream is acceptable; otherwise a fetch-based SSE helper SHALL be used. Events SHALL be bridged into RxJS observables for the panel (FASSE-009).

#### Scenario: Authenticated stream opens for a list scope

- **WHEN** the adapter needs enrichment for a list scope
- **THEN** it opens an authenticated SSE stream for that scope
- **AND** panel subscriptions receive events via RxJS

### Requirement: Blueprint manufacture-index example (front)

For the manufacture blueprint list, the page/panel SHALL ask the adapter for the pilot's blueprint list; a cache hit SHALL return cached blueprints and open SSE; otherwise HTTP then first paint with delayed/partial rows; on SSE merge the panel SHALL update that row with no reload; a return visit SHALL paint last known indexes from cache then continue SSE (FASSE-006).

#### Scenario: Index arrives after first paint

- **WHEN** manufacture index calculation completes for a blueprint
- **THEN** the SSE merge updates that row
- **AND** the user stays on the same page
