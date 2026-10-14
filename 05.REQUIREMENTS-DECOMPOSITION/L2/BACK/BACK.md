# Backend hexagonal architecture

System: `back`. Feature: `hexagonal`.
OpenSpec change: `back-hexagonal` → `specs/back/hexagonal/spec.md`.

The pasted controller and use-case sample shows the shape: a controller implements the generated API and delegates to an injected use case. The sample's universe and market endpoints are not requirements.

| ID | Status | Requirement |
| --- | --- | --- |
| BACK-001 | registered | The NestJS backend follows hexagonal architecture |
| BACK-002 | registered | The backend has `application`, `domain`, and `infrastructure` directories |
| BACK-003 | registered | `infrastructure` contains `adapters/inbound`, which processes REST input requests |
| BACK-004 | registered | A controller implements the API definition declared in an OpenAPI document that describes the endpoints and DTOs |
| BACK-005 | registered | The API interface and the DTOs are generated from that OpenAPI document with openapi-generator |
| BACK-006 | registered | The publication is a port with the endpoints and the business-object models used to retrieve the information. The service is stored in `neocom-back` |
| BACK-007 | registered | The first endpoint is Pilot. It returns a `PilotDto`, a JSON view of the Pilot model in `L2/DOMAIN/MODELS/Pilot.md` |
| BACK-008 | registered | The Pilot endpoint accepts the pilot identifier as a parameter |
| BACK-009 | registered | If the system is not logged in and the private part is not accessible, the response does not include the private section of the pilot data |
| BACK-010 | registered | The controller follows the supplied sample: it implements the generated API interface and delegates to an injected use case |

## UNREGISTERED REQUIREMENTS
