# domain/neocom-domain Specification

## Purpose

Shared business-domain module. Source: `L2/DOMAIN/01.NEOCOM-DOMAIN.md` (moved from an unregistered note on the infrastructure register).

## ADDED Requirements

### Requirement: Domain submodule

The repository https://github.com/AdamAntinoo/neocom-domain.git SHALL be added as a submodule, and domain objects SHALL be declared there (DOMAIN-001).

#### Scenario: Submodule is present

- **WHEN** a developer clones `neocom` with submodules
- **THEN** `neocom-domain` is present and tracks that remote

### Requirement: Node TypeScript domain package

`neocom-domain` SHALL be a Node component that declares TypeScript classes and other components of the NEOCOM business domain (DOMAIN-002).

#### Scenario: Domain types are TypeScript

- **WHEN** a developer inspects the domain package
- **THEN** business-domain types are TypeScript in that package

### Requirement: npm dependency for front and back

Front and back SHALL include this module by package dependency, and the module SHALL be published to npm (DOMAIN-003).

#### Scenario: Apps depend on the published package

- **WHEN** `neocom-front` or `neocom-back` declares its dependencies
- **THEN** the domain module is an npm package dependency
