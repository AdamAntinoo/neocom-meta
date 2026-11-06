# Proposal

## Why

EPIC-003 requires unit and acceptance CI tasks to be separable (and optionally parallel) and to finish successfully before SonarCloud analysis starts.

## What Changes

- Allow unit-testing and acceptance-testing CI tasks to run in parallel
- Require both to succeed before SonarCloud analysis / quality-gate
- Do not start Sonar until those tasks passed and coverage artifacts are available when required

## Capabilities

### New Capabilities

- `cicd/testing-gates`: Ordering of unit, acceptance, and SonarCloud steps

### Modified Capabilities

- *(none)* — extends intent of `cicd-pipeline` without replacing INFRA-030…039

## Impact

- Owning repositories: CI workflows in **`neocom-front`** / **`neocom-back`**
- Requirement ids: GATE-001 … GATE-003 
- Source extract: 
- Companion: `cicd-coverage-sonar`, `cicd-pipeline`
