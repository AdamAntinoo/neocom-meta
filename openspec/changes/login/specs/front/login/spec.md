# front/login Specification

## Purpose

Front SSO login: guard, authorize link, cookies, login page, and callback. Source: LOGIN-001 … LOGIN-008 in `L2/FRONT/06.LOGIN.md`.

## ADDED Requirements

### Requirement: Guard and return URL

A guarded page SHALL start login when `neocom_access` is missing or its `Max-Age` has elapsed. The front filter SHALL write the current URL into `neocom_return` and send the browser to the login page. After login completes, the browser SHALL return to that URL. `neocom_return` SHALL use `Path=/` and `SameSite=Lax`, and SHALL last until the callback redirects or 20 minutes (LOGIN-001).

#### Scenario: Missing access cookie sends the user to login

- **WHEN** a guarded page loads and `neocom_access` is absent
- **THEN** `neocom_return` holds the current URL
- **AND** the browser opens the login page

### Requirement: Development registration and scopes

The development registration SHALL be named New Neocom Infinity. The callback SHALL be `http://localhost:6001/app/login-callback` because the front `base href` is `/app`. The client id SHALL be `4664722d6bd0415683a04519e738a5fc`. The client secret SHALL NOT be written in the epic. Locally the client id and the client secret SHALL be written in the front configuration file for that environment, in the clear. The first login SHALL request every registered scope name, joined with a single space. There SHALL be no wildcard and the request SHALL NOT send `esi-*`. The registered names SHALL be the list recorded in LOGIN-002 (LOGIN-002).

#### Scenario: Authorize link uses every registered scope

- **WHEN** the login page builds the authorize URL
- **THEN** `scope` is the registered names separated by spaces
- **AND** `redirect_uri` is the registered callback under `/app`

### Requirement: Authorize link from OAuthEnabledComponent

The login page SHALL reuse `OAuthEnabledComponent` through `BackgroundOauthEnabledComponent`. `getLoginLink()` SHALL call `composeLoginLink()`, which reads `environment.loginLinkData` and appends `response_type`, `client_id`, `state`, `redirect_uri`, and `scope`. The scope value SHALL be `environment.loginLinkData.scope`, the same `EVE_SSO_SCOPES` value. The page SHALL write that same `state` into `neocom_sso_state` before the browser leaves for EVE. The back SHALL NOT build the authorize URL (LOGIN-003).

#### Scenario: Login button opens the composed authorize URL

- **WHEN** the player activates the EVE login button
- **THEN** the href is `getLoginLink()`
- **AND** `neocom_sso_state` matches the `state` in that URL

### Requirement: SSO state cookie

`neocom_sso_state` SHALL use `Path=/` and `SameSite=Lax`. It SHALL hold the `state` from `getLoginLink()` and last until the callback accepts or rejects it, or 20 minutes. The callback SHALL reject the request when the query `state` differs from this cookie and SHALL NOT call `addCharacter`. On a match it SHALL clear `neocom_sso_state`. If the player cancels at EVE, the browser SHALL return with no code, the login page SHALL be shown again, and `neocom_return` SHALL stay (LOGIN-004).

#### Scenario: State mismatch rejects the callback

- **WHEN** the callback receives a `state` that does not match `neocom_sso_state`
- **THEN** `addCharacter` is not called
- **AND** the exception region is shown

### Requirement: Readable access cookie on the front

`neocom_access` SHALL be readable by the front. It SHALL NOT be `HttpOnly`. The value SHALL be the access token, the character name, and the character id. It SHALL use `Path=/`, `SameSite=Lax`, and `Max-Age=1200`. The front filter SHALL treat a missing cookie as token not present and an elapsed `Max-Age` as expired. The front SHALL NOT refresh the token and SHALL NOT run a timer. When the back answers `401`, the front SHALL delete `neocom_access` and return to the login page (LOGIN-005).

#### Scenario: 401 clears the access cookie

- **WHEN** the back responds `401`
- **THEN** `neocom_access` is deleted
- **AND** the browser returns to the login page

### Requirement: Character switch without a new login

The UI SHALL be able to change the active character without a new login. It SHALL write another character name and character id into `neocom_access` when that character is already stored. That SHALL NOT start a new SSO login (LOGIN-006).

#### Scenario: UI selects another stored character

- **WHEN** the player selects another stored character
- **THEN** `neocom_access` holds that character's name and id
- **AND** no new authorize request is opened

### Requirement: Login page

The login page SHALL follow `neocom-infinity-frontend` `v1-start-page`, with `app-info-panel` above that panel. `app-info-panel` SHALL show the application name in uppercase, the version, and the copyright from the front environment. The title SHALL be `NeoCom / SSO EVE Online`. While the page is checking the session it SHALL show `VALIDANDO AUTENTICACION DEL PILOTO...`. When there is no session it SHALL show the EVE login button, `cy-name="EVE-login-button"`, using `assets/media/eve-sso-login-white-large.png`, with href `getLoginLink()`. A footer SHALL carry the copyright line. The validation message and the login button SHALL be alternatives (LOGIN-007).

#### Scenario: No session shows the EVE button

- **WHEN** the login page has no session
- **THEN** the EVE login button is shown
- **AND** the validation message is not shown as the active alternative

### Requirement: Callback page

The callback page SHALL be required to finish login. It SHALL live in `neocom-front/src/app/pages/login-callback-page` and be served at `/login-callback`. EVE SHALL return the browser to `http://localhost:6001/app/login-callback?code=<authorization_code>&state=<state>`. The page SHALL follow `v1-login-validation-page`, keep `app-info-panel` at the top, show `Waiting for code authentication...` and the code or `-AWAITING-CODE-`, and show `Exception: EXCEPTION` when `code` is missing or `state` does not match. On a match the callback SHALL continue and the browser SHALL open `neocom_return` (LOGIN-008).

#### Scenario: Matching code and state continue login

- **WHEN** the callback receives a matching `code` and `state`
- **THEN** the progress region shows the authorization code
- **AND** the browser later opens `neocom_return`
