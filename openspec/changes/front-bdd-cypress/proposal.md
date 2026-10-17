# Proposal

## Why

EPIC-003 requires an SDD→BDD→TDD design model and Cypress acceptance that validates page/panel content and UI through documented `cy-*` attributes, not only navigation flows.

## What Changes

- Adopt SDD→BDD→TDD: Gherkin scenarios from specs must pass before a feature is complete
- Cypress validates navigation, panel/item contents, and UI aspects via catalogued `cy-*` attributes
- Pages and panels under test expose those properties; Gherkin asserts against them

## Capabilities

### New Capabilities

- `front/bdd-cypress`: SDD→BDD→TDD methodology and Cypress UI/content validation via `cy-*`

### Modified Capabilities

- *(none)*

## Impact

- Owning repository: **`neocom-front`**
- L2 IDs: BDD-001 … BDD-004 (`L2/FRONT/10.BDD-CYPRESS.md`)
- Source extract: `L2/03.EPIC-TESTING.bdd-cypress.md`
- Related (not duplicated): Cypress+Cucumber toolchain (`front-infrastructure` / INFRA-005); pilot-panel-specific markers (PANEL-010/012)
- Out of scope: inventing new `cy-*` attribute names beyond those already documented in L2
