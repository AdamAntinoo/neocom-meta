# Design

## Approach

- Keep the existing `neocom-front/.github/workflows/build.yml` as the production-build job (INFRA-030, INFRA-033, INFRA-035, INFRA-038).
- Add unit, lint, and Cypress jobs only as separate tasks; do not expand CD.
- Local Kubernetes, started by `neocom-meta` scripts `k8s:start` and `k8s:dashboard`, is the deployment target named in L2. Remote promotion stays undefined (INFRA-036).

## Decisions

| Topic | Decision |
| --- | --- |
| Node | `.nvmrc` / alias `neocom` (24.21.0) |
| Front CI | unit tests, lint when defined, production build, Cypress + WireMock |
| Backend in front CI | Not required |
| CD | Out of scope until promotion rules exist |
| Local deploy target | Kubernetes via the meta `k8s:*` scripts |
| Delivery branch | `features/pipeline` from `develop` |

## Risks

- Cypress in CI needs a served app and WireMock. This change does not pick the job image.
