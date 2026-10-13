# Design

## Approach

- Download Universe datasets from ESI with no access token (UNIV-001).
- Limit the first set to the eight operations named in UNIV-002. They exist to resolve ids carried by the Pilot character payload.
- Read Universe data from `neocom-front` through an adapter (UNIV-003).
- Cache retrieved Universe data on the client. It usually does not change over time or across pilots. This change does not choose a database.

## Decisions

| Topic | Decision |
| --- | --- |
| Auth | None for these operations |
| First operations | Ancestries, bloodlines, factions, graphics, groups, group id, categories, category id |
| Delivery branch | `features/universe` from `develop` |

## Risks

- ESI list payloads are large (groups, categories). This change does not set pagination. Client caching is required (UNIV-003); the cache key and lifetime are not specified.
