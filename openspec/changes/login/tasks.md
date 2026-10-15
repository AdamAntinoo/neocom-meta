# Tasks

## Front (`front/login`)

- [x] Guard routes on `neocom_access` and set `neocom_return` when the token is missing or expired (LOGIN-001)
- [x] Put client id, secret, and scopes in the front environment configuration for local development (LOGIN-002)
- [x] Reuse `OAuthEnabledComponent` / `BackgroundOauthEnabledComponent` so the login button calls `getLoginLink()` and writes `neocom_sso_state` (LOGIN-003, LOGIN-004)
- [x] Treat `neocom_access` as readable; clear it on `401`; allow the UI to switch a stored character name and id (LOGIN-005, LOGIN-006)
- [x] Build the login page with `app-info-panel`, validation message or EVE button, and footer (LOGIN-007)
- [x] Finish the callback page: progress, EXCEPTION on missing code or state mismatch, then open `neocom_return` on match (LOGIN-008)

## Back (`back/login`)

- [x] Construct `EsiTokenManager` with locked `FileTokenStorage('./tokens.json')` and `ssoTimeoutMs: 10_000`; gitignore `tokens.json` (BACK-014)
- [x] On matching `state`, call `addCharacter`, set `neocom_access`, and clear `neocom_return` and `neocom_sso_state` (BACK-015)
- [x] Reuse `getToken(characterId)` when the cookie names another stored character and rewrite `neocom_access` (BACK-016)
- [x] Replace `neocom_access` on refresh; respond `401` when the token cannot be replaced (BACK-017)

## ESI SSO (`esi/sso`)

- [x] Document and implement Authorization Code authorize and token exchange parameters with `state` verification (ESI-013)
- [x] Use cookies `neocom_return`, `neocom_sso_state`, and `neocom_access` with `SameSite=Lax` and `Path=/` (ESI-014)

## ESI tool PKCE (`esi/login`)

- [ ] Start PKCE token management for the ESI tool (ESI-012)
