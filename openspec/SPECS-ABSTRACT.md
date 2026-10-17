# OpenSpec registered specs — abstract

One-page view of active OpenSpec changes for planning a **single feature** that folds several registered capabilities together (as `login` already did for front/back/esi login).

Refresh companion counts in `CHANGE-STATUS.md` with `npx openspec list --json`. This abstract is narrative; re-read each `proposal.md` before merging changes.

**How to integrate:** pick a feature name, create or extend one change folder (multi-capability under `specs/<system>/<feature>/`), move or cite the L2 ids, supersede the old change names in the proposal, then archive or drop the superseded folders when apply is complete.

---

## Suggested integration clusters

Use these clusters when deciding what belongs in one `feature/<name>` branch and one OpenSpec change.

| Cluster | Candidate changes | Why they fit together |
| --- | --- | --- |
| **Pilot experience** | `front-pilot`, `front-pilot-panel`, `front-universe`, `front-dashboard`, `back-service`, `domain-module`, `esi-character-api` | One vertical: domain Pilot type → ESI public data → back pilot use case → dashboard + panel UI |
| **Front shell & toolchain** | `front-infrastructure`, `front-app-shell`, `infra-developer-install`, `infra-local-config` | Install, Node/Angular stack, canvas chrome, local WireMock config |
| **Auth / SSO** | `login` (already multi-system), `back-nestjs-sso-config` | Session already unified; NestJS SSO env/config still separate |
| **Angular codification (EPIC-002)** | `front-angular-structure`, `front-node-render`, `front-async-sse`, `back-async-sse`, `infra-async-persistence` | Structure → node/viewer/registry → async SSE enrichment with Nest + PostgreSQL/Redis |
| **Delivery** | `cicd-pipeline` | CI/CD boundary; keep separate unless a release feature needs it |

`login` is the template: one change folder, several capability specs (`front/login`, `back/login`, `esi/sso`, `esi/login`).

---

## Active changes (abstract)

### `login` — applying · 13/13 · multi-system

| | |
| --- | --- |
| **Why** | Authenticate with EVE SSO and establish a session across front, back, and ESI contract |
| **Capabilities** | `front/login`, `back/login`, `esi/sso`, `esi/login` |
| **Owners** | `neocom-front`, `neocom-back` (ESI-012 noted for `neocom-esi`) |
| **Requirements (short)** | Guard + return cookie; scopes; authorize link; SSO state; readable access cookie; character switch; login page; callback; token file storage; code exchange; multi-character; refresh/401; Authorization Code; three cookies; PKCE (fulfilled outside apply) |
| **Related** | Keep `back-nestjs-sso-config` separate unless folding env var names into this feature |
| **Paths** | `changes/login/` |

### `back-nestjs-sso-config` — registered · 0/2

| | |
| --- | --- |
| **Why** | NestJS SSO env vars and K8s secrets for client id/secret |
| **Capabilities** | `back/nestjs-sso-config` |
| **Owners** | `neocom-back` (NestJS Config); docs in `neocom-meta`; local values also on front |
| **Requirements** | `EVE_SSO_*` variables; Kubernetes secrets at deploy |
| **Integrate with** | `login` (optional fold) |
| **Paths** | `changes/back-nestjs-sso-config/` |

### `front-infrastructure` — applying · 8/8

| | |
| --- | --- |
| **Why** | Shared front stack: Angular 22, TypeScript, Vitest, Cypress+Cucumber, nvm `neocom`, WireMock for front `dev` |
| **Capabilities** | `front-toolchain` |
| **Owners** | `neocom-front`, programme docs |
| **Integrate with** | `front-app-shell`, `infra-developer-install`, `infra-local-config` |
| **Paths** | `changes/front-infrastructure/` |

### `front-app-shell` — registered · 0/3

