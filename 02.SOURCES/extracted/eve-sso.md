# EVE Single Sign-On (SSO)

- URL: https://developers.eveonline.com/docs/services/sso/
- Fetched: 2026-10-12

## Summary

EVE SSO is an OAuth 2.0 service that lets players sign in to third-party apps with EVE credentials and authorize scoped access to character data via ESI, without sharing account passwords. Apps register on the Developers Portal, redirect users through SSO for login/character/scope consent, exchange an authorization code for access + refresh tokens, then call ESI. Two authorization-code variants are documented: confidential (client secret) and PKCE (no secret). Access tokens are JWTs that must be validated.

## Requirements

### Registration and consent

- Developers **must** register the application on the EVE Online Developers Portal to obtain client ID and secret.
- User **must** explicitly consent to all requested scopes (or cancel).
- Applications may **only** request scopes assigned at application registration.
- Application can **only** access data the user consented to; players can revoke access.

### Tokens and secrets

- Client ID is public; **client secret must be kept private**.
- Access token is **time-limited**; valid only for consented character + scopes.
- Refresh token is **long-lived**; can obtain new access tokens until user revokes access; **must be kept secure**.
- Authorization code is **one-time**, short-lived.

### Redirect and CSRF

- Redirect URL **must** be registered with the application; any other URL is **rejected**.
- Application **must** send a random `state` and **must** verify it on return (CSRF prevention).

### Endpoints

- Resolve authorization, token, and JWKS URLs from well-known metadata: `https://login.eveonline.com/.well-known/oauth-authorization-server`.
- URLs may change; **recommended** to always fetch from well-known (safe/recommended to cache reasonably).

### Authorization Code flow (confidential / server-side secret)

- Suitable when the client secret can be stored securely server-side.
- Authorize query: `response_type=code`, `client_id`, `redirect_uri`, `scope`, `state`.
- Token POST: `grant_type=authorization_code`, `code`; authenticate with **HTTP Basic** (client id:secret).
- Docs examples use hosts `https://login.eveonline.com/v2/oauth/authorize` and `.../v2/oauth/token` (prefer metadata discovery).

### Authorization Code with PKCE

- Enhanced authorization-code flow; aimed at mobile/desktop apps that **cannot securely store** the client secret.
- See `eve-sso-pkce.md` for challenge/verifier and token payload details.

### JWT validation (access token)

- Verify signature using SSO JWKS (discover JWKS URI via metadata; do not assume static URI).
- `iss` must be `https://login.eveonline.com/` or `login.eveonline.com`; reject others.
- `aud` must include both application `client_id` and `"EVE Online"`.
- Check `exp`; if expired, use refresh token for a new access token.

### Claims (after verification)

- `sub`: `CHARACTER:EVE:<character_id>`
- `name`: character name
- `scp`: array of granted scopes

### UX

- Use official “Log in with EVE Online” button images from the docs for consistency.

## Concepts / tokens

- OAuth 2.0, Authorization Code, PKCE
- client_id, client_secret, scopes, redirect_uri, state
- authorization_code, access_token, refresh_token
- ESI, JWT, JWKS, well-known oauth-authorization-server
- Claims: `iss`, `aud`, `exp`, `sub`, `name`, `scp`

## Implications for NEOCOM

- **Login (`FEAT-LOGIN`)**: EVE SSO is the identity path; programme already points at authorization code + PKCE for public/native clients.
- **neocom-back**: owns secure handling of secrets (if confidential flow), refresh tokens, JWT validation, and ESI calls with access tokens.
- **neocom-front**: owns login CTA / redirect start and callback UX; PKCE verifier/challenge participation depends on chosen architecture (public client vs BFF).
- **neocom-meta**: keep this extract; promote durable decisions via Spec Collect / OpenSpec—do not invent scopes or redirect URIs here.

## Open questions

- Confidential Authorization Code (back holds secret) vs PKCE-only (or hybrid BFF)—which architecture for NEOCOM?
- Exact redirect URI(s) and registered scopes for MVP Login.
- Refresh-token storage location (back-only vs other)—docs require security but do not prescribe NEOCOM storage.
