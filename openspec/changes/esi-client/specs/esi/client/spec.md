# esi/client Specification

## Purpose

Use `@lgriffin/esi.ts` in `neocom-esi`. References to `esijs` are removed. Source: `L2/ESI/ESI-CLIENT.md`.

## ADDED Requirements

### Requirement: Explore @lgriffin/esi.ts

The documentation of `@lgriffin/esi.ts` SHALL be explored to see whether it is useful for the NEOCOM tool (ESI-006). References to `esijs` SHALL be removed.

#### Scenario: The selected client is reviewed

- **WHEN** the ESI client is considered for NEOCOM
- **THEN** the documentation of `@lgriffin/esi.ts` has been explored for usefulness
- **AND** `esijs` is not part of the requirement

### Requirement: Download @lgriffin/esi.ts documentation

The documentation for `@lgriffin/esi.ts` SHALL be downloaded (ESI-007).

#### Scenario: Documentation is obtained

- **WHEN** `@lgriffin/esi.ts` is taken into `neocom-esi`
- **THEN** its documentation has been downloaded

### Requirement: Install @lgriffin/esi.ts into neocom-esi

`@lgriffin/esi.ts` SHALL be installed into `neocom-esi` (ESI-008).

#### Scenario: The package is a neocom-esi dependency

- **WHEN** `neocom-esi` dependencies are installed
- **THEN** `@lgriffin/esi.ts` is one of them

### Requirement: Keep documentation links in neocom-esi

`neocom-esi` SHALL have a `doc` folder containing the URL links to `@lgriffin/esi.ts` as the documentation reference (ESI-009).

#### Scenario: The doc folder names the tool

- **WHEN** a developer looks up the ESI client documentation from the repository
- **THEN** `neocom-esi/doc` contains the URL links to `@lgriffin/esi.ts`

### Requirement: ESI requirements are implemented in neocom-esi

Requirements that concern ESI SHALL be implemented in `neocom-esi` (ESI-010).

#### Scenario: An ESI requirement has a home

- **WHEN** a requirement concerns ESI
- **THEN** its implementation is in `neocom-esi`
