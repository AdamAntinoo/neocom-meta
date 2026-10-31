# Backend login

System: `back`. Feature: `login`.
OpenSpec change: `login` → `specs/back/login/spec.md`.

Moved here from `L2/01.EPIC-LOGIN-PROCEDURE/back.md`.

| ID | Status | Requirement |
| --- | --- | --- |
| BACK-014 | registered | The back uses `EsiTokenManager` from `@lgriffin/esi.ts` and `FileTokenStorage('./tokens.json', { lock: true })`, including when only one back process is running. Writes go to a temporary file, then a rename, mode `0600`. The lock adds `tokens.json.lock` for each write and `tokens.json.<characterId>.lock` for each refresh. `ssoTimeoutMs` is 10 seconds, below the lock `staleMs` of 30 seconds. `tokens.json` is gitignored. The lock files sit next to that path. The guide is `neocom-back/doc/lgriffin-esi.ts/guides/AUTHENTICATION.md`. The back controls expiration and replacement of the access token. The manager refreshes a token that is near expiry, coalesces concurrent refreshes for one character, and stores the rotated refresh token before it returns the new access token. The refresh token stays in `FileTokenStorage` on the back |
| BACK-015 | registered | On a matching `state`, the back calls `tokens.addCharacter(code)`. That exchanges the code and writes the character. `addCharacter` returns `characterName` and `characterId`. `getToken(characterId)` returns that character's access token. The back then sets `neocom_access` with the access token, the character name, and the character id. The cookie uses `Path=/`, `SameSite=Lax`, and `Max-Age=1200`, and is not `HttpOnly`. The callback then clears `neocom_return` and `neocom_sso_state` |
| BACK-016 | registered | Several characters can sit in the same token file. A later request calls `getToken` with the character id in `neocom_access`. When the UI has written another stored character's name and id into the cookie, the back reuses the token in `FileTokenStorage` and rewrites `neocom_access` with that character's access token, name, and id |
| BACK-017 | registered | While the cookie is present, the back calls `tokens.getToken` with the character id from `neocom_access`. When the manager refreshes the access token, the back replaces `neocom_access` and the 20 minutes start over. When the back cannot replace the token, it responds `401` |

## UNREGISTERED REQUIREMENTS
