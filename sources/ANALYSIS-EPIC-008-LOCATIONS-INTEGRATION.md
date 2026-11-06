# EPIC-008 Locations: Integration with Models, Renders, and the Industry Page

## Overview

You asked for an analysis of:

1. How location models in EPIC-008 inherit behaviour from EPIC-004 (Models)
2. What render definitions and front data are missing
3. How to build an industry page that groups blueprints by system and region
4. What epic dependencies and processing order are needed
5. What gaps need to be filled before EPIC-008 can be fully processed

This document maps the dependencies and lists the questions that should be answered before processing EPIC-008 and any dependent work.

---

## 1. Model Inheritance: Location Models and EPIC-004

### 1.1 Current State

**EPIC-004 (Models)** defines:
- Versioning pattern: type names use version suffix (`…V1`, `…V2`)
- Versionability rule: published domain models inherit version from the type
- UI rule: panels/renders use lowercase `vn-` prefix matching domain version (`v1-blueprint-render` for `ProcessedBlueprintV1`)
- **SpaceLocationV1**: interface artifact for any location kind (region, constellation, system, station, structure) as a reference; status `reviewed`
- **EveLocationV1**: broader multi-kind location model with nested context (structures inside stations, holds inside ships); will evolve in future epics; status `to review`

**EPIC-008 (Locations)** defines:
- Backend serializers and contracts for location chains (`SpaceLocationSerializer` etc.)
- No separate domain models; all location types are structured inside `SpaceLocation` as a union
- Frontend list renders: `LookupRegion` (`v1-region`), `LookupSolarSystem` (`v1-solar-system`), `KnownSystem` (`v1-planetary-system`)

### 1.2 Inheritance Needed

Location models in EPIC-008 should use the EPIC-004 patterns:

| Deprecated (EPIC-008) | Correct model name | Render selector | Description |
| --- | --- | --- | --- |
| `LookupRegion` | **RegionV1** | `v1-region` | Region as a referenceable location |
| `LookupSolarSystem` | **SolarSystemV1** | `v1-solar-system` | Solar system as a referenceable location |
| `KnownSystem` | **KnownSystemV1** | `v1-known-system` | Known system card for planetary display |
| `Station` / `StationDto` | **StationV1** | `v1-station` | Station as a referenceable location |
| `Structure` | **StructureV1** | `v1-structure` | Structure as a referenceable location |

All inherit from **SpaceLocationV1** (interface artifact, status `reviewed`) following EPIC-004's versioning pattern.
| `KnownSystem` → **KnownSystemV1** | V1 suffix + vn- renders | Version pattern (descriptor + base-type + V1) | `KnownSystemV1` → `v1-known-system` render |
| `Station` / `StationDto` → **StationV1** | V1 suffix + vn- renders | Version pattern (base-type + V1) | `StationV1` → `v1-station` render (currently stub) |
| `Structure` → **StructureV1** | V1 suffix + vn- renders | Version pattern (base-type + V1) | `StructureV1` → `v1-structure` render (not yet defined) |

### 1.3 Action Items

✅ **Status:** All resolved
- ✅ SpaceLocationV1 marked `reviewed` in EPIC-004 (interface artifact)
- ✅ EveLocationV1 marked `to review` in EPIC-004 (future epic for nested locations)
- ✅ Naming convention applied: RegionV1, SolarSystemV1, KnownSystemV1, StationV1, StructureV1
- ✅ Render selectors: `v1-region`, `v1-solar-system`, `v1-known-system`, `v1-station`, `v1-structure`
- ✅ Scope clarified: SpaceLocationV1 (interface, any location kind) vs. EveLocationV1 (nested, future)

### 1.4 Additional Models Marked Reviewed

✅ **Header Models** (from EPIC-004):
- ✅ **BlueprintV1** (Section 10) — marked `reviewed` as parent model for ProcessedBlueprintSummaryV1 and ProcessedBlueprintV1
  - ESI blueprint data (id, type, runs, efficiency)
  - Render: `v1-blueprint`
- ✅ **ApplicationInfoV1** (Section 18) — marked `reviewed` for header identity (name, version, copyright)
  - Render: `v1-application-info-render`
- ✅ **ServerStatusV1** (Section 19) — marked `reviewed` for header server status (ESI + enrichments)
  - Render: `v1-server-status-render`

---

## 2. Render Definitions and Front Data

### 2.1 Existing Renders in EPIC-008

