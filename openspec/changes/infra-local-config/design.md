# Design

## Approach

Register INFRA-020 … INFRA-026 without inventing values the L2 text leaves open. The typical serve URL is `http://localhost:4200` only as the Angular CLI default.

## Decisions

| Topic | Decision |
| --- | --- |
| Dev API | WireMock base URL, not `neocom-back` |
| Serve URL | Angular CLI default unless documented otherwise |
| Secrets | Never committed |
| Sass | `NG_BUILD_SASS_EMBEDDED=0` is an allowed workaround |
| Delivery branch | `features/local-config` from `develop` |

## Risks

- INFRA-021 cannot be implemented until stub files exist. The task stays open rather than picking a port.
