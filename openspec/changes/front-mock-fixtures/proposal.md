# Proposal

## Why

EPIC-003 needs stable, realistic mock fixtures (including errors and stale/incorrect data) selected from Gherkin so Cypress can validate UI variations without live backends.

## What Changes

- Provide mocked scenarios with configurable, replaceable adapters in the test environment
- Prefer mock data extracted from real runs, including error and stale/incorrect presentations
- Keep fixtures stable and predefined while reflecting production-like shapes
- Allow Gherkin scenarios to select fixtures for Cypress validation

## Capabilities

### New Capabilities

- `front/mock-fixtures`: Real-run-derived fixtures and replaceable test adapters for Cypress

### Modified Capabilities

- *(none)*

## Impact

- Owning repository: **`neocom-front`** (adapters/fixtures); WireMock stubs as needed
- L2 IDs: FIX-001 … FIX-004 (`L2/FRONT/11.MOCK-FIXTURES.md`)
- Source extract: `L2/03.EPIC-TESTING.mock-fixtures.md`
- Related: WireMock front-dev (`front-infrastructure` / INFRA-008); acceptance without live back (`cicd-pipeline`)
