# Space location lookup API

<!-- L2-STATUS: placed -->

| Field | Value |
| --- | --- |
| Status | 📌 `placed` |
| Kind | placed |
| Epic | EPIC-008 |
| OpenSpec | `back-spacelocations` |
| Unregistered | 0 |
| Next | See `openspec/CHANGE-STATUS.md` |
| Index | [`L2/INDEX.md`](../INDEX.md) |

System: `back`. Feature: `spacelocations`.
OpenSpec change: `back-spacelocations` → `specs/back/spacelocations/spec.md`.

Source: `L2/08.EPIC-LOCATIONS.md` (LOC-010). Domain levels: `domain-locations`.

| ID | Status | Requirement |
| --- | --- | --- |
| LOC-010 | registered | `GET /api/v1/universe/spacelocations/{locationId}` SHALL return one `SpaceLocation` for that id (`SpaceLocationControllerV1` → `LocationCatalogService.searchLocation4Id`). Kind is not part of the path. Response kind depends on what the catalog stored for that id. |

## UNREGISTERED REQUIREMENTS
