# Proposal

## Why

`neocom-back` uses `@lgriffin/esi.ts` as its ESI client. References to `esijs` are removed.

## What Changes

- Explore the documentation of `@lgriffin/esi.ts` (ESI-006)
- Download that documentation (ESI-007)
- Install `@lgriffin/esi.ts` into `neocom-back` (ESI-008)
- Keep URL links to that tool in a `doc` folder (ESI-009)
- ESI-010 is cancelled. ESI requirements are not required to be implemented in `neocom-esi`

## Capabilities

### New Capabilities

- `back/esi-client`: `@lgriffin/esi.ts` as the ESI client installed in `neocom-back`

### Modified Capabilities

- *(none)*

## Impact

- Owner: **`neocom-back`**
- Out of scope: installing `esijs`, installing the package into `neocom-esi`, and treating pasted package descriptions (Zod validation, ETag caching, rate limiting) as required NEOCOM behavior