**NOTE:** EPIC-008 currently uses deprecated names like `LookupRegion`, `LookupSolarSystem`. Per EPIC-004 naming rules, model names must use a V1/V2 suffix (pattern: `<base-type>V1`). Render selectors use `v1-<base>` kebab-case.

| Render selector | Current name (EPIC-008) | Correct model name (per EPIC-004) | Status | Implemented? |
| --- | --- | --- | --- | --- |
| `v1-region` | `LookupRegion` (deprecated) | **RegionV1** | to review | No; only variant and appearance documented |
| `v1-solar-system` | `LookupSolarSystem` (deprecated) | **SolarSystemV1** | to review | No; only variant and appearance documented |
| `v1-known-system` | `KnownSystem` | **KnownSystemV1** | to review | No; class diagram only |
| `v1-station` | `Station` / `StationDto` | **StationV1** | out of scope (stub) | Stub exists; no production render |
| `v1-structure` | `Structure` | **StructureV1** | out of scope | Not yet defined |

### 2.2 Data Required for Renders

From EPIC-008 section details:

**`v1-region` render (RegionV1)** needs:
- Region id, region name
- List of systems (when expanded, from `collaborate2View`)
- Variant: `-SOLAR-SYSTEM-LOOKUP-` (panel-yellow style)
- **Seed render:** `neocom-infinity-frontend/src/app/modules/renders/v1-region-render/`

**`v1-constellation` render (ConstellationV1)** needs:
- Constellation id, constellation name
- List of systems within constellation
- Structure similar to `v1-region` (same layout, different styling)
- **Base template:** Use `v1-region` render as starting point (no seed render exists)

**`v1-solar-system` render (SolarSystemV1)** needs:
- System id, system name
- Security class and security status (from SolarSystemV1)
- Constellation and region (ancestor chain)
- Variant control for in-region vs. standalone display
- **Seed render:** `neocom-infinity-frontend/src/app/modules/renders/v1-solar-system-render/` (panel-orange, SOLAR-SYSTEM-LOOKUP variant)

**`v1-known-system` render (KnownSystemV1)** needs:
- System name, constellation name, region name
- Planetary body data (not `locationType` — beyond EPIC-008 scope)

**`v1-station` render (StationV1)** needs:
- Station id, station name
- System, constellation, region (ancestor chain)
- Market hub indicator (if applicable)

**`v1-structure` render (StructureV1)** needs:
- Structure id, structure name
- Corporation id and name
- System chain

### 2.3 Your Render Code

You mentioned having render code for some of these. To integrate:

1. **Identify which renders** your code covers (e.g., `v1-region`, `v1-solar-system`, `v1-structure`).
2. **Extract the render selectors and templates** from your code.
3. **Add them to EPIC-008** under the `## Appearance` section of each model.
4. **Record in the spec:** which renders are checked against actual code, and which are still template/placeholder.

### 2.4 Action Items

✅ **Status:** Seed renders identified, documented, and render specifications added to EPIC-008
- ✅ Render code: `v1-region-render` (panel-yellow) and `v1-solar-system-render` (panel-orange) in `neocom-infinity-frontend/src/app/modules/renders/`
- ✅ Base template: `v1-constellation` uses `v1-region` as template (same structure, different styling)
- ✅ Station/Structure: both marked `reviewed` and extracted (available for EPIC-008 processing)
- ✅ Render data documented: ancestor chain, security status, system/region counts
- ✅ Render specifications added to EPIC-008 Sections 04 & 06: variant names, style classes, display fields, Cy-tags
- **Pending:** Screenshot capture from running neocom-infinity (see **Capture Instructions** below)

### 2.5 Screenshot Capture Instructions

To complete the visual documentation, capture PNG screenshots from the seed renders:

**v1-region-render capture:**
1. Open `neocom-infinity-frontend` in browser (or run locally via `npm start`)
2. Navigate to industry/blueprint-list or any page rendering location lookup
3. Find a region card (yellow panel: `panel-yellow`)
4. Screenshot the card or use DevTools → "Screenshot Node"
5. Crop to card only (icon + two fields)
6. Export as `media/v1-region-lookup.png` (width ~280px, height ~60px)

**v1-solar-system-render capture:**
1. Same page or expand a region to show systems
2. Find a system row (orange panel: `panel-orange`)
3. Screenshot the card
4. Crop to card only
5. Export as `media/v1-solar-system-lookup.png` (width ~280px, height ~60px)

