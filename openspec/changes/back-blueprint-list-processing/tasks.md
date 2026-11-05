# Tasks

## DTO interchange

- [x] Define `neocom-back` **`BlueprintV1Dto`** and **`SpaceLocationV1Dto`** (`Dto` suffix; not in `neocom-domain`) (BLP-020)
- [x] Transform ESI blueprint contents into `BlueprintV1Dto` (BLP-018)
- [x] Ensure blueprints carry location information from ESI (`location_id` / related) (BLP-014)

## Location via composed use case

- [x] Resolve blueprint location via **`GetSpaceLocationUseCase`** (not direct catalog) → `SpaceLocationV1Dto` (BLP-015 / BLP-030)
- [x] Embed that `SpaceLocationV1Dto` instance on `BlueprintV1Dto` (BLP-019)

## Adapters DTO package

- [x] Place interchange `*Dto` classes under **`infrastructure/adapters/dto`** (adapters top level; not inbound/outbound) (BLP-026)
- [x] Implement ESI→DTO / catalog→DTO via **one static converter class** in that `dto` package (`BlueprintListDtoConverter`; ESI library input type) (BLP-027 / BLP-029)
- [x] Own **`Record`** on `neocom-back` under `adapters/dto`; `*Dto` classes **extend** it (not `neocom-domain` `Record`) (BLP-028)
