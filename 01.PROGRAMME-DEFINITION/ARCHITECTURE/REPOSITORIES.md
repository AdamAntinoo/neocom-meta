# Architecture — repositories

Status: draft (based on repos already defined in the NEOCOM workspace)

## Parent

| Repo | Remote | Role |
| --- | --- | --- |
| `neocom` | https://github.com/AdamAntinoo/neocom.git | Ecosystem root: OpenSpec, Graphify, shared Cursor tooling; tracks product folders as **git submodules** |

Clone with submodules:

```bash
git clone --recurse-submodules https://github.com/AdamAntinoo/neocom.git
```

## Submodules / product folders

| Folder | Remote | Role | Stack (current) |
| --- | --- | --- | --- |
| `neocom-meta` | https://github.com/AdamAntinoo/neocom-meta.git | Agent config, programme docs, sources, requirements decomposition | Docs + Cursor agents/skills/commands |
| `neocom-front` | https://github.com/AdamAntinoo/neocom-front.git | User-facing application | **Angular 22.2.x** + TypeScript; Vitest; Cypress + Cucumber; Node via nvm alias **`neocom`** (`.nvmrc` → 24.21.0) |
| `neocom-back` | *(planned)* | HTTP API, persistence, auth boundaries | Stack not decided yet; NestJS appears in `02.SOURCES` as a candidate reference |
| `neocom-domain` | https://github.com/AdamAntinoo/neocom-domain.git | Business-domain TypeScript package. Submodule is registered. npm publish and app dependencies are not done yet | Node + TypeScript |
| `neocom-esi` | https://github.com/AdamAntinoo/neocom-esi.git | ESI classes and tools. Character API DTOs live here. `npm run release` builds, tests, publishes, commits, and opens or updates the pull request | Node + TypeScript |

## Relationships

```text
neocom (parent)
├── openspec/          OpenSpec root
├── .cursor/           shared OpenSpec/Graphify Cursor wiring
├── neocom-meta/       submodule — programme + agents + requirements
├── neocom-front/      submodule — Angular UI
├── neocom-domain/     submodule — TypeScript domain package
└── neocom-back/       future submodule — API
```

- Parent pins submodule SHAs; sync with `git submodule update --init --recursive`.
- Product code stays in the owning submodule; meta does not implement front/back features.
- Spec pipeline: `02.SOURCES` → `/spec-collect` → L1 → (if atomic) `/spec-registration` → `openspec/`.
- Programme docs (this tree) capture architecture and **active features** as the project advances.

## Local development (front `dev`)

- **WireMock** mocks backend HTTP APIs.
- `neocom-front` in the **dev** configuration talks to WireMock only; it does **not** use `neocom-back`.
- Developer clone / install / start steps: [`README.md`](../../../README.md).

## Cross-cutting tools

| Tool | Location | Purpose |
| --- | --- | --- |
| OpenSpec | `openspec/` in this repository | Spec-driven changes after Spec Registration |
| Graphify | `.venv` and `graphify-out/` in this repository; source corpora may also use `02.SOURCES/` | Code / documentation knowledge graphs |
| WireMock | used with `neocom-front` (dev) | Mock HTTP APIs so local front runs without `neocom-back` |

## Open architecture decisions

- Backend stack and `neocom-back` remote not finalized.
- Exact WireMock port, stub directory, and npm scripts: pin in `neocom-front` when scaffolded.
- Exact deployment topology (hosts, environments) not defined yet — see L2 when filled.
