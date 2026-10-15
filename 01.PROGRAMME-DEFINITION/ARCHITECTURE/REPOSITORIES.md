# Architecture — repositories

Status: each repository is one independent project. The parent `neocom` repository is deprecated.

## Active projects

| Repo | Remote | Role | Stack (current) |
| --- | --- | --- | --- |
| `neocom-meta` | https://github.com/AdamAntinoo/neocom-meta.git | Agent config, programme docs, sources, requirements, OpenSpec, Graphify | Docs + Cursor agents/skills/commands |
| `neocom-front` | https://github.com/AdamAntinoo/neocom-front.git | User-facing application | **Angular 22.2.x** + TypeScript; Vitest; Cypress + Cucumber; Node via nvm alias **`neocom`** |
| `neocom-back` | https://github.com/AdamAntinoo/neocom-back.git | HTTP API | NestJS |

## Aside for now

| Repo | Remote | Role |
| --- | --- | --- |
| `neocom` | https://github.com/AdamAntinoo/neocom.git | Deprecated. Do not use it as a parent, and do not update submodule pointers. |
| `neocom-domain` | https://github.com/AdamAntinoo/neocom-domain.git | Business-domain TypeScript package. Leave aside. |
| `neocom-esi` | https://github.com/AdamAntinoo/neocom-esi.git | ESI classes and tools. Leave aside. |

## Relationships

```text
neocom-meta     independent project — programme, agents, OpenSpec
neocom-front    independent project — Angular UI
neocom-back     independent project — API
```

- A change stays in the repository that owns it. There is no parent checkout to pin the others.
- Meta does not implement front or back features.
- Spec pipeline: `02.SOURCES` → `/spec-collect` → L1 → (if atomic) `/spec-registration` → `openspec/`.
- Programme docs (this tree) capture architecture and **active features** as the project advances.

## Local development (front `dev`)

- **WireMock** mocks backend HTTP APIs.
- `neocom-front` in the **dev** configuration talks to WireMock only; it does **not** use `neocom-back`.
- Developer clone, install, and start steps live in the `neocom-front` repository.

## Cross-cutting tools

| Tool | Location | Purpose |
| --- | --- | --- |
| OpenSpec | `openspec/` in this repository | Spec-driven changes after Spec Registration |
| Graphify | `.venv` and `graphify-out/` in this repository; source corpora may also use `02.SOURCES/` | Code / documentation knowledge graphs |
| WireMock | used with `neocom-front` (dev) | Mock HTTP APIs so local front runs without `neocom-back` |

## Open architecture decisions

- `neocom-back` is an active independent project. Deployment topology (hosts, environments) is not defined yet — see L2 when filled.
- Exact WireMock port, stub directory, and npm scripts: pin in `neocom-front` when scaffolded.
