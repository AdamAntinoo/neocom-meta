# NEOCOM sources

Authoritative external documentation to read when extracting textual requirements and domain information for NEOCOM.

Use the project skill **extract-requirements-from-urls** (via `/neocom-meta`) to fetch these URLs, extract requirements, and build Graphify token maps from the saved corpus.

## Stack and platform

| Source | URL | Use for |
| --- | --- | --- |
| NestJS | https://nestjs.com/ | Backend framework concepts, modules, providers, HTTP, auth patterns (when `neocom-back` adopts Nest) |
| EVE Online Developers | https://developers.eveonline.com/ | ESI / developer platform overview, services, app registration |
| EVE SSO | https://developers.eveonline.com/docs/services/sso/ | Single Sign-On flows, tokens, scopes, security constraints |
| EVE SSO — Authorization Code + PKCE | https://developers.eveonline.com/docs/services/sso/#authorization-code-with-pkce | Required OAuth authorization-code + PKCE requirements for public/native clients |

## Corpus layout

| Path | Purpose |
| --- | --- |
| `raw/` | Fetched page content (via `graphify add`) |
| `extracted/` | Human-readable requirement notes derived from the sources |
| `graphify-out/` | Graphify knowledge / token map for this sources corpus (when built) |

## URL list (machine-friendly)

```
https://nestjs.com/
https://developers.eveonline.com/
https://developers.eveonline.com/docs/services/sso/
https://developers.eveonline.com/docs/services/sso/#authorization-code-with-pkce
```
