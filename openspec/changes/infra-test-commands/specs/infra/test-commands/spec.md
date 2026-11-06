# infra/test-commands Specification

## Purpose

Shared catalog of stable testing commands across NEOCOM projects. Source: INFRA-060 … INFRA-064 in  §I.

## ADDED Requirements

### Requirement: Shared testing command catalog

There SHALL be a **catalog of stable, common testing commands** shared across NEOCOM projects. Names SHALL be **short and clear** (INFRA-060).

#### Scenario: Catalog is discoverable

- **WHEN** a developer or agent looks up how to run tests
- **THEN** a documented catalog of short command names is available

### Requirement: Shared names across front and back

Front and back MAY differ in how each command is implemented, but the catalog names and intent SHALL stay the same so agents and developers use one vocabulary (INFRA-061).

#### Scenario: Same name different implementation

- **WHEN** the catalog names a TDD command
- **THEN** front and back may implement it differently
- **AND** the name and intent remain the same

### Requirement: TDD BDD and SDD layers

The catalog SHALL cover separately: **TDD** — unit testing — project unit runner (e.g. Vitest on front, Vitest on back); **BDD** — acceptance testing — Cypress with Gherkin; **SDD** — integration / full automated UI testing — defined later; SHALL cover cross-cutting automated UI tests beyond acceptance scenarios (INFRA-062).

#### Scenario: Layers are separate entries

- **WHEN** the catalog is read
- **THEN** TDD, BDD, and SDD appear as separate entries
- **AND** SDD may be marked defined later until tooling exists

### Requirement: Environment setup per entry

Each catalog entry SHALL include the **environment setup** required to run that layer (for example Node/nvm, WireMock or mocks, app under test, Cypress binary) (INFRA-063).

#### Scenario: BDD entry lists setup

- **WHEN** a developer reads the BDD catalog entry
- **THEN** required setup (e.g. nvm, mocks, app under test, Cypress) is listed

### Requirement: Run all layers in sequence

There SHALL also be a command that runs **all testing layers in sequence** (TDD, then BDD, then SDD when defined), after applying the setup each layer needs (INFRA-064).

#### Scenario: Run-all order

- **WHEN** the run-all testing command is invoked
- **THEN** TDD runs first, then BDD, then SDD when defined
- **AND** each layer's setup is applied before that layer runs
