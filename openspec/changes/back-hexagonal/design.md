# Design

## Approach

- Directories are `application`, `domain`, and `infrastructure`. REST input is `infrastructure/adapters/inbound` (BACK-002, BACK-003).
- An OpenAPI document describes endpoints and DTOs. openapi-generator produces the API interface and the DTOs. The controller implements that interface and delegates to an injected use case (BACK-004, BACK-005, BACK-010).
- The published port lives in `neocom-back`. The first endpoint is Pilot. It accepts the pilot identifier and returns a `PilotDto`, a JSON view of `L2/DOMAIN/MODELS/Pilot.md` (BACK-006, BACK-007, BACK-008).
- When the system is not logged in and the private part is not accessible, the private section is omitted (BACK-009).

## Decisions

| Topic | Decision |
| --- | --- |
| Owner | `neocom-back` |
| Delivery branch | `feature/hexagonal` from `develop` |

## Risks

- The OpenAPI path and operation id are not named. Do not invent them.
- "Not logged in" is stated. How the login state is read is not stated.
