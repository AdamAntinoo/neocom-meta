# Design

## Context

`EveItemV1Dto` today maps optional ESI `dogma_attributes` / `dogma_effects` into `dogmaAttributes` / `dogmaEffects`. Front item/asset renders never read those fields (EPIC-016 §01).

## Decisions

| Topic | Decision |
| --- | --- |
| Wire | Omit dogma arrays from `EveItemV1Dto` (and inherited priced/nested payloads) |
| Converter | Stop mapping ESI dogma into the DTO; prefer deleting unused dogma helper types |
| Reintroduction | Only via a later reviewed L1 + OpenSpec change |

## Risks / trade-offs

- Any external client that relied on dogma in NeoCom item JSON loses those fields — programme front is confirmed not to use them.
