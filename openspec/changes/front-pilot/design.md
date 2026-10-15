# Design

## Approach

- Treat Pilot as the programme name and Character as the ESI name for the same public record (`PILOT-004`).
- Model only the fields in the supplied `GetCharactersDetail` sample plus the character id (`PILOT-005`, `PILOT-006`).
- A credential holds zero to three pilot references (`PILOT-002`).
- Standalone tests stub `GET /characters/93813310` on WireMock with the supplied JSON (`PILOT-005`). The front `dev` stack already uses WireMock and does not call a live `neocom-back`.

## Decisions

| Topic | Decision |
| --- | --- |
| Source | ESI `GET https://esi.evetech.net/characters/{character_id}` |
| Fixture | Character id `93813310`, name `Perico Tuerto` |
| Cardinality | At most 3 pilots per game credential |
| Delivery branch | `features/pilot` from `develop` |

## Risks

- ESI field names are snake_case. The TypeScript model may map them; the WireMock body stays the ESI JSON.
- Completing bloodline, race, and ancestry display depends on the `front-universe` change.
