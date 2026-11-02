# Proposal

## Why

New back work must update OpenAPI first when it applies, name schemas after domain models, version paths, and let the domain model win when OpenAPI disagrees.

## What Changes

- First development stage for new back code updates OpenAPI for the port being updated when OpenAPI applies (BACK-SVC-060)
- OpenAPI schemas named after domain model names (BACK-SVC-061)
- Endpoints versioned with a path prefix (e.g. `v1`) (BACK-SVC-062)
- When OpenAPI and domain model fields or names differ, the domain model takes precedence (BACK-SVC-063)

## Capabilities

### New Capabilities

- `back/openapi`: OpenAPI-first rules; schema naming; versioned paths; model wins

### Modified Capabilities

- *(none)*

## Impact

- Owner: **`neocom-back`**
- Related (not duplicated): archived `back-hexagonal` already requires an OpenAPI document and generator; this change adds precedence and naming rules from EPIC-009
- Out of scope: choosing concrete generator flags; Industry blueprint path shape beyond version prefix (see `back-industry-blueprints`)
- L2 ids: BACK-SVC-060…063 from `L2/09.EPIC-BACKEND-SERVICES.md` → `L2/BACK/BACK-OPENAPI.md`
