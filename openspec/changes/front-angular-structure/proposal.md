# Proposal

## Why

EPIC-002 needs a durable front structure: core pages/panels vs section modules (industry/manufacture in scope) vs shared non-section modules, so later features place screens correctly.

## What Changes

- Define page vs panel vs section module and lazy `loadChildren` / `forChild` routing
- Place shell screens under `app/pages` and core-only panels under `app/panels`
- Place shared header panels under `modules/header`
- Create industry and manufacture section modules with `pages`/`panels` folders
- Keep non-section modules (`header`, `shared`, `renders`, `common`, `innovative-core`) without root routes
- Apply placement rules for new screens and panels

## Capabilities

### New Capabilities

- `front/angular-structure`: Application division for pages, panels, section modules, and shared modules

### Modified Capabilities

- *(none)*

## Impact

- Owning repository: **`neocom-front`**
- Requirement ids: STRUCT-001 … STRUCT-007 
- Source extract: 
- Out of scope: planetary/loyalty/fittings sections (deferred); login/dashboard product behaviour (separate changes)