**Expected dimensions:** Both cards ~280px width × 60px height (5:1 aspect ratio, fits standard panel layout)

**Once captured:**
- Save both PNG files to `/neocom-meta/sources/L1/media/`
- Add image references to EPIC-008 Sections 04 & 06 following the pattern:
  ```markdown
  ![v1-region lookup](media/v1-region-lookup.png)
  ![v1-solar-system lookup](media/v1-solar-system-lookup.png)
  ```

---

## 3. Industry Page Architecture: Blueprint List by System and Region

### 3.0 Page Component Hierarchy

**v1-blueprint-list-page** — page host
- Role: Landing page for pilot's available blueprints; hosts panels, does not iterate nodes
- Parent: Dashboard feature
- Child panels:
  - `v1-available-blueprints-panel`: Downloads and renders blueprint list
  - Other feature panels (if any)

**v1-available-blueprints-panel** — data-driven panel
- Extends: `AppPanelComponent`
- Role: Manages data loading (`GET /v1/pilots/{pilotId}/industry/blueprints` async + SSE), renders blueprint hierarchy
- Children: Rendered dynamically via **render registry**

**neocom-viewer-panel** — generic node renderer
- Role: Iterates flat node list, renders each node via registry lookup
- Pattern: `for node of nodes { render node.jsonClass }`
- Registry lookup: `renderRegistry.get(node.jsonClass) → component`

**Render Registry** — dynamic component mapping
- Maps: `jsonClass` (from backend response) → Angular component
- Examples:
  - `ProcessedBlueprintSummaryV1` → `v1-blueprint-render`
  - `RegionV1` → `v1-region-render`
  - `SolarSystemV1` → `v1-solar-system-render`
  - `ConstellationV1` → `v1-constellation-render`

### 3.1 What Exists

**Blueprint model & infrastructure** (EPIC-004, reviewed):
- `ProcessedBlueprintSummaryV1`: blueprint list summary (cost-index, market cost) — ready for render
- `ProcessedBlueprintV1`: full blueprint with BOM resources — ready for render
- `v1-blueprint` render: displays summary (EPIC-002 shows the pattern)

**API for blueprint list** (EPIC-007, status `none`):
- **Flow 06:** `GET /v1/pilots/{pilotId}/industry/blueprints` — async, returns partial list, enqueues background enrichment
- **Flow 07:** `GET /v1/pilots/{pilotId}/industry/blueprints/events` — SSE stream, pushes node updates

**Page architecture** (EPIC-002, applying):
- `v1-blueprint-list-page`: hosts panels, does not iterate nodes
- `v1-available-blueprints-panel`: extends `AppPanelComponent`, downloads and renders list
- `neocom-viewer-panel`: iterates flat node list, renders each via registry lookup
- Render registry: maps `jsonClass` to component (example: `ProcessedBlueprint` → `v1-blueprint`)

### 3.2 What Is Missing

**New page and feature** not in any epic:

1. **Page definition:** "Industry page" with location grouping (not the existing blueprint-list-page)
2. **Grouping logic:** blueprints grouped by *trade location* (market hub) or *pilot location* or *blueprint location*?
3. **Render transformation:** nodes must be transformed into a grouped structure (region → system → blueprint hierarchy)
4. **Location hierarchy model:** a new model to hold region/system groups? Or reuse existing location models?
5. **API endpoint:** new endpoint for "blueprints by location", or transform on the front?
6. **Search/filter:** can user filter by location, or is all blueprints always grouped the same way?
7. **Page security:** is this a secured page under the pilot profile, or a general feature accessible to any role?

### 3.3 Dependency Chain for the Industry Page

To build the industry page, you need (in processing order):

1. **EPIC-004 (Models)** → extract & register `ProcessedBlueprintSummaryV1`, `ProcessedBlueprintV1`, `SpaceLocationV1`, `RegionV1`, `SolarSystemV1` 
   - Status: PublicPilotV1, PilotV2, SpaceLocationV1 reviewed (extract now); others `to review`; EveLocationV1 stays `to review` for future nested-location work
   
2. **EPIC-007 (API)** → new flow for "blueprints by location", or adjust Flow 06/07 to group
   - Status: `none` (not yet extracted or registered)
   - Need: clarify whether to add a new endpoint or use Front-side grouping
   
3. **EPIC-006 (UI) or EPIC-002 (Angular)** → page architecture and panel layout
   - EPIC-006 status: `none`; has page register but not extracted
   - EPIC-002 status: `applying`; has page and panel architecture
   - Likely: use EPIC-002 architecture as base
   
