# Tasks

## Shared UI

- [ ] Document/apply Elemental + Open Sans as primary faces; field labels Open Sans 9px `#ffa500` (IND-BP-080, IND-BP-081)
- [ ] Provide standard icon size tokens 16/24/32 (`sm`/`md`/`lg`) (IND-BP-082)
- [ ] Expandable items show toggle icon pair: collapsed → `arrowright.png`, expanded → `arrowdownred.png` (IND-BP-083)
- [ ] Ship expand-chevron set under `public/res-ui/drawable/` for Region/System expand UI (IND-BP-088)

## Model strip

- [ ] Provide `model-strip-page` at `/model-strip` without authentication (IND-BP-001)
- [ ] Add docs index of validated model previews; show green check on validated specimens (IND-BP-002, IND-BP-003)
- [ ] Place new specimens at top; show render name (+ optional style ref); include 14px Elemental + Open Sans baseline (IND-BP-004…006)
- [ ] Allow agents to add specimens and capture PNGs into `sources/L1/media/` when documenting Appearances (IND-BP-007)

## Color table

- [ ] Provide `color-table-page` at `/color-table` with `<app-page-header />` and no authentication (IND-BP-040)
- [ ] List every palette colour with swatch and style name (key + CSS variable) (IND-BP-041, IND-BP-042)

## Feature button

- [ ] Introduce FeatureV1 + `v1-feature-button` (selected B); discard candidate A (IND-BP-010…012)
- [ ] Procedurally seed Industry Feature panel including `blueprint-by-location`; navigate on select (IND-BP-020, IND-BP-021, IND-BP-023)

## Blueprint by location

- [ ] Provide `v1-blueprint-by-location-page` at `/industry/blueprints-by-location` with header, auth, Region→System→Blueprint panel; paint System with `v1-system-render` (IND-BP-030…036)
- [ ] Implement `v1-region-render` (+ model-strip specimen) and hierarchy children rules (IND-BP-060…063, 070…072)
- [ ] Implement `v1-system-render` (+ model-strip specimen), panel-orange, expandable (IND-BP-100…105)
- [ ] Implement / align `v1-blueprint-render` base identity (+ specimen): icon lg, name, ME/TE, conditional runs (IND-BP-090…095)
- [ ] On page start request pilot blueprints; process partial/SSE feed into Region→System→Blueprint aggregation; rebuild render list; no ESI from front (IND-BP-110…118)
