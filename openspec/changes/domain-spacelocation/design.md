# Design

## Approach

- Do not invent a SpaceLocationV1 field list
- Point new location work at EveLocationV1 where L1 says so
- Concrete REGION…STRUCTURE contracts stay in `domain-locations`

## Decisions

| Topic | Decision |
| --- | --- |
| SpaceLocationV1 | Thin interface artifact |
| Broader model | EveLocationV1 (still `to review` on EPIC-004 for full extract) |
| Delivery | `feature/spacelocation` |

## Risks

- L1 §20 prose still says superseded; register intent is interface artifact — apply must not invent fields to “fill” the type
