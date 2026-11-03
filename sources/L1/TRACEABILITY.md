# L1 epic → OpenSpec traceability

Central index so agents can **skip** epics (or passages) that are already extracted, registered, applying, applied, or archived. Each epic file also carries a `## Spec traceability` section (authored by `/epic`); this index is the authoritative record — keep it current, and do not edit the epic file during evolution.

Refresh OpenSpec task counts from `npx openspec list --json` when updating this file.

## Status values

Icons sit beside the status token for scanning; the backtick token remains the machine value.

### Pipeline (epic → OpenSpec)

| Icon | Status | Meaning |
| --- | --- | --- |
| ⚪ | `none` | No L2 extract and no OpenSpec change yet |
| 📤 | `extracted` | Epic-named L2 file(s) exist (`L2/NN.EPIC-NAME.md` and/or `L2/NN.EPIC-NAME.<group>.md`); OpenSpec not registered (or not yet for this epic) |
| 📝 | `registered` | One or more OpenSpec changes exist under `openspec/changes/` |
| 🔨 | `applying` | Implementation on `feature/<feature>` |
| ✅ | `applied` | Accepted on `develop`; not archived |
| 📦 | `archived` | OpenSpec change in `openspec/changes/archive/` |

### Review gate (register / requirement row)

Replaces the deprecated `UNREGISTERED REQUIREMENTS` inbox. New requirements start at `to review`.

| Icon | Status | Meaning |
| --- | --- | --- |
| ⏳ | `to review` | Initial / pending human review; **not** extractable |
| 👀 | `reviewed` | Ready for this extract iteration |
| 📤 | `extracted` | Already extracted to L2 |
| 🔁 | `duplicated` | Holding copy in `sources/L1/00.DUPLICATES.md` |
| 🚫 | `out of scope` | Not part of this epic |
| ↪️ | `superseded` | Do not extract |

**Skip rules**

- `/neo:extract-l2`: extract only rows marked `reviewed`. Set each processed row to `extracted`, or to `duplicated` when the behaviour already exists in L2 / applied-or-archived OpenSpec (append `sources/L1/00.DUPLICATES.md`). Leave `to review` untouched. Do not write `UNREGISTERED REQUIREMENTS` headings.
- `/neo:spec-evolution`: register L2 notes with status `pending` (legacy `UNREGISTERED` drained once). Do not open L1 to add models still `to review`. Near-duplicates append `00.DUPLICATES` (not an L2 `DUPLICATED` heading).
- `/epic` appends: new requirement rows start at `to review` until the developer marks them `reviewed`.

## Review gate record (L1 → L2)

`/neo:extract-l2` processes only register rows whose Review cell is exactly `reviewed`. After processing, it sets that cell to `extracted`, meaning the row is already extracted to L2. This table records, per row, the cell value after the last run and when the row was last processed. The rules are in `.dsh/skills/extract-l2/SKILL.md`, section "Review gate".

- The skill and agent rules take precedence over any epic prose that describes this procedure differently. The only epic change is the Review status cell of a processed row.
- A row with no entry is treated as never seen.
- `Last seen` is updated on every run that reads the row.
- A `reviewed` row is processed when `Last seen` is not `reviewed`. The cell is then set to `extracted`, `Processed` is set, and `Last seen` becomes `extracted`.

