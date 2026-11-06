# Design

## Approach

- Norms live under capability `front/domain-nodes` sourced from EPIC-006 UI-DOM-001…005
- Alias **`@domain`** maps to `src/app/modules/innovative-core/domain/nodes` (barrel + wildcard)
- Hierarchy consumers (e.g. blueprint-by-location aggregate) stay in `front-blueprint-list-processing`; this change owns the shared naming / identity rules

## Decisions

| Topic | Decision |
| --- | --- |
| Alias name | `@domain` (not `-domain-`) |
| File pattern | `<object>-v<n>.node.ts` under a `domain` module folder |
| Render key | Exactly the NeoCom class `jsonClass` |
| Hierarchy | Domain Region / SolarSystem / Blueprint + `NeoCom` children; no Lookup* / required Listing |
| Blueprint wire | Internal `BlueprintV1DtoWire` (or successor); npm `BlueprintV1` not required for front NeoCom |

## Risks

- Older docs/defects may still say `-domain-`; L1 UI-DOM-002 and this change are authoritative
