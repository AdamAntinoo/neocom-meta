# Design

## Approach

- Front environment file holds `EVE_SSO_CLIENT_ID` and `EVE_SSO_CLIENT_SECRET` in the clear on local development (INFRA-041, INFRA-042).
- Back reads the same client id and secret for the token exchange; `EVE_SSO_CALLBACK_URL` must match the registered callback; `EVE_SSO_SCOPES` is space-separated with no wildcard (INFRA-041).
- Deployment injects client id and secret from Kubernetes secrets into those configuration entries (INFRA-042).

## Decisions

| Topic | Decision |
| --- | --- |
| Local secrets | Cleartext in the front env file |
| Deployed secrets | Kubernetes secrets |
| Scope list | Space-separated registered names only |

## Risks

- Client secret must not be committed to git when deployment wiring lands.
