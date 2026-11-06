# Defects — `feature/blueprint-list-processing`

Register of defects found while validating the current implementation on `feature/blueprint-list-processing` (primarily `neocom-back`). This file is the **intake log** only until a defect is promoted into the OpenSpec / epic flow.

Related OpenSpec (applying): [`back-blueprint-list-processing`](../openspec/changes/back-blueprint-list-processing/), [`front-blueprint-list-processing`](../openspec/changes/front-blueprint-list-processing/) (registered).  
Related epics: [EPIC-011](../sources/L1/11.EPIC-BLUEPRINT-LIST-PROCESSING.md), [EPIC-008](../sources/L1/08.EPIC-LOCATIONS.md) (spacelocation / catalog), [EPIC-006](../sources/L1/06.EPIC-USER-INTERFACE.md) (domain-node / render naming norms).

## Contents

- [Register](#register)
- [DEF-BLP-002 — CI/CD front build cannot resolve neocom-domain](#def-blp-002-ci-cd-front-build-cannot-resolve-neocom-domain)
- [DEF-BLP-004 — Corporation panel: single flex row 3·2·1 with double column gap](#def-blp-004-corporation-panel-single-flex-row-3-2-1-with-double-column-gap)

## How defects resolve (intended programme flow)

1. **Record here** — `/defect`; status `open` (or `prep`).
2. **Register the spec on the epic** — author or amend the L1 requirement; **selecting this assumes Review accepted** → `[x] reviewed`. Prefer **not** inventing behaviour beyond what the defect states.
3. **Mark to run the process** (developer, manual) — authorizes `/fix:defect`.
4. `/fix:defect` — list defects + actions; wait for go-ahead; then implement Expected. Status `applying`. No commit.
5. **Developer validates** the product fix — then `/defect:fixed DEF-…` moves the defect (same row + section) to [`FIXED-DEFECTS.md`](./FIXED-DEFECTS.md) and removes it from this page.

Statuses: `open` · `prep` · `in openspec` · `applying` · `fixed` · `closed` · `wontfix`.

---

## Register

| ID | Title | Status | Owning epic / capability | OpenSpec (when known) | Found |
| --- | --- | --- | --- | --- | --- |
| DEF-BLP-002 | CI/CD front build cannot resolve neocom-domain | `open` | Front CI/CD · `neocom-domain` dependency | TBD — front / cicd package install | 2026-11-05 |
| DEF-BLP-004 | Corporation panel: single flex row 3·2·1 with double column gap | `in openspec` | EPIC-006 · UI-CORP-014 | `front-dashboard-shell` | 2026-11-05 |

---

## DEF-BLP-002 — CI/CD front build cannot resolve neocom-domain

| Field | Value |
| --- | --- |
| Status | `open` |
| Severity | `TBD` |
| Surfaces | Front CI/CD application bundle generation; `neocom-front` / `neocom-back` `package.json` `neocom-domain` dep; `application-info.provider.ts` (`import { ApplicationInfoV1 } from 'neocom-domain'`); `/git:pr` domain → npm publish flow |
| Found on | CI run `2026-11-05T08:38:11.968Z` — Application bundle generation failed (2.266s) with esbuild resolve error |
| Branch tip | `neocom-front` `feature/blueprint-list-processing` `@ 8030666` |
| L1 | TBD — consumers use published npm `neocom-domain`; domain PR publishes to npm |

### Observed

Front CI/CD **Application bundle generation failed**:

```text
✘ [ERROR] Could not resolve "neocom-domain"

    src/app/modules/header/providers/application-info.provider.ts:2:34:
      2 │ import { ApplicationInfoV1 } from 'neocom-domain';
```

Root cause: dependents pin `neocom-domain` as `**file:../neocom-domain**` (local checkout / `dist`), which is **not present in CI**. Domain change rate is low; the temporary local-file link broke the published-npm consumption path.

### Expected

1. `**neocom-front` / `neocom-back**` SHALL depend on `**neocom-domain` from the npm registry** (semver range / pinned published version), not a local `file:../neocom-domain` path, so CI can resolve the package without a sibling clone/`dist`.
2. `neocom-domain` **SHALL publish to npm** with an incremental version (npm-led: patch after commit, minor on PR→develop, major on PR→main; GitHub `npm-publish.yml` on push). Consumers install from the registry, not a local `file:` link.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | TBD | Domain published on npm; apps consume registry package |
| OpenSpec | TBD — `cicd-*` / domain packaging | CI installs registry `neocom-domain` |
| Harness | `.dsh/agents/neocom-git.md`, `.dsh/skills/git-pr/SKILL.md`; domain `.github/workflows/npm-publish.yml` | npm-led publish on push; PR open bumps minor/major |
| Code | `neocom-front` / `neocom-back` `package.json` (+ lockfiles) | Replace `file:../neocom-domain` with published npm version |

### Prep for resolution (checklist)

- [ ] Register the spec on the owning epic (L1 requirement row; Review starts `[ ] to review`)
- [ ] Mark to run the process — sets Review to `[x] reviewed` and authorizes `/fix:defect`
- [ ] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Local builds can still succeed with `file:` + a sibling `neocom-domain` `dist`; CI cannot. Prefer npm publish after domain PRs given low domain churn.

---

## DEF-BLP-004 — Corporation panel: single flex row 3·2·1 with double column gap

| Field | Value |
| --- | --- |
| Status | `in openspec` |
| Severity | `TBD` |
| Surfaces | `v1-corporation-panel` (corporation panel content lines / columns) |
| Found on | Dashboard corporation panel layout height / column arrangement |
| Branch tip | `neocom-front` `feature/blueprint-list-processing` `@ 8030666` |
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

Stacked tip still carries dashboard-shell / industry-blueprints UI; defect logged on current `feature/blueprint-list-processing` page.

`/fix:defect` 2026-11-05: `v1-corporation-render` main line is flex order tax → members → name/ticker with `gap: 2× $panel-padding`.

`/epic:extract` 2026-11-06: UI-CORP-014 → `front-dashboard-shell` (1 apply task open).

---

