# Proposal

## Why

NEOCOM login spans the front, the back, and the ESI SSO contract. Those pieces were registered as separate changes (`front-login`, `back-login`, `esi-sso`, `esi-login`). They are one feature: authenticate with EVE SSO and establish a session.

## What Changes

- Front: auth guard, authorize URL, cookies, login page, and callback (LOGIN-001 … LOGIN-008)
- Back: `EsiTokenManager` / `FileTokenStorage`, code exchange, `neocom_access`, refresh, multi-character reuse (BACK-014 … BACK-017)
- ESI SSO: Authorization Code flow and the three shared cookies (ESI-013, ESI-014)
- ESI login: PKCE token management for the ESI tool (ESI-012), kept as a capability under this feature

## Capabilities

### New Capabilities

- `front/login`: Guard, authorize link, front cookies, login page, callback
- `back/login`: Token storage, code exchange, access cookie lifecycle
- `esi/sso`: Authorization Code contract and shared cookie names
- `esi/login`: PKCE token management for the ESI tool

### Modified Capabilities

- *(none)*

## Impact

- Owning repositories: **`neocom-front`**, **`neocom-back`**; ESI tool notes may touch **`neocom-esi`** for ESI-012
- Related OpenSpec (stays separate): `infra-sso-config` (INFRA-041…042)
- Delivery branch: `feature/login` from `develop`
- Supersedes the former change folders `front-login`, `back-login`, `esi-sso`, and `esi-login`
