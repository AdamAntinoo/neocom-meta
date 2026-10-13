# Design

## Approach

- Generate TypeScript DTO classes from the Character API OpenAPI with openapi-generator (ESI-002, ESI-003).
- Keep the generated files in `neocom-esi` at `src/esi-api/characters` (ESI-001, ESI-004).
- Treat the generated files as DTOs. A service in the same package composes higher-level DTOs or business objects from them (ESI-005).
- Publish `neocom-esi` so `neocom-front` depends on it (ESI-004, ESI-005).

## Decisions

| Topic | Decision |
| --- | --- |
| Owner | `neocom-esi` |
| Generator | openapi-generator, TypeScript DTOs |
| OpenAPI | EVE Online Character API, 28 operations, URL in ESI-002 |
| Output path | `src/esi-api/characters` |
| Consumption | npm publish of `neocom-domain` |
| Delivery branch | `features/character-api` from `develop` |

## Risks

- The OpenAPI document is a third-party snapshot, not the live ESI spec. This change does not switch the source URL.
- Generator options (library target, model naming) are not specified. Do not invent them here.
