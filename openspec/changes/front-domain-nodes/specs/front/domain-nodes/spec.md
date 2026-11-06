# front/domain-nodes Specification

## Purpose

Front NeoCom classes that represent domain objects in the UI tree: file naming, path alias, render registration identity, hierarchy children, and Blueprint wire. Source: UI-DOM-001…005 in EPIC-006 (DEF-BLP-007…013).

## ADDED Requirements

### Requirement: Domain node file naming

Front NeoCom domain object files SHALL be named `<object>-v<n>.node.ts` under a `domain` module folder (example: Blueprint → `blueprint-v1.node.ts`) (UI-DOM-001).

#### Scenario: Blueprint node file name

- **WHEN** a front NeoCom class represents Blueprint v1
- **THEN** its file is `blueprint-v1.node.ts` under a `domain` module folder

### Requirement: Path alias @domain

TypeScript / Angular SHALL expose path alias **`@domain`** to that domain nodes root (UI-DOM-002).

#### Scenario: Import via @domain

- **WHEN** application code imports a front domain NeoCom node
- **THEN** it MAY use `@domain` / `@domain/*` instead of a deep relative path to the domain nodes root

### Requirement: Render registration name equals jsonClass

The **render registration name** SHALL be **exactly** the representing NeoCom class’s `jsonClass` (no parallel alias key) (UI-DOM-003).

#### Scenario: Registry lookup uses jsonClass

- **WHEN** a render registers for a domain NeoCom node
- **THEN** `registerRender` uses that class’s `jsonClass` string only
- **AND** lookup uses the same string

### Requirement: Hierarchy uses domain nodes and NeoCom children

Hierarchy (e.g. Region → SolarSystem → Blueprint) SHALL use domain Region / SolarSystem / Blueprint NeoCom nodes and `NeoCom` **children** (`addChild` / `getChildren`); SHALL NOT invent Lookup* or require Listing subclasses for counts (UI-DOM-004).

#### Scenario: Aggregate without Lookup types

- **WHEN** blueprints are aggregated by location
- **THEN** parents are domain Region / SolarSystem NeoCom nodes with children
- **AND** Lookup* hierarchy types are not used

### Requirement: Blueprint wire without npm BlueprintV1

Front Blueprint NeoCom SHALL NOT require published npm `neocom-domain` `BlueprintV1`; DTO/wire MAY use an internal `BlueprintV1DtoWire` (or successor) mapped into the front NeoCom node (UI-DOM-005).

#### Scenario: Wire maps into front node

- **WHEN** HTTP returns a blueprint DTO
- **THEN** the front MAY map via `BlueprintV1DtoWire` into the front NeoCom Blueprint node
- **AND** it does not require importing `BlueprintV1` from `neocom-domain` for that path
