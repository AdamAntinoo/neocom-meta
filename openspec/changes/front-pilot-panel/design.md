# Design

## Approach

- The panel input is the EVE character identifier (PANEL-002).
- Public data uses `-PILOT-PUBLIC-VARIANT-`. Private data that complements it uses `-PILOT-VARIANT-`. Listings use `-PILOT-LIST-VARIANT-` and render only a partial of the data (PANEL-006, PANEL-007, PANEL-008).
- Without a credential, private data can be hidden (PANEL-003).
- The panel is white with the standard background. The active pilot on a listing uses a greenish background (PANEL-005, PANEL-009).
- Markup is a `div` with `cy-element-name=pilot` and `cy-element-type=panel`. Rows are `div`s. Fields use `cy-field-label` and `cy-field-value` (PANEL-010, PANEL-011, PANEL-012).

## Decisions

| Topic | Decision |
| --- | --- |
| Owner | `neocom-front` |
| Delivery branch | `feature/pilot-panel` from `develop` |

## Risks

- "The neocom panel model" and "the standard background" are named, not specified further. Do not invent their CSS.
- The list variant's partial set of fields is not named.
