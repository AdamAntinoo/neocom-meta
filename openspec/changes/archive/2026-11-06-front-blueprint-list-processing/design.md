# Design

## Context

EPIC-011 Section 01–04. Current `blueprint-by-location-panel` uses `NodeListAdapterService` for HTTP + SSE; redesign moves SSE/cache into `PilotBlueprintProviderService` and NeoCom domain nodes.

## Decisions

| Topic | Decision |
| --- | --- |
| Change name | `front-blueprint-list-processing` |
| Provider | `PilotBlueprintProviderService` under `modules/services/` |
| Real-time contract | Approach A: shared `Observable` + `shareReplay` / `refCount` (`observeBlueprints`) |
| Cache | Keyed by pilot; TTL **60 minutes** (ESI Get character blueprints); upsert by `id` |
| Nodes | `BlueprintNodeV1`, Region/System `NeoCom` subclasses, `SpaceLocationNodeV1` (from DTO) |
| Aggregation | Same shape as IND-BP-033 / 112…117; sort Region roots by name; panel `notifyDataChanged` |
| SSE ownership | Provider only; panels subscribe to the stream |

## Risks

- High-frequency SSE → coalesce/debounce (policy TBD)
- Expand/selection lost on rebuild → preserve node `id`s
- Orphan SSE → prefer `refCount`
- Stacking on `feature/industry-blueprints` if that tip is still ahead of `develop` — ask before create
