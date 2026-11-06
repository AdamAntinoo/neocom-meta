# Design

## Approach

- Codify package layout only: interchange under `src/domain`, ports under `src/ports`
- Align existing interchange types to `Record` and `*V1` names without inventing new fields

## Decisions

| Topic | Decision |
| --- | --- |
| Truth repo | `neocom-domain` for interchange + ports |
| Split | `src/domain` vs `src/ports` until a later taxonomy |
| Naming | Version suffix; initial copies start at V1 |
| Delivery | `feature/layout` in `neocom-domain` |

## Risks

- Renaming unversioned types may touch consumers in front/back; coordinate package bump separately
