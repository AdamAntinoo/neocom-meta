# Design

## Approach

- The start route renders the dashboard page (DASH-001, DASH-002).
- An Angular route filter allows navigation because every page is authenticated for now (DASH-001).
- The pilot id is the cookie `neocom-pilot-id`. The proposed name is recorded here because the requirement asks for a name. The test value is `93813310` (DASH-003). Do not read it from the route.
- Header is borderless and holds `app-info-panel` then `server-info-panel` (DASH-005).
- `pilot-dashboard` holds `pilot-public-info` (DASH-006).
- `exception` renders under `header` on any page that has an exception. Passing the exception is later work (DASH-007).
- Colour classes are `panel-white`, `panel-blue`, and `panel-green` (DASH-008, DASH-009).

## Decisions

| Topic | Decision |
| --- | --- |
| Landing page | Dashboard under `app/pages` |
| Auth filter | Allows all pages until login exists |
| Pilot cookie | `neocom-pilot-id` = `93813310` |
| Colours | app-info white, server-info blue, pilot green |
| Delivery branch | `features/dashboard` from `develop` |

## Risks

- The current pilot host is `v1-pilot-panel`. This change names `pilot-public-info`. Applying the change replaces or renames that host; this registration does not do that rename.