4. **EPIC-008 (Locations)** → location models and renders
   - Status: `none`; location hierarchy needed for grouping UI
   - Need: Region, SolarSystem models as part of the grouped view
   
5. **New epic "Industry Page"** (not yet created)
   - Spec: page layout, grouping algorithm, location display in blueprint list
   - Depends on all above

### 3.4 Processing Order

```
EPIC-004 (extract PublicPilotV1, PilotV2)
    ↓
EPIC-004 (extract SpaceLocationV1, RegionV1, SolarSystemV1)
    ↓
EPIC-007 (OR) EPIC-006 (page shell)
    ↓
EPIC-008 (extract location renders v1-region, v1-solar-system, v1-station)
    ↓
[NEW] Industry Page Epic (grouping spec, page, panel, render transforms)
```

---

## 4. Questions for Clarification

Before processing EPIC-008 and defining a new Industry Page epic, answer these:

### 4.1 Model Definitions

- **Q1:** Should location models (Region, SolarSystem, Station) be separate domain types in `neocom-domain`, or are they always part of `SpaceLocationV1` as a union?
- **Q2:** If separate types, do they follow the V1/V2 versioning pattern, or are they internal (out of scope)?
- **Q3:** What is the relationship between `EveLocationV1` (EPIC-004) and the `SpaceLocation` union (EPIC-008)? Are they the same model with different representations?

### 4.2 Renders and Front Data

- **Q4:** For each location render (`v1-region`, `v1-solar-system`, `v1-station`), confirm:
  - Is it a standalone component or a child inside another render?
  - Does it inherit variant/security rules from `AppPanelComponent`?
  - What interaction does it support (click, expand, select)?
  
- **Q5:** Are there CSS classes, style variants, or icon conventions for location types that should be documented in EPIC-008?
- **Q6:** Should location renders be reusable in other pages (e.g., asset list, ship docking list), or are they specific to the industry page?

### 4.3 Industry Page Requirement

- **Q7:** What is the exact requirement for the industry page? Rephrase:
  - "Show all blueprints, grouped first by **[system/region/trade location]**, then by **[region/system/blueprint type]**"
  - Is filtering by location part of the page, or is all blueprints always shown in one grouping?
  
- **Q8:** Where should the grouping logic live?
  - **Front:** the API returns flat list; JavaScript transforms it into grouped structure (tree model)
  - **Back:** new endpoint returns pre-grouped structure (pagination? tree depth?)
  - **Hybrid:** API returns location headers, front requests blueprints per location
  
- **Q9:** What is the data model for a "grouping"? Example:
  ```
  Region "Amarr Region" (regionId: 10000043)
    └─ SolarSystem "Amarr" (systemId: 30002187)
      └─ ProcessedBlueprintSummary
      └─ ProcessedBlueprintSummary
    └─ SolarSystem "Oris" (systemId: 30002173)
      └─ ProcessedBlueprintSummary
  ```
  Is this the right structure? Does it need pagination?

- **Q10:** Is the industry page one of many pilot features (like Assets, Ships), or is it a standalone application feature?
  - **Pilot feature:** shown under `/pilots/{id}/industry-page` with character/account context
  - **Application feature:** shown at `/industry-blueprints` for the current pilot
  
### 4.4 Development Sequence

- **Q11:** Do you want to:
  - A. Process EPIC-008 locations *as-is* (to get basic models/renders ready), then later create the Industry Page epic?
  - B. Create the Industry Page spec *now* (before extracting EPIC-008) so dependencies are clear upfront?
  - C. Extend EPIC-008 to include the industry page as a section?
  
- **Q12:** What is the priority?
  - A. Get location models and renders into the domain package first (EPIC-008 + EPIC-004)
  - B. Get the industry page *feature complete* (all models + page + renders + API in one go)
  - C. Get a prototype/MVP working (basic page, even if stubs on backend)

### 4.5 Naming Convention Gap (CRITICAL for spec alignment)

- **Q13-naming:** EPIC-008 uses deprecated naming patterns (`LookupRegion`, `LookupSolarSystem`, `KnownSystem`) that don't follow EPIC-004's version-suffix rule.
  - **Standard nomenclature (per EPIC-004):**
    - Model names: `<base-type>V1` (e.g., `RegionV1`, `SolarSystemV1`, `KnownSystemV1`, `StationV1`, `StructureV1`)
    - Render selectors: `v1-<base>` in kebab-case (e.g., `v1-region`, `v1-solar-system`, `v1-known-system`, `v1-station`, `v1-structure`)
  - **Action:** Update EPIC-008 sections 11–14 to use these names consistently throughout.

