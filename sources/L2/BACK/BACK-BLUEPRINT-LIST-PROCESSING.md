# Backend — blueprint list processing DTOs (EPIC-011)

<!-- L2-STATUS: placed -->

| Field | Value |
| --- | --- |
| Status | 🔨 `applying` |
| Kind | placed |
| Epic | EPIC-011 |
| OpenSpec | `back-blueprint-list-processing` |
| Unregistered | 0 |
| Next | Review uncommitted `neocom-back` `feature/blueprint-list-processing`; `/git:commit neocom-back` |
| Index | [`L2/INDEX.md`](../INDEX.md) |

System: `back`. Feature: `blueprint-list-processing`.  
OpenSpec: `openspec/changes/back-blueprint-list-processing/specs/back/blueprint-list-processing/spec.md`.  
Source extract: `L2/11.EPIC-BLUEPRINT-LIST-PROCESSING.md`.

| ID | Status | Requirement |
| --- | --- | --- |
| BLP-014 | registered | Back blueprints SHALL include **location** information (from ESI `location_id` / related fields) |
| BLP-015 | registered | During backend processing, the blueprint location SHALL be obtained via the **space-location use case** and represented as **`SpaceLocationV1Dto`** on `neocom-back` |
| BLP-018 | registered | Backend blueprint contents SHALL be obtained from the **ESI API** and **transformed** to **`neocom-back` `BlueprintV1Dto`** |
| BLP-019 | registered | `neocom-back` **`BlueprintV1Dto` SHALL contain the instance of `SpaceLocationV1Dto`** derived from the location lookup |
| BLP-020 | registered | Back ↔ front interchange types for this flow SHALL be **`neocom-back` classes with the `Dto` suffix**; they SHALL **not** be defined in `neocom-domain` |
| BLP-026 | registered | Interchange `*Dto` classes SHALL live under **`infrastructure/adapters/dto`** (infrastructure adapters **top level**; not under inbound/outbound) |
| BLP-027 | registered | Origin→DTO mapping SHALL live in **`adapters/dto`**; ESI→DTO input SHALL be the **ESI library** result type (not a local row interface) |
| BLP-028 | registered | `*Dto` classes SHALL **extend** back-owned **`Record`** under `adapters/dto` (moved from `neocom-domain` for DTO interchange; do not import domain `Record` for new DTOs) |
| BLP-029 | registered | Origin→DTO conversions SHALL be **one static converter class** (multiple methods; **not** instantiated; not one class per mapping) |
| BLP-030 | registered | Back use cases MAY **compose other use cases** for shared lookups (blueprint list → space-location use case; do not copy catalog logic) |
