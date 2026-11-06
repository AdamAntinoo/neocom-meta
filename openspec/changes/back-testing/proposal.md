# Proposal

## Why

EPIC-003 extends the same testing guidelines to `neocom-back`, with WireMock (or equivalent) for stable upstream mocks, case-by-case live vs mock decisions, and Gherkin/Cucumber for backend BDD acceptance.

## What Changes

- Align back with front testing guidelines (SDD→BDD→TDD, coverage/gates, Sonar, command catalog intent, fixtures where applicable)
- Use mocked sources / WireMock for stable acceptance and integration data
- Allow real Universe ESI feeds when acceptable; record other mock-vs-live choices per scenario
- Express backend BDD acceptance in Gherkin with Cucumber (or equivalent BDD runner)

## Capabilities

### New Capabilities

- `back/testing`: Backend testing guidelines, mocks, and Gherkin acceptance

### Modified Capabilities

- *(none)*

## Impact

- Owning repository: **`neocom-back`**
- Requirement ids: BTEST-001 … BTEST-005 
- Source extract: 
- Related: front methodology (`front-bdd-cypress`, `cicd-coverage-sonar`, `infra-test-commands`, `front-mock-fixtures`)
