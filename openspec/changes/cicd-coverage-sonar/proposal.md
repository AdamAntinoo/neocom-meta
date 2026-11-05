# Proposal

## Why

EPIC-003 requires measurable coverage, recorded quality-gate rules, and SonarCloud as the shared place for coverage and quality findings across NEOCOM projects.

## What Changes

- Provide a coverage measurement tool usable locally and in CI
- Define quality-gate rules (thresholds and which suites apply) that block feature completion on failure
- Report analysis and coverage to SonarCloud; failing Sonar gates block completion

## Capabilities

### New Capabilities

- `cicd/coverage-sonar`: Coverage control, quality-gate rules, and SonarCloud reporting

### Modified Capabilities

- *(none)*

## Impact

- Owning repositories: **`neocom-front`**, **`neocom-back`**, CI workflows; programme docs in `neocom-meta`
- L2 IDs: COV-001 … COV-005 (`L2/CICD/01.COVERAGE-SONAR.md`)
- Source extract: `L2/03.EPIC-TESTING.coverage-sonar.md`
- Companion: `cicd-testing-gates` (job order before Sonar); `cicd-pipeline` (existing unit/acceptance jobs)
