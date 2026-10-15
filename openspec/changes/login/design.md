# Design

## Approach

One OpenSpec change holds every login capability. Delta specs keep their original paths and wording:

| Capability | Spec | Source L2 |
| --- | --- | --- |
| `front/login` | `specs/front/login/spec.md` | `L2/FRONT/06.LOGIN.md` |
| `back/login` | `specs/back/login/spec.md` | `L2/BACK/BACK-LOGIN.md` |
| `esi/sso` | `specs/esi/sso/spec.md` | `L2/ESI/ESI-SSO.md` |
| `esi/login` | `specs/esi/login/spec.md` | `L2/ESI/ESI-LOGIN.md` |

- Front builds the authorize URL (`OAuthEnabledComponent`) and owns `neocom_return` / `neocom_sso_state` / readable `neocom_access`.
- Back owns `FileTokenStorage`, `addCharacter`, refresh, and rewriting `neocom_access`.
- `esi/sso` is the shared Authorization Code contract (client secret). `esi/login` remains the earlier PKCE note for the ESI tool; do not invent PKCE details beyond ESI-012.

## Decisions

| Topic | Decision |
| --- | --- |
| Change name | `login` (one feature, several capability specs) |
| Primary flow for the app | Authorization Code (`esi/sso` + front/back login) |
| PKCE note | Kept under `esi/login` inside this change |
| Env / k8s secrets | Still `infra-sso-config` |
| Delivery branch | `feature/login` from `develop` |

## Risks

- ESI-012 PKCE and ESI-013 Authorization Code describe different flows; implementers follow the capability that owns the work.
- Front and back must agree on the `neocom_access` value shape.
