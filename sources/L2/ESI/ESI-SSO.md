# ESI SSO Authorization Code

System: `esi`. Feature: `sso`.
OpenSpec change: `login` → `specs/esi/sso/spec.md`.

Moved here from `L2/01.EPIC-LOGIN-PROCEDURE/common.md`. Authorization Code capability under feature `login`. PKCE for the ESI tool is `specs/esi/login/spec.md` (ESI-012) in the same change.

| ID | Status | Requirement |
| --- | --- | --- |
| ESI-013 | registered | Login uses the EVE SSO Authorization Code flow at https://developers.eveonline.com/docs/services/sso/. The authorize request sends `response_type=code`, `client_id`, `redirect_uri`, `scope`, and `state`. The token request uses `grant_type=authorization_code` and the authorization `code`, authenticated with the client id and the client secret. The access token lasts about 20 minutes. The refresh token is long-lived and stays on the server. SSO returns `state` unchanged, and the application checks that it matches the value it sent |
| ESI-014 | registered | Three cookies carry this login: `neocom_return`, `neocom_sso_state`, and `neocom_access`. All use `SameSite=Lax` and `Path=/` so the browser sends them on the top-level redirect back from EVE. `navigator.storage` stays unused |

## UNREGISTERED REQUIREMENTS
