# Design

## Approach

- First Industry API endpoint: pilot id in → `BlueprintV1[]` out
- Enrich from ESI blueprints plus model-only BlueprintV1 fields already defined on the domain model
- Leave the granular ESI field mapping for a follow-up review (per BACK-SVC-072)

## Decisions

| Topic | Decision |
| --- | --- |
| Port | Industry (see `domain-ports`) |
| Return type | `BlueprintV1[]` |
| Input | Pilot unique identifier |
| Mapping detail | Stated at field-group level; exact map TBD |
| Delivery | `feature/industry-blueprints` in `neocom-back` |

## Risks

- Detailed mapping gap may block apply until review; do not invent columns beyond the L2 note
