# EVE SSO — Authorization Code with PKCE

- URL: https://developers.eveonline.com/docs/services/sso/#authorization-code-with-pkce
- Fetched: 2026-10-12

## Summary

PKCE extends the OAuth 2.0 Authorization Code flow for clients that cannot securely store a client secret (docs: mostly mobile and desktop). The app proves possession of a secret code verifier at token exchange instead of using HTTP Basic with the client secret. Challenge method required by the docs is `S256`.

## Requirements

### Applicability

- Use when the application **cannot securely store** the client secret.
- Docs note: **do not use the client secret** in this flow’s token request.

### Code verifier and challenge

- Generate a **code verifier**: 32 random bytes, base64url-encoded; keep secret until token exchange.
- Generate a **code challenge**: SHA-256 hash of the verifier, then base64url-encode **without padding** (strip trailing `=`), per RFC 4648 as stated in the docs.
- Send the challenge on the authorize request; send the verifier on the token request.

### Authorize request (query parameters)

- `code_challenge=` — generated challenge
- `code_challenge_method=S256`
- `response_type=code`
- `client_id=<your_client_id>`
- `redirect_uri=<your_redirect_uri>` — must match a registered redirect URL
- `scope=` — space-separated scopes; user must consent
- `state=<random_string>` — must verify on callback (CSRF)

### After redirect

- Verify `state` matches the value sent.
- Exchange code at `token_endpoint` with form-encoded body:
  - `grant_type=authorization_code`
  - `code=`
  - `code_verifier=`
  - `client_id=<your_client_id>`
- Response: access token and refresh token; **verify** the access token (JWT rules on the parent SSO page).

### Shared SSO constraints still apply

- App registration on Developers Portal; scopes limited to registration + user consent.
- Unregistered redirect URLs rejected.
- Prefer endpoint discovery via `https://login.eveonline.com/.well-known/oauth-authorization-server`.

## Concepts / tokens

- PKCE, code_verifier, code_challenge, `code_challenge_method=S256`
- Authorization code, access_token, refresh_token
- `client_id` (no secret in token exchange for this flow)
- `state`, `redirect_uri`, scopes

## Implications for NEOCOM

- Programme feature **Login** already targets authorization code + PKCE for public/native clients — this section is the primary normative source for that path.
- **neocom-front**: likely generates/stores verifier for the authorize round-trip if acting as public client; or receives callback and forwards code to back if BFF holds verifier.
- **neocom-back**: token exchange and JWT validation fit server-side even when PKCE is used (verifier may be passed from front for a single exchange, or generated server-side if authorize is started via back)—architecture choice not dictated by CCP beyond the OAuth parameters above.
- Do not invent NEOCOM-specific scope lists or redirect hosts from this page alone.

## Open questions

- Is the Angular SPA treated as a public PKCE client end-to-end, or does Nest (candidate back) act as BFF starting authorize / holding verifier?
- Where is the code verifier stored between authorize redirect and callback (session, memory, back)?
- Are “mobile and desktop” the only intended PKCE clients per CCP, or is SPA PKCE explicitly accepted? (Docs emphasize mobile/desktop; SPA use is a NEOCOM architecture decision.)
