# Proposal

## Why

The application header needs a published **ServerStatusV1** model distinct from raw ESI server status.

## What Changes

- Register ServerStatusV1 fields and `v1-server-status-render` contract (DOM-SRV-001…003)

## Capabilities

### New Capabilities

- `domain/server-status`: ServerStatusV1 domain model and header display contract

### Modified Capabilities

- *(none)*

## Impact

- **`neocom-domain`** / front header provider
- L2 ids: DOM-SRV-001…003 from `L2/DOMAIN/05.SERVER-STATUS.md`
