# Proposal

## Why

SSO needs named environment variables and a deployment path for the client id and secret. Source: INFRA-041 and INFRA-042 in `L2/INFRASTRUCTURE-SPECS.md`.

## What Changes

- Define `EVE_SSO_CLIENT_ID`, `EVE_SSO_CLIENT_SECRET`, `EVE_SSO_CALLBACK_URL`, and `EVE_SSO_SCOPES`
- Hold client id and secret in the front configuration file per environment locally
- Supply those same entries from Kubernetes secrets when deployment is ready

## Capabilities

### New Capabilities

- `infra/sso-config`: SSO environment variables and Kubernetes secret mapping for the client id and secret

### Modified Capabilities

- *(none)*

## Impact

- Owning docs: **`neocom-meta`**; values consumed by **`neocom-front`** and **`neocom-back`**
- Related: INFRA-023 (secrets not committed) stays; this change names the SSO variables
- L2 IDs registered: INFRA-041, INFRA-042
