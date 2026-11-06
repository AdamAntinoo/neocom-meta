# Spec Epic Index: Centralized Review Status Register

> **DEPRECATED (2026-11-03). Retired with the L2 step (2026-11-06).** Do **not** update this file and do **not** follow the commands it names.  
> Authoritative Review / pipeline view: `sources/L1/TRACEABILITY.md` (**### Sections**). Registration is `/epic:extract`.  
> The Review gate remains the Review column on each L1 epic.

Master index of all sections and items across L1 epics with their Review statuses *(frozen snapshot — historical)*.

The **extract gate** is the Review column on each L1 epic register (exact value `reviewed`). This file was formerly the cross-epic dashboard; that role moved to `TRACEABILITY.md`.

---

## Status Values

| Status | Meaning | Extract? | Next Step |
| --- | --- | --- | --- |
| 🟢 `reviewed` | Ready for `/epic:extract`. | ✅ Yes | `/epic:extract` registers this section/item |
| 🟡 `to review` | Pending. Not ready yet. | ❌ No | Await review and approval; then set to `reviewed` |
| 🔵 `extracted` | Legacy status from the removed L2 copy. | ❌ No | Set back to `reviewed` only to register with `/epic:extract` |
| ⚫ `superseded` | Replaced by newer item; do not use. | ❌ No | Archive or link to replacement |
| ⚪ `out of scope` | Not part of this epic; reused elsewhere. | ❌ No | Link to the epic that owns it |

---

## EPIC-004: Models

### Register: Section 02 — Model register (review under this epic)

Source: `sources/L1/04.EPIC-MODELS.md` (lines 146–168)

| Item | Role | Review | Section | Notes |
| --- | --- | --- | --- | --- |
| PricedItemV1 | Item identity + buy/sell + hub market place | 🟡 `to review` | 03 | — |
| EveLocationV1 | Multi-kind location with nested context (structures, holds); will evolve in future epics | 🟡 `to review` | 04 | Broader than SpaceLocationV1; future epic work |
| EveAssetV1 | Instanced item + Pilot + location + price | 🟡 `to review` | 05 | — |
| PublicPilotV1 | Public-only Pilot base (legacy); kept for compatibility | 🔵 `extracted` | 06 | `domain-pilot` ·  |
| PilotV2 | Published Pilot for new development (extends public Pilot); header render + PilotShipV1 + EveLocationV1 | 🔵 `extracted` | 07 | `domain-pilot` ·  |
| ShipV1 | Neutral hull / type | 🟡 `to review` | 08 | — |
| PilotShipV1 | Boarded instance: hull + location + fit | 🟡 `to review` | 09 | — |
| BlueprintV1 | Base blueprint model; ESI data (id, type, runs, efficiency) — parent for processed variants | 🔵 `extracted` | 10 | `domain-blueprint` ·  |
| ProcessedBlueprintSummaryV1 | Blueprint list / cost-index summary (v1-blueprint render) | 🟡 `to review` | 11 | Extends BlueprintV1 with cost index and market data |
| ProcessedBlueprintV1 | Full processed blueprint (type + output + BOM resources) | 🟡 `to review` | 12 | Extends BlueprintV1 with full BOM |
| ResourceV1 | Typed BOM line (EsiType + quantity) | 🟡 `to review` | 12 | — |
| IndustryResourceV1 | BOM material line: type id, name, quantity, price | 🟡 `to review` | 13 | — |
| BOMResourceV1 | Industry resource plus build/buy action | 🟡 `to review` | 14 | — |
| BuildActionDtoV1 | BUY/BUILD action and market context on a BOM line | 🟡 `to review` | 15 | — |
| BOMGroupV1 | Labelled group of BOM resources and derived cost | 🟡 `to review` | 16 | — |
| ApplicationInfoV1 | Front application identity for header (name, version, copyright); v1-application-info-render | 🔵 `extracted` | 18 | `domain-application-info` ·  |
| ServerStatusV1 | EVE Online server info for header; from ESI status + enrichments; v1-server-status-render | 🔵 `extracted` | 19 | `domain-server-status` ·  |
| SpaceLocationV1 | Interface artifact: any kind of location (region, constellation, system, station, structure) as reference | 🔵 `extracted` | 20 | `domain-spacelocation` ·  (thin; no invented fields) |
| `jsonClass` interchange | Back responses for published domain models SHALL set `jsonClass` to the programme type name | 🔵 `extracted` | 22 | DOM-JSONCLASS-001…003 · registered `domain-jsonclass` ·  |
| EveItem / ESI type / EsiType mirrors | Internal server only | ⚪ `out of scope` | — | — |
| ESI corporation / alliance / universe race | Internal server only | ⚪ `out of scope` | — | — |

---

## EPIC-008: Locations

### Register: Section 02 — Location register (review under this epic)

Source: `sources/L1/08.EPIC-LOCATIONS.md` (lines 175–189)

| Item | Role | Model Name (Corrected) | Render Selector | Review | Section | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| SpaceLocation | Lookup node: kind + id + ancestor chain | **SpaceLocationV1** (from EPIC-004) | — | 🔵 `extracted` | 03 | `domain-locations` · ; LOC-010 → `back-spacelocations` |
| Region | `REGION` level | **RegionV1** | `v1-region` | 🔵 `extracted` | 04 | `domain-locations` (LOC-020); seed render notes left with LookupRegion until that row is reviewed |
| Constellation | `CONSTELLATION` level | **ConstellationV1** | `v1-constellation` | 🔵 `extracted` | 05 | `domain-locations` (LOC-030) |
| Solar system | `SOLAR_SYSTEM` level, with security | **SolarSystemV1** | `v1-solar-system` | 🔵 `extracted` | 06 | `domain-locations` (LOC-040); lookup variant binds LookupSolarSystem |
| Station | `STATION` level; dockable NPC station | **StationV1** | `v1-station` | 🔵 `extracted` | 07 | `domain-locations` (LOC-050, LOC-051) |
| Structure | `STRUCTURE` level; player structure | **StructureV1** | `v1-structure` | 🔵 `extracted` | 08 | `domain-locations` (LOC-060) |
| LocationAssetContainer | Assets grouped under one space location | — | — | ⚪ `out of scope` | 09 | Reused by assets or ships epic |
| ShippingYardLocation | Corporation yard: deposit + office + station | — | — | ⚪ `out of scope` | 10 | Reused by assets or ships epic |
| LookupRegion (deprecated) | Front region list for system lookup | **RegionV1** | `v1-region` | 🟡 `to review` | 11 | Rename from `LookupRegion` to `RegionV1` |
| LookupSolarSystem (deprecated) | Front system row inside a lookup region | **SolarSystemV1** | `v1-solar-system` | 🟡 `to review` | 12 | Rename from `LookupSolarSystem` to `SolarSystemV1` |
| KnownSystem | Planetary system card | **KnownSystemV1** | `v1-known-system` | 🟡 `to review` | 13 | — |
| Front stubs | Empty SpaceLocationV1 and Station; StationDto field names | — | — | ⚪ `out of scope` | 14 | — |

### Requirements: Section 01 — Location identity

Source: `sources/L1/08.EPIC-LOCATIONS.md` (lines 155–161)

| Requirement ID | Status | Description |
| --- | --- | --- |
| LOC-001 | 🔵 `extracted` | A published location SHALL name its kind — in  |
| LOC-002 | 🔵 `extracted` | A deeper location SHALL carry its ancestor place — in  |
| LOC-003 | ⚪ `out of scope` | Planets, ships, and cargo holds (not locationType values) |

### Requirements: Per-section requirement tables (Sections 03–14)

Source: `sources/L1/08.EPIC-LOCATIONS.md`

| Section | Item | Requirement ID | Status | Notes |
| --- | --- | --- | --- | --- |
| 03 | SpaceLocation | LOC-010 | 🔵 `extracted` |  |
| 03 | SpaceLocation | LOC-011 | ⚪ `out of scope` | Callers should use SpaceLocation node |
| 04 | Region | LOC-020 | 🔵 `extracted` |  |
| 05 | Constellation | LOC-030 | 🔵 `extracted` |  |
| 06 | Solar system | LOC-040 | 🔵 `extracted` |  |
| 07 | Station | LOC-050 | 🔵 `extracted` |  |
| 07 | Station | LOC-051 | 🔵 `extracted` |  |
| 08 | Structure | LOC-060 | 🔵 `extracted` |  |
| 11 | LookupRegion | LOC-090 | 🟡 `to review` | Region lookup card SHALL show region name and system count |
| 12 | LookupSolarSystem | LOC-100 | 🟡 `to review` | Lookup system row SHALL show the system name |
| 13 | KnownSystem | LOC-110 | 🟡 `to review` | Known-system card SHALL show name, path, security, planet count |
| 14 | Front stubs | LOC-120 | ⚪ `out of scope` | Front location type SHALL read serializer fields |
| 14 | Front stubs | LOC-121 | ⚪ `out of scope` | PilotV2.lastKnownLocation SHALL use that location type |

---

## EPIC-006 Addendum: Component Hierarchy & Render Registry

### Industry Page Stack (Blueprint List)

**Component Architecture:**
- `v1-blueprint-list-page` (page host) — does not iterate, hosts panels
  - `v1-available-blueprints-panel` (data panel) — extends `AppPanelComponent`
    - Data: `GET /v1/pilots/{pilotId}/industry/blueprints` (async + SSE events)
    - Renders: Dynamic list via `neocom-viewer-panel`
      - `neocom-viewer-panel` (generic renderer) — iterates flat node list
        - Registry lookup: `renderRegistry.get(node.jsonClass) → component`

**Render Registry Pattern:**
Maps backend `jsonClass` to Angular render component for dynamic rendering.

| jsonClass | Render Component | Notes |
| --- | --- | --- |
| `ProcessedBlueprintSummaryV1` | `v1-blueprint-render` | Blueprint card in list |
| `RegionV1` | `v1-region-render` | Region grouping header |
| `SolarSystemV1` | `v1-solar-system-render` | System grouping header |
| `ConstellationV1` | `v1-constellation-render` | Constellation grouping (future) |

**Data Flow:**
1. Page requests `/v1/pilots/{pilotId}/industry/blueprints` (Flow 06, async)
2. Backend enqueues enrichment jobs, returns partial list with `ready: true/false`
3. Backend publishes updates via `/v1/pilots/{pilotId}/industry/blueprints/events` SSE (Flow 07)
4. Panel receives flat node list grouped by region/system/blueprint hierarchy
5. `neocom-viewer-panel` renders each node via registry lookup

**Page Status:** 🟢 `reviewed` (Architecture confirmed; ready for implementation)

---

## EPIC-007: NeoCom API

### Register: API Flows (async and SSE)

Source: `sources/L1/07.EPIC-NEOCOM-API.md`

| Flow | Method | Endpoint | Description | Review | Notes |
| --- | --- | --- | --- | --- | --- |
| Flow 06 | GET | `/v1/pilots/{pilotId}/industry/blueprints` | Async, returns partial list, enqueues background enrichment | 🟢 `reviewed` | Pilot-scoped industry blueprint list with async loading |
| Flow 07 | GET | `/v1/pilots/{pilotId}/industry/blueprints/events` | SSE stream, pushes node updates | 🟢 `reviewed` | Server-sent events for blueprint enrichment progress |

---

## EPIC-006: User Interface

### Register: Page register (with Review column)

Source: `sources/L1/06.EPIC-USER-INTERFACE.md` (lines 16–26)

| Page | Role | Security | Review | Notes |
| --- | --- | --- | --- | --- |
| Dashboard | Application landing page after login + character selection; root feature list | Secured | 🟡 `to review` | — |
| Feature dashboard | Secured page for a parent feature; hosts that feature's subfeature list | Secured | 🟡 `to review` | — |
| Authentication pages | Login, callback, character selection, exception info | Unsecured / Secured | 🟡 `to review` | Imported from EPIC-001 |
| Blueprint list page (`v1-blueprint-list-page`) | Industry feature page: pilot's available blueprints grouped by region → system → blueprint | Secured | 🟢 `reviewed` | Render registry pattern; async loading via Flow 06–07 (EPIC-007) |

---

## How to Update Status *(obsolete — file deprecated)*

Do **not** follow these steps against this file anymore. Use L1 Review cells + `TRACEABILITY.md` + .

### Historical procedure (for recovery only)

1. Set the item’s **Review** cell on the L1 epic register to exactly `reviewed` (that cell is the extract gate).
2. ~~Mirror the same status in this index~~ — **do not**; update `TRACEABILITY.md` ### Sections instead.
3. Run `/epic:extract` (optionally scoped by epic number).

### What `/epic:extract` updates:

- Epic register: processed rows `reviewed` → `registered` (or `duplicated`)
- Epic `## Spec traceability` (start of file)
- `sources/L1/TRACEABILITY.md` (that epic’s ### Sections)
- `openspec/CHANGE-STATUS.md`
- **This file:** no updates

### Example workflow:

- Set **KnownSystem** to `[x] reviewed` on `08.EPIC-LOCATIONS.md`
- Run `/epic:extract 08`
- KnownSystem is registered into an OpenSpec change
- Epic Review cell and TRACEABILITY show `registered`

---

## Why This Index?

Cross-epic view of Review status so you can see what is waiting, extracted, or out of scope without opening every L1 file. The **extract gate** remains the Review column on the epic; this index must stay synchronized after every `/epic:extract`.

---

## Linking Changes to OpenSpec

When an extracted item is registered into OpenSpec via `/epic:extract`:

1. Keep the `Review` column at 🔵 `extracted` (pipeline status lives on TRACEABILITY / Spec traceability)
2. Add a note in the **Notes** column with the OpenSpec change name (e.g., `domain-locations`, `front-blueprint-page`)
3. Update `sources/L1/TRACEABILITY.md` (Sections / L2 delivery) and the epic’s `## Spec traceability`

Example:
| SpaceLocationV1 | Interface artifact | `v1-` | 🔵 `extracted` | 19 | Registered as `domain-locations` in OpenSpec |

---

## Maintenance

**None.** This file is deprecated. Agents must not refresh it after extract, Spec Evolution, or archive.

---

## EPIC-009: Backend services

Source: `sources/L1/09.EPIC-BACKEND-SERVICES.md` · L2:  (📭 cleared)

| Item | Role | Review | Section | Notes |
| --- | --- | --- | --- | --- |
| BACK-SVC-001…004, 010…013 | Domain layout / Record / V1 | 🔵 `extracted` | 01–02 | `domain-layout` → `DOMAIN/09.LAYOUT.md` |
| BACK-SVC-020…022, 030…032 | Pilot + Industry ports; contracts | 🔵 `extracted` | 03–04 | `domain-ports` → `DOMAIN/10.PORTS.md` |
| BACK-SVC-040…042, 050…052 | DTO + esi-api deprecations | 🔵 `extracted` | 05–06 | `domain-deprecations` → `DOMAIN/11.DEPRECATIONS.md` |
| BACK-SVC-060…063 | OpenAPI first; model wins | 🔵 `extracted` | 07 | `back-openapi` → `BACK/BACK-OPENAPI.md` |
| BACK-SVC-070…072 | Industry API pilot → `BlueprintV1[]` | 🔵 `extracted` | 08 | `back-industry-blueprints` → `BACK/BACK-INDUSTRY-BLUEPRINTS.md` |

## Current Status Summary

Last synced: 2026-11-02 (after `/epic:extract` on EPIC-009).

| Epic | 🟢 Reviewed | 🟡 To review | 🔵 Extracted | ⚪ Out of scope |
| --- | --- | --- | --- | --- |
| EPIC-004: Models | 0 | 11 | 7 (+ `jsonClass` interchange → `domain-jsonclass`) | 2 |
| EPIC-006: User Interface | 1 (v1-blueprint-list-page) | 3 | 0 | 0 |
| EPIC-007: NeoCom API | 2 (Flow 06, Flow 07) | 0 | 0 | 0 |
| EPIC-008: Locations | 0 | 3 register + LOC-090/100/110 | 6 register (SpaceLocation…Structure) + LOC-001/002/010/020/030/040/050/051/060 | 3 register + LOC-003/011/120/121 |
| EPIC-009: Backend services | 0 | 0 | 27 (BACK-SVC-001…072 → 5 OpenSpec changes) | 0 |
| **Total (register rows)** | **3** | **17** | **39** | **5** |

