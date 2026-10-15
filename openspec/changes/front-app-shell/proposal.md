# Proposal

## Why

The front canvas is wasted if the router outlet, the pages, or the document body keep a margin or a border. Components need that space.

## What Changes

- Give the Angular `router-outlet` 0 margin and 0 border, using the available HTML canvas
- Give pages inside the outlet the same zero margin and border
- Set `body` margin and padding to 0px

## Capabilities

### New Capabilities

- `front/app-shell`: Full-canvas application frame around the router outlet

### Modified Capabilities

- *(none)*

## Impact

- Owning submodule: **`neocom-front`** (`index.html` or global styles, and page hosts)
- Out of scope: dashboard sections, authentication, and pilot data
