# Proposal

## Why

The Pilot model needs a panel that can show public data, and private data when a credential is present.

## What Changes

- Add a pilot panel whose input is an EVE character identifier (PANEL-002)
- Render public data, and private data when a credential is available (PANEL-001, PANEL-003)
- Use the stated variants, colors, and Cypress markers (PANEL-004 … PANEL-012)

## Capabilities

### New Capabilities

- `front/pilot-panel`: The panel that renders the Pilot model

### Modified Capabilities

- *(none)*

## Impact

- Owner: **`neocom-front`**
- Out of scope: the backend Pilot endpoint, and which subset of fields the list variant shows. The note says a partial, and does not name the fields.
