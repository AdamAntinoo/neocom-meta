# Design

## Approach

- Mirror the Infinity front division: routed pages, non-routed panels, section modules under `app/modules`, shared modules without section routes.
- Root router: direct routes for shell pages; `loadChildren` for industry (and nested manufacture).
- Only industry + manufacture are in scope for this epic; other sections stay deferred.

## Decisions

| Topic | Decision |
| --- | --- |
| Shell pages | `app/pages` — `login`, `login-callback`, `dashboard` (+ `authGuard`); empty path → `dashboard` |
| Core-only panels | `app/panels` |
| Shared header panels | `modules/header` (e.g. `app-info-panel`, `server-info-panel`, `v1-pilot-panel`) |
| Section in scope | `modules/industry` (`industry`) and `modules/industry/manufacture` (`industry/manufacture`) |
| Non-section modules | `header`, `shared`, `renders`, `common`, `innovative-core` — no root route |
| Delivery branch | `feature/angular-structure` from `develop` |

## Risks

- Existing login/dashboard OpenSpec changes own product behaviour; this change owns folder/module placement only — apply without relocating those features' requirements.
