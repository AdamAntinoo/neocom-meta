# ESI character API

System: `esi`. Feature: `character-api`.
OpenSpec change: `esi-character-api` → `specs/esi/character-api/spec.md`.

The EVE Online third-party ecosystem includes ESI (`esi.evetech.net`), SSO (`login.eveonline.com`), the Image Server (`images.evetech.net`), and the Static Data Export. This feature is the Character API only.

| ID | Status | Requirement |
| --- | --- | --- |
| ESI-001 | registered | Implement this in `neocom-esi` under `src/esi-api/characters` |
| ESI-002 | registered | Process the EVE Online Character API OpenAPI, 28 operations, from https://raw.githubusercontent.com/api-evangelist/eve-online/refs/heads/main/openapi/eve-online-character-api-openapi.yml |
| ESI-003 | registered | The agent can use openapi-generator to generate the ESI character API DTO classes in TypeScript from that API definition |
| ESI-004 | registered | Generated code is registered under `src/esi-api/characters` and made available to `neocom-front` by publishing `neocom-esi` |
| ESI-005 | registered | Generated files are DTO classes. A service uses them to compose higher-level DTOs or business objects, which are also published on `neocom-esi` |

## UNREGISTERED REQUIREMENTS

