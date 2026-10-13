# infra/developer-install Specification

## Purpose

Developer installation for front work. Source: INFRA-010 … INFRA-016.

## ADDED Requirements

### Requirement: Recursive clone

The parent repository SHALL be obtained with `git clone --recurse-submodules` of `https://github.com/AdamAntinoo/neocom.git`, or with `git submodule update --init --recursive` after a plain clone (INFRA-010). Front work SHALL have the submodules `neocom-meta` and `neocom-front` present (INFRA-011).

#### Scenario: Front submodules exist after clone

- **WHEN** a developer clones the parent repository with submodules
- **THEN** `neocom-meta` and `neocom-front` are present

### Requirement: Node and front dependencies

The developer SHALL install nvm, install Node from `neocom-front/.nvmrc`, and create or update the alias `neocom` before installing the front (INFRA-012). Front dependencies SHALL be installed with `npm install` under `neocom-front` while `nvm use neocom` is active (INFRA-013).

#### Scenario: Install under the neocom alias

- **WHEN** a developer installs front dependencies
- **THEN** Node is the `.nvmrc` version selected by the `neocom` alias
- **AND** `npm install` runs in `neocom-front`

### Requirement: WireMock without the backend

WireMock SHALL be available for local front `dev` (INFRA-014). `neocom-back` SHALL NOT be required to install or run front `dev` (INFRA-015). OpenSpec CLI and Graphify SHALL be documented separately and SHALL NOT block front UI install (INFRA-016).

#### Scenario: Front dev install does not need the backend

- **WHEN** a developer installs and runs front `dev`
- **THEN** WireMock is the documented mock server
- **AND** `neocom-back` is not required
