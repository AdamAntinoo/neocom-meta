# front-toolchain Specification

## Purpose

Define the durable toolchain and local developer environment for `neocom-front`.

## ADDED Requirements

### Requirement: Angular framework

The `neocom-front` application SHALL be implemented with the **Angular** framework.

#### Scenario: Framework identity

- **WHEN** a developer inspects the front application dependencies
- **THEN** the project uses `@angular/*` packages as the UI framework

### Requirement: Current latest stable Angular

The Angular major/minor line SHALL be the **current latest stable** version at scaffold or intentional upgrade time (initially **22.2.x**).

#### Scenario: Version recorded

- **WHEN** the front project is initialized or upgraded
- **THEN** `package.json` Angular packages reflect the chosen latest stable line
- **AND** programme/L2 docs record that version

### Requirement: TypeScript language

Application and test source for `neocom-front` SHALL be written in **TypeScript**.

#### Scenario: TypeScript project

- **WHEN** a developer opens the front application sources
- **THEN** application code uses TypeScript (`.ts`) and a TypeScript compiler configuration is present

### Requirement: Vitest unit tests

Unit tests SHALL run via the Angular CLI default unit-test runner (**Vitest** on Angular 22).

#### Scenario: Unit test command

- **WHEN** a developer runs `npm test` in `neocom-front`
- **THEN** the Vitest-based Angular unit-test target executes

### Requirement: Cypress and Cucumber acceptance tests

Acceptance tests SHALL use **Cypress** with **Cucumber** (Gherkin `.feature` files and step definitions).

#### Scenario: Acceptance layout

- **WHEN** a developer inspects acceptance test assets
- **THEN** Cypress is configured
- **AND** feature files and Cucumber step definitions exist under the front project
- **AND** `npm run e2e` invokes Cypress

### Requirement: nvm Node version and neocom alias

Developers SHALL use **nvm** with a Node.js version that satisfies Angular’s engines (`^22.22.3 || ^24.15.0 || >=26.0.0`). An nvm alias named **`neocom`** SHALL point to the approved Node version for the NEOCOM environment (initially **24.21.0**, also recorded in `.nvmrc`).

#### Scenario: Activate neocom Node

- **WHEN** a developer runs `nvm use neocom` (after installing and aliasing per project docs)
- **THEN** the active Node version matches the approved NEOCOM pin
- **AND** it is compatible with the project’s Angular engines

### Requirement: WireMock for front dev

The front **dev** configuration SHALL use **WireMock** to mock backend HTTP APIs and SHALL NOT require a running `neocom-back` instance for local UI development.

#### Scenario: Dev without backend

- **WHEN** a developer starts front `dev` with WireMock running
- **THEN** the UI can be developed against mocked HTTP responses without `neocom-back`
