# Dashboard

Status: recorded. OpenSpec change: `front-dashboard`.

The landing page is the dashboard under `app/pages`. Until login works, an Angular filter treats pages as authenticated. The pilot id is the cookie `neocom-pilot-id`, initialized to `93813310`.

The page has a borderless `header` (`app-info-panel` white, `server-info-panel` blue) and `pilot-dashboard` (`pilot-public-info` green). An `exception` region sits under the header on every page when an exception is present. How the exception is passed is not defined.

Source: `05.REQUIREMENTS-DECOMPOSITION/L2/FRONT/04.DASHBOARD.md`.
