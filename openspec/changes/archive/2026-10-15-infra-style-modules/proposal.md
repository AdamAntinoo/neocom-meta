# Proposal

## Why

Dart Sass will remove `@import`. The front build warns because application styles still loaded the variables partial that way, and Angular's global style loader still wraps `src/styles.scss` in `@import`.

## What Changes

- Load shared Sass variables with `@use`, not `@import`
- Keep application stylesheets on the Sass module system (`@use` / `@forward`)
- Silence only the `import` deprecation that `@angular/build` still emits for the global style entry

## Capabilities

### New Capabilities

- `infra/style-modules`: How NEOCOM stylesheets load Sass modules under the current Angular builder

### Modified Capabilities

- *(none)*

## Impact

- Owning submodule: **`neocom-front`** (`src/styles/panel-styles.scss`, `angular.json`)
- Out of scope: changing `@angular/build` itself, and restyling panels
