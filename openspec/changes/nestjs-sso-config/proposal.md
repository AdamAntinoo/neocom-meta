# Proposal

## Why

NestJS on `neocom-back` needs named SSO environment variables and a deployment path for the client id and secret (ConfigModule / env contract). Source: INFRA-041 and INFRA-042 in . Change name: `nestjs-sso-config` (formerly `back-nestjs-sso-config`, earlier `infra-sso-config`).

## What Changes

- Define `EVE_SSO_CLIENT_ID`, `EVE_SSO_CLIENT_SECRET`, `EVE_SSO_CALLBACK_URL`, and `EVE_SSO_SCOPES`
- Hold client id and secret in the front configuration file per environment locally
- NestJS back reads those values via its configuration layer for the token exchange
- Supply those same entries from Kubernetes secrets when deployment is ready

## Capabilities

### New Capabilities

- `back/nestjs-sso-config`: NestJS SSO environment variables and Kubernetes secret mapping for the client id and secret

### Modified Capabilities

- *(none)*

## Impact

- Owning implementation: **`neocom-back`** (NestJS Config); docs in **`neocom-meta`**; local values also held by **`neocom-front`**
- Related: INFRA-023 (secrets not committed) stays; this change names the SSO variables for NestJS
- L2 IDs registered: INFRA-041, INFRA-042
- Replaces former change names `back-nestjs-sso-config` and `infra-sso-config`; capability remains `back/nestjs-sso-config`
