# Proposal

## Why

EPIC-006 secured chrome and landing experience should ship as one front feature: shared page header, Dashboard layout (including breadcrumb), EVE Image Server media URLs, corporation panel, and pre-Dashboard character selection.

## What Changes

Folds the previously separate registered changes into one multi-capability change:

- `front-page-header` → capability `front/page-header`
- `front-dashboard` → capability `front/dashboard`
- `front-eve-media` → capability `front/eve-media`
- `front-corporation` → capability `front/corporation`
- `front-character-selection` → capability `front/character-selection`

Those change folders are **superseded** by this change and removed from the active register.

## Capabilities

### New Capabilities

- `front/page-header` — `app-page-header`, versioned AIP/SSP renders
- `front/dashboard` — secured landing + feature dashboards + breadcrumb
- `front/eve-media` — client Image Server URL contract
- `front/corporation` — corporation panel / `v1-corporation-render`
- `front/character-selection` — pre-Dashboard character selection UI

## Impact

- Owner: **`neocom-front`**
- Branch: `feature/dashboard-shell` from `develop`
- L2: `FRONT/04`, `12`, `18`, `19`, `20` (+ cleared EPIC-006 extracts)
- Depends on applied: `front-pilot`, `front-pilot-panel`, `login` (session)
- Still `to review` on L1: UI-DASH-006, UI-DASH-011
