# Design

## Context

EPIC-015 front work mirrors blueprint-by-location but consumes `GET /v1/pilots/{pilotId}/assets` and aggregates with an Unidentified-location path (no skip). Leaf chrome is `v1-asset-render` from infinity `neocom-asset`, already specimen’d on `/model-strip`.

## Decisions

| Topic | Decision |
| --- | --- |
| Change name | `front-assets-by-location` |
| Delivery branch | `feature/assets-by-location` from `develop` |
| Module / route | `pilot` lazy module; `/pilot/assets-by-location` |
| Feature icon (interim) | `/media/blueprints-feature.jpeg` (FAL-002); replace later with dedicated assets drawable |
| Place resolution | Aggregator keys on `locationId`; new ids → location service → `GET /api/v1/universe/spacelocations/{locationId}` — not embedded asset `location` |
| Unidentified | No usable region/system chain → Unidentified location root by that id (not blueprint skip) |
| Leaf render | `v1-asset-render` / `EveAssetV1`; ITEM VALUE = `item.sellPrice`; TOTAL VALUE and VOLUME = unit × stack `quantity` |
| Container expand | `LocatedAssetContainerV1Dto.contents` children when expanded |

## Risks / gaps

- Unidentified location **icon** is deferred (FAL-025) — do not invent a drawable at apply time without L1 update.
- Moving pilot/corporation panels into `pilot` may touch secured chrome composition; keep Pilot & corporation row behaviour unchanged for consumers.
