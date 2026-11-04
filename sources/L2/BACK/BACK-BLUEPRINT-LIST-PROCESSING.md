# Backend — blueprint list processing DTOs (EPIC-011)

<!-- L2-STATUS: placed -->

| Field | Value |
| --- | --- |
| Status | 📌 `placed` |
| Kind | placed |
| Epic | EPIC-011 |
| OpenSpec | `back-blueprint-list-processing` |
| Unregistered | 0 |
| Next | See `openspec/CHANGE-STATUS.md` |
| Index | [`L2/INDEX.md`](../INDEX.md) |

System: `back`. Feature: `blueprint-list-processing`.  
OpenSpec: `openspec/changes/back-blueprint-list-processing/specs/back/blueprint-list-processing/spec.md`.  
Source extract: `L2/11.EPIC-BLUEPRINT-LIST-PROCESSING.md`.

| ID | Status | Requirement |
| --- | --- | --- |
| BLP-014 | registered | Back blueprints SHALL include **location** information (from ESI `location_id` / related fields) |
| BLP-015 | registered | During backend processing, the blueprint location SHALL be **looked up on the location catalog** and represented as **`SpaceLocationV1Dto`** on `neocom-back` |
| BLP-018 | registered | Backend blueprint contents SHALL be obtained from the **ESI API** and **transformed** to **`neocom-back` `BlueprintV1Dto`** |
| BLP-019 | registered | `neocom-back` **`BlueprintV1Dto` SHALL contain the instance of `SpaceLocationV1Dto`** derived from the location lookup |
| BLP-020 | registered | Back ↔ front interchange types for this flow SHALL be **`neocom-back` classes with the `Dto` suffix**; they SHALL **not** be defined in `neocom-domain` |
