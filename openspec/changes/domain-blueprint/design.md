# Design

## Approach

- Register only the base BlueprintV1 contract from the EPIC-004 extract
- Child processed models wait for a later extract

## Decisions

| Topic | Decision |
| --- | --- |
| Parent | BlueprintV1 |
| Children (later) | ProcessedBlueprintSummaryV1, ProcessedBlueprintV1 |
| Delivery | `feature/blueprint` in `neocom-domain` |

## Risks

- Render `v1-blueprint` may later bind processed summaries; this change only states the base identity card
