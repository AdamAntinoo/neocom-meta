# Feature — Login

| Field | Value |
| --- | --- |
| ID | `FEAT-LOGIN` |
| Status | registered in OpenSpec |
| Owners | `neocom-front`, `neocom-back` (ESI-012 may touch `neocom-esi`) |
| Related L2 | `L2/FRONT/06.LOGIN.md`, `L2/BACK/BACK-LOGIN.md`, `L2/ESI/ESI-SSO.md`, `L2/ESI/ESI-LOGIN.md`, INFRA-041…042 |
| OpenSpec | `login` (capabilities `front/login`, `back/login`, `esi/sso`, `esi/login`); related `infra-sso-config` |
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
- Env / Kubernetes secret wiring (`infra-sso-config`)

## Notes

- Former OpenSpec changes `front-login`, `back-login`, `esi-sso`, and `esi-login` were merged into `login`.
- Callback URL for dev-watch: `http://localhost:6001/app/login-callback`
- Client id (public): `4664722d6bd0415683a04519e738a5fc`. Client secret is not written in specs.
- Delivery branch: `feature/login` from `develop`
