# Design

## Approach

- Set `body` margin and padding to 0 (SHELL-003).
- The `router-outlet` host and each page host use the remaining canvas with no margin and no border (SHELL-001, SHELL-002).
- Do not add a max-width container around the outlet.

## Decisions

| Topic | Decision |
| --- | --- |
| Canvas | Outlet and pages fill the available space |
| Body | margin 0, padding 0 |
| Delivery branch | `features/app-shell` from `develop` |

## Risks

- Existing page padding on the dashboard will have to move inside a section when this change is applied, or those sections will sit on the canvas edge.
