# Design

## Approach

- Single front adapter entry: cache → HTTP → SSE merge into `dataModelRoot` / `notifyDataChanged`.
- Sync path unchanged when the backend returns a complete list quickly.
- Delayed nodes use `NeoComDelayed` / `isReady()` until SSE enrichment arrives.
- Auth on the stream: prefer fetch-based SSE if cookie/`EventSource` auth is insufficient.

## Decisions

| Topic | Decision |
| --- | --- |
| Push protocol | SSE (Nest `@Sse()`; front listens) |
| Cache | First-party; memory + optional `localStorage` / IndexedDB |
| SSE client | `EventSource` if cookie auth works; else e.g. `@microsoft/fetch-event-source` |
| UI updates | In place; no reload or navigation |
| Delivery branch | `feature/async-sse` from `develop` (may rebase onto `node-render` when needed) |

## Risks

- Depends on Nest SSE and persistence from `back-async-sse` and provisioned Redis/DB from `infra-async-persistence`.
