# Design

## Context

EPIC-011 Section 03. Applied `back-industry-blueprints` returns domain-shaped `BlueprintV1`; this change moves interchange to `BlueprintV1Dto` + embedded `SpaceLocationV1Dto` on `neocom-back`.

## Decisions

| Topic | Decision |
| --- | --- |
| Change name | `back-blueprint-list-processing` |
| ESI source | Get character blueprints fields (`item_id`, `location_flag`, `location_id`, ME/TE, `quantity`, `runs`, `type_id`, …) |
| Interchange | `BlueprintV1Dto` + `SpaceLocationV1Dto` (`Dto` suffix, `neocom-back` only) |
| DTO package | `src/infrastructure/adapters/dto/` (adapters top level; not inbound/outbound) |
| Converters | Single static class in `dto` (e.g. `BlueprintListDtoConverter`) with static methods per origin→DTO; not instantiated |
| Record base | `Record` for `*Dto` lives on `neocom-back` `adapters/dto` (moved from domain for DTO flows); domain `Record` deprecated for legacy models |
| Location | Via `GetSpaceLocationUseCase` during blueprints processing; embed DTO on blueprint (no duplicated catalog call) |
| Use-case composition | Use cases may call other use cases for shared lookups (BLP-030) |

## Risks

- Breaking wire shape vs current front adapters until `front-blueprint-list-processing` lands — apply coordinated or feature-flag
- Catalog miss for a `location_id` — behaviour TBD if not specified in L2 (do not invent)
