# Backend OpenAPI rules

<!-- L2-STATUS: placed -->

| Field | Value |
| --- | --- |
| Status | 📌 `placed` |
| Kind | placed |
| Epic | EPIC-009 |
| OpenSpec | `back-openapi` |
| Unregistered | 0 |
| Next | See `openspec/CHANGE-STATUS.md` |
| Index | [`L2/INDEX.md`](../INDEX.md) |

System: `back`. Feature: `openapi`.
OpenSpec change: `back-openapi` → `specs/back/openapi/spec.md`.
Source extract: `L2/09.EPIC-BACKEND-SERVICES.md`.

| ID | Status | Requirement |
| --- | --- | --- |
| BACK-SVC-060 | registered | The first development stage for new back code SHALL update the OpenAPI specification for the port being updated when OpenAPI applies |
| BACK-SVC-061 | registered | OpenAPI schemas SHALL be named after their domain model names |
| BACK-SVC-062 | registered | Endpoints SHALL be versioned with a path prefix (e.g. `v1`) |
| BACK-SVC-063 | registered | When OpenAPI and domain model fields or names differ, the domain model SHALL take precedence and supersede the OpenAPI |
