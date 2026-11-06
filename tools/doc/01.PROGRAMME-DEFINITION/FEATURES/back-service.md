# Backend service

Status: recorded. OpenSpec change: `back-service`.

The pilot use case in `neocom-back` reads public information from ESI with the installed ESI tool and converts it into the pilot DTO. A character ESI does not have is not found. Raised exceptions use `NeocomBackendError` and can carry a payload.

Source: L1 (BACK-011 … BACK-013).
