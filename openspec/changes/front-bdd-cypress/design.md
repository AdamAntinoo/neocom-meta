# Design

## Approach

- Keep Cypress + Cucumber from `front-infrastructure` as the BDD runner.
- Treat documented `cy-*` attributes as the stable contract between UI and Gherkin steps.
- Feature completion requires passing Gherkin scenarios for the change, not only unit tests.

## Decisions

| Topic | Decision |
| --- | --- |
| Methodology | SDD → BDD → TDD; Gherkin from spec before complete |
| Selectors | Documented `cy-*` attributes (e.g. `cy-section-name`, `cy-field-value`, `cy-field-label`, `cy-name`) |
| Delivery branch | `feature/bdd-cypress` from `develop` |

## Risks

- Pilot-panel already defines PANEL-010/012 markers; this change is the general rule for all pages/panels under test — apply without rewriting those panel-specific IDs.
