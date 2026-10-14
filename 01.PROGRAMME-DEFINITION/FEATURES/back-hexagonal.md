# Backend hexagonal

Status: recorded. OpenSpec change: `back-hexagonal`.

The NestJS backend in `neocom-back` uses hexagonal directories. An OpenAPI document defines the API, openapi-generator produces the interface and DTOs, and a controller delegates to an injected use case. The first endpoint is Pilot.

Source: `05.REQUIREMENTS-DECOMPOSITION/L2/BACK/BACK.md` (BACK-001 … BACK-010).
