# Proposal

## Why

ESI-001, ESI-002, ESI-003, and ESI-004 are cancelled. `neocom-esi` no longer keeps a generated Character API. High-level data comes from `@lgriffin/esi.ts`.

## What Changes

- Remove the OpenAPI document and the code generated from it (ESI-011)
- Keep a service that publishes higher-level objects on `neocom-esi` (ESI-005)

## Capabilities

### New Capabilities

- `esi/character-api`: High-level ESI data in `neocom-esi`, without the generated Character API

### Modified Capabilities

- *(none)*

## Impact

- Owner: **`neocom-esi`**
- Out of scope: SSO, the Image Server, and the Static Data Export
