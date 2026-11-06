# Defects — `feature/blueprint-list-processing`

Register of defects found while validating the current implementation on `feature/blueprint-list-processing` (primarily `neocom-back`). This file is the **intake log** only until a defect is promoted into the OpenSpec / epic flow.

Related OpenSpec (applying): [`back-blueprint-list-processing`](../openspec/changes/back-blueprint-list-processing/), [`front-blueprint-list-processing`](../openspec/changes/front-blueprint-list-processing/) (registered).  
Related epics: [EPIC-011](../sources/L1/11.EPIC-BLUEPRINT-LIST-PROCESSING.md), [EPIC-008](../sources/L1/08.EPIC-LOCATIONS.md) (spacelocation / catalog), [EPIC-006](../sources/L1/06.EPIC-USER-INTERFACE.md) (domain-node / render naming norms).

## Contents

- [Register](#register)
- [DEF-BLP-002 — CI/CD front build cannot resolve neocom-domain](#def-blp-002--cicd-front-build-cannot-resolve-neocom-domain)
- [DEF-BLP-003 — Park front SSE; load blueprints from back HTTP endpoints](#def-blp-003--park-front-sse-load-blueprints-from-back-http-endpoints)
- [DEF-BLP-004 — Corporation panel: single flex row 3·2·1 with double column gap](#def-blp-004--corporation-panel-single-flex-row-321-with-double-column-gap)
- [DEF-BLP-005 — Row/section gap uses](#def-blp-005--rowsection-gap-uses-section-padding--panel-padding) `$section-padding` [(=](#def-blp-005--rowsection-gap-uses-section-padding--panel-padding) `$panel-padding`[)](#def-blp-005--rowsection-gap-uses-section-padding--panel-padding)
- [DEF-BLP-007 — Aggregate invents LookupRegion/System nodes instead of Region/SolarSystem domain nodes](#def-blp-007--aggregate-invents-lookupregionsystem-nodes-instead-of-regionsolarsystem-domain-nodes)
- [DEF-BLP-008 — RegionLookupNode jsonClass](#def-blp-008--regionlookupnode-jsonclass-lookupregion-is-not-the-domainrender-identity) `LookupRegion` [is not the domain/render identity](#def-blp-008--regionlookupnode-jsonclass-lookupregion-is-not-the-domainrender-identity)
- [DEF-BLP-009 — Front domain node file naming, module location, and](#def-blp-009--front-domain-node-file-naming-module-location-and-domain-path-alias) `@domain` [path alias](#def-blp-009--front-domain-node-file-naming-module-location-and-domain-path-alias)
- [DEF-BLP-010 — Overlapping Blueprint front domain types (NodeV1 / V1Node / ProcessedBlueprint)](#def-blp-010--overlapping-blueprint-front-domain-types-nodev1--v1node--processedblueprint)
- [DEF-BLP-011 — Render registration name SHALL equal the domain node](#def-blp-011--render-registration-name-shall-equal-the-domain-node-jsonclass) `jsonClass`
- [DEF-BLP-012 — Hierarchy uses NeoCom children on domain Region/SolarSystem; no Lookup or Listing subclass](#def-blp-012--hierarchy-uses-neocom-children-on-domain-regionsolarsystem-no-lookup-or-listing-subclass)
- [DEF-BLP-013 — Published](#def-blp-013--published-blueprintv1-neocom-domain-is-redundant-for-front-nodes-use-blueprintv1dtowire) `BlueprintV1` [(neocom-domain) is redundant for front nodes; use](#def-blp-013--published-blueprintv1-neocom-domain-is-redundant-for-front-nodes-use-blueprintv1dtowire) `BlueprintV1DtoWire`
- [DEF-BLP-014 — v2-node-container expand toggle size/centering; node body fills row](#def-blp-014--v2-node-container-expand-toggle-sizecentering-node-body-fills-row)

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
| DEF-BLP-003 | Park front SSE; load blueprints from back HTTP endpoints | `in openspec` | EPIC-011 §01 interim · BLP-031…034 | `front-blueprint-list-processing` (BLP-031…034 registered) | 2026-11-05 |
| DEF-BLP-004 | Corporation panel: single flex row 3·2·1 with double column gap | `in openspec` | EPIC-006 · UI-CORP-014 | `front-dashboard-shell` | 2026-11-05 |
| DEF-BLP-005 | Row/section gap uses `$section-padding` (= `$panel-padding`) | `in openspec` | EPIC-006 · UI-GEO-002 | `front-dashboard-shell` | 2026-11-05 |
| DEF-BLP-007 | Aggregate invents LookupRegion/System nodes instead of Region/SolarSystem domain nodes | `in openspec` | EPIC-006 · UI-DOM-004 | `front-domain-nodes` | 2026-11-05 |
| DEF-BLP-008 | RegionLookupNode jsonClass `LookupRegion` is not the domain/render identity | `in openspec` | EPIC-006 · UI-DOM-003 / 004 | `front-domain-nodes` | 2026-11-05 |
| DEF-BLP-009 | Front domain node file naming, module location, and `@domain` path alias | `in openspec` | EPIC-006 · UI-DOM-001…002 | `front-domain-nodes` | 2026-11-05 |
| DEF-BLP-010 | Overlapping Blueprint front domain types (NodeV1 / V1Node / ProcessedBlueprint) | `in openspec` | EPIC-006 · UI-DOM-001 / 005 | `front-domain-nodes` | 2026-11-05 |
| DEF-BLP-011 | Render registration name SHALL equal the domain node `jsonClass` | `in openspec` | EPIC-006 · UI-DOM-003 | `front-domain-nodes` | 2026-11-05 |
| DEF-BLP-012 | Hierarchy uses NeoCom children on domain Region/SolarSystem; no Lookup or Listing subclass | `in openspec` | EPIC-006 · UI-DOM-004 | `front-domain-nodes` | 2026-11-05 |
| DEF-BLP-013 | Published `BlueprintV1` (neocom-domain) is redundant for front nodes; use `BlueprintV1DtoWire` | `in openspec` | EPIC-006 · UI-DOM-005 | `front-domain-nodes` | 2026-11-05 |
| DEF-BLP-014 | v2-node-container expand toggle size/centering; node body fills row | `applying` | EPIC-006 · domain-node container | TBD — `front-domain-nodes` / UI render | 2026-11-06 |

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

## DEF-BLP-003 — Park front SSE; load blueprints from back HTTP endpoints

| Field      | Value                                                                                                                                           |
| ---------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| Status     | `in openspec`                                                                                                                                   |
| Severity   | `HIGH`                                                                                                                                          |
| Surfaces   | Front SSE / async client used by blueprint list processing; `PilotBlueprintProviderService` (or equivalent); blueprint-by-location UI data path |
| Found on   | Validation: SSE is not operative; product decision to move SSE to a proof of concept before project integration                                 |
| Branch tip | `neocom-front` `feature/blueprint-list-processing` `@ 8030666`                                                                                  |
| L1         | [`11.EPIC-BLUEPRINT-LIST-PROCESSING.md`](../sources/L1/11.EPIC-BLUEPRINT-LIST-PROCESSING.md) §01 interim — **BLP-031…033** (+ **BLP-034** §04) `registered` → `front-blueprint-list-processing` |

### Observed

Front **SSE is not operative**. Blueprint list processing still depends on (or is wired toward) the front SSE implementation, which is not ready for project integration. SSE work is to move to a **proof of concept** before it is integrated again.

### Expected

1. **Park** all front implementations related to the **SSE** path used for blueprints (disable / isolate / stop calling them in the product feature path — do not keep them as the live data source).
2. Blueprint list processing SHALL **load blueprints from the current back HTTP endpoints** (existing REST/API surfaces), not from the front SSE stream, until an SSE PoC is accepted and re-integrated.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`11.EPIC-BLUEPRINT-LIST-PROCESSING.md`](../sources/L1/11.EPIC-BLUEPRINT-LIST-PROCESSING.md) §01 / §04 | **BLP-031…034** `[ ] to review`; BLP-002 / BLP-010 / BLP-021 / BLP-023 → `superseded` |
| OpenSpec | `front-blueprint-list-processing`; related `front-async-sse` / back SSE | Amend front BLP to HTTP-only; park SSE wiring |
| Code | Front provider / SSE clients under blueprint list + industry blueprints UI | Use back blueprint list endpoint; park SSE listeners/providers |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`) — EPIC-011 **BLP-031…034**
- [x] Mark to run the process — sets Review to `[x] reviewed` and authorizes `/fix:defect`
- [ ] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

SSE remains a future PoC; product BLP path resorts to current back endpoints for blueprints until that PoC is integrated. Owning L1 is **EPIC-011**.

`/fix:defect` 2026-11-05: parked SSE in `PilotBlueprintProviderService` + `available-blueprints-panel`; HTTP `GET /v1/pilots/:id/blueprints` only.

`/epic:extract` 2026-11-06: BLP-031…034 → `registered` in `front-blueprint-list-processing` (3 apply tasks open).

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

## DEF-BLP-005 — Row/section gap uses `$section-padding` (= `$panel-padding`)

| Field | Value |
| --- | --- |
| Status | `in openspec` |
| Severity | `TBD` |
| Surfaces | Dashboard / page geometry gaps between **rows** and **sections**; tokens `$section-padding`, `$panel-padding` (`_tokens.scss`, `geometry.scss`, page SCSS e.g. `dashboard-home-page`) |
| Found on | Dashboard layout spacing — row/section gaps not tied to the panel padding token |
| Branch tip | `neocom-front` `feature/blueprint-list-processing` `@ 8030666` |
| L1 | EPIC-006 **UI-GEO-002** `registered` → `front-dashboard-shell` |

### Observed

Gaps between **rows** or **sections** do not consistently use the default `$section-padding` token, and that spacing is not aligned to `$panel-padding`. Geometry currently often uses `gap: 0` or ad-hoc values (e.g. `$panel-margin` on local rows) instead of a single section-padding default equal to panel padding.

### Expected

1. The gap between **rows** or **sections** SHALL be the **default value of** `$section-padding`.
2. That `$section-padding` default SHALL be the **same value as** `$panel-padding` (section padding equals panel padding).

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | TBD — EPIC-006 / UI geometry | Section/row gap = `$section-padding` = `$panel-padding` |
| OpenSpec | TBD — `front-dashboard-shell` / geometry | Token + geometry defaults |
| Code | `src/styles/_tokens.scss`; `geometry.scss`; page/panel SCSS using row/section gaps | Introduce/align `$section-padding`; apply as row/section `gap` |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and authorizes `/fix:defect`
- [ ] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Related to dashboard spacing next to DEF-BLP-004; `$panel-padding` is currently `2px` in `_tokens.scss`.

`/fix:defect` 2026-11-05: added `$section-padding: $panel-padding`; geometry `.neo-page` / `.section` / `.row` / `.column` use it; dashboard pilot row uses `$section-padding`.

`/epic:extract` 2026-11-06: UI-GEO-002 → `front-dashboard-shell` (1 apply task open).

---

## DEF-BLP-007 — Aggregate invents LookupRegion/System nodes instead of Region/SolarSystem domain nodes

| Field | Value |
| --- | --- |
| Status | `in openspec` |
| Severity | `TBD` |
| Surfaces | `BlueprintLocationAggregate`; `RegionLookupNode`; `SystemLookupNode`; blueprint-by-location hierarchy; missing `Region` / `SolarSystem` v1 domain nodes |
| Found on | Validating provider → aggregate → panel: HTTP returns domain-shaped blueprints, aggregate synthesises parallel “Lookup*” types |
| Branch tip | `neocom-front` `feature/blueprint-list-processing` |
| L1 | EPIC-006 **UI-DOM-004** (+ peers) `registered` → [`front-domain-nodes`](../openspec/changes/front-domain-nodes/) |

### Observed

`PilotBlueprintProviderService` correctly maps endpoint DTOs via wire types (e.g. `BlueprintV1DtoWire`) into front domain nodes such as `BlueprintNodeV1` / space location. That DTO→domain step is accepted.

`BlueprintLocationAggregate` then **invents hierarchy containers** `RegionLookupNode` and `SystemLookupNode` instead of using proper versioned domain nodes for **Region** and **SolarSystem** (e.g. `Region` v1 / `SolarSystem` v1). There is **no** matching `Region` domain node in the expected naming; the aggregate therefore diverges from the domain model the provider already uses.

### Expected

1. Hierarchy aggregation SHALL compose **real domain nodes** for Region and SolarSystem (versioned), not ad-hoc Lookup* stand-ins.
2. Those types SHALL follow the same front domain-node convention as Blueprint (DEF-BLP-009 / DEF-BLP-011).
3. `RegionLookupNode` / `SystemLookupNode` SHALL be removed or superseded once the proper domain nodes exist.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md); [`11.EPIC-BLUEPRINT-LIST-PROCESSING.md`](../sources/L1/11.EPIC-BLUEPRINT-LIST-PROCESSING.md) | Norm + hierarchy uses domain Region / SolarSystem nodes |
| OpenSpec | TBD — `front-blueprint-list-processing` | Aggregate + node types |
| Code | `blueprint-location-aggregate.ts`; `region-lookup.node.ts`; `system-lookup.node.ts`; renders consuming Lookup* | Replace with `region-v1.node.ts` / `solar-system-v1.node.ts` (names per DEF-BLP-009) |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and authorizes `/fix:defect`
- [ ] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

`/fix:defect` 2026-11-05: domain RegionV1/SolarSystemV1 + NeoCom children aggregate; single BlueprintV1Node + BlueprintV1DtoWire; render keys = jsonClass; Lookup* / npm BlueprintV1 wrapper removed.

`/epic:extract` 2026-11-06: UI-DOM-001…005 → `front-domain-nodes` (alias `@domain`).

DTO wire mapping (`*DtoWire` → domain node) remains valid; only the aggregate’s invented hierarchy types are in scope here. Sharpened by [DEF-BLP-012](#def-blp-012--hierarchy-uses-neocom-children-on-domain-regionsolarsystem-no-lookup-or-listing-subclass): no Listing subclass either — use `NeoCom` children on domain Region / SolarSystem.

---

## DEF-BLP-008 — RegionLookupNode jsonClass `LookupRegion` is not the domain/render identity

| Field | Value |
| --- | --- |
| Status | `in openspec` |
| Severity | `TBD` |
| Surfaces | `region-lookup.node.ts` (`jsonClass = 'LookupRegion'`); likewise `system-lookup.node.ts` (`LookupSolarSystem`); render registry resolution |
| Found on | Inspecting `RegionLookupNode` constructor registration vs domain/render naming norm |
| Branch tip | `neocom-front` `feature/blueprint-list-processing` |
| L1 | EPIC-006 **UI-DOM-003 / 004** `registered` → [`front-domain-nodes`](../openspec/changes/front-domain-nodes/) |

### Observed

`RegionLookupNode` registers `jsonClass = 'LookupRegion'` (legacy infinity name). That is **not** the correct identity for a Region domain object. The same pattern appears on `SystemLookupNode` (`LookupSolarSystem`). Render lookup then cannot match the domain class that should represent Region / SolarSystem.

### Expected

1. The domain node that represents Region (and SolarSystem) SHALL set `jsonClass` to that type’s correct domain identity (per DEF-BLP-007 / DEF-BLP-009), **not** `LookupRegion` / `LookupSolarSystem`.
2. Render registration for that node SHALL use **exactly the same string** as that class’s `jsonClass` (DEF-BLP-011).
3. Legacy `LookupRegion` / `LookupSolarSystem` SHALL NOT remain the registered identity for new hierarchy work.
4. The norm SHALL be authored on [EPIC-006](../sources/L1/06.EPIC-USER-INTERFACE.md) (Review gate) before `/fix:defect` applies code.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) | Author jsonClass = render registration identity |
| OpenSpec | TBD | |
| Code | successor Region / SolarSystem domain nodes; `render-registry.ts` / region-system renders | Drop Lookup*; `registerRender(node.jsonClass, …)` |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and authorizes `/fix:defect`
- [ ] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

`/fix:defect` 2026-11-05: domain RegionV1/SolarSystemV1 + NeoCom children aggregate; single BlueprintV1Node + BlueprintV1DtoWire; render keys = jsonClass; `-domain-` alias; Lookup* / npm BlueprintV1 wrapper removed.

Pairs with DEF-BLP-007 (replace Lookup* types) and DEF-BLP-011 (render name ≡ `jsonClass`).

---

## DEF-BLP-009 — Front domain node file naming, module location, and `@domain` path alias

| Field | Value |
| --- | --- |
| Status | `in openspec` |
| Severity | `TBD` |
| Surfaces | `innovative-core/domain/nodes/*`; industry `domain/`; `tsconfig` / Angular path aliases; imports across front |
| Found on | Comparing `blueprint-v1.node.ts`, `blueprint-node-v1.ts`, `region-lookup.node.ts`, pilot/corporation nodes |
| Branch tip | `neocom-front` `feature/blueprint-list-processing` |
| L1 | EPIC-006 **UI-DOM-001 / 002** `registered` → [`front-domain-nodes`](../openspec/changes/front-domain-nodes/) |

### Observed

Front domain NeoCom classes that represent domain objects are **inconsistently named and placed**:

- File names mix `blueprint-v1.node.ts`, `blueprint-node-v1.ts`, `region-lookup.node.ts`, etc.
- Class names mix `BlueprintV1Node`, `BlueprintNodeV1`, `RegionLookupNode`, `SpaceLocationNodeV1`.
- There was **no** Angular / TypeScript path alias for importing these nodes (now `@domain` per UI-DOM-002).

### Expected

1. Norms SHALL be recorded on [EPIC-006](../sources/L1/06.EPIC-USER-INTERFACE.md).
2. A front domain NeoCom class that represents a domain object SHALL use file name `<object>-v<n>.node.ts` (object lower-case/kebab; version `v1`, `v2`, …) — example: Blueprint → `blueprint-v1.node.ts`.
3. Those classes SHALL live under a module folder named `domain` (not required to re-export every type from a barrel for consumers).
4. Angular / TS config SHALL register a **path alias** whose name is `@domain` pointing at that domain roots so imports do not use deep relative paths.
5. The same convention SHALL apply to all current domain objects in use (at least Blueprint, Pilot, Corporation, Region, SolarSystem, SpaceLocation, and peers already under `domain/nodes`).

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) | Author file/class/alias norms |
| OpenSpec | TBD | |
| Code | `tsconfig*.json` / `angular.json` paths; rename/move node files; update imports | Alias `@domain`; rename to `*-vN.node.ts` |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and authorizes `/fix:defect`
- [ ] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

`/fix:defect` 2026-11-05: domain RegionV1/SolarSystemV1 + NeoCom children aggregate; single BlueprintV1Node + BlueprintV1DtoWire; render keys = jsonClass; Lookup* / npm BlueprintV1 wrapper removed.

`/epic:extract` 2026-11-06: UI-DOM-001…002 → `front-domain-nodes` with alias `@domain`.

`neocom-domain` npm package (published Record types) stays separate from these front NeoCom node wrappers; this defect is front NeoCom layout/naming only.

---

## DEF-BLP-010 — Overlapping Blueprint front domain types (NodeV1 / V1Node / ProcessedBlueprint)

| Field | Value |
| --- | --- |
| Status | `in openspec` |
| Severity | `TBD` |
| Surfaces | `BlueprintNodeV1`; `BlueprintV1Node`; `ProcessedBlueprint`; `BlueprintV1DtoWire`; aggregate `toBlueprintV1Node`; available-blueprints vs by-location panels |
| Found on | Tracing provider → aggregate → renders: multiple Blueprint-shaped types with different names/features |
| Branch tip | `neocom-front` `feature/blueprint-list-processing` |
| L1 | EPIC-006 **UI-DOM-001 / 005** `registered` → [`front-domain-nodes`](../openspec/changes/front-domain-nodes/) |

### Observed

Too many similar Blueprint front types coexist and **do not match in names or features**:

- Provider / HTTP path uses `BlueprintNodeV1` (+ accepted `BlueprintV1DtoWire` mapping).
- Aggregate adapts again into `BlueprintV1Node` for leaves / existing render path.
- Manufacture list still has `ProcessedBlueprint` as another list node shape.

That duplication causes mismatched features and unclear which type is the canonical front domain Blueprint node.

### Expected

1. One canonical front domain Blueprint node SHALL exist per the DEF-BLP-009 file/class rule (`blueprint-v1.node.ts`).
2. `BlueprintV1DtoWire` (or equivalent) MAY remain as the DTO→domain mapper only — that role is accepted.
3. Aggregate, panels, and renders SHALL consume that single Blueprint domain node; redundant `BlueprintNodeV1` / `BlueprintV1Node` / `ProcessedBlueprint` overlaps SHALL be removed or reduced to thin aliases only during migration.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | EPIC-006; EPIC-011 | Single Blueprint front node |
| OpenSpec | TBD — `front-blueprint-list-processing` | |
| Code | `blueprint-node-v1.ts`; `blueprint-v1.node.ts`; `processed-blueprint.ts`; aggregate; panels; renders | Consolidate |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and authorizes `/fix:defect`
- [ ] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

`/fix:defect` 2026-11-05: domain RegionV1/SolarSystemV1 + NeoCom children aggregate; single BlueprintV1Node + BlueprintV1DtoWire; render keys = jsonClass; `-domain-` alias; Lookup* / npm BlueprintV1 wrapper removed.

Does not dispute DTO wire types; only overlapping NeoCom/list domain classes. See [DEF-BLP-013](#def-blp-013--published-blueprintv1-neocom-domain-is-redundant-for-front-nodes-use-blueprintv1dtowire): published `BlueprintV1` is redundant vs `BlueprintV1DtoWire`.

---

## DEF-BLP-011 — Render registration name SHALL equal the domain node `jsonClass`

| Field | Value |
| --- | --- |
| Status | `in openspec` |
| Severity | `TBD` |
| Surfaces | `render-registry.ts`; `jsonClass` on domain nodes; `v1-*-render` registrations (Blueprint, Pilot, Corporation, Region, SolarSystem, …) |
| Found on | Clarifying earlier hyphenated-key idea: registration must match the representing class’s `jsonClass` |
| Branch tip | `neocom-front` `feature/blueprint-list-processing` |
| L1 | EPIC-006 **UI-DOM-003** `registered` → [`front-domain-nodes`](../openspec/changes/front-domain-nodes/) |

### Observed

Render registration today uses mixed keys (`BlueprintV1`, `ProcessedBlueprint`, `LookupRegion`, `PublicPilotV1`, …) that are not consistently tied to a single rule. An earlier draft proposed hyphenated names such as `-Blueprint-`; the authoritative rule is simpler and stricter.

### Expected

1. EPIC-006 SHALL state: the **render registration name** for a domain object SHALL be **the same string** as the `jsonClass` of the front domain class that represents that object.
2. `registerRender(jsonClass, component)` (and collaborate / lookup) SHALL use that class’s `jsonClass` only — no parallel alias registry key.
3. Domain nodes (Blueprint, Pilot, Corporation, Region, SolarSystem, …) SHALL set `jsonClass` once to the correct domain identity (DEF-BLP-008 / DEF-BLP-009 / DEF-BLP-010); renders register under that exact value.
4. Versionability stays on the **render** UI (`vn-` selector / folder per UI-VER-*); it does **not** invent a second registration key different from `jsonClass`.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | [`06.EPIC-USER-INTERFACE.md`](../sources/L1/06.EPIC-USER-INTERFACE.md) | Author: render registration name ≡ representing class `jsonClass` |
| OpenSpec | TBD | |
| Code | `render-registry.ts`; each `v*-*-render` `registerRender(...)`; domain node `jsonClass` setters | One key = `jsonClass` |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and authorizes `/fix:defect`
- [ ] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

`/fix:defect` 2026-11-05: domain RegionV1/SolarSystemV1 + NeoCom children aggregate; single BlueprintV1Node + BlueprintV1DtoWire; render keys = jsonClass; `-domain-` alias; Lookup* / npm BlueprintV1 wrapper removed.

Update 2026-11-05: supersedes the earlier “`-Blueprint-` hyphenated registration” wording in this defect. Path alias `@domain` (DEF-BLP-009 / UI-DOM-002) is a separate import-path concern and is not the render key.

---

## DEF-BLP-012 — Hierarchy uses NeoCom children on domain Region/SolarSystem; no Lookup or Listing subclass

| Field | Value |
| --- | --- |
| Status | `in openspec` |
| Severity | `TBD` |
| Surfaces | `RegionLookupNode`; `SystemLookupNode`; `BlueprintLocationAggregate`; `NeoCom.getChildren` / `addChild`; Region / SolarSystem domain nodes; region/system renders |
| Found on | Clarifying DEF-BLP-007: Lookup* is an invention; Listing subclass also unnecessary because NeoCom already owns children |
| Branch tip | `neocom-front` `feature/blueprint-list-processing` |
| L1 | EPIC-006 **UI-DOM-004** `registered` → [`front-domain-nodes`](../openspec/changes/front-domain-nodes/) |

### Observed

`RegionLookupNode` is another invention standing in for **Region**. A conceivable alternative would be a **Listing** subclass that inherits from Region (same render) and adds countable children so counts come from `children.length` while aggregation targets that Region extension — not an unrelated Lookup class.

Even that Listing approach is **not required**: `NeoCom` already provides `getChildren` / `addChild` (and `children`). Aggregation can build Region → SolarSystem → Blueprint **on the domain Region and domain SolarSystem nodes** with **no further classes or modifications** to NeoCom or to those domain types for hierarchy.

### Expected

1. Blueprint-by-location hierarchy SHALL aggregate onto **domain Region** and **domain SolarSystem** nodes (per DEF-BLP-007 / DEF-BLP-009 naming).
2. Parent/child links SHALL use existing `NeoCom` **children** (`addChild` / `getChildren`); counts for rendering SHALL be derived from children when needed (real-time from `children.length` / equivalent), not from a parallel Lookup model.
3. `RegionLookupNode` **/** `SystemLookupNode` **SHALL NOT** remain as hierarchy types.
4. A **Listing** subclass of Region (or SolarSystem) is **optional and not required** for this fix; do not introduce Listing types unless a later requirement explicitly needs them.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | EPIC-006; EPIC-011 | Hierarchy = domain nodes + NeoCom children |
| OpenSpec | TBD — `front-blueprint-list-processing` | |
| Code | `blueprint-location-aggregate.ts`; remove/supersede `region-lookup.node.ts` / `system-lookup.node.ts`; region/system renders read counts via children | Use `NeoCom.addChild` / `getChildren` |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and authorizes `/fix:defect`
- [ ] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

`/fix:defect` 2026-11-05: domain RegionV1/SolarSystemV1 + NeoCom children aggregate; single BlueprintV1Node + BlueprintV1DtoWire; render keys = jsonClass; `-domain-` alias; Lookup* / npm BlueprintV1 wrapper removed.

Complements DEF-BLP-007 (replace Lookup* with domain Region/SolarSystem) and DEF-BLP-008 (wrong `LookupRegion` jsonClass). Explicitly rejects inventing Listing* unless later required.

---

## DEF-BLP-013 — Published `BlueprintV1` (neocom-domain) is redundant for front nodes; use `BlueprintV1DtoWire`

| Field | Value |
| --- | --- |
| Status | `in openspec` |
| Severity | `TBD` |
| Surfaces | `blueprint-v1.node.ts` (`BlueprintV1` from `neocom-domain`); `BlueprintV1Node`; `BlueprintV1DtoWire` in `blueprint-node-v1.ts`; provider / aggregate / `v1-blueprint-render` |
| Found on | Front NeoCom Blueprint path wrapping npm `BlueprintV1` while HTTP already maps via internal `BlueprintV1DtoWire` |
| Branch tip | `neocom-front` `feature/blueprint-list-processing` |
| L1 | EPIC-006 **UI-DOM-005** `registered` → [`front-domain-nodes`](../openspec/changes/front-domain-nodes/) |

### Observed

Front render/list code uses published `neocom-domain` ****`BlueprintV1` inside `BlueprintV1Node` (Record wrapper). That package domain class is **redundant** for front NeoCom use: the list pipeline already has an internal DTO shape `BlueprintV1DtoWire` for endpoint mapping into NeoCom nodes (`BlueprintNodeV1.fromDto`). Requiring `BlueprintV1` adds a second, overlapping representation.

### Expected

1. Front NeoCom Blueprint handling SHALL **not** require the published `neocom-domain` `BlueprintV1` class.
2. When a DTO / wire shape is needed, the front SHALL use the **internal** `BlueprintV1DtoWire` (or successor wire type colocated with the front node), not `BlueprintV1` from npm.
3. `BlueprintV1Node`’s dependency on `import { BlueprintV1 } from 'neocom-domain'` SHALL be removed as part of consolidating to the single front Blueprint node (DEF-BLP-010).
4. This does **not** forbid `neocom-domain` elsewhere where the published Record is genuinely needed; it forbids treating `BlueprintV1` as required for front node / render / aggregate paths that already have DTO wire + NeoCom.

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | EPIC-006; EPIC-011 | Front NeoCom + internal DTO wire; npm Record optional |
| OpenSpec | TBD — `front-blueprint-list-processing` | |
| Code | `blueprint-v1.node.ts`; `v1-blueprint-render`; aggregate `toBlueprintV1Node`; keep/use `BlueprintV1DtoWire` | Drop `BlueprintV1` import from front Blueprint NeoCom path |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; Review starts `[x] to review`)
- [x] Mark to run the process — sets Review to `[x] reviewed` and authorizes `/fix:defect`
- [ ] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

`/fix:defect` 2026-11-05: domain RegionV1/SolarSystemV1 + NeoCom children aggregate; single BlueprintV1Node + BlueprintV1DtoWire; render keys = jsonClass; `-domain-` alias; Lookup* / npm BlueprintV1 wrapper removed.

Narrows DEF-BLP-010: of the overlapping Blueprint types, published `BlueprintV1` / `BlueprintV1Node(record)` is explicitly unnecessary when `BlueprintV1DtoWire` exists.

---

## DEF-BLP-014 — v2-node-container expand toggle size/centering; node body fills row

| Field | Value |
| --- | --- |
| Status | `applying` |
| Severity | `TBD` |
| Surfaces | `v2-node-container.component.html` (expand toggle ~L7–23); `v2-node-container.component.scss` (`.expand-toggle`, `.node-body`, `.node-row`); blueprint-by-location / hierarchy rows |
| Found on | Validating expand/collapse chrome on hierarchy node rows |
| Branch tip | `neocom-front` `feature/blueprint-list-processing` |
| L1 | TBD — EPIC-006 UI / domain-node container |

### Observed

On `v2-node-container`, the expand/collapse control (button + arrow icon) is too small and not centered horizontally in its column. The rendered node content (`.node-body` / outlet) does not expand to use the remaining width of the row.

### Expected

1. The expand toggle SHALL be a little larger than today and centered horizontally in its column.
2. The node being rendered SHALL expand to fill the rest of the row width (toggle fixed; body flexes to remaining space).

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | TBD — EPIC-006 | Domain-node container / expand chrome layout |
| OpenSpec | TBD | |
| Code | `neocom-front` `src/app/modules/renders/v2-node-container/` (HTML/SCSS; possibly icon size class) | Larger + centered toggle; `.node-body` fills remaining row |

### Prep for resolution (checklist)

- [x] Register the spec on the owning epic (L1 requirement row; selecting this assumes Review accepted → `[x] reviewed`)
- [x] Mark to run the process — authorizes `/fix:defect`
- [ ] Developer validates the fix — then `/defect:fixed` moves this entry to `FIXED-DEFECTS.md`

### Notes

Layout already uses Bootstrap `.row` plus `.node-body { flex: 1 1 auto; min-width: 0 }`; fix likely needs toggle sizing/alignment (and confirm flex/width on the row so the body actually stretches).

`/fix:defect` 2026-11-06: `v2-node-container` — arrow `neo-icon-md`; toggle fixed gutter centered; `:host`/`.node-body` fill remaining row width. L1/OpenSpec still TBD (not invented).

---
