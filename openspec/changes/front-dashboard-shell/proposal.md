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

## Amend 2026-11-03 (DEF-IB batch)

Registered from EPIC-006 extracts into this change:

| L2 id | Capability | Defect |
| --- | --- | --- |
| UI-VER-004 | `front/page-header` | DEF-IB-004 — pages unversioned |
| UI-GEO-001 | `front/page-header` | DEF-IB-006 token |
| UI-HDR-010 | `front/page-header` | DEF-IB-002 |
| UI-HDR-011 | `front/page-header` | DEF-IB-005 |
| UI-AIP-006 | `front/page-header` | DEF-IB-001 |
| UI-DASH-015 | `front/dashboard` | DEF-IB-006 application |

Industry page rename called out by UI-VER-004 may touch `feature/industry-blueprints` artefacts when applying; the SHALL is owned here.

## Amend 2026-11-06 (DEF-BLP-004 / 005)

Registered from EPIC-006 into this change:

| L1 id | Capability | Defect |
| --- | --- | --- |
| UI-CORP-014 | `front/corporation` | DEF-BLP-004 — flex row 3→2→1, 2× gap |
| UI-GEO-002 | `front/page-header` | DEF-BLP-005 — `$section-padding` = `$panel-padding` |