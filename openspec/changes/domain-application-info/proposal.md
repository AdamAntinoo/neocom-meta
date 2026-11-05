# Proposal

## Why

The application header needs a published **ApplicationInfoV1** domain node, not ad-hoc environment reads in the render.

## What Changes

- Register ApplicationInfoV1 model, provider/render contract, and `v1-application-info-render` (DOM-APPINFO-001…003)

## Capabilities

### New Capabilities

- `domain/application-info`: ApplicationInfoV1 domain model and header display contract

### Modified Capabilities

- *(none)*

## Impact

- **`neocom-domain`** / front header provider
- L2 ids: DOM-APPINFO-001…003 from `L2/DOMAIN/04.APPLICATION-INFO.md`
