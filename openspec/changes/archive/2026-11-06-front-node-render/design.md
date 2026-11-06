# Design

## Approach

- Treat each renderable row as a node over a business object; Part chooses render via registry and calls node methods only.
- Registry maps `jsonClass` → component type; instantiate with `NgComponentOutlet` or `ViewContainerRef.createComponent`.
- Panels own roots and flatten with `collaborate2View`; viewers only iterate the flat list.
- Blueprint list / `v1-blueprint-render` remain the reference sample for manufacture.

## Decisions

| Topic | Decision |
| --- | --- |
| Class map | Remove hard-coded `*ngIf` in `v2-node-container`; registry only |
| Variant | Selects layout within a render (e.g. `-AVAILABLE-BLUEPRINTS-` vs short) |
| Viewer inputs | `nodes2render`, `downloader`, `variant`, `selectOnHover` |
| Delayed nodes | `NeoComDelayed` / `isReady()` for async readiness (enrichment owned elsewhere) |
| Delivery branch | `feature/node-render` from `develop` |

## Risks

- Large Infinity port; apply incrementally starting with registry + one feature render (blueprint).
