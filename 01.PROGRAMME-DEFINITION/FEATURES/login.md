# Feature — Login

| Field | Value |
| --- | --- |
| ID | `FEAT-LOGIN` |
| Status | recorded (active in programme definition) |
| Owners | `neocom-front`, `neocom-back` (auth boundaries) |
| Related L1 | *(to be linked after `/spec-collect`)* |
| Sources | https://developers.eveonline.com/ · https://developers.eveonline.com/docs/services/sso/ · https://developers.eveonline.com/docs/services/sso/#authorization-code-with-pkce |

## Intent

Allow a user to authenticate to NEOCOM using **EVE Online SSO**, with the **authorization code flow and PKCE** as the documented secure path for public/native clients.

## In scope (initial)

- User can start login from the Angular front (`neocom-front`).
- Authorization uses EVE SSO authorization code + PKCE per CCP developer documentation.
- Tokens and session handling respect SSO service constraints (scopes, redirect URIs, token lifetime) once detailed in L1/L2.
- Backend (when present) owns server-side auth boundaries; front owns UI and client-side PKCE participation as appropriate for the chosen architecture.

## Out of scope (for now)

- Non-EVE identity providers.
- Full character/corporation authorization matrix beyond what Login needs to establish a session.
- Implementation details not yet backed by Spec Collect / OpenSpec artifacts.

## Notes from development

- Prefer updating this file when login UX, redirect URIs, scopes, or token storage decisions are made.
- Cite L1 IDs and OpenSpec change names here after `/spec-registration`.
- Keep extracted SSO notes under `02.SOURCES/extracted/` and promote durable decisions into this feature doc.
- **2026-10-12**: Source extract completed — raw corpus under `02.SOURCES/raw/`; human notes at `02.SOURCES/extracted/eve-developers.md`, `eve-sso.md`, `eve-sso-pkce.md` (plus Nest candidate `nestjs.md`). Graphify semantic map blocked (no LLM API key); `02.SOURCES/graphify-out/` has cache only until a keyed `graphify .` run. L1 still owned by `/spec-collect`.
