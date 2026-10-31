# ESI SPECS

System: `esi`. Feature: `character-api`.
OpenSpec change: `esi-character-api` → `specs/esi/character-api/spec.md`.

The EVE Online third-party ecosystem includes ESI (`esi.evetech.net`), SSO (`login.eveonline.com`), the Image Server (`images.evetech.net`), and the Static Data Export. ESI-001 through ESI-004 are cancelled. The library focuses on high-level data from `@lgriffin/esi.ts`.

| ID | Status | Requirement |
| --- | --- | --- |
| ESI-001 | cancelled | Implement this in `neocom-esi` under `src/esi-api/characters` |
| ESI-002 | cancelled | Process the EVE Online Character API OpenAPI, 28 operations, from https://raw.githubusercontent.com/api-evangelist/eve-online/refs/heads/main/openapi/eve-online-character-api-openapi.yml |
| ESI-003 | cancelled | The agent can use openapi-generator to generate the ESI character API DTO classes in TypeScript from that API definition |
| ESI-004 | cancelled | Generated code is registered under `src/esi-api/characters` and made available to `neocom-front` by publishing `neocom-esi` |
| ESI-005 | registered | Generated files are DTO classes. A service uses them to compose higher-level DTOs or business objects, which are also published on `neocom-esi` |
| ESI-011 | registered | Remove from `neocom-esi` the OpenAPI document and the code generated from it. The library focuses on high-level data based on `@lgriffin/esi.ts` |

ESI-006, ESI-007, ESI-008, ESI-009, and ESI-010 are in `L2/ESI/ESI-CLIENT.md`. The login notes are under OpenSpec change `login` (`esi/login`, `esi/sso`). The backend service, port, and Pilot endpoint are `L2/BACK/BACK.md`.

## UNREGISTERED REQUIREMENTS 
