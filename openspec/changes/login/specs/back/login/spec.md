# back/login Specification

## Purpose

Back SSO token storage, code exchange, and `neocom_access` lifecycle. Source: BACK-014 … BACK-017 in `L2/BACK/BACK-LOGIN.md`.

## ADDED Requirements

### Requirement: Token manager and file storage

The back SHALL use `EsiTokenManager` from `@lgriffin/esi.ts` and `FileTokenStorage('./tokens.json', { lock: true })`, including when only one back process is running. Writes SHALL go to a temporary file, then a rename, mode `0600`. The lock SHALL add `tokens.json.lock` for each write and `tokens.json.<characterId>.lock` for each refresh. `ssoTimeoutMs` SHALL be 10 seconds, below the lock `staleMs` of 30 seconds. `tokens.json` SHALL be gitignored. The lock files SHALL sit next to that path. The guide SHALL be `neocom-back/doc/lgriffin-esi.ts/guides/AUTHENTICATION.md`. The back SHALL control expiration and replacement of the access token. The manager SHALL refresh a token that is near expiry, coalesce concurrent refreshes for one character, and store the rotated refresh token before it returns the new access token. The refresh token SHALL stay in `FileTokenStorage` on the back (BACK-014).

#### Scenario: Storage uses a locked tokens file

- **WHEN** the back stores or refreshes a character token
- **THEN** writes use `FileTokenStorage` with `lock: true` at `./tokens.json`
- **AND** `ssoTimeoutMs` is 10 seconds

### Requirement: Code exchange sets the access cookie

On a matching `state`, the back SHALL call `tokens.addCharacter(code)`. That SHALL exchange the code and write the character. `addCharacter` SHALL return `characterName` and `characterId`. `getToken(characterId)` SHALL return that character's access token. The back SHALL then set `neocom_access` with the access token, the character name, and the character id. The cookie SHALL use `Path=/`, `SameSite=Lax`, and `Max-Age=1200`, and SHALL NOT be `HttpOnly`. The callback SHALL then clear `neocom_return` and `neocom_sso_state` (BACK-015).

#### Scenario: Successful code exchange sets neocom_access

- **WHEN** `addCharacter` succeeds for a matching `state`
- **THEN** `neocom_access` holds the access token, character name, and character id
- **AND** `neocom_return` and `neocom_sso_state` are cleared

### Requirement: Several characters in one token file

Several characters SHALL be able to sit in the same token file. A later request SHALL call `getToken` with the character id in `neocom_access`. When the UI has written another stored character's name and id into the cookie, the back SHALL reuse the token in `FileTokenStorage` and rewrite `neocom_access` with that character's access token, name, and id (BACK-016).

#### Scenario: Selected character reuses stored token

- **WHEN** `neocom_access` names another character id already in `tokens.json`
- **THEN** `getToken` returns that character's access token
- **AND** the back rewrites `neocom_access` for that character

### Requirement: Refresh replaces the cookie or returns 401

While the cookie is present, the back SHALL call `tokens.getToken` with the character id from `neocom_access`. When the manager refreshes the access token, the back SHALL replace `neocom_access` and the 20 minutes SHALL start over. When the back cannot replace the token, it SHALL respond `401` (BACK-017).

#### Scenario: Failed replacement answers 401

- **WHEN** the back cannot replace the access token
- **THEN** the response status is `401`