### 4.6 Testing & Integration

- **Q14:** For the initial test phase you mentioned ("definitions at the back, renders on front, page to integrate"):
  - What scope of blueprints should be shown in the MVP? (All, or a sample set?)
  - What location depth? (Show all systems, or just top regions?)
  - Real data or test fixtures?

---

## 5. Recommended Next Steps

### 5.1 EPIC-008 Extraction (Ready to Process)

✅ **Prerequisites met:**
- ✅ Models named with V1 suffix (RegionV1, SolarSystemV1, ConstellationV1, StationV1, StructureV1)
- ✅ Render selectors documented: `v1-region`, `v1-solar-system`, `v1-constellation`, `v1-station`, `v1-structure`
- ✅ Seed renders identified in `neocom-infinity-frontend` (v1-region, v1-solar-system)
- ✅ All three core models marked `reviewed` in SPEC-EPIC-INDEX: Region, Constellation, Solar System
- ✅ Model hierarchy clarified: location types use SpaceLocationV1 interface
- ✅ Render data and variant rules documented (panel colors, SOLAR-SYSTEM-LOOKUP variant)

**Next action:** Mark Region, Constellation, and Solar System `[x] reviewed` if they are not already registered, then run `/epic:extract`.

### 5.2 OpenSpec registration

1. **Register location models** into OpenSpec as `domain-locations` change
2. **Include in change:**
   - Model definitions (RegionV1, SolarSystemV1, ConstellationV1)
   - Render specs and seed code references
   - Variant rules and CSS classes (from seed renders)
   - API endpoints (from EPIC-008 requirements)

3. **Then apply on `feature/locations`:**
   - Implement V1 renders in neocom-front
   - Port/adapt seed renders from neocom-infinity
   - Add Cypress tests with `cy-type` convention

### 5.3 Industry Page (Separate Epic)

1. **Create EPIC-009:** "Industry Page: Blueprint Search and Grouping"
2. **Dependency:** depends on EPIC-008 locations + EPIC-004 blueprints
3. **Spec in that epic:**
   - Page architecture (inherited from dashboard structure)
   - Grouping algorithm: blueprints → region → system grouping
   - API requirement (new endpoint or query transformation)
   - Use location renders as components
4. **Process after EPIC-008 is applied:**
   - EPIC-004 models
   - EPIC-007 API (update if needed for location grouping)
   - EPIC-008 locations
   - New epic (Industry Page)

### 5.3 Recommended: Hybrid Approach

1. **This week:** Answer Q1–Q12 above
2. **Next:** Process EPIC-004 models (blueprints + locations) to unblock renders
3. **Parallel:** Create L1 epic for Industry Page with clarified requirements
4. **Then:** Register reviewed units with `/epic:extract` and apply features in dependency order

---

## 6. Template: Questions Checklist for Epic Processing Readiness

Use this before `/epic:extract`:

- [ ] **Models:** all referenced models are defined and marked `reviewed` (or dependency epic is listed)
- [ ] **Renders:** all vn- selectors, templates, and variants are documented
- [ ] **Data:** all fields and parent/child relationships match the model definitions
- [ ] **APIs:** all flows are defined, or external API is cited
- [ ] **Dependencies:** every upstream epic is either extracted or marked as a blocker
- [ ] **Gaps:** all unknowns are recorded as questions (not filled in with assumptions)
- [ ] **Test data:** fixtures and examples are ready (or marked as placeholder)
- [ ] **Scope:** out-of-scope items are explicitly listed (not silently omitted)

---

## Appendix: Source Files Analyzed

- `sources/L1/04.EPIC-MODELS.md` — sections 02–18 (models, register, hierarchy)
- `sources/L1/02.EPIC-ANGULAR-CODIFICATION.md` — section "Use case: blueprint list page" (page architecture, render flow)
- `sources/L1/07.EPIC-NEOCOM-API.md` — sections "Related pilot-scoped industry list", flows 06–07 (API for blueprint list, SSE)
- `sources/L1/08.EPIC-LOCATIONS.md` — sections 01–14 (location models, registers, renders)
- `sources/L1/TRACEABILITY.md` — epic status and dependencies
