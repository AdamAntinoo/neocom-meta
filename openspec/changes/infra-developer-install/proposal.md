# Proposal

## Why

Front work depends on a repeatable clone and install path. Those steps are written in L2 and are not in an OpenSpec change yet.

## What Changes

- Require a recursive clone of https://github.com/AdamAntinoo/neocom.git
- Require `neocom-meta` and `neocom-front` for front work
- Require nvm, the `neocom` Node alias, and `npm install` in `neocom-front`
- Require WireMock for local front `dev`, and do not require `neocom-back`
- Keep OpenSpec CLI and Graphify optional for UI install

## Capabilities

### New Capabilities

- `infra/developer-install`: Clone, submodule, Node, and local mock install for front development

### Modified Capabilities

- *(none)*

## Impact

- Docs in the parent repo and `neocom-meta`
- Out of scope: product UI behavior and the optional OpenSpec/Graphify install itself
