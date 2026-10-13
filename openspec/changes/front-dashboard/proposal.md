# Proposal

## Why

The application needs a defined landing page: the dashboard, reached as authenticated while login is not operative, with the pilot id in a cookie and a fixed section layout.

## What Changes

- Land on the dashboard page under `app/pages` after `index.html`
- Treat every page as authenticated at this stage; the Angular filter returns success
- Store the pilot identifier in the cookie `neocom-pilot-id`, initialized to `93813310`, not in a route parameter
- Lay the dashboard out as two rows: a borderless `header` (`app-info-panel`, `server-info-panel`) and `pilot-dashboard` (`pilot-public-info`)
- Show an `exception` region under the header on every page when an exception is present. How the exception is passed is undefined
- Decorate panels with `panel-` plus a colour: white, blue, and green as named. Section row or column layout defines the gap

## Capabilities

### New Capabilities

- `front/dashboard`: Landing dashboard, pilot cookie, section layout, panel colours, and the exception-under-header pattern

### Modified Capabilities

- *(none)*

## Impact

- Owning submodule: **`neocom-front`**
- Out of scope: a working login flow, and the mechanism that passes an exception into a page
