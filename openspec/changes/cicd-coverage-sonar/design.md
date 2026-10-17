# Design

## Approach

- Use each project's unit-test runner coverage output (e.g. Vitest coverage) locally and in CI.
- Record gate thresholds in programme or repo docs so agents and CI share one rule set.
- Upload analysis (and coverage when required) to SonarCloud; treat Sonar quality-gate failure as incomplete.

## Decisions

| Topic | Decision |
| --- | --- |
| Coverage tool | Project unit runner coverage (front/back Vitest or equivalent) |
| Quality findings hub | SonarCloud |
| Delivery branch | `feature/coverage-sonar` from `develop` (per owning repo) |

## Risks

- Exact numeric thresholds are not in L2; record them when applying without inventing product behaviour beyond “gates are defined and enforced”.
