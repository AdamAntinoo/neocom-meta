# Feature — Login

| Field | Value |
| --- | --- |
| ID | `FEAT-LOGIN` |
| Status | archived in OpenSpec (Release-0.1.0) |
| Owners | `neocom-front`, `neocom-back` (ESI-012 may touch `neocom-esi`) |
| Related L2 | LOGIN / BACK / ESI login ids (see OpenSpec) |
| OpenSpec | `login` archived (`front/login`, `back/login`, `esi/sso`, `esi/login`); obsolete `nestjs-sso-config` removed |
| Sources | https://developers.eveonline.com/docs/services/sso/ |

## Intent

Authenticate to NEOCOM with **EVE Online SSO**. The app path is **Authorization Code** (`esi/sso` + front and back login). The ESI tool PKCE note (ESI-012) lives in the same OpenSpec change as capability `esi/login`.

## Capabilities in `openspec/changes/login/`

| Spec | L2 IDs |
| --- | --- |
| `specs/front/login/spec.md` | LOGIN-001 … LOGIN-008 |
| `specs/back/login/spec.md` | BACK-014 … BACK-017 |
| `specs/esi/sso/spec.md` | ESI-013, ESI-014 |
| `specs/esi/login/spec.md` | ESI-012 |

## Out of scope

- Non-EVE identity providers
- Full character/corporation authorization matrix beyond establishing a session

## Notes

- Former OpenSpec changes `front-login`, `back-login`, `esi-sso`, and `esi-login` were merged into `login`.
- Obsolete registered change `nestjs-sso-config` (and earlier `back-nestjs-sso-config` / `infra-sso-config`) was removed 2026-11-09 — not archived.
- Callback URL for dev-watch: `http://localhost:6001/app/login-callback`
- Client id (public): `4664722d6bd0415683a04519e738a5fc`. Client secret is not written in specs.
- Delivery: archived with Release-0.1.0 (`openspec/changes/archive/2026-11-06-login/`)
