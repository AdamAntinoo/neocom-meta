# Feature — domain ports

| Field | Value |
| --- | --- |
| OpenSpec | `domain-ports` |
| Status | registered |
| Owners | `neocom-domain`, `neocom-back` |
| L2 IDs | BACK-SVC-020…022, BACK-SVC-030…032 |
| Source | `sources/L2/DOMAIN/10.PORTS.md` (EPIC-009) |

## Intent

Ports live under `src/ports`. Pilot stays separate; other endpoints use Industry. Back adapters implement ports; signatures use domain models only and stop if a model is missing.
