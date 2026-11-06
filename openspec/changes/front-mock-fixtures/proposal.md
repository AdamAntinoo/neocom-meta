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
- Requirement ids: FIX-001 … FIX-004 
- Source extract: 
- Related: WireMock front-dev (`front-infrastructure` / INFRA-008); acceptance without live back (`cicd-pipeline`)
