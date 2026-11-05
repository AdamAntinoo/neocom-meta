# Proposal

## Why

EPIC-010 Industry blueprints front work (support pages, Feature button, by-location hierarchy, shared UI tokens) should ship as one front feature on one branch.

## What Changes

Folds the previously separate registered changes into one multi-capability change:

- `front-model-strip` → capability `front/model-strip`
- `front-color-table` → capability `front/color-table`
- `front-feature-button` → capability `front/feature-button`
- `front-blueprint-by-location` → capability `front/blueprint-by-location`
- `front-shared-ui` → capability `front/shared-ui`

Those change folders are **superseded** by this change and removed from the active register.

## Capabilities

### New Capabilities

- `front/model-strip` — specimen strip support page
- `front/color-table` — palette support page
- `front/feature-button` — FeatureV1 / `v1-feature-button` + panel population
- `front/blueprint-by-location` — page, renders, hierarchy aggregation / SSE
- `front/shared-ui` — faces, labels, icon sizes, expand toggles

## Impact

- Owner: **`neocom-front`**
- Branch: `feature/industry-blueprints` from `develop`
- L2: `FRONT/13`…`17` (+ cleared EPIC-010 extract)
- Depends on applied: `front-node-render`, `front-async-sse`, `back-industry-blueprints` / manufacture SSE paths
- May stack after or alongside `front-dashboard-shell` if shared header/feature list chrome is required first
