# Design

## Approach

- The pilot use case calls the ESI tool already installed in `neocom-back` for public information and converts that result into the pilot DTO (BACK-011). The note does not name the ESI operation.
- When ESI has no character, the use case returns not found (BACK-012). The note does not name an HTTP status.
- Raised exceptions use a class that can hold a payload of additional fields. The content format is `NeocomBackendError` (BACK-013). The note does not name the extra fields.

## Decisions

| Topic | Decision |
| --- | --- |
| Owner | `neocom-back` |
| ESI access | The installed `@lgriffin/esi.ts` tool |
| Missing character | Returned as not found |
| Exception content | `NeocomBackendError` |
| Delivery branch | `feature/service` from `develop` in `neocom-back` |

## Risks

- The note does not say which public ESI operation fills the pilot DTO. Do not invent the operation.
