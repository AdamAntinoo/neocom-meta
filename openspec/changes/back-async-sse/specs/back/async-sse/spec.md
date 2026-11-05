# back/async-sse Specification

## Purpose

Nest list persistence, background enrichment, and SSE push for heavy node lists. Source: BASSE-001 … BASSE-012 in `L2/BACK/BACK-ASYNC-SSE.md`.

## ADDED Requirements

### Requirement: SSE push with HTTP work-start

When enrichment is too slow to block the page, Nest SHALL expose an SSE stream for push updates. Requests that start work SHALL stay on normal HTTP. The client listens; the server sends (BASSE-001, BASSE-007).

#### Scenario: List request does not wait for full enrichment

- **WHEN** a list HTTP request needs background enrichment
- **THEN** the HTTP response returns without waiting for every item to finish
- **AND** enrichment events are available on the scoped SSE route

### Requirement: Backend stores of truth

Backend persistence SHALL be the durable store of processed and expanded items (not a short-lived HTTP cache), surviving restarts. ESI SHALL be the authoritative raw source when persistence has nothing yet. A background Nest worker/job SHALL complete expensive per-item work one by one, write persistence, and emit SSE events (BASSE-002).

#### Scenario: Persistence hit avoids ESI

- **WHEN** processed data for the list scope already exists in persistence
- **THEN** the list handler returns that data without calling ESI first

### Requirement: Nest request path

On list request Nest SHALL look in persistence — on hit, return what persistence has (may be partial or stale), check staleness, and if stale start or continue background refresh without blocking the HTTP response on a full recompute; on miss, call ESI, build a simplified/partial node list, start background completion one by one, and return the partial list on HTTP (BASSE-003).

#### Scenario: Miss builds partial list and starts background

- **WHEN** persistence has no data for the list scope
- **THEN** Nest calls ESI, returns a simplified partial list
- **AND** starts background enrichment without blocking the response on full completion

### Requirement: Enrichment and repeat requests

The background process SHALL complete items one by one; when an item is done, the service SHALL store the full result in persistence and send an SSE event with the updated node or a patch keyed by node id. Later Nest list requests SHALL prefer persistence over ESI, return stored data immediately, evaluate staleness, and if stale kick background update again with SSE pushes as fields complete (BASSE-004, BASSE-005).

#### Scenario: Stale data still returned immediately

- **WHEN** persistence has stale data for a list scope
- **THEN** the HTTP response returns that data immediately
- **AND** background refresh continues with SSE updates

### Requirement: Persistence access and jobs

Nest SHALL read/write processed and calculated records via a DB driver + ORM/client, configured with `@nestjs/config`. Background jobs SHALL use BullMQ with Redis as the broker for production; in-process async is acceptable only for local/dev spikes. Schema and migrations SHALL live in `neocom-back` (or a shared infra repo if adopted later) (BASSE-008, BASSE-009, BASSE-012).

#### Scenario: Job completes one item

- **WHEN** a BullMQ job finishes enrichment for one node
- **THEN** persistence is upserted for that node
- **AND** an SSE event is emitted for subscribers

### Requirement: Multi-instance SSE and ESI

If more than one Nest replica runs, enrichment completion on one instance SHALL reach SSE clients on another via Redis pub/sub (or BullMQ events + Redis). On persistence miss, enrichment and list build SHALL fetch raw data via `@lgriffin/esi.ts` through domain services (BASSE-010, BASSE-011).

#### Scenario: Fan-out across replicas

- **WHEN** a job completes on instance A and the SSE client is on instance B
- **THEN** the client still receives the enrichment event

### Requirement: Blueprint manufacture-index example (back)

For the manufacture blueprint list Nest SHALL load from persistence when available, otherwise ESI for the pilot's blueprints; return a simplified list (identity and basic fields; index missing or placeholder); background SHALL compute manufacture cost, market cost, and index per blueprint, persist, and SSE-push the enriched node (BASSE-006).

#### Scenario: Index computed in background

- **WHEN** a blueprint list is returned without indexes
- **THEN** background jobs compute and persist indexes
- **AND** each completion is pushed over SSE
