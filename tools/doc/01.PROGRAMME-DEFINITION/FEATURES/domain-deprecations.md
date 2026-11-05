# Feature — domain deprecations

| Field | Value |
| --- | --- |
| OpenSpec | `domain-deprecations` |
| Status | registered |
| Owners | `neocom-domain`, `neocom-back` |
| L2 IDs | BACK-SVC-040…042, BACK-SVC-050…052 |
| Source | `sources/L2/DOMAIN/11.DEPRECATIONS.md` (EPIC-009) |

## Intent

Domain DTOs and `src/esi-api` are deprecated. DTOs stay marked for templates or later removal. ESI types are not exported outside back via domain and may leave the domain package.