| | |
| --- | --- |
| **Why** | Full-canvas frame: zero margin/border on outlet, pages, and body |
| **Capabilities** | `front/app-shell` |
| **Owners** | `neocom-front` |
| **Integrate with** | `front-infrastructure`, `front-dashboard` |
| **Paths** | `changes/front-app-shell/` |

### `front-dashboard` — registered · 0/6

| | |
| --- | --- |
| **Why** | Landing dashboard layout, pilot cookie, header/pilot sections, exception strip, panel colours |
| **Capabilities** | `front/dashboard` |
| **Owners** | `neocom-front` |
| **Note** | Spec still says “authenticated while login is not operative”; reconcile with `login` when merging |
| **Integrate with** | `front-pilot-panel`, `front-pilot`, `front-app-shell` |
| **Paths** | `changes/front-dashboard/` |

### `front-pilot` — registered · 4/5

| | |
| --- | --- |
| **Why** | Pilot as game presence; ≤3 pilots per credential; public ESI character; fixture `93813310` |
| **Capabilities** | `front/pilot` |
| **Owners** | Model in `neocom-domain`, consumed by front |
| **Integrate with** | `domain-module`, `front-universe`, `front-pilot-panel`, `back-service` |
| **Paths** | `changes/front-pilot/` |

### `front-pilot-panel` — registered · 0/4

| | |
| --- | --- |
| **Why** | UI panel for Pilot public/private data, variants, Cypress markers |
| **Capabilities** | `front/pilot-panel` |
| **Owners** | `neocom-front` |
| **Integrate with** | `front-pilot`, `front-dashboard` |
| **Paths** | `changes/front-pilot-panel/` |

### `front-universe` — registered · 0/4

| | |
| --- | --- |
| **Why** | Unauthenticated ESI reference data (ancestries, bloodlines, …) to complete Pilot |
| **Capabilities** | `front/universe` |
| **Owners** | front + domain Pilot model |
| **Integrate with** | `front-pilot`, `domain-module` |
| **Paths** | `changes/front-universe/` |

### `back-service` — registered · 0/3

| | |
| --- | --- |
| **Why** | Pilot use case: public ESI → pilot DTO; not-found; `NeocomBackendError` |
| **Capabilities** | `back/service` |
| **Owners** | `neocom-back` |
| **Integrate with** | `front-pilot`, `esi-character-api`, archived `back-esi-client` / `back-hexagonal` |
| **Paths** | `changes/back-service/` |

### `domain-module` — registered · 2/3

| | |
| --- | --- |
| **Why** | Shared Node TypeScript domain package on npm for front and back |
| **Capabilities** | `domain/neocom-domain` |
| **Owners** | `neocom-domain` published package |
| **Note** | DOMAIN-001 submodule cancelled in proposal; npm package remains |
| **Integrate with** | `front-pilot`, `back-service` |
| **Paths** | `changes/domain-module/` |

### `esi-character-api` — registered · 3/4

| | |
| --- | --- |
| **Why** | Drop generated Character API; high-level data via `@lgriffin/esi.ts` / `neocom-esi` |
| **Capabilities** | `esi/character-api` |
| **Owners** | `neocom-esi` (aside) |
| **Integrate with** | `back-service`, pilot cluster |
| **Paths** | `changes/esi-character-api/` |

### `infra-developer-install` — registered · 0/4

| | |
| --- | --- |
| **Why** | Repeatable clone/install: recursive clone, nvm, front npm install, WireMock without back |
| **Capabilities** | `infra/developer-install` |
| **Integrate with** | `front-infrastructure`, `infra-local-config` |
| **Paths** | `changes/infra-developer-install/` |

### `infra-local-config` — registered · 0/7

| | |
| --- | --- |
| **Why** | WireMock base URL, local UI URL, env/secrets, submodule pins, Sass workaround |
| **Capabilities** | `infra/local-config` |
| **Integrate with** | `front-infrastructure`, `infra-developer-install` |
| **Paths** | `changes/infra-local-config/` |

### `cicd-pipeline` — registered · 0/8

