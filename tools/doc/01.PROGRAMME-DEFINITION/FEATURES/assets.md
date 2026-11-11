# Assets (back)

Status: recorded. OpenSpec change: `back-assets`.

`neocom-back` interchange for pilot-owned asset instances: ESI character assets (+ personal names) → `EveAssetV1Dto` (nested `PricedItemV1Dto` item; conditional nested `EveLocationV1Dto`) and `LocatedAssetContainerV1Dto` (asset + `contents`). Authenticated programme HTTP on `V1PilotController` (full list + by-location filter), new use case, `PilotPort` assets entry, Redis write-through under `pilot/asset` with TTL 60 minutes.

Source: EPIC-014 `14.EPIC-ASSETS.md` (AST-001…014).
