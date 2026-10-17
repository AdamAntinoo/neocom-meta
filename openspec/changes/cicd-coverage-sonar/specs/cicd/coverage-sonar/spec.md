# cicd/coverage-sonar Specification

## Purpose

Coverage measurement, quality-gate rules, and SonarCloud reporting. Source: COV-001 … COV-005 in `L2/CICD/01.COVERAGE-SONAR.md`.

## ADDED Requirements

### Requirement: Coverage measurement tool

The project SHALL provide a **tool to measure and control code testing coverage**. Coverage results SHALL be available to developers locally and in CI so gaps can be found before a feature is completed (COV-001).

#### Scenario: Developer sees coverage locally

- **WHEN** a developer runs the project's coverage command locally
- **THEN** coverage results are produced
- **AND** the same kind of results are available in CI

### Requirement: Quality-gate rules on coverage

The project SHALL define **quality-gate rules** that use coverage (and related test outcomes) to pass or fail a change. A feature SHALL NOT be considered complete when required gates fail (COV-002).

#### Scenario: Failed gate blocks completion

- **WHEN** a required quality gate fails for a change
- **THEN** the feature is not considered complete

### Requirement: Recorded thresholds and suites

Gate thresholds and which suites they apply to (unit, acceptance/Cypress, and any later layers) SHALL be recorded so agents and CI enforce the same rules (COV-003).

#### Scenario: Agents and CI share gate rules

- **WHEN** an agent or CI evaluates a change
- **THEN** it uses the recorded thresholds and suite mapping

### Requirement: Report to SonarCloud

NEOCOM projects SHALL **report to SonarCloud** so coverage, quality gates, and other quality findings are checked in one place (COV-004).

#### Scenario: Findings appear in SonarCloud

- **WHEN** a project analysis runs
- **THEN** findings are reported to SonarCloud

### Requirement: CI upload and Sonar gate completeness

CI SHALL upload analysis (and coverage where applicable) to SonarCloud; a change that fails the configured SonarCloud quality gate SHALL NOT be considered complete (COV-005).

#### Scenario: Failed Sonar gate blocks completion

- **WHEN** the configured SonarCloud quality gate fails for a change
- **THEN** that change is not considered complete
