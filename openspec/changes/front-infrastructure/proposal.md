# Proposal

## Why

NEOCOM front development needs a registered infrastructure baseline so agents and developers share one stack: Angular (latest stable), TypeScript, Vitest, Cypress + Cucumber, and an nvm Node alias `neocom`. Registering this in OpenSpec locks those constraints before feature work (Initialization, Login).

## What Changes

- Establish `neocom-front` on **Angular 22** (current latest stable at scaffold) with **TypeScript**
- Require **nvm** with Node satisfying Angular engines and alias **`neocom`** → pinned Node (24.21.0)
- Require unit tests via Angular CLI default (**Vitest**) and acceptance tests via **Cypress + Cucumber**
- Document local **dev** against **WireMock** (no `neocom-back`)
- Record the same constraints in `neocom-meta` L2 infrastructure specs

## Capabilities

### New Capabilities

- `front-toolchain`: Frontend application toolchain and local developer environment for `neocom-front` (framework, language, Node/nvm, unit and acceptance testing)

### Modified Capabilities

- *(none)*

## Impact

- Owning submodule: **`neocom-front`**
- Programme/docs: **`neocom-meta`** (`05.REQUIREMENTS-DECOMPOSITION/L2`, programme definition)
- Parent README developer instructions (nvm alias, install, start)
- Out of scope: Login/Initialization product behavior; real `neocom-back` implementation; WireMock stub catalog details beyond the requirement to use WireMock in front `dev`
