# esi/sso Specification

## Purpose

EVE SSO Authorization Code contract and shared login cookies. Source: ESI-013 and ESI-014 in `L2/ESI/ESI-SSO.md`. Distinct from `esi/login` (PKCE, ESI-012).

## ADDED Requirements

### Requirement: Authorization Code flow

Login SHALL use the EVE SSO Authorization Code flow at https://developers.eveonline.com/docs/services/sso/. The authorize request SHALL send `response_type=code`, `client_id`, `redirect_uri`, `scope`, and `state`. The token request SHALL use `grant_type=authorization_code` and the authorization `code`, authenticated with the client id and the client secret. The access token SHALL last about 20 minutes. The refresh token SHALL be long-lived and stay on the server. SSO SHALL return `state` unchanged, and the application SHALL check that it matches the value it sent (ESI-013).

#### Scenario: Authorize and token exchange parameters

- **WHEN** the application starts login
- **THEN** the authorize URL includes `response_type=code`, `client_id`, `redirect_uri`, `scope`, and `state`
- **AND** the token request uses `grant_type=authorization_code` with the client id and client secret

### Requirement: Three login cookies

Three cookies SHALL carry this login: `neocom_return`, `neocom_sso_state`, and `neocom_access`. All SHALL use `SameSite=Lax` and `Path=/` so the browser sends them on the top-level redirect back from EVE. `navigator.storage` SHALL stay unused (ESI-014).

#### Scenario: Cookies are sent on the EVE redirect

- **WHEN** EVE redirects the browser to the registered callback
- **THEN** the browser can attach `neocom_sso_state` with `SameSite=Lax` and `Path=/`
