# Defects — UI (cross-feature)

Register of **UI / presentation** defects that are not tied to a single product feature branch page. Use this file for shared chrome, renders, and layout issues (EPIC-006 and related Appearances). Feature-specific pages remain under `*_DEFECTS.md`.

Related OpenSpec: _(fill when known)_.  
Related epics: [EPIC-006](../sources/L1/06.EPIC-USER-INTERFACE.md).

## Contents

- [Register](#register)
- [DEF-UI-001 — Expand toggle on the right so non-expandable rows stay aligned](#def-ui-001-expand-toggle-on-the-right-so-non-expandable-rows-stay-aligned)
- [DEF-UI-002 — Corporation panel: single flex row 3·2·1 with double column gap](#def-ui-002-corporation-panel-single-flex-row-3-2-1-with-double-column-gap)

## How defects resolve (intended programme flow)

1. **Record here** — `/defect` targeting this page (or move from a feature register); status `open` (or `prep`).
2. **Register the spec on the epic** — author or amend the L1 requirement on the owning epic. **Checking this checklist item assumes Review is accepted** → set the L1 cell to **`[x] reviewed`**. Prefer **not** inventing behaviour beyond what the defect states.
3. **Mark to run the process** (developer, manual) — authorizes `/fix:defect` (Review is already `[x] reviewed` from step 2 when that item is checked).
4. **`/fix:defect`** — list defects + actions; wait for go-ahead; then implement Expected. Status `applying`. No commit.
5. **Developer validates** the product fix — then **`/defect:fixed DEF-…`** moves the defect to [`FIXED-DEFECTS.md`](./FIXED-DEFECTS.md) and removes it from this page.

Statuses: `open` · `prep` · `in openspec` · `applying` · `fixed` · `closed` · `wontfix`.

---

## Register

| ID | Title | Status | Owning epic / capability | OpenSpec (when known) | Found |
| --- | --- | --- | --- | --- | --- |
| DEF-UI-001 | Expand toggle on the right so non-expandable rows stay aligned | `open` | EPIC-006 · `v2-node-container` | TBD — front domain-node / hierarchy row | 2026-11-06 |
| DEF-UI-002 | Corporation panel: single flex row 3·2·1 with double column gap | `in openspec` | EPIC-006 · UI-CORP-014 | `front-dashboard-shell` | 2026-11-05 |

---

## DEF-UI-001 — Expand toggle on the right so non-expandable rows stay aligned

| Field | Value |
| --- | --- |
| Status | `open` |
| Severity | `TBD` |
| Surfaces | `v2-node-container` hierarchy rows (expandable Region/System vs non-expandable Blueprint leaves) |
| Found on | Visual misalignment in blueprint-by-location list: expandable rows indented vs leaf rows |
| Branch tip | `neocom-front` `develop` (register: `UI-DEFECTS.md`) |
| L1 | TBD — EPIC-006 domain-node container / expand chrome (related prior: DEF-BLP-014) |

### Observed

When a hierarchy node is **expandable**, `v2-node-container` places the **expand button outside** the `neocom-panel` (sibling **before** `.node-body` / outlet). Non-expandable rows have no button, so their content starts further left. The list looks **indented inconsistently** between expandable and non-expandable rows — visually disturbing. The toggle also sits **outside** the panel chrome rather than inside the render panel.

### Expected

1. For expandable nodes, the **expand / collapse button SHALL sit on the right**, **inside** the row’s **`neocom-panel`** (the panel that hosts the render), not as a sibling outside that panel.
2. Expandable and non-expandable rows SHALL keep **left-aligned** node content (no left gutter reserved only for expandable rows).
3. Non-expandable rows SHALL not show an expand control (unchanged).
4. Prefer **reusing** the existing expand-toggle markup / styles in `v2-node-container` (move the control into `.neocom-panel.node-body` trailing the outlet) rather than copying the button HTML into each expandable render (`v1-region-render`, `v1-system-render`, …).

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | TBD — EPIC-006 | `v2-node-container` expand chrome: inside panel, trailing |
| OpenSpec | TBD — `front-domain-nodes` / hierarchy UI | Expand toggle inside `neocom-panel` |
| Code | `neocom-front` `v2-node-container` (HTML/SCSS) | Move existing `@if (isExpandable)` button **into** `.neocom-panel.node-body` after the outlet; make that panel a horizontal `row` so content + toggle share the panel |

### Code review (reuse)

Current structure (`v2-node-container.component.html`):

```text
.node-row
├── button.expand-toggle          ← outside panel (left)
└── .neocom-panel.node-body
      └── *ngComponentOutlet      ← region/system/blueprint render
```

Region / system renders paint an inner colour card (`panel-yellow` / `panel-orange`); they do **not** own the expand control. Corporation / app-info owns its own `neocom-panel` for other hosts — not the hierarchy path.

**Reuse recommendation:** keep one toggle in the container; target layout:

```text
.node-row
└── .neocom-panel.node-body.row
      ├── outlet (render)
      └── button.expand-toggle    ← inside panel, right (only if expandable)
```

Do **not** duplicate the arrow button into each `v*-render` unless a later Appearance requires per-render chrome; shared container HTML is enough.

### Prep for resolution (checklist)

- [ ] Register the spec on the owning epic (L1 requirement row; selecting this assumes Review accepted → `[x] reviewed`)
- [ ] Mark to run the process — authorizes `/fix:defect`
- [ ] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Was **DEF-BLP-016** → briefly **DEF-IB-011** → **DEF-UI-001**. Follow-on to DEF-BLP-014 (toggle size / body fill): placement is **inside panel + trailing right** for alignment and chrome.
---

## DEF-UI-002 — Corporation panel: single flex row 3·2·1 with double column gap

| Field | Value |
| --- | --- |
| Status | `in openspec` |
| Severity | `TBD` |
| Surfaces | `v1-corporation-panel` (corporation panel content lines / columns) |
| Found on | Dashboard corporation panel layout height / column arrangement |
| Branch tip | `neocom-front` `feature/blueprint-list-processing` `@ 8030666` (register: `UI-DEFECTS.md`) |
| L1 | EPIC-006 **UI-CORP-014** `registered` → `front-dashboard-shell` |

### Observed

The corporation panel lays out its content across **multiple lines** (lines **1**, **2**, and **3** stacked), which makes the panel taller than needed. Lines **2** and **3** are separate; the three content lines are not on one compact flex row in the desired order.

### Expected

1. Integrate **lines 2 and 3** into a **single line** so the panel **height is reduced**.
2. Integrate **lines 1, 2, and 3** onto a **single flex row** in content order **3 → 2 → 1** (left to right).
3. Column separation on that row SHALL be **double** the common / predefined gap used between columns elsewhere in the panel chrome (2× the usual column gap).

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | TBD — EPIC-006 / UI dashboard | Corporation panel Appearance layout |
| OpenSpec | TBD — `front-dashboard-shell` / corporation panel | Flex row 3·2·1; 2× gap; shorter height |
| Code | `neocom-front` `v1-corporation-panel` (template / styles) | Merge lines; flex order 3 2 1; gap |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and authorizes `/fix:defect`
- [ ] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Was **DEF-BLP-004** on `BLUEPRINT-LIST-PROCESSING_DEFECTS.md`.

Stacked tip still carries dashboard-shell / industry-blueprints UI; originally logged on `feature/blueprint-list-processing`.

`/fix:defect` 2026-11-05: `v1-corporation-render` main line is flex order tax → members → name/ticker with `gap: 2× $panel-padding`.

`/epic:extract` 2026-11-06: UI-CORP-014 → `front-dashboard-shell` (1 apply task open).

---
