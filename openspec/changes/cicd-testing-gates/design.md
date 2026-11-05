# Design

## Approach

- Model unit and acceptance as separate CI jobs that may run in parallel.
- Make the SonarCloud job depend on both succeeding (and on coverage artifacts when analysis needs them).

## Decisions

| Topic | Decision |
| --- | --- |
| Parallelism | Unit and acceptance MAY run in parallel |
| Sonar start | After both test jobs pass |
| Delivery branch | `feature/testing-gates` from `develop` (per owning repo) |

## Risks

- Existing `cicd-pipeline` jobs may need rewiring; do not drop INFRA-031/034 acceptance/unit requirements when applying.
