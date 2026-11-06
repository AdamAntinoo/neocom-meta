# Design

## Approach

- Mark domain DTOs deprecated without deleting them in this change
- Stop exporting `src/esi-api` from the domain package; ESI stays in back
- Removal of `src/esi-api` from domain is allowed once consumers no longer import it

## Decisions

| Topic | Decision |
| --- | --- |
| DTO fate | Deprecated; keep for templates / later removal |
| esi-api | Deprecated; not exported outside back; removable from domain |
| Delivery | `feature/deprecations` in `neocom-domain` |

## Risks

- Front/back may still import deprecated DTOs; marking makes call sites findable before removal
