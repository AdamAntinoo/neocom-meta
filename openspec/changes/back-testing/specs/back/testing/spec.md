# back/testing Specification

## Purpose

Backend testing guidelines, mocked upstream sources, and Gherkin acceptance. Source: BTEST-001 … BTEST-005 in `L2/BACK/BACK-TESTING.md`.

## ADDED Requirements

### Requirement: Same testing guidelines as front

`neocom-back` SHALL follow the **same testing guidelines** as the front (SDD→BDD→TDD, coverage and quality gates, SonarCloud, shared command catalog intent, mock fixtures from real runs where applicable) (BTEST-001).

#### Scenario: Back follows shared testing intent

- **WHEN** testing guidelines are applied to `neocom-back`
- **THEN** SDD→BDD→TDD, coverage/gates, SonarCloud, shared command catalog intent, and fixtures where applicable are in scope for the back

### Requirement: WireMock for stable upstream data

Backend acceptance and integration scenarios that need **stable, predefined data** SHALL use **mocked sources**, with **WireMock** (or an equivalent HTTP mock) replacing upstream dependencies for those scenarios (BTEST-002).

#### Scenario: Upstream replaced by WireMock

- **WHEN** a backend acceptance scenario needs stable predefined upstream data
- **THEN** WireMock or an equivalent HTTP mock replaces that upstream dependency

### Requirement: Universe ESI may use real feeds

**Universe ESI** reference data MAY use **real ESI feeds** when that is acceptable for the scenario (BTEST-003).

#### Scenario: Live Universe ESI allowed

- **WHEN** a scenario accepts live Universe ESI reference data
- **THEN** the scenario MAY call real ESI feeds for that data

### Requirement: Case-by-case mock vs live recorded

Every other external source SHALL be decided **case by case** (mock vs live), and the choice SHALL be recorded for that scenario (BTEST-004).

#### Scenario: Choice recorded on the scenario

- **WHEN** a scenario uses an external source that is not Universe ESI under BTEST-003
- **THEN** mock vs live is decided for that scenario
- **AND** the choice is recorded with the scenario

### Requirement: Backend Gherkin BDD acceptance

Backend BDD acceptance tests SHALL use **Gherkin** with **Cucumber** (or another BDD runner that consumes the same Gherkin scenarios) so acceptance behaviour is expressed the same way as Cypress-driven front acceptance (BTEST-005).

#### Scenario: Backend acceptance in Gherkin

- **WHEN** a backend acceptance behaviour is specified
- **THEN** it is expressed as a Gherkin scenario
- **AND** Cucumber or an equivalent BDD runner consumes that scenario
