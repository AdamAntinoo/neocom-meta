# Design

## Approach

- One capability for the shared serializer chain and level fields
- Endpoint stays on back change
- LookupRegion / KnownSystem remain unextracted (`to review`)

## Decisions

| Topic | Decision |
| --- | --- |
| locationType values | REGION, CONSTELLATION, SOLAR_SYSTEM, STATION, STRUCTURE |
| Delivery | `feature/locations` in `neocom-domain` |

## Risks

- Serializer fall-through and dual system field names are limitations in L2; do not “fix” them in the domain model without a stated requirement
