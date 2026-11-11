# Backend service

Status: archived. OpenSpec: `changes/archive/2026-11-09-back-service/` · main `specs/back/service/spec.md`.

The pilot use case in `neocom-back` reads public information from ESI with `@lgriffin/esi.ts` (`EsiPilotSource`) and converts it into the pilot domain model (`GetPilotUseCase`). A character ESI does not have is not found (`ExceptionCatalog.PILOT_NOT_FOUND` → `NeocomBackendError`). Raised exceptions use `NeocomBackendError` and can carry a payload.

Requirement ids: BACK-011 … BACK-013. Implemented on `neocom-back` `develop`.
