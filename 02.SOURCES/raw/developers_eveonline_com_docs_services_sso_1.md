---
source_url: "https://developers.eveonline.com/docs/services/sso/#authorization-code-with-pkce"
type: webpage
title: "Single Sign-On — Authorization Code with PKCE (section)"
captured_at: 2026-10-12T09:43:06+00:00
contributor: "neocom-meta extract (WebFetch enrichment; graphify scrape was truncated)"
---

# Authorization Code with PKCE

Source: https://developers.eveonline.com/docs/services/sso/#authorization-code-with-pkce

(Section of the EVE SSO documentation page.)

The Authorization Code flow with PKCE (Proof Key for Code Exchange) is an enhanced version of the Authorization Code flow. It is mostly aimed at mobile and desktop applications that cannot securely store the client secret.

## Flow summary

1. Generate a code challenge (from a secret code verifier).
2. Build authorize query string including code challenge, state, redirect URL, and scopes; redirect user to `authorization_endpoint`.
3. User authenticates and consents; SSO redirects to registered callback with authorization code and state.
4. Verify state.
5. POST to `token_endpoint` with authorization code, code verifier, and client ID (no client secret).
6. Receive access token and refresh token; verify the access token.

## Authorize parameters

- `code_challenge=` — challenge derived from verifier
- `code_challenge_method=S256` — SHA-256
- `response_type=code`
- `client_id=<your_client_id>`
- `redirect_uri=<your_redirect_uri>` — must match registered redirect URL
- `scope=` — space-separated; user must consent
- `state=<random_string>` — verify on return (CSRF)

## Token exchange parameters

- `grant_type=authorization_code`
- `code=` — one-time authorization code
- `code_verifier=` — secret used to derive challenge
- `client_id=<your_client_id>`

**Note from docs**: this flow does not use the client secret.

## Code verifier / challenge generation

- Verifier: 32 random bytes, base64url-encoded; keep secret until token exchange.
- Challenge: SHA-256(verifier), then base64url-encode **without padding** (strip `=`).

## Related SSO constraints (same page)

- Register application on EVE Online Developers Portal (client ID; secret exists but unused in PKCE token exchange as documented).
- Redirect URLs must be pre-registered; others rejected.
- Scopes limited to those assigned at registration and consented by the user.
- Resolve endpoint URLs from `https://login.eveonline.com/.well-known/oauth-authorization-server` (cache reasonably).
- Validate JWT access tokens (signature via JWKS, `iss`, `aud` including `client_id` and `"EVE Online"`, `exp`).
