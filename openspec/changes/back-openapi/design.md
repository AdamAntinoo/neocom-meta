# Design

## Approach

- Treat OpenAPI update as the first stage when the port has an OpenAPI surface
- Align schema names to domain models; keep versioned path prefixes
- Resolve conflicts by updating OpenAPI to match the domain model

## Decisions

| Topic | Decision |
| --- | --- |
| Order | OpenAPI first when OpenAPI applies |
| Schema names | Domain model names |
| Paths | Version prefix (e.g. `v1`) |
| Conflict | Domain model supersedes OpenAPI |
| Delivery | `feature/openapi` in `neocom-back` |

## Risks

- Generated DTOs may lag domain until OpenAPI is corrected; model-wins rule makes that intentional
