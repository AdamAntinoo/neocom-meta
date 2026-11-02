# Backend Industry API — pilot blueprints

<!-- L2-STATUS: placed -->

| Field | Value |
| --- | --- |
| Status | 📌 `placed` |
| Kind | placed |
| Epic | EPIC-009 |
| OpenSpec | `back-industry-blueprints` |
| Unregistered | 0 |
| Next | See `openspec/CHANGE-STATUS.md` |
| Index | [`L2/INDEX.md`](../INDEX.md) |

System: `back`. Feature: `industry-blueprints`.
OpenSpec change: `back-industry-blueprints` → `specs/back/industry-blueprints/spec.md`.
Source extract: `L2/09.EPIC-BACKEND-SERVICES.md`.

| ID | Status | Requirement |
| --- | --- | --- |
| BACK-SVC-070 | registered | The new Industry API SHALL start with an endpoint that retrieves the blueprints belonging to a pilot |
| BACK-SVC-071 | registered | That endpoint SHALL take the pilot unique identifier as input and return a list of `BlueprintV1` |
| BACK-SVC-072 | registered | Each `BlueprintV1` SHALL map all fields available from the ESI blueprints API plus the `BlueprintV1` fields not present on ESI (names, icons, output type, and other model-only fields), with the detailed field mapping to be reviewed |
