# infra/local-config Specification

## Purpose

Local configuration for front development. Source: INFRA-020 … INFRA-026.

## ADDED Requirements

### Requirement: Dev HTTP target is WireMock

Front `dev` configuration SHALL point HTTP clients at the WireMock base URL and SHALL NOT point them at `neocom-back` (INFRA-020). WireMock port, mappings directory, and the start command SHALL be pinned in `neocom-front` once stubs exist (INFRA-021).

#### Scenario: Dev client uses WireMock

- **WHEN** the front application runs in `dev`
- **THEN** its HTTP base URL is the WireMock base URL

### Requirement: Local UI URL

The front serve URL for the local UI SHALL remain the Angular CLI default unless another URL is documented (INFRA-022). That default is typically `http://localhost:4200`.

#### Scenario: Undocumented serve URL

- **WHEN** no other local UI URL is documented
- **THEN** the front dev server uses the Angular CLI default

### Requirement: Environment files and secrets

Environment files for `dev`, and later `staging` or `prod`, SHALL be owned by the relevant submodule and named consistently. Secrets SHALL NOT be committed (INFRA-023).

#### Scenario: Secret is not in git

- **WHEN** a developer inspects the repository
- **THEN** credentials are not stored in committed environment files

### Requirement: Submodule pins

The parent `neocom` repository SHALL track product folders as git submodules, and SHA pins SHALL be updated when releasing coordinated changes (INFRA-024).

#### Scenario: Coordinated release updates pins

- **WHEN** a coordinated change is released
- **THEN** the parent records the new submodule SHAs

### Requirement: Sass embedded workaround

On hosts where `sass-embedded` cannot run, front scripts MAY set `NG_BUILD_SASS_EMBEDDED=0` so builds use pure-JS Sass (INFRA-025). Programme architecture docs SHALL stay under `neocom-meta/01.PROGRAMME-DEFINITION/` and stay aligned with the L2 register (INFRA-026).

#### Scenario: macOS workaround

- **WHEN** a host cannot run `sass-embedded`
- **THEN** the front build may set `NG_BUILD_SASS_EMBEDDED=0`
