# Design

## Approach

- Remove the OpenAPI document and the code generated from it from `neocom-esi` (ESI-011).
- High-level data is based on `@lgriffin/esi.ts`.
- A service in the same package still publishes higher-level objects (ESI-005).

## Decisions

| Topic | Decision |
| --- | --- |
| Owner | `neocom-esi` |
| Generated Character API | removed (ESI-001 … ESI-004 cancelled) |
| High-level data | `@lgriffin/esi.ts` |
| Delivery branch | `feature/character-api` from `develop` |

## Risks

- ESI-005 still says a service composes higher-level objects from generated DTO classes. Those classes are removed by ESI-011. The note did not rewrite ESI-005.
