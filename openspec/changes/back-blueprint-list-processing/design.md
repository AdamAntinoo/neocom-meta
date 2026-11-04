# Design

## Context

EPIC-011 Section 03. Applied `back-industry-blueprints` returns domain-shaped `BlueprintV1`; this change moves interchange to `BlueprintV1Dto` + embedded `SpaceLocationV1Dto` on `neocom-back`.

## Decisions

| Topic | Decision |
| --- | --- |
| Change name | `back-blueprint-list-processing` |
| ESI source | Get character blueprints fields (`item_id`, `location_flag`, `location_id`, ME/TE, `quantity`, `runs`, `type_id`, …) |
| Interchange | `BlueprintV1Dto` + `SpaceLocationV1Dto` (`Dto` suffix, `neocom-back` only) |
| Location | Catalog lookup during backend processing; embed result on the blueprint DTO |

## Risks

- Breaking wire shape vs current front adapters until `front-blueprint-list-processing` lands — apply coordinated or feature-flag
- Catalog miss for a `location_id` — behaviour TBD if not specified in L2 (do not invent)
