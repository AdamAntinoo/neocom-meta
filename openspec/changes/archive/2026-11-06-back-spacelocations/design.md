# Design

## Approach

- Single path parameter; kind is not in the URL
- Response kind depends on catalog contents for that id

## Decisions

| Topic | Decision |
| --- | --- |
| Path | `GET /api/v1/universe/spacelocations/{locationId}` |
| Delivery | `feature/spacelocations` in `neocom-back` |

## Risks

- Front empty SpaceLocationV1 / HAL limitations are out of scope for this back change
