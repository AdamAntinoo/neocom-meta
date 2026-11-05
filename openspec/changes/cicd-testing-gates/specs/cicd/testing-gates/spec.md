# cicd/testing-gates Specification

## Purpose

CI/CD ordering of unit testing, acceptance testing, and SonarCloud quality-gate. Source: GATE-001 … GATE-003 in `L2/CICD/02.TESTING-GATES.md`.

## ADDED Requirements

### Requirement: Unit and acceptance may run in parallel

CI/CD unit-testing and acceptance-testing tasks **MAY run in parallel** (GATE-001).

#### Scenario: Parallel test jobs

- **WHEN** a pipeline runs unit and acceptance tasks
- **THEN** those tasks are separate
- **AND** they are allowed to run at the same time

### Requirement: Both tests before Sonar

Both unit testing and acceptance testing SHALL complete successfully before the **SonarCloud analysis / quality-gate** step (GATE-002).

#### Scenario: Sonar waits for tests

- **WHEN** unit or acceptance has not succeeded
- **THEN** the SonarCloud analysis / quality-gate step does not run as complete

### Requirement: Sonar starts only after tests and artifacts

The Sonar gate SHALL NOT start until those test tasks have passed (and their coverage artifacts are available when the analysis requires them) (GATE-003).

#### Scenario: Coverage artifacts ready for Sonar

- **WHEN** Sonar analysis requires coverage artifacts
- **THEN** the Sonar step starts only after the producing test tasks have passed
- **AND** those artifacts are available to the analysis
