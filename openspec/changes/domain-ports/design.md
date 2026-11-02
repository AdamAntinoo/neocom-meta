# Design

## Approach

- Ports live in `neocom-domain` `src/ports` as interfaces
- Pilot stays its own port; Industry covers other endpoints in this epic’s scope
- Back adapters implement ports; missing domain models block work (no invented types)

## Decisions

| Topic | Decision |
| --- | --- |
| Pilot | Separate port under `src/ports` |
| Other endpoints | Industry port (new or extend existing industry interface) |
| Signatures | Domain models only |
| Delivery | `feature/ports` in `neocom-domain`; adapters on matching back feature |

## Risks

- Existing `src/api/industry.interface.api.ts` may need rename/move into `src/ports` without changing behavior beyond placement
