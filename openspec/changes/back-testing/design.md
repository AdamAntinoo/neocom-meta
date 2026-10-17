# Design

## Approach

- Mirror front testing intent on back: same methodology and gates, back-specific runners.
- Prefer WireMock (or equivalent HTTP mock) for upstream dependencies needing stable data.
- Universe ESI may stay live when the scenario allows; document every other live vs mock choice.

## Decisions

| Topic | Decision |
| --- | --- |
| HTTP mock | WireMock or equivalent |
| Universe ESI | MAY use real feeds when acceptable |
| BDD runner | Gherkin + Cucumber (or runner that consumes same Gherkin) |
| Delivery branch | `feature/testing` from `develop` in `neocom-back` |

## Risks

- Exact Cucumber vs other Gherkin runner is left open by L2; choose at apply without changing “same Gherkin scenarios” intent.
