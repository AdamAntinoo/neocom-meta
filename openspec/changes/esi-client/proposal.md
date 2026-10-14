# Proposal

## Why

`neocom-esi` uses `@lgriffin/esi.ts` as its ESI client. References to `esijs` are removed.

## What Changes

- Explore the documentation of `@lgriffin/esi.ts` (ESI-006)
- Download that documentation (ESI-007)
- Install `@lgriffin/esi.ts` into `neocom-esi` (ESI-008)
- Keep URL links to that tool in a `doc` folder (ESI-009)
- Implement ESI requirements in `neocom-esi` (ESI-010)

## Capabilities

### New Capabilities

- `esi/client`: `@lgriffin/esi.ts` as the ESI client in `neocom-esi`

### Modified Capabilities

- *(none)*

## Impact

- Owner: **`neocom-esi`**
- Out of scope: installing `esijs`, and treating pasted package descriptions (Zod validation, ETag caching, rate limiting) as required NEOCOM behavior
