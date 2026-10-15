# Proposal

## Why

The Pilot use case in `neocom-back` should read public ESI information through the installed ESI tool and turn that result into the pilot DTO. A missing character is not found. Raised exceptions use `NeocomBackendError`.

## What Changes

- The pilot use case retrieves public information from ESI and converts it into the pilot DTO (BACK-011)
- A character that ESI does not have is returned as not found (BACK-012)
- Raised exceptions use a class that can carry a payload; the exception content format is `NeocomBackendError` (BACK-013)

## Capabilities

### New Capabilities

- `back/service`: Pilot retrieval from ESI, not-found, and `NeocomBackendError`

### Modified Capabilities

- *(none)*

## Impact

- Owner: **`neocom-back`**
- Out of scope: choosing the ESI operation name, the HTTP status number, and any exception fields the note does not name