| Epic | Item | Last seen | Processed | L1 path | Notes |
| --- | --- | --- | --- | --- | --- |
| EPIC-004 | PricedItemV1 | ⏳ `to review` | | `04.EPIC-MODELS.md` | |
| EPIC-004 | EveLocationV1 | ⏳ `to review` | | `04.EPIC-MODELS.md` | |
| EPIC-004 | EveAssetV1 | ⏳ `to review` | | `04.EPIC-MODELS.md` | |
| EPIC-004 | PublicPilotV1 | ✅ `applied` | 2026-11-03 | `04.EPIC-MODELS.md` | `domain-pilot` 5/5 + `front-pilot` 5/5 — validated domain `@ 477ee33`, front `@ e3356db` |
| EPIC-004 | PilotV2 | ✅ `applied` | 2026-11-03 | `04.EPIC-MODELS.md` | `domain-pilot` 5/5 + `front-pilot` 5/5 — validated domain `@ 477ee33`, front `@ e3356db` |
| EPIC-004 | ShipV1 | ⏳ `to review` | | `04.EPIC-MODELS.md` | |
| EPIC-004 | PilotShipV1 | ⏳ `to review` | | `04.EPIC-MODELS.md` | |
| EPIC-004 | BlueprintV1 | ✅ `applied` | 2026-11-03 | `04.EPIC-MODELS.md` | `domain-blueprint` 2/2 — validated domain `@ 477ee33` |
| EPIC-004 | ProcessedBlueprintSummaryV1 | ⏳ `to review` | | `04.EPIC-MODELS.md` | |
| EPIC-004 | ProcessedBlueprintV1 | ⏳ `to review` | | `04.EPIC-MODELS.md` | |
| EPIC-004 | ResourceV1 | ⏳ `to review` | | `04.EPIC-MODELS.md` | |
| EPIC-004 | IndustryResourceV1 | ⏳ `to review` | | `04.EPIC-MODELS.md` | |
| EPIC-004 | BOMResourceV1 | ⏳ `to review` | | `04.EPIC-MODELS.md` | |
| EPIC-004 | BuildActionDtoV1 | ⏳ `to review` | | `04.EPIC-MODELS.md` | |
| EPIC-004 | BOMGroupV1 | ⏳ `to review` | | `04.EPIC-MODELS.md` | |
| EPIC-004 | ApplicationInfoV1 | ✅ `applied` | 2026-11-03 | `04.EPIC-MODELS.md` | `domain-application-info` 3/3 — validated domain `@ 477ee33` |
| EPIC-004 | ServerStatusV1 | ✅ `applied` | 2026-11-03 | `04.EPIC-MODELS.md` | `domain-server-status` 2/2 — validated domain `@ 477ee33` |
| EPIC-004 | SpaceLocationV1 | ✅ `applied` | 2026-11-03 | `04.EPIC-MODELS.md` | `domain-spacelocation` 3/3 — validated domain `@ 477ee33` |
| EPIC-004 | `jsonClass` interchange | ✅ `applied` | 2026-11-03 | `04.EPIC-MODELS.md` | Section 22; `domain-jsonclass` 3/3 — validated domain `@ 477ee33`, front `@ e3356db`, back `@ 3317849` |
| EPIC-004 | EveItem / ESI type mirrors | 🚫 `out of scope` | | `04.EPIC-MODELS.md` | |
| EPIC-004 | ESI corp / alliance / race | 🚫 `out of scope` | | `04.EPIC-MODELS.md` | |
| EPIC-004 | neocom-domain deploy | ⏳ `to review` | | `04.EPIC-MODELS.md` | Section 21 not extracted |
| EPIC-008 | SpaceLocation | 📤 `extracted` | 2026-11-02 | `08.EPIC-LOCATIONS.md` | Extracted to `L2/08.EPIC-LOCATIONS.md` (LOC-010; identity LOC-001/002) |
| EPIC-008 | Region | 📤 `extracted` | 2026-11-02 | `08.EPIC-LOCATIONS.md` | Extracted to `L2/08.EPIC-LOCATIONS.md` (LOC-020) |
| EPIC-008 | Constellation | 📤 `extracted` | 2026-11-02 | `08.EPIC-LOCATIONS.md` | Extracted to `L2/08.EPIC-LOCATIONS.md` (LOC-030) |
| EPIC-008 | Solar system | 📤 `extracted` | 2026-11-02 | `08.EPIC-LOCATIONS.md` | Extracted to `L2/08.EPIC-LOCATIONS.md` (LOC-040) |
| EPIC-008 | Station | 📤 `extracted` | 2026-11-02 | `08.EPIC-LOCATIONS.md` | Extracted to `L2/08.EPIC-LOCATIONS.md` (LOC-050, LOC-051) |
| EPIC-008 | Structure | 📤 `extracted` | 2026-11-02 | `08.EPIC-LOCATIONS.md` | Extracted to `L2/08.EPIC-LOCATIONS.md` (LOC-060) |
| EPIC-008 | LocationAssetContainer | 🚫 `out of scope` | | `08.EPIC-LOCATIONS.md` | Assets epic reuse |
| EPIC-008 | ShippingYardLocation | 🚫 `out of scope` | | `08.EPIC-LOCATIONS.md` | Assets/ships epic reuse |
| EPIC-008 | LookupRegion | ⏳ `to review` | | `08.EPIC-LOCATIONS.md` | |
| EPIC-008 | LookupSolarSystem | ⏳ `to review` | | `08.EPIC-LOCATIONS.md` | |
| EPIC-008 | KnownSystem | ⏳ `to review` | | `08.EPIC-LOCATIONS.md` | |
| EPIC-008 | Front stubs | 🚫 `out of scope` | | `08.EPIC-LOCATIONS.md` | |
| EPIC-009 | BACK-SVC-001…004 | 📤 `extracted` | 2026-11-02 | `09.EPIC-BACKEND-SERVICES.md` | Domain truth / ports placement → `L2/09.EPIC-BACKEND-SERVICES.md` |
| EPIC-009 | BACK-SVC-010…013 | 📤 `extracted` | 2026-11-02 | `09.EPIC-BACKEND-SERVICES.md` | Record base + version suffix |
| EPIC-009 | BACK-SVC-020…022 | 📤 `extracted` | 2026-11-02 | `09.EPIC-BACKEND-SERVICES.md` | Pilot + Industry ports |
| EPIC-009 | BACK-SVC-030…032 | 📤 `extracted` | 2026-11-02 | `09.EPIC-BACKEND-SERVICES.md` | Port contracts / domain models only |
| EPIC-009 | BACK-SVC-040…042 | 📤 `extracted` | 2026-11-02 | `09.EPIC-BACKEND-SERVICES.md` | Domain DTOs deprecated |
| EPIC-009 | BACK-SVC-050…052 | 📤 `extracted` | 2026-11-02 | `09.EPIC-BACKEND-SERVICES.md` | Domain esi-api deprecated |
| EPIC-009 | BACK-SVC-060…063 | 📤 `extracted` | 2026-11-02 | `09.EPIC-BACKEND-SERVICES.md` | OpenAPI first; model wins |
| EPIC-009 | BACK-SVC-070…072 | 📤 `extracted` | 2026-11-02 | `09.EPIC-BACKEND-SERVICES.md` | Industry API pilot blueprints |

