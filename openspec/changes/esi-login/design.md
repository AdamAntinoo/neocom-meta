# Design

## Approach

- Add PKCE token management for use by the ESI tool (ESI-012).
- The note does not name the authorize URL, client id, scopes, or where tokens are stored.

## Decisions

| Topic | Decision |
| --- | --- |
| Owner | `neocom-esi` |
| Delivery branch | `feature/login` from `develop` |

## Risks

- PKCE details beyond the name of the flow are not specified. Do not invent them.
