---
source_url: "https://developers.eveonline.com/docs/services/sso/"
type: webpage
title: "Single Sign-On - EVE Developer Documentation"
captured_at: 2026-10-12T09:43:06+00:00
contributor: "neocom-meta extract (WebFetch enrichment; graphify scrape was truncated)"
---

# Single Sign-On (SSO)

Source: https://developers.eveonline.com/docs/services/sso/

The EVE Single Sign-On (SSO) Service helps facilitate third-party application access for players. By leveraging the OAuth 2.0 protocol, the EVE SSO allows players to sign in to external websites, applications or tools using their EVE Online credentials. Furthermore, this provides a seamless and secure way for players to authorize third-party applications to access their EVE Online data through the ESI API, without exposing their account credentials.

The SSO ensures that third-party applications can obtain limited access to a character's data based on the permissions granted (also known as "scopes"). For instance, a third-party application may request access to a character's location, skill queue or wallet balance, but only if the player explicitly grants the application permission to do so. At the same time, scopes not granted by the player will not be accessible to the third-party application.

This secure, token-based access control mechanism ensures that players have full control over the data they share with third-party applications, and can revoke access at any time.

## How it works

The EVE SSO workflow is based on the OAuth 2.0 protocol.

1. **Application Registration**: Before using the SSO, developers must register their application with the EVE Online Developers Portal. This process generates a unique client ID and secret, which are used to authenticate the application with the SSO service.
2. **Authorization Request**: When a user wants to use a third-party application, the application redirects the user to the EVE SSO service. The user is prompted to log in with their EVE Online account, after which they select with which character they wish to continue, and to confirm the access scopes that will be granted to the application. The user must explicitly consent to all the requested scopes, or cancel the process.
3. **Authorization Code and Redirect**: If the user has selected a character, and consented to the requested scopes, the SSO service redirects the user back to the third-party application. The redirect contains an authorization code, which the application can use to obtain an access token.
4. **Token Exchange**: The third-party application sends the authorization code to the SSO service, along with the client ID and secret. In return, the SSO service returns an access token together with a refresh token. The access token is a time-limited token used to authenticate requests to the ESI API, while the refresh token can be used to obtain a new access token when the current one expires.
5. **Accessing the ESI API**: With the access token, the third-party application can now make requests to the ESI API on behalf of the user. The token is valid only for the character and scopes that the user has consented to, and until it expires.

## Terms and important notes

- **Client ID and Secret**: The client ID and secret are used to authenticate the application with the SSO service. The Client ID is public and can be shared, but the secret must be kept private.
- **Scopes**: Scopes are permissions that the user must grant to the application. The application can only access the data that the user has consented to. Applications can also only request scopes that they have assigned in the application registration.
- **Access Token**: The access token is a time-limited token that the application uses to authenticate requests to the ESI API. The token is only valid for the character and scopes that the user has consented to.
- **Refresh Token**: The refresh token is used to obtain a new access token when the current one expires. The refresh token is long-lived and can be used to obtain new access tokens indefinitely, as long as the user has not revoked the application's access. This token must be kept secure, as it can be used to obtain new access tokens.
- **Authorization Code**: The authorization code is a one-time code that the application exchanges for an access token. The code is only valid for a short period and can only be used once.
- **Redirect URLs**: The application must define a redirect URL where the user is sent after completing the authorization flow. The redirect URL must be registered with the application. Any other URL will be rejected by the SSO service.
- **State Parameter**: The state parameter is used to prevent CSRF attacks. The application generates a random string and includes it in the authorization request. The SSO service returns the same string in the redirect, and the application must verify that the state parameter matches the one it sent.
- **Endpoints**: The SSO service has several endpoints that applications interact with. These include the authorization endpoint, token endpoint, and the JWKS endpoint. The URLs for these endpoints can be retrieved from the SSO service's well-known endpoint: `https://login.eveonline.com/.well-known/oauth-authorization-server`. These URLs may change in the future, so it is recommended to always fetch them from the endpoint, however, it is safe (and recommended) to cache them for a reasonable amount of time.

## Authorization Flows

### Authorization Code

The Authorization Code flow is the most common OAuth 2.0 flow used with the EVE SSO service. It is suitable for web applications that can securely store the client secret on the server side.

**Authorize query parameters** (URL-encoded, appended to `authorization_endpoint`):

- `response_type=code`
- `client_id=<your_client_id>`
- `redirect_uri=<your_redirect_uri>` (must match a registered redirect URL)
- `scope=` (space-separated scopes; user must consent)
- `state=<random_string>` (must verify on return to prevent CSRF)

**Token request** (POST to `token_endpoint`, form-encoded):

- `grant_type=authorization_code`
- `code=` (authorization code from redirect)
- Authenticated with HTTP Basic using client ID and secret

Example authorize URL host in docs: `https://login.eveonline.com/v2/oauth/authorize`
Example token URL host in docs: `https://login.eveonline.com/v2/oauth/token`

(Prefer resolving endpoints from the well-known metadata URL rather than hard-coding.)

### Authorization Code with PKCE

The Authorization Code flow with PKCE (Proof Key for Code Exchange) is an enhanced version of the Authorization Code flow. It is mostly aimed at mobile and desktop applications that cannot securely store the client secret.

**Code challenge**: Application generates a code verifier (secret random string) and a code challenge (hashed verifier). Challenge goes in the authorize request; verifier goes in the token request. Client secret is not used in this flow.

**Authorize query parameters** (in addition to / overlapping Authorization Code params):

- `code_challenge=`
- `code_challenge_method=S256`
- `response_type=code`
- `client_id=<your_client_id>`
- `redirect_uri=<your_redirect_uri>`
- `scope=`
- `state=<random_string>`

**Token request payload** (form-encoded; no Basic auth with secret):

- `grant_type=authorization_code`
- `code=`
- `code_verifier=`
- `client_id=<your_client_id>`

**Creating a code challenge** (per docs):

- Code verifier: generate 32 random bytes and base64url-encode them; store for later exchange.
- Code challenge: SHA-256 hash the code verifier, then base64url-encode without padding (RFC 4648; strip trailing `=`).

## Validating JWT Tokens

Access tokens are JWTs. To ensure validity: verify signature, check expiration, ensure the token is intended for your application.

### Signature Verification

Fetch public keys from the SSO JWKS endpoint. Prefer: fetch metadata from well-known endpoint first, then fetch JWKS from the URI in metadata. JWKS URI is not guaranteed static.

### Issuer Verification

`iss` should match issuer URL of the SSO service: `https://login.eveonline.com/`. In some cases `login.eveonline.com` may be used; check for both and reject others.

### Audience

`aud` should be an array containing both the application's `client_id` and the static value `"EVE Online"`. Reject tokens that do not match.

### Expiration Time

`exp` is Unix timestamp. If expired, request a new token using the refresh token.

## JWT Token Claims

- `sub`: format `CHARACTER:EVE:<character_id>` — character ID
- `name`: character name
- `scp`: array of granted scopes

## Log in with EVE Online buttons

When creating a button to direct users to log in with the EVE SSO, use one of the official images provided on the documentation page for consistency among third-party applications.
