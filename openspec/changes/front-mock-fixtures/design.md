# Design

## Approach

- Capture HTTP/UI fixtures from real or developer runs; store as stable test assets.
- Adapters in the test environment are configurable and replaceable (e.g. WireMock mappings or committed stubs).
- Gherkin tags or steps select which fixture set Cypress uses for a scenario.

## Decisions

| Topic | Decision |
| --- | --- |
| Fixture source | Extracted from real / production-like runs |
| Variations | Happy path, errors, stale, incorrect data |
| Selection | Gherkin-selectable for Cypress |
| Delivery branch | `feature/mock-fixtures` from `develop` |

## Risks

- Fixture capture process must not commit secrets; redact before check-in.
