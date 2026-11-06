# infra/async-persistence Specification

## Purpose

PostgreSQL/Redis provision and persistence contract for async node enrichment. Source: INFRA-050 … INFRA-055 in .

## ADDED Requirements

### Requirement: Durable store for async workflow

The asynchronous workflow SHALL have a durable database for extended and calculated data and a way to run background enrichment. Without this database, Nest cannot return stored processed lists or survive restarts while enrichment is in flight (INFRA-050, INFRA-051).

#### Scenario: Restart retains processed data

- **WHEN** Nest restarts after enrichment has written calculated fields
- **THEN** subsequent list requests can read those fields from persistence
- **AND** do not require recomputing every item from ESI first

### Requirement: Persistence contents and operations

The database SHALL store at least: scope key (e.g. pilot id), node identity, simplified fields, calculated fields, readiness/completion state, `updatedAt` / staleness markers, and enough payload to rebuild a viewer node without calling ESI again when fresh. Supported operations SHALL include: read list for HTTP response; upsert one item when background work finishes; query incomplete or stale items for the worker (INFRA-052).

#### Scenario: Worker queries incomplete items

- **WHEN** a background worker looks for work
- **THEN** it can query incomplete or stale items for a list scope
- **AND** upsert a single item when enrichment finishes

### Requirement: Relational engine preference

A relational database SHALL be required. PostgreSQL SHALL be preferred unless programme infra already standardises another engine. Nest SHALL access it via an official or Nest-supported ORM/query layer. Schema and migrations SHALL live in `neocom-back` (or a shared infra repo if one is adopted later) (INFRA-053).

#### Scenario: Migrations owned by back

- **WHEN** the persistence schema changes
- **THEN** migrations are applied from `neocom-back` (or the adopted shared infra repo)

### Requirement: Provision PostgreSQL and Redis

PostgreSQL (persistence) and Redis (queue and optional pub/sub for SSE fan-out) SHALL be provisioned. Config/secrets for DB and Redis SHALL exist in back environments; SSE URL/base path SHALL exist in front environments (INFRA-054).

#### Scenario: Environments expose required settings

- **WHEN** back and front environments are configured for async enrichment
- **THEN** back has DB and Redis connection secrets
- **AND** front has the SSE base path/URL

### Requirement: Infrastructure checklist

The programme checklist SHALL include: PostgreSQL (or approved equivalent) for processed/calculated node data; Nest persistence module + migrations for list/item records and staleness fields; Redis + BullMQ (or approved queue) for one-by-one background enrichment; Nest `@Sse` endpoints per list scope with Redis pub/sub if multiple replicas; front adapter with HTTP + cache + authenticated SSE consumer; front panel wiring for in-place SSE merge; DB/Redis secrets in back envs; SSE base path in front envs (INFRA-055).

#### Scenario: Checklist gates apply readiness

- **WHEN** `/feature-delivery` starts for async enrichment
- **THEN** the checklist items above are the infra readiness bar for that feature cluster
