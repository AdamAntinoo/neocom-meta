# Defects — `feature/industry-blueprints` (and stacked shell)

Register of defects found while validating the current front implementation on `feature/industry-blueprints` (stacked on `feature/dashboard-shell`). This file is the **intake log** only until a defect is promoted into the OpenSpec / epic flow.

Related OpenSpec (applying): [`front-industry-blueprints`](../openspec/changes/front-industry-blueprints/), [`front-dashboard-shell`](../openspec/changes/front-dashboard-shell/).  
Related epics: [EPIC-010](../sources/L1/10.EPIC-INDUSTRY-BLUEPRINTS.md), [EPIC-006](../sources/L1/06.EPIC-USER-INTERFACE.md) (header / character selection chrome).

## Contents

- [Defects —](#defects--featureindustry-blueprints-and-stacked-shell) `feature/industry-blueprints` [(and stacked shell)](#defects--featureindustry-blueprints-and-stacked-shell)
  - [Contents](#contents)
  - [How defects resolve (intended programme flow)](#how-defects-resolve-intended-programme-flow)
  - [Register](#register)
  - [DEF-IB-001 — App name click returns to character selection](#def-ib-001--app-name-click-returns-to-character-selection)
    - [Observed](#observed)
    - [Expected](#expected)
    - [Likely sources to amend](#likely-sources-to-amend)
    - [Prep for resolution (checklist)](#prep-for-resolution-checklist)
    - [Notes](#notes)
  - [DEF-IB-002 — Header host named](#def-ib-002--header-host-named-page-header-instead-of-app-page-header) `page-header` [instead of](#def-ib-002--header-host-named-page-header-instead-of-app-page-header) `app-page-header`
    - [Observed](#observed-1)
    - [Expected](#expected-1)
    - [Likely sources to amend](#likely-sources-to-amend-1)
    - [Prep for resolution (checklist)](#prep-for-resolution-checklist-1)
    - [Notes](#notes-1)
  - [DEF-IB-003 —](#def-ib-003--cy-section-name-matches-component-name-without-type-suffix) `cy-section-name` [matches component name without type suffix](#def-ib-003--cy-section-name-matches-component-name-without-type-suffix)
    - [Observed](#observed-2)
    - [Expected](#expected-2)
    - [Likely sources to amend](#likely-sources-to-amend-2)
    - [Prep for resolution (checklist)](#prep-for-resolution-checklist-2)
    - [Notes](#notes-2)
  - [DEF-IB-004 — Pages must not use](#def-ib-004--pages-must-not-use-vn--version-prefix) `vn-` [version prefix](#def-ib-004--pages-must-not-use-vn--version-prefix)
    - [Observed](#observed-3)
    - [Expected](#expected-3)
    - [Likely sources to amend](#likely-sources-to-amend-3)
    - [Prep for resolution (checklist)](#prep-for-resolution-checklist-3)
    - [Notes](#notes-3)
  - [DEF-IB-005 — Header app-info / server-info row width and responsive stack](#def-ib-005--header-app-info--server-info-row-width-and-responsive-stack)
    - [Observed](#observed-4)
    - [Expected](#expected-4)
    - [Likely sources to amend](#likely-sources-to-amend-4)
    - [Prep for resolution (checklist)](#prep-for-resolution-checklist-4)
    - [Notes](#notes-4)
  - [DEF-IB-006 — Pilot row spacing must use default panel gap](#def-ib-006--pilot-row-spacing-must-use-default-panel-gap)
    - [Observed](#observed-5)
    - [Expected](#expected-5)
    - [Likely sources to amend](#likely-sources-to-amend-5)
    - [Prep for resolution (checklist)](#prep-for-resolution-checklist-5)
    - [Notes](#notes-5)
  - [DEF-IB-007 — Pilot panel render vs model-strip + missing private data](#def-ib-007--pilot-panel-render-vs-model-strip--missing-private-data)
    - [Observed](#observed-6)
    - [Expected](#expected-6)
    - [Likely sources to amend](#likely-sources-to-amend-6)
    - [Prep for resolution (checklist)](#prep-for-resolution-checklist-6)
    - [Notes](#notes-6)
  - [DEF-IB-008 — Breadcrumb: small Elemental in full-width white panel](#def-ib-008--breadcrumb-small-elemental-in-full-width-white-panel)
    - [Observed](#observed-7)
    - [Expected](#expected-7)
    - [Likely sources to amend](#likely-sources-to-amend-7)
    - [Prep for resolution (checklist)](#prep-for-resolution-checklist-7)
    - [Notes](#notes-7)
  - [DEF-IB-009 — Feature list flex layout + icon/name Appearance](#def-ib-009--feature-list-flex-layout--iconname-appearance)
    - [Observed](#observed-8)
    - [Expected](#expected-8)
    - [Prep for resolution (checklist)](#prep-for-resolution-checklist-8)
    - [Notes](#notes-8)
  - [DEF-IB-010 — Blueprint list panel uses deprecated](#def-ib-010--blueprint-list-panel-uses-deprecated-solar_system_lookup-variant) `SOLAR_SYSTEM_LOOKUP` [variant](#def-ib-010--blueprint-list-panel-uses-deprecated-solar_system_lookup-variant)
    - [Observed](#observed-9)
    - [Expected](#expected-9)
    - [Likely sources to amend](#likely-sources-to-amend-9)
    - [Prep for resolution (checklist)](#prep-for-resolution-checklist-9)
    - [Notes](#notes-9)

## How defects resolve (intended programme flow)

Use `/defect` (`neocom-defect`) to append new entries on this page (`FEATURE-<branch-stem>_DEFECTS.md`). Use `/fix:defect` (optional `DEF-…` id) to implement marked / named defects. Treat each accepted defect as follows:

1. **Record here** — `/defect`; status `open`; fill Observed / Expected / Prep below.
2. **Register the spec on the epic** — author or amend the L1 requirement on the owning epic with Review `[ ] to review`. Prefer **not** inventing behaviour beyond what the defect states.
3. **Mark to run the process** (developer, manual) — checking that mark sets Review to `[x] reviewed` and authorizes `/fix:defect`.
4. `/fix:defect` — list defects + planned actions; wait for developer go-ahead; then implement Expected for one id or all ready (Mark to run `[x]`, Developer validates still `[ ]`). Status `applying`. No commit.
5. **Developer validates** the product fix — then `/defect:fixed DEF-…` moves the defect (same row + section) to [`FIXED-DEFECTS.md`](./FIXED-DEFECTS.md) and removes it from this page.

Statuses for this register: `open` · `prep` · `in openspec` · `applying` · `fixed` · `closed` · `wontfix`.

---

## Register

| ID | Title | Status | Owning epic / capability | OpenSpec (when known) | Found |
| --- | --- | --- | --- | --- | --- |
| DEF-IB-001 | App name click → character selection | `applying` | EPIC-006 · **UI-AIP-006** `[ ]` | after review → extract / amend `front-dashboard-shell` | 2026-11-03 |
| DEF-IB-002 | Header host named `page-header` not `app-page-header` | `applying` | EPIC-006 · **UI-HDR-010** `[ ]` | after review → extract / amend `front-dashboard-shell` | 2026-11-03 |
| DEF-IB-003 | `cy-section-name` must match component name minus type suffix | `applying` | EPIC-003 / EPIC-006 · BDD `cy-*` + UI hosts | TBD — BDD catalog + dashboard-shell / industry specs | 2026-11-03 |
| DEF-IB-004 | Pages must not use `vn-` version prefix | `applying` | EPIC-006 · **UI-VER-004** `[ ] to review` | after review → extract / amend industry page name | 2026-11-03 |
| DEF-IB-005 | Header app-info / server-info row width + stack | `applying` | EPIC-006 · **UI-HDR-011** `[ ]` | after review → extract / amend `front-dashboard-shell` | 2026-11-03 |
| DEF-IB-006 | Pilot row spacing must use default panel gap | `applying` | EPIC-006 · **UI-GEO-001** + **UI-DASH-015** `[ ]` | after review → extract / amend `front-dashboard-shell` | 2026-11-03 |
| DEF-IB-007 | Pilot panel ≠ model-strip; private data missing when authenticated | `applying` | EPIC-004 · PublicPilotV1 / PilotV2 · EPIC-006 UI-DASH pilot row | TBD — `front-pilot` / `front-dashboard-shell` + back pilot DTO | 2026-11-03 |
| DEF-IB-008 | Breadcrumb: small Elemental in full-width white panel, flush to neighbours | `applying` | EPIC-006 · UI-DASH breadcrumb Appearance | TBD — `front-dashboard-shell` amend or follow-up fix | 2026-11-03 |
| DEF-IB-009 | Feature list flex layout + icon border + Elemental white name | `applying` | EPIC-006 · UI-DASH feature list / feature button Appearance | TBD — `front-dashboard-shell` amend or follow-up fix | 2026-11-03 |
| DEF-IB-010 | Blueprint list panel uses deprecated `SOLAR_SYSTEM_LOOKUP`; need `-BLUEPRINT-LIST-` | `applying` | EPIC-010 · blueprint-by-location panel variant | TBD — `front-industry-blueprints` + `NeoComVariant` | 2026-11-04 |

---

## DEF-IB-001 — App name click returns to character selection

| Field | Value |
| --- | --- |
| Status | `applying` |
| Severity | UX / navigation gap (no alternate path to character selection from secured pages) |
| Surfaces | `v1-application-info-render` (and transitional `app-info-panel` if still painted) inside `app-page-header` |
| Found on | Secured pages after Industry / Dashboard (e.g. Blueprint Availability) |
| Branch tip | `neocom-front` `feature/industry-blueprints` |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) **UI-AIP-006** Review `[ ]` — check to `[x]` when ready for `/neo:extract-l2` |

### Observed

There is **no** navigation control back to the **character selection** page from the secured application chrome. The application **name** in the application-info panel is display-only (`cy-field-value="app-name"`); clicking it does nothing.

### Expected

When the user **clicks the application name** in the application-info panel (`v1-application-info-render` / `cy-field-value="app-name"`), the app SHALL navigate to the **character selection** route (programme path: `/character-selection`, UI-CHAR / LOGIN-006 UI).

Scope note (prep): activation is the **name** control only (not version, not copyright), unless L1 later widens it.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) — Application info panel (UI-AIP-*) and/or Character selection (UI-CHAR-*) | Add a Review row for name → character-selection navigation; leave Appearance rows intact unless they conflict |
| L2 | `FRONT/12.PAGE-HEADER.md` and/or `FRONT/20.CHARACTER-SELECTION.md` (after extract) | Only if L1 is extracted |
| OpenSpec | `front-dashboard-shell` specs `front/page-header` or `front/character-selection` (or a small fix change) | Delta: clickable name → `/character-selection` |
| Code | `neocom-front` `v1-application-info-render` (+ router link / click handler); ensure auth guard still applies | Do not invent SSO behaviour |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and applies the flow through OpenSpec
- [x] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Found while exercising Industry blueprints secured chrome; root cause is header/ApplicationInfo behaviour (EPIC-006), not Blueprint Availability aggregation itself.

2026-11-05 `/fix:defect`: front already navigates app-name → `/character-selection` (`v1-application-info-render`); L1 UI-AIP-006 already extracted. Status applying — validate in UI then `/defect:fixed`.

---

## DEF-IB-002 — Header host named `page-header` instead of `app-page-header`

| Field | Value |
| --- | --- |
| Status | `applying` |
| Severity | Naming / consistency (breaks programme naming consistency with UI-HDR-001) |
| Surfaces | Header host component folder, class, SCSS class; L2 / OpenSpec capability id may also say `page-header` |
| Found on | `neocom-front` header module while validating secured chrome |
| Branch tip | `neocom-front` `feature/industry-blueprints` |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) **UI-HDR-010** Review `[ ]` — check to `[x]` when ready for `/neo:extract-l2` |

### Observed

Programme and specs name the common header host `**app-page-header**` (UI-HDR-001; pages use `<app-page-header />`). The Angular **selector** already matches (`selector: 'app-page-header'`), but other artefacts are still named `**page-header`**:

| Artefact | Current name | Programme name |
| --- | --- | --- |
| Folder / files | `modules/header/page-header/page-header.component.*` | expect `app-page-header` |
| Class | `PageHeaderComponent` | expect `AppPageHeaderComponent` (or equivalent `app-page-header` alignment) |
| Host CSS class | `page-header` on the section | expect `app-page-header` (or document intentional short class) |
| L2 / OpenSpec | `FRONT/12.PAGE-HEADER.md`, capability `front/page-header` | programme short name is `app-page-header` |

This split breaks naming consistency: docs and templates say `app-page-header`; source paths and types say `page-header`.

### Expected

The header host SHALL be named consistently as `**app-page-header**` across selector, folder/file basename, component class, and (unless L1 explicitly keeps a short CSS token) the primary CSS class. Spec / OpenSpec capability paths SHOULD use the same programme name when next amended (or record an explicit alias if `page-header` remains as a legacy path).

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) — Common header (`app-page-header`, UI-HDR-*) | Add a naming-consistency row (suggested `UI-HDR-010`) or clarify that folder/class MUST match the selector |
| L2 | `FRONT/12.PAGE-HEADER.md` → consider rename / alias to `APP-PAGE-HEADER` when extracted again | Avoid silent path breaks; update INDEX / TRACEABILITY |
| OpenSpec | `front-dashboard-shell` → `specs/front/page-header/` (rename or alias to `app-page-header`) | Delta + tasks for rename |
| Code | Rename `page-header/` → `app-page-header/`, class → `AppPageHeaderComponent`, CSS `page-header` → `app-page-header`; update imports | Keep selector `app-page-header` (already correct) |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and applies the flow through OpenSpec
- [x] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Selector already complies with UI-HDR-001; defect is **identifier drift** in source layout and secondary names, not a missing header host.

2026-11-05 `/fix:defect`: host renamed to `app-page-header` on tip; L1 UI-HDR-010 already extracted. Status applying — validate naming then `/defect:fixed`.

---

## DEF-IB-003 — `cy-section-name` matches component name without type suffix

| Field | Value |
| --- | --- |
| Status | `applying` |
| Severity | Test / catalog consistency (Cypress `cy-section-name` drift from component identity) |
| Surfaces | Host components that publish `cy-section-name` (pages, panels, headers; renders as applicable) |
| Found on | Header / dashboard / industry chrome while validating secured pages |
| Branch tip | `neocom-front` `feature/industry-blueprints` |

### Observed

`cy-section-name` values do **not** consistently derive from the component selector / short name. Some are abbreviated or invented (`header`, `pilot-dashboard`, `blueprint-by-location-hierarchy`), while others already follow a cleaner pattern (`feature-list`, `character-selection`, `color-table`).

Programme docs (UI-HDR-005, UI-AIP-002, UI-SSP-002) currently **encode** some of the mismatched values (e.g. `app-page-header` owns `cy-section-name="header"`), so fixing this is both a **code** and a **spec** change — prior rows that mandate the old markers become incomplete / superseded by the naming rule.

### Expected

For a component whose selector / programme short name ends with a **type suffix** (`panel`, `header`, or `page`), `cy-section-name` SHALL equal that name **with the suffix removed**.

Examples (target):

| Component selector | Strip suffix | Expected `cy-section-name` | Current (examples) |
| --- | --- | --- | --- |
| `app-page-header` | `header` | `app-page` | `header` |
| `app-info-panel` | `panel` | `app-info` | `app-info` ✓ |
| `server-info-panel` | `panel` | `server-info` | `server-info` ✓ |
| `feature-list-panel` | `panel` | `feature-list` | `feature-list` ✓ |
| `v1-pilot-panel` | `panel` | `v1-pilot` | `pilot` |
| `v1-corporation-panel` | `panel` | `v1-corporation` | (render uses `corporation`) |
| `character-selection-page` | `page` | `character-selection` | `character-selection` ✓ |
| `color-table-page` | `page` | `color-table` | `color-table` ✓ |
| `blueprint-by-location-page` (after DEF-IB-004; today `v1-blueprint-by-location-page`) | `page` | `blueprint-by-location` | `v1-blueprint-by-location` (will change with page rename) |
| `blueprint-by-location-panel` | `panel` | `blueprint-by-location` | `blueprint-by-location-hierarchy` |
| `dashboard-home-page` | `page` | `dashboard-home` | (page body uses `pilot-dashboard` / `exception`) |

Prep clarification: if the selector has **multiple** trailing type tokens (e.g. `app-page-header`), strip **only the last** type suffix (`header` → `app-page`), not every occurrence of `page`. Confirm in L1 when authoring.

Out of scope until stated: inventing rules for `-render` / other suffixes; nested child sections that are not the component root may keep distinct names only if L1 allows an exception list.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | EPIC-003 testing / Cypress catalog; EPIC-006 UI-HDR / UI-AIP / UI-SSP rows that hard-code `header`, `app-info`, `server-info` | Add global `cy-section-name` derivation rule; mark UI-HDR-005 (and similar) superseded or amended where they force `header` |
| L2 | `FRONT/10.BDD-CYPRESS.md`, `FRONT/12.PAGE-HEADER.md`, industry/dashboard L2 as needed | After extract |
| OpenSpec | `front-bdd-cypress` and/or `front-dashboard-shell` / `front-industry-blueprints` deltas | Catalog + concrete host markers |
| Code | Align root `cy-section-name` on each host; update Vitest/Cypress queries | Mechanical rename; keep field-level `cy-field-*` unchanged |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and applies the flow through OpenSpec
- [x] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Related to DEF-IB-002 (host identity): once the host is consistently `app-page-header`, its section marker should be `app-page`, not `header`.

2026-11-05 `/fix:defect`: aligned root markers (`app-page`, `dashboard-home`, `v1-pilot`, `blueprint-by-location`); Vitest + Cypress steps updated. Renders kept as-is (out of suffix rule). Status applying.

---

## DEF-IB-004 — Pages must not use `vn-` version prefix

| Field | Value |
| --- | --- |
| Status | `applying` |
| Severity | Naming / versionability consistency (pages stay unversioned; panels/renders stay versioned) |
| Surfaces | Page component selectors, folders, classes under `neocom-front` `pages/` and feature `…/pages/` |
| Found on | Secured and support pages while validating Industry / Dashboard chrome |
| Branch tip | `neocom-front` `feature/industry-blueprints` |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) **UI-VER-004** Review `[ ] to review` — mark `[x] reviewed` when ready for `/neo:extract-l2` |

### Observed

Most **page** hosts correctly have **no** version prefix (`vn-` / `v1-`…). Programme UI versionability (UI-VER) requires `vn-` on **domain-bound panels/renders**, not on pages. One industry page incorrectly uses a versioned page name:

| Current selector | Versioned? |
| --- | --- |
| `dashboard-home-page` | no (correct) |
| `industry-home-page` | no (correct) |
| `manufacture-home-page` | no (correct) |
| `character-selection-page` | no (correct) |
| `login-page` / `login-callback-page` | no (correct) |
| `model-strip-page` / `color-table-page` | no (correct) |
| `v1-blueprint-by-location-page` | yes (`v1-`) — **incorrect for a page** |

So page naming is **inconsistent**: one feature page was versioned by mistake; the rest match the intended unversioned page rule.

### Expected

**Page hosts SHALL NOT carry a** `vn-` **version prefix** on selector / folder / class. Use unversioned `*-page` names (e.g. `dashboard-home-page`, `character-selection-page`, `blueprint-by-location-page`). Versionability stays on panels/renders (`v1-…-render`, `v1-…-panel`), not on pages.

Prep clarifications for L1 (do not invent beyond this defect until authored):

- Apply to **all** `*-page` **hosts** under the page register (feature, auth, and support pages alike).
- Shell-only hosts such as `app-page-header` remain unversioned (unchanged).
- Migrate the outlier: `v1-blueprint-by-location-page` → `blueprint-by-location-page` (and matching folder / class / short name without `v1-`).
- After rename, DEF-IB-003 `cy-section-name` derivation uses the unversioned selector (strip final `page` → e.g. `blueprint-by-location`).
- Route **URL paths** stay stable (`/industry/blueprints-by-location`, `/dashboard`, …) unless a later requirement says otherwise.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) **UI-VER-004**; [`10.EPIC-INDUSTRY-BLUEPRINTS.md`](../sources/L1/10.EPIC-INDUSTRY-BLUEPRINTS.md) Section 04 page short name / selector | UI-VER: pages unversioned; EPIC-010: drop `v1-` from page name (panels/renders keep `vn-`) |
| L2 | Industry page L2 / FRONT/16 after extract or amend | Reflect unversioned page selector |
| OpenSpec | `front-industry-blueprints` (page rename); shell only if any page was wrongly versioned | Delta + rename tasks; keep URL paths |
| Code | Rename `v1-blueprint-by-location-page` → `blueprint-by-location-page`; update imports/tests | Prefer keep URL paths stable |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and applies the flow through OpenSpec
- [x] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Earlier prep wrongly proposed versioning all pages to match industry. **Correct direction is the opposite:** strip `v1-` from the industry **page** host; leave most pages as they are. Domain-bound panels/renders on that page stay versioned.

2026-11-05 `/fix:defect`: `blueprint-by-location-page` already unversioned on tip; L1 UI-VER-004 extracted. Status applying — validate then `/defect:fixed`.

---

## DEF-IB-005 — Header app-info / server-info row width and responsive stack

| Field | Value |
| --- | --- |
| Status | `applying` |
| Severity | Layout / responsive gap (header first line does not use full page width correctly) |
| Surfaces | `app-page-header` first line: `v1-application-info-render` + `v1-server-status-render` (via `standalone-node-panel`); global `.row` / render `:host` flex |
| Found on | Dashboard (and any `-APP-` secured page with the same header) |
| Branch tip | `neocom-front` `feature/industry-blueprints` |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) **UI-HDR-011** Review `[ ]` — check to `[x]` when ready for `/neo:extract-l2` |

### Observed

On the dashboard (and other `-APP-` pages), the **first header line** hosts application-info and server-info side by side inside `app-page-header` (`class="row section page-header"`).

Current flex behaviour does **not** match the intended chrome:

| Piece | Current | Problem |
| --- | --- | --- |
| Header `.row` | `width: 100%`, `flex-wrap: nowrap` (`geometry.scss`) | Row is full width, but children never wrap when space is tight |
| `v1-application-info-render` `:host` | `flex-grow: 4` | Grows, but not explicitly “remaining space after server” |
| `v1-server-status-render` `:host` | `flex: 1`; inner panel `width: 100%` | Server **shares** row flex instead of sizing to its **content** and sitting on the **right** |
| Narrow viewports | `nowrap` | Panels stay side-by-side and compress; they do **not** stack (app above server) |

Result: the pair does not clearly span the page as “app fills remainder + server content-width on the right”, and there is no fallback stack when horizontal space is insufficient.

### Expected

The header first line (app-info + server-info on `-APP-`) SHALL:

1. **Span the complete width** of the page / header band.
2. Place **server-info on the right**, sized to the **space its contents require** (content-sized / `flex: 0 0 auto` or equivalent — not an equal flex share).
3. Place **app-info on the left**, using the **remaining** horizontal space.
4. When there is **not enough** horizontal space for that arrangement, **stack** vertically: **app-info on top**, **server-info below** (each then full width of the band).

`-AUTH-` (app-info only) is unchanged: single panel still full width of the header band.

Prep clarifications for L1 (do not invent beyond this defect until authored):

- Owner is `**app-page-header` layout** (and/or the two render hosts’ flex contract), not page-specific dashboard CSS.
- “Not enough space” may be implemented via wrap + min-widths, a CSS breakpoint, or `flex-wrap` with full-width children when wrapped — L1 should state the behaviour, not a specific breakpoint px value, unless the user sets one.
- Panel chrome / field Appearance (UI-AIP / UI-SSP) stay as-is; this defect is **row geometry** only.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) — Common header (UI-HDR-*) and/or UI-AIP / UI-SSP | Add layout row requirement (suggested `UI-HDR-010` or `UI-HDR-011` if 010 used by DEF-IB-002 naming); leave Appearance rows intact |
| L2 | `FRONT/12.PAGE-HEADER.md` (after extract) | Header band geometry |
| OpenSpec | `front-dashboard-shell` → `front/page-header` (or small fix change) | Delta: full-width band; server content-right; app fill; stack when narrow |
| Code | `page-header.component.scss` (facade today); `v1-application-info-render` / `v1-server-status-render` `:host` flex; optionally `.row--wrap` / header-specific modifier | Avoid breaking other `.row` consumers; prefer header-scoped rules |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and applies the flow through OpenSpec
- [ ] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Related to UI-HDR-003 / UI-AIP-005 / UI-SSP (both panels on `-APP-`). Found while validating dashboard chrome on the industry-blueprints stack tip; root cause is header row flex, not Blueprint Availability.

2026-11-05 `/fix:defect`: `app-page-header` SCSS already full-width / server content-right / stack @720px; render hosts width-aligned. Status applying — validate responsive then `/defect:fixed`.

---

## DEF-IB-006 — Pilot row spacing must use default panel gap

| Field | Value |
| --- | --- |
| Status | `applying` |
| Severity | Layout / spacing inconsistency (pilot row uses ad-hoc `0.75rem` instead of programme panel gap) |
| Surfaces | Dashboard pilot & corporation row; `app-page-header` sibling spacing; shared panel tokens (`$panel-margin` / `$panel-padding`) |
| Found on | Dashboard first content after header (`v1-pilot-panel` + `v1-corporation-panel`) |
| Branch tip | `neocom-front` `feature/industry-blueprints` |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) **UI-GEO-001** + **UI-DASH-015** Review `[ ]` — check to `[x]` when ready for `/neo:extract-l2` |

### Observed

The **pilot panel** sits in a second dashboard band under `app-page-header`. That band is visually **too far** from the header first line (app-info / server-info).

Current dashboard styles (`dashboard-home-page.component.scss` → `.pilot-corporation-row`) apply:

| Property | Current value | Effect |
| --- | --- | --- |
| `padding` | `0.75rem` | Large inset from the page edge and from the header above |
| `gap` | `0.75rem` | Large separation between pilot and corporation |

Meanwhile the programme’s **default panel / application gap** in common styles is the token pair in `styles/_tokens.scss`:

- `$panel-margin: 2px`
- `$panel-padding: 2px`

and the app-info render already uses a `**2px**` right margin toward server-info (`v1-application-info-render` `:host { margin-right: 2px }`). Geometry classes themselves use **zero** gap (`geometry.scss`); panel separation is meant to come from that panel token, not from page-local `0.75rem`.

So spacing is inconsistent: header panels use ~`2px`; the pilot row invents a larger gutter and also pads the whole band away from the header and the page border.

### Expected

All of the following separations SHALL use the **same predefined default application / panel gap** from common styles (today: `**$panel-margin` / `$panel-padding` → `2px`**, or the CSS variable equivalent when one is published):

1. **Vertical** gap between the **header first line** (app-info / server-info) and the **pilot panel** (pilot & corporation row) — minimal; only that default gap, not an extra page padding band.
2. **Horizontal** gap between **app-info** and **server-info** (same token — aligns with DEF-IB-005 row geometry).
3. **Inset from the page / band border** around these panels — same as the app-info panel’s border separation (panel margin), not a larger local padding.
4. **Horizontal** gap between the **pilot panel** and the **corporation panel** — same predefined gap.

No inventing a second spacing scale on the dashboard page. If geometry stays flush (`gap: 0`), panels SHALL own the `2px` margin (or the row SHALL use the token as `gap` / edge inset consistently).

Prep clarifications for L1 (do not invent beyond this defect until authored):

- Token name in L1 should point at the common styles token (`$panel-margin` / programme “default panel gap”), not hard-code `0.75rem`.
- Breadcrumb / feature-list rows are **out of scope** unless the user later says they must share the same rule; this defect is header → pilot/corporation chrome.
- Related to DEF-IB-005 (header row width/stack); spacing between app and server is the **same token**, not a separate invent.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) — Page geometry + UI-DASH / Pilot and corporation row | Add spacing rule: secured chrome panels use default panel gap for inter-panel and border inset |
| L2 | `FRONT/04.DASHBOARD.md` / `FRONT/12.PAGE-HEADER.md` after extract | Geometry + gap token |
| OpenSpec | `front-dashboard-shell` (`front/dashboard`, `front/page-header`) | Delta: remove `0.75rem` pilot-row padding/gap; use `$panel-margin` |
| Code | `dashboard-home-page.component.scss` (drop/replace `0.75rem`); ensure header row + renders use the same token; optionally publish `--neo-panel-margin` if not already | Keep Appearance chrome intact |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and applies the flow through OpenSpec
- [ ] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Found while validating dashboard chrome after DEF-IB-005. Root cause is **page-local spacing** on `.pilot-corporation-row`, not pilot/corporation Appearance content.

2026-11-05 `/fix:defect`: dashboard pilot row already uses `$panel-margin` / `$panel-padding`; L1 UI-GEO-001 + UI-DASH-015 extracted. Status applying — validate spacing then `/defect:fixed`.

---

## DEF-IB-007 — Pilot panel render vs model-strip + missing private data

| Field | Value |
| --- | --- |
| Status | `applying` |
| Severity | Appearance + data contract gap (dashboard pilot ≠ programme specimen; authenticated private fields absent) |
| Surfaces | Dashboard `v1-pilot-panel`; `v1-public-pilot-render` / `v2-pilot-render`; model-strip specimens `v1-public-pilot` and `v2-pilot`; back `GET /v1/pilots/:id` wire |
| Found on | Dashboard pilot row after character selection (authenticated session) |
| Branch tip | `neocom-front` `feature/industry-blueprints` |

### Observed

Two related failures on the dashboard pilot panel:

**1. Appearance does not match the model-strip** `v1-public-pilot` **specimen**

Programme Appearance for the public pilot HEADER is the model-strip specimen `**v1-public-pilot**` (EPIC-004 Section 06; live strip on `model-strip-page`). The dashboard hosts `**v1-pilot-panel**`, which may paint via `v1-public-pilot-render`, but the **on-page result does not match** that specimen (layout / chrome / typography / field arrangement as validated on the strip).

Contributing factors visible in code (prep evidence, not inventing root cause):

| Piece | Note |
| --- | --- |
| Model-strip | Inline specimen HTML under `data-specimen="v1-public-pilot"` (portrait + name `[id]` + ancestry + gender) — authoritative visual |
| Dashboard | `<v1-pilot-panel class="panel" [identifier]="…">` with its own `neocom-panel panel-white pilot` chrome wrapping the render |
| Render | `v1-public-pilot-render` exists and is intended to match the strip; host chrome / CSS / data may still diverge from the strip specimen |

**2. When the pilot is authenticated, private data is not present**

After login / character selection the session has a credential. Expected authenticated HEADER is `**v2-pilot**` (same public lines as `v1-public-pilot`, plus skill points, wallet, current ship — EPIC-004 Section 07).

Observed: **private fields are not shown** on the panel. `v1-pilot-panel` only switches to `v2-pilot-render` when the loaded node is a `**PilotV2Node`** and a credential is present (`showPrivate`). If the backend returns `**PublicPilotV1`** (or a wire without PilotV2 private fields / wrong `jsonClass`), the panel stays on the public path and private data never appears.

Private PilotV2 data **SHALL come from the backend** (`GET /v1/pilots/:pilotId` with Authorization) and be **ready on the panel** for the authenticated selected pilot — not invented on the client, not left empty while authenticated.

### Expected

1. **Public Appearance:** the dashboard (and any host using the public pilot HEADER) SHALL match the model-strip `**v1-public-pilot`** specimen for the public lines (portrait, name + id, ancestry, gender, chrome language). Prefer painting through the registered `**v1-public-pilot-render`** (or equivalent) so strip and live panel stay one Appearance.
2. **Authenticated private data:** when the user is authenticated and a pilot is selected, the panel SHALL receive a **PilotV2** (or equivalent authenticated wire) from the **backend**, with private HEADER fields populated (**total skill points, wallet balance, current ship name** per EPIC-004 `v2-pilot` contract), and SHALL render them with `**v2-pilot`** Appearance (model-strip `v2-pilot` specimen) — public lines still aligned with `v1-public-pilot`.
3. Private fields are **not** optional empty placeholders when the session is authenticated; if the back cannot supply them yet, that is a **back delivery gap** to fix, not a front omission of the contract.

Prep clarifications for L1 / OpenSpec (do not invent beyond this defect until authored):

- Character-selection **list** mode may stay public/list; this defect is the **dashboard / HEADER** authenticated panel.
- Confirm whether visual mismatch is host double-chrome, render CSS drift, or incomplete/wrong field values — fix whichever the strip comparison shows; do not change the strip specimen to match the broken panel.
- Back + front may both need work: front to host the correct render; back to return PilotV2 private fields when Authorization is present.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`04.EPIC-MODELS.md`](../sources/L1/04.EPIC-MODELS.md) — `v1-public-pilot` / `v2-pilot`; [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) — Pilot and corporation row | Clarify dashboard uses strip-aligned render; authenticated HEADER requires PilotV2 from back |
| L2 | Pilot / dashboard L2 as applicable | After extract |
| OpenSpec | `front-pilot` / `front-dashboard-shell`; back pilot / character endpoint change if needed | Delta: Appearance parity + authenticated PilotV2 wire |
| Code (front) | `v1-pilot-panel`, `v1-public-pilot-render`, `v2-pilot-render`, `PilotService.getPilot` | Align chrome with strip; ensure private path when PilotV2 arrives |
| Code (back) | Pilot `GET /v1/pilots/:id` authenticated response | Return PilotV2 with private HEADER fields when credential present |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and applies the flow through OpenSpec
- [ ] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Related to UI-DASH-007 (pilot panel on second row) and EPIC-004 PILOT-008 / `v2-pilot` HEADER contract. Distinct from DEF-IB-006 (spacing only). Found while validating dashboard chrome on the industry-blueprints stack tip.

2026-11-05 `/fix:defect`: **blocked for full Expected** — authenticated PilotV2 private fields need back `GET /v1/pilots/:id` contract (do not invent on front). Front `cy-section-name` → `v1-pilot` only. Status applying (partial); need back follow-up.

---

## DEF-IB-008 — Breadcrumb: small Elemental in full-width white panel

| Field | Value |
| --- | --- |
| Status | `applying` |
| Severity | Appearance / layout gap (breadcrumb typography, chrome, width, and neighbour spacing undefined / wrong) |
| Surfaces | `app-breadcrumb` on Dashboard and secured feature pages |
| Found on | Dashboard breadcrumb row (and same host on Industry / Manufacture pages) |
| Branch tip | `neocom-front` `feature/industry-blueprints` |

### Observed

Breadcrumb **Appearance is not defined** in L1 beyond navigable links (UI-DASH-008 / UI-DASH-010; epic text: “Detailed breadcrumb component behaviour … MAY be refined later”).

Current implementation:

| Aspect | Current | Problem |
| --- | --- | --- |
| Typography | Open Sans 12px (`app-breadcrumb.component.scss`) | Not programme **Elemental** |
| Chrome | Bare `<nav class="section row breadcrumb">` — no `neocom-panel` / `panel-white` | Not encased in a white NeoCom panel |
| Width | Row may not read as a full page-width band | Should span **all page width** |
| Spacing | Local padding (`0.5rem 0.75rem`) and page gaps leave separation from neighbours | Should have **no separation** from the **previous** panel (pilot/corporation row) **nor** the **next** panel (feature list) |

### Expected

1. **Typography:** crumb text SHALL use **Elemental** in a **small** size (same family as app name/version chrome, smaller than title sizes).
2. **Chrome:** the breadcrumb SHALL be **encased** in a `**neocom-panel panel-white`** (white NeoCom panel).
3. **Width:** the panel SHALL span the **full page width**.
4. **Neighbour spacing:** there SHALL be **no separation** (extra gap / margin) between this breadcrumb panel and the **previous** panel band, and **no separation** between it and the **next** panel band. Flush stacking — only the shared default panel gap token applies if panels themselves own `$panel-margin` (see DEF-IB-006); do not add an extra gutter around the breadcrumb band.

Prep clarifications for L1 (do not invent beyond this defect until authored):

- Face: **Elemental** (not Open Sans); size: **small** Elemental — exact px MAY be authored in L1.
- Colour / link / current / separator styling MAY stay until separately specified; this defect covers **font**, **white panel chrome**, **full width**, and **flush to previous/next**.
- “No separation” means no extra page/band gutter above or below the breadcrumb panel relative to its neighbours; panel border chrome itself remains.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) — Breadcrumb row / UI-DASH-* | Add Appearance: Elemental small; `neocom-panel panel-white`; full width; flush to previous/next |
| L2 | Dashboard / shared breadcrumb L2 after extract | |
| OpenSpec | `front-dashboard-shell` (breadcrumb / dashboard capability) | Delta: typography + white panel + width + flush stacking |
| Code | `app-breadcrumb.component.html` / `.scss`; dashboard (and feature) page stacking | Add `neocom-panel panel-white`; Elemental small; width 100%; remove extra gutters vs pilot row / feature list |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and applies the flow through OpenSpec
- [x] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

L1 already deferred detailed breadcrumb styling; this defect **supplies** the missing Appearance (type + chrome + layout) rather than contradicting an existing row. Related to DEF-IB-006 (shared gap token).

2026-11-05 `/fix:defect`: breadcrumb now `neocom-panel panel-white`, Elemental 12px, full width, `$panel-margin` flush. Status applying — validate Appearance then `/defect:fixed`.

---

## DEF-IB-009 — Feature list flex layout + icon/name Appearance

| Field | Value |
| --- | --- |
| Status | `applying` |
| Severity | Appearance / layout gap (feature list distribution and feature-button chrome undefined / wrong) |
| Surfaces | `feature-list-panel` + `v1-feature-button` (legacy) on Dashboard and feature dashboards |
| Found on | Dashboard feature list row |
| Branch tip | `neocom-front` `feature/industry-blueprints` |

### Observed

Feature list **layout Appearance** is not specified beyond “listing panel + feature render” (UI-DASH-004 / Feature list row). Live UI:

| Aspect | Current | Problem |
| --- | --- | --- |
| Distribution | `.feature-list` is a wrapping flex row with `gap: 0.75rem` and padding; slots pack from the start | Not a balanced flex presentation across the page width |
| Icon | `.neocom-icon` has size/object-fit only; hover border on `.feature-box` is blue | Icons lack a **fine white** border |
| Feature name | `.feature-label` is 12px uppercase bold — no Elemental, no white colour | Name should be **small Elemental**, **white** |

### Expected

1. **Flex presentation** of feature slots across the band width:
   - **One** feature → **centered** on the width.
   - **Two** features → equally separated from **each other** and from the **left/right borders** (symmetric gutters).
   - **More** → same rule generalised: even distribution with equal space between items and equal space to the band edges (e.g. `justify-content: space-evenly` or equivalent).
2. **Icons** SHALL be bordered with a **fine white line**.
3. **Feature name** SHALL use **small Elemental** font in **white** colour.

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and applies the flow through OpenSpec
- [x] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Not in this L1 batch (prep Author L1 still unchecked). Distinct from DEF-IB-008 (breadcrumb).

2026-11-05 `/fix:defect`: feature-list `justify-content: space-evenly` + token gap; feature-button fine white icon border + Elemental white label. Status applying — validate then `/defect:fixed`.

---

## DEF-IB-010 — Blueprint list panel uses deprecated `SOLAR_SYSTEM_LOOKUP` variant

| Field | Value |
| --- | --- |
| Status | `applying` |
| Severity | Incorrect / deprecated variant on the blueprint list panel |
| Surfaces | `blueprint-by-location-panel` (`setVariant` in `ngOnInit`); `NeoComVariant` enum |
| Found on | Blueprint Availability / blueprint-by-location list page |
| Branch tip | `neocom-front` `feature/industry-blueprints` |
| L1 | [`10.EPIC-INDUSTRY-BLUEPRINTS.md`](../sources/L1/10.EPIC-INDUSTRY-BLUEPRINTS.md) — TBD requirement id for panel variant `-BLUEPRINT-LIST-` |

### Observed

`blueprint-by-location-panel` sets its panel variant to `NeoComVariant.SOLAR_SYSTEM_LOOKUP` (`-SOLAR-SYSTEM-LOOKUP-`) in `ngOnInit`:

```40:41:neocom-front/src/app/modules/industry/manufacture/panels/blueprint-by-location-panel/blueprint-by-location-panel.component.ts
    this.setVariant(NeoComVariant.SOLAR_SYSTEM_LOOKUP);
    this.startDownloading();
```

That variant is **deprecated** for the blueprint list page. `NeoComVariant` currently has no `-BLUEPRINT-LIST-` constant.

### Expected

For the **blueprint list** page / `blueprint-by-location-panel`, the panel variant SHALL be `-BLUEPRINT-LIST-` (register a matching `NeoComVariant` constant and use it in `setVariant`). Do **not** use `SOLAR_SYSTEM_LOOKUP` / `-SOLAR-SYSTEM-LOOKUP-` for this panel.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`10.EPIC-INDUSTRY-BLUEPRINTS.md`](../sources/L1/10.EPIC-INDUSTRY-BLUEPRINTS.md) | Register panel variant `-BLUEPRINT-LIST-` for the blueprint list / by-location host |
| L2 | industry / FRONT blueprint panel notes (after extract) | Only if L1 is extracted |
| OpenSpec | `front-industry-blueprints` | Delta: panel variant `-BLUEPRINT-LIST-` |
| Code | `NeoComVariant.ts`; `blueprint-by-location-panel.component.ts` | Add enum member; replace `setVariant(NeoComVariant.SOLAR_SYSTEM_LOOKUP)` |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and applies the flow through OpenSpec
- [ ] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

`-SOLAR-SYSTEM-LOOKUP-` remains appropriate for region/system lookup cards/renders; this defect is scoped to the **blueprint list panel** host variant only.

Broader panel processing (models / helper classes) does **not** fit the expected design: that implementation returns to the design table under new epic [`11.EPIC-BLUEPRINT-LIST-PROCESSING.md`](../sources/L1/11.EPIC-BLUEPRINT-LIST-PROCESSING.md) (EPIC-011), which may deprecate some current applied industry specs.

2026-11-05 `/fix:defect`: added `NeoComVariant.BLUEPRINT_LIST` (`-BLUEPRINT-LIST-`); `blueprint-by-location-panel` uses it. Status applying — validate then `/defect:fixed`.

---
