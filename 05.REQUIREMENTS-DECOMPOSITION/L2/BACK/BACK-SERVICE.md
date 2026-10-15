# Backend service

System: `back`. Feature: `service`.
OpenSpec change: `back-service` → `specs/back/service/spec.md`.

| ID | Status | Requirement |
| --- | --- | --- |
| BACK-011 | registered | After the ESI tool is installed in `neocom-back`, the pilot use case uses it to retrieve the public information from ESI and convert the result into the pilot DTO model |
| BACK-012 | registered | If the character is not found on the ESI platform, return a not found |
| BACK-013 | registered | Exception raising uses an exception class that can contain a payload with additional fields. The format of the exception content is `NeocomBackendError` |

## UNREGISTERED REQUIREMENTS