## Index

**L2 backlog** is the extract-queue view from [`sources/L2/INDEX.md`](../L2/INDEX.md) (📥 inbox still has `pending` notes). Pipeline status alone does not mean Spec Evolution is done. Holding epic [`00.DUPLICATES.md`](00.DUPLICATES.md) is not a product row below.

| L1 epic | Epic id | Highest OpenSpec status | L2 backlog | OpenSpec changes | L2 path | Last updated |
| --- | --- | --- | --- | --- | --- | --- |
| `01.EPIC-LOGIN-PROCEDURE.md` | EPIC-001 | ✅ `applied` | 📌 placed (legacy extract cleared) | `login` (13/13, validated front `@ e3356db` / back `@ 3317849`); related `nestjs-sso-config` (0/2, still registered) | Legacy `L2/01.EPIC-LOGIN-PROCEDURE/`; placed under `L2/FRONT/06.LOGIN.md`, `L2/BACK/BACK-LOGIN.md`, `L2/ESI/` | 2026-11-03 |
| `02.EPIC-ANGULAR-CODIFICATION.md` | EPIC-002 | ✅ `applied` | 📭 `4` cleared extracts | `front-angular-structure` (7/7), `front-node-render` (7/7), `front-async-sse` (7/7), `front-infrastructure` (8/8), `front-pilot` (5/5), `front-pilot-panel` (4/4) validated front `@ e3356db`; `back-async-sse` (7/7), `infra-async-persistence` (4/4) validated back `@ 3317849`. Related still registered: `front-app-shell`, `front-dashboard` | Epic extracts + `L2/FRONT/07.ANGULAR-STRUCTURE.md`, `08.NODE-RENDER.md`, `09.ASYNC-SSE.md`, `L2/BACK/BACK-ASYNC-SSE.md`, `INFRASTRUCTURE-SPECS.md` §H | 2026-11-03 |
| `03.EPIC-TESTING.md` | EPIC-003 | 📝 `registered` | 📭 `6` cleared extracts | `front-bdd-cypress`, `front-mock-fixtures`, `cicd-coverage-sonar`, `cicd-testing-gates`, `infra-test-commands`, `back-testing` | Epic extracts + `L2/FRONT/10.BDD-CYPRESS.md`, `11.MOCK-FIXTURES.md`, `L2/CICD/01.COVERAGE-SONAR.md`, `02.TESTING-GATES.md`, `INFRASTRUCTURE-SPECS.md` §I, `L2/BACK/BACK-TESTING.md` | 2026-10-17 |
| `04.EPIC-MODELS.md` | EPIC-004 | ✅ `applied` | 📭 cleared extract | `domain-pilot`, `domain-blueprint`, `domain-application-info`, `domain-server-status`, `domain-spacelocation`, `domain-jsonclass` validated domain `@ 477ee33`; `front-pilot` validated front `@ e3356db`. Models still `to review` remain for later extract | `L2/04.EPIC-MODELS.md` (📭 cleared); placed `L2/DOMAIN/02.PILOT.md`, `03.BLUEPRINT.md`, `04.APPLICATION-INFO.md`, `05.SERVER-STATUS.md`, `07.SPACELOCATION-V1.md`, `08.JSONCLASS.md`; Pilot front pointer `L2/FRONT/01.PILOT-DEFINITION.md` | 2026-11-03 |
| `05.EPIC-ESI-UNIVERSE.md` | EPIC-005 | ⚪ `none` | — (no L2 extract) | | SDE source + back install noted on L1 | 2026-10-19 |
| `06.EPIC-USER-INTERFACE.md` | EPIC-006 | ⚪ `none` | — (no L2 extract) | | Auth page UI + `app-page-header` shell rules on L1 (not extracted yet) | 2026-10-19 |
| `07.EPIC-NEOCOM-API.md` | EPIC-007 | ⚪ `none` | — (no L2 extract) | | Baseline: auth `POST /v1/auth/callback` + cookie refresh; pilot `GET /v1/pilots/{id}`; related industry blueprints sync/SSE. More flows TBD | 2026-10-19 |
| `08.EPIC-LOCATIONS.md` | EPIC-008 | ✅ `applied` | 📭 cleared | `domain-locations` (3/3) validated domain `@ 477ee33`; `back-spacelocations` (2/2) validated back `@ 3317849`. Lookup* rows still `to review` | `L2/08.EPIC-LOCATIONS.md` (cleared); placed `L2/DOMAIN/06.LOCATIONS.md`, `L2/BACK/BACK-SPACELOCATIONS.md` | 2026-11-03 |
| `09.EPIC-BACKEND-SERVICES.md` | EPIC-009 | ✅ `applied` | 📭 cleared | `domain-layout`, `domain-ports`, `domain-deprecations` validated domain `@ 477ee33`; `back-openapi`, `back-industry-blueprints` validated back `@ 3317849`; related `domain-jsonclass` applied | `L2/09.EPIC-BACKEND-SERVICES.md` (cleared); placed DOMAIN/09–11 + BACK-OPENAPI + BACK-INDUSTRY-BLUEPRINTS | 2026-11-03 |

