# Design

## Context

Five EPIC-006 front capabilities were registered as separate OpenSpec changes. They share one apply branch and one landing/chrome vertical, so they fold here (template: `login`).

## Decisions

| Topic | Decision |
| --- | --- |
| Change name | `front-dashboard-shell` |
| Delivery branch | `feature/dashboard-shell` from `develop` |
| Capability layout | Keep five `specs/front/<capability>/spec.md` files (archive granularity) |
| Applied deps | Cite `front-pilot` / `front-pilot-panel` / `login`; do not reopen those applied changes |
| Corporation data | Front consumes NeoCom provider; no browser ESI |
| Media | Client CDN URLs only; no backend image proxy |

## Risks

- Application menu (UI-DASH-006) and UI-DASH-011 remain `to review`.
- Public corporation back enrichment may still need a follow-up back change if not already present.