| | |
| --- | --- |
| **Why** | Front CI jobs, Node pin, Cypress without live back, CD deferred, local K8s target |
| **Capabilities** | `cicd/pipeline` |
| **Owners** | GitHub Actions in front (and later ecosystem) |
| **Integrate with** | Usually alone; optionally a “delivery” meta feature |
| **Paths** | `changes/cicd-pipeline/` |

### `front-angular-structure` — registered · 0/7

| | |
| --- | --- |
| **Why** | Page/panel/section division; industry + manufacture modules; placement rules |
| **Capabilities** | `front/angular-structure` |
| **Owners** | `neocom-front` |
| **Integrate with** | `front-node-render`, `front-app-shell`, `front-dashboard` |
| **Paths** | `changes/front-angular-structure/` |

### `front-node-render` — registered · 0/7

| | |
| --- | --- |
| **Why** | Node MVC, render registry (replace `*ngIf`), hierarchy flatten, viewer/standalone panels |
| **Capabilities** | `front/node-render` |
| **Owners** | `neocom-front` |
| **Integrate with** | `front-angular-structure`, `front-async-sse` |
| **Paths** | `changes/front-node-render/` |

### `front-async-sse` — registered · 0/7

| | |
| --- | --- |
| **Why** | Front adapter cache + authenticated SSE; partial first paint; in-place row enrichment |
| **Capabilities** | `front/async-sse` |
| **Owners** | `neocom-front` |
| **Integrate with** | `back-async-sse`, `infra-async-persistence`, `front-node-render` |
| **Paths** | `changes/front-async-sse/` |

### `back-async-sse` — registered · 0/7

| | |
| --- | --- |
| **Why** | Nest list persistence, BullMQ enrichment, `@Sse()` push, ESI on miss |
| **Capabilities** | `back/async-sse` |
| **Owners** | `neocom-back` |
| **Integrate with** | `front-async-sse`, `infra-async-persistence` |
| **Paths** | `changes/back-async-sse/` |

### `infra-async-persistence` — registered · 0/4

| | |
| --- | --- |
| **Why** | Provision PostgreSQL + Redis; persistence contract and async enrichment checklist |
| **Capabilities** | `infra/async-persistence` |
| **Owners** | meta docs; runtime for back/front envs |
| **Integrate with** | `back-async-sse`, `front-async-sse` |
| **Paths** | `changes/infra-async-persistence/` |

---

## Already archived (for context)

| Archive | Main spec | Role |
| --- | --- | --- |
| `2026-10-15-back-esi-client` | `specs/back/esi-client/spec.md` | ESI client install in back |
| `2026-10-15-back-hexagonal` | `specs/back/hexagonal/spec.md` | Hexagonal Nest layout |
| `2026-10-15-infra-style-modules` | `specs/infra/style-modules/spec.md` | Style / module infra |

---

## Capability index (active)

| Capability path | Change |
| --- | --- |
| `front/login` | `login` |
| `back/login` | `login` |
| `esi/sso` | `login` |
| `esi/login` | `login` |
| `back/nestjs-sso-config` | `back-nestjs-sso-config` |
| `front-toolchain` | `front-infrastructure` |
| `front/app-shell` | `front-app-shell` |
| `front/dashboard` | `front-dashboard` |
| `front/pilot` | `front-pilot` |
| `front/pilot-panel` | `front-pilot-panel` |
| `front/universe` | `front-universe` |
| `back/service` | `back-service` |
| `domain/neocom-domain` | `domain-module` |
| `esi/character-api` | `esi-character-api` |
| `infra/developer-install` | `infra-developer-install` |
| `infra/local-config` | `infra-local-config` |
| `cicd/pipeline` | `cicd-pipeline` |
| `front/angular-structure` | `front-angular-structure` |
| `front/node-render` | `front-node-render` |
| `front/async-sse` | `front-async-sse` |
| `back/async-sse` | `back-async-sse` |
| `infra/async-persistence` | `infra-async-persistence` |
