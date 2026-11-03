# Design

## Context

Five EPIC-010 front capabilities were registered separately. They share one Industry vertical and one apply branch, so they fold here.

## Decisions

| Topic | Decision |
| --- | --- |
| Change name | `front-industry-blueprints` |
| Delivery branch | `feature/industry-blueprints` from `develop` |
| Capability layout | Keep five `specs/front/<capability>/spec.md` files |
| Hierarchy feed | NeoCom sync + SSE; no browser ESI |
| Shared UI | Tokens/assets here; expand/collaborate behaviour remains applied `front-node-render` |

## Risks

- If Dashboard feature-list chrome from `front-dashboard-shell` is not yet on `develop`, ask before stacking this branch onto that feature tip.
