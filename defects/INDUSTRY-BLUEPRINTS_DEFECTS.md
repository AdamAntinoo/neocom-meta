# Defects — `feature/industry-blueprints` (and stacked shell)

Register of defects found while validating the current front implementation on `feature/industry-blueprints` (stacked on `feature/dashboard-shell`). This file is the **intake log** only until a defect is promoted into the OpenSpec / epic flow.

Related OpenSpec (applying): [`front-industry-blueprints`](../openspec/changes/front-industry-blueprints/), [`front-dashboard-shell`](../openspec/changes/front-dashboard-shell/).  
Related epics: [EPIC-010](../sources/L1/10.EPIC-INDUSTRY-BLUEPRINTS.md), [EPIC-006](../sources/L1/06.EPIC-USER-INTERFACE.md) (header / character selection chrome).

## Contents

- [Register](#register)
- [DEF-IB-007 — Pilot panel render vs model-strip + missing private data](#def-ib-007-pilot-panel-render-vs-model-strip-missing-private-data)
- [DEF-IB-010 — Blueprint list panel uses deprecated `SOLAR_SYSTEM_LOOKUP` variant](#def-ib-010-blueprint-list-panel-uses-deprecated-solar-system-lookup-variant)

## How defects resolve (intended programme flow)

Use `/defect` (`neocom-defect`) to append new entries on this page (`<branch-stem>_DEFECTS.md`). Use `/fix:defect` (optional `DEF-…` id) to implement marked / named defects. Treat each accepted defect as follows:

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
| DEF-IB-007 | Pilot panel ≠ model-strip; private data missing when authenticated | `applying` | EPIC-004 · PublicPilotV1 / PilotV2 · EPIC-006 UI-DASH pilot row | TBD — `front-pilot` / `front-dashboard-shell` + back pilot DTO | 2026-11-03 |
| DEF-IB-010 | Blueprint list panel uses deprecated `SOLAR_SYSTEM_LOOKUP`; need `-BLUEPRINT-LIST-` | `applying` | EPIC-010 · blueprint-by-location panel variant | TBD — `front-industry-blueprints` + `NeoComVariant` | 2026-11-04 |

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
    this.startDownloading;
```

That variant is **deprecated** for the blueprint list page. `NeoComVariant` currently has no `-BLUEPRINT-LIST-` constant.

### Expected

For the **blueprint list** page / `blueprint-by-location-panel`, the panel variant SHALL be `-BLUEPRINT-LIST-` (register a matching `NeoComVariant` constant and use it in `setVariant`). Do **not** use `SOLAR_SYSTEM_LOOKUP` / `-SOLAR-SYSTEM-LOOKUP-` for this panel.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`10.EPIC-INDUSTRY-BLUEPRINTS.md`](../sources/L1/10.EPIC-INDUSTRY-BLUEPRINTS.md) | Register panel variant `-BLUEPRINT-LIST-` for the blueprint list / by-location host |
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

Expand-toggle alignment defect moved to [`UI-DEFECTS.md`](./UI-DEFECTS.md) **DEF-UI-001** (was DEF-IB-011 / DEF-BLP-016).

---
