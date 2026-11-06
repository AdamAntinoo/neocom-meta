# Proposal

## Why

Business types such as Pilot must live in one Node module shared by the front and the back, not be copied into each app.

## What Changes

- DOMAIN-001 is cancelled. The git submodule is not required
- Declare NEOCOM business-domain TypeScript classes and related components in that repository
- Publish the package to npm so `neocom-front` and `neocom-back` depend on it

## Capabilities

### New Capabilities

- `domain/neocom-domain`: Shared domain package, submodule, and npm consumption

### Modified Capabilities

- *(none)*

## Impact

- Parent `neocom` gains a submodule pointer
- **`neocom-front`** and **`neocom-back`** depend on the published package
- Out of scope: choosing the npm scope name, and implementing Pilot or Universe behavior beyond placing their types in this module
