# Proposal

## Why

EPIC-006 front NeoCom domain-node norms (DEF-BLP-007…013) must land in OpenSpec so apply can enforce file naming, `@domain` path alias, render registration ≡ `jsonClass`, hierarchy on domain Region/SolarSystem/Blueprint with NeoCom children, and internal `BlueprintV1DtoWire` instead of npm `BlueprintV1`.

## What Changes

- Register front NeoCom domain-node conventions from UI-DOM-001…005
- Path alias name is **`@domain`** (amended from earlier `-domain-` draft)

## Capabilities

### New Capabilities

- `front/domain-nodes`: Front NeoCom domain object files, `@domain` alias, render key ≡ `jsonClass`, hierarchy children, Blueprint wire without npm `BlueprintV1`

### Modified Capabilities

- *(none)*

## Impact

- Owner: **`neocom-front`**
- L1: EPIC-006 Front domain NeoCom nodes (UI-DOM-001…005)
- Related defects: DEF-BLP-007…013
- Related applying changes: `front-blueprint-list-processing` (hierarchy consumers), `front-node-render` (registry mechanism)
