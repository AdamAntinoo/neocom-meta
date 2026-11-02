# neocom-domain

Status: recorded. OpenSpec change: `domain-module`.

`neocom-domain` is a Node TypeScript package for business-domain types. DOMAIN-001, the git submodule, is cancelled. Front and back depend on the package from npm.

Business objects in that package are versioned. A new shape is a new type, and features that use an older model keep that older type. Versioning rules: **EPIC-004** — `L1/04.EPIC-MODELS.md`. Implemented models and hierarchy diagram: `ARCHITECTURE/MODELS.md`.

Source: `sources/L2/DOMAIN/01.NEOCOM-DOMAIN.md`.