Non-epic L1 notes (`REQUIREMENTS.md`, `UX.md`, `ESI.md`) are not rows here until an `/epic` owns them. `00.DUPLICATES.md` is a holding epic (status `holding`), not a normal extract source.

## How agents update this file

1. After `/neo:extract-l2` creates or updates epic-named L2 file(s), set status at least 📤 `extracted`, fill **L2 path**, set **L2 backlog** from `sources/L2/INDEX.md`, update that index plus each file’s L2 status header, refresh the epic’s `## Spec traceability` (start of file: Status, L2, Skip, Index), **and** sync `sources/L1/SPEC-EPIC-INDEX.md` (processed items → 🔵 `extracted`, summary counts).
2. After `/neo:spec-evolution` registers OpenSpec changes sourced from that epic, add change names and set 📝 `registered` (or keep a higher status); refresh **L2 backlog** (📭 when extracts are cleared) and the epic’s `## Spec traceability` OpenSpec / Status fields.
3. When `/feature-delivery` starts, set 🔨 `applying` (and mirror on the epic header).
4. When the pull request into `develop` is accepted, set ✅ `applied` (and mirror on the epic header).
5. After `openspec archive`, set 📦 `archived` (and mirror on the epic header).
6. Keep the icon with the status token in every status cell (legend above).
7. Authored L1 sections stay as written. Only Review cells (extract) and `## Spec traceability` may change on the epic. This index and the epic header stay in sync; when they disagree, fix both in the same turn.
