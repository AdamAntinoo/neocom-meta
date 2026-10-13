# Proposal

## Why

Character data from EVE Online should come from the published Character API instead of hand-written endpoint calls. The generated types belong in `neocom-esi` so `neocom-front` can depend on the published package.

## What Changes

- Generate TypeScript DTO classes for the EVE Online Character API (28 operations) from its OpenAPI document
- Place that generated code in `neocom-esi` at `src/esi-api/characters`
- Publish those DTOs, and the higher-level DTOs or business objects a service composes from them, on `neocom-esi`

## Capabilities

### New Capabilities

- `esi/character-api`: Generated ESI character DTOs and the domain objects composed from them

### Modified Capabilities

- *(none)*

## Impact

- Owner: **`neocom-esi`**
- Consumer: **`neocom-front`**, through the published package
- Out of scope: SSO, the Image Server, the Static Data Export, and ESI APIs other than the Character API
