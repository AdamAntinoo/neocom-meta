# Tasks

## DTO interchange

- [ ] Define `neocom-back` **`BlueprintV1Dto`** and **`SpaceLocationV1Dto`** (`Dto` suffix; not in `neocom-domain`) (BLP-020)
- [ ] Transform ESI blueprint contents into `BlueprintV1Dto` (BLP-018)
- [ ] Ensure blueprints carry location information from ESI (`location_id` / related) (BLP-014)

## Location catalog

- [ ] Look up blueprint location on the location catalog → `SpaceLocationV1Dto` (BLP-015)
- [ ] Embed that `SpaceLocationV1Dto` instance on `BlueprintV1Dto` (BLP-019)
