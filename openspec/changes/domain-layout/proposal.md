# Proposal

## Why

Backend services need a single truth place in `neocom-domain` for interchange models and ports, with existing classes under `src/domain`, `Record` inheritance, and a version suffix.

## What Changes

- Treat `neocom-domain` as the truth repository for interchange classes and port interfaces (BACK-SVC-001)
- Place interchange models under `src/domain` and port interfaces under `src/ports` (BACK-SVC-002…004)
- Move already implemented interchange classes under `src/domain` (BACK-SVC-010)
- Require those classes to inherit from `Record` and use a version suffix starting at **V1** (BACK-SVC-011…013)

## Capabilities

### New Capabilities

- `domain/layout`: Truth layout for `src/domain` / `src/ports`, Record base, and V1 naming

### Modified Capabilities

- *(none)*

## Impact

- Owner: **`neocom-domain`**
- Out of scope: further subfolder taxonomy beyond `src/domain` / `src/ports`; Pilot/Industry port contents (see `domain-ports`); DTO/`esi-api` deprecation (see `domain-deprecations`)
- L2 ids: BACK-SVC-001…004, BACK-SVC-010…013 from `L2/09.EPIC-BACKEND-SERVICES.md` → `L2/DOMAIN/09.LAYOUT.md`
