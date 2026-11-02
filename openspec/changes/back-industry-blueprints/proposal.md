# Proposal

## Why

The Industry API starts with retrieving a pilot’s blueprints as `BlueprintV1[]`, mapping ESI blueprint fields plus model-only fields already on `BlueprintV1`.

## What Changes

- Industry API starts with an endpoint that retrieves blueprints belonging to a pilot (BACK-SVC-070)
- Input is the pilot unique identifier; output is a list of `BlueprintV1` (BACK-SVC-071)
- Each `BlueprintV1` maps all fields available from the ESI blueprints API plus `BlueprintV1` fields not present on ESI (names, icons, output type, and other model-only fields); detailed field mapping remains to be reviewed (BACK-SVC-072)

## Capabilities

### New Capabilities

- `back/industry-blueprints`: Pilot blueprints Industry endpoint returning `BlueprintV1[]`

### Modified Capabilities

- *(none)*

## Impact

- Owners: **`neocom-back`** (endpoint/adapters); depends on published **`BlueprintV1`** (`domain-blueprint`) and Industry port (`domain-ports`)
- Out of scope: inventing the detailed ESI↔BlueprintV1 field map (BACK-SVC-072 marks it for review); front list UI
- L2 ids: BACK-SVC-070…072 from `L2/09.EPIC-BACKEND-SERVICES.md` → `L2/BACK/BACK-INDUSTRY-BLUEPRINTS.md`
