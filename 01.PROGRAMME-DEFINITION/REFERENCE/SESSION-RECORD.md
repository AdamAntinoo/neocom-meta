# Session record

Reference for later work. Product repositories in this workspace are independent clones. Agent configuration stays in `neocom-meta`.

## Git metadata for former submodules

`neocom-meta`, `neocom-front`, and `neocom-domain` had been moved out of the parent `neocom` checkout. Each `.git` file still pointed at `../.git/modules/<name>`, which only resolved inside the parent. The object stores were still in `neocom/.git/modules/`. Each store was moved into the checkout as a real `.git` directory, and `core.worktree` was removed. They are ordinary repositories again.

| Repository | Branch at recovery | HEAD at recovery |
| --- | --- | --- |
| `neocom-meta` | `feature/initialization` | `a5aaca4` |
| `neocom-front` | `feature/initialization` | `883bdaf` |
| `neocom-domain` | `feature/initialization` | `9fb89eb` |

The parent `neocom` repo still lists those paths in `.gitmodules`.

## Versioning

Node libraries use GitVersion 5.12 in continuous deployment mode. `main` increments the minor version on each commit. The version-source tag is `vX.Y.Z`. `/neocom-git` owns the package version: `version:sync` and release scripts write GitVersion `MajorMinorPatch` (`X.Y.Z`) into `package.json`. Do not write `SemVer`; it adds a branch pre-release label. Do not use `npm version`; it creates a second tag.

| Package | Previous npm version | Version-source tag |
| --- | --- | --- |
| `neocom-domain` | `0.29.2` | `v0.30.0` |
| `neocom-esi` | none | `v0.1.0` |

## Tests

New Node packages test with `node --test` (`node:test` and `node:assert/strict`). Jest is not the runner. `neocom-domain` still lists `jest`, `@types/jest`, `ts-jest`, and `builder-pattern` because `src/dto/*.spec.ts` is compiled by `tsc` and those files use Jest globals. `tsconfig.json` there excludes the files that fail compilation. `neocom-esi` does not depend on Jest.

`tsc` and `tsc -p tsconfig.json` are the same when the command runs from the package directory that contains `tsconfig.json`.

## Requirements intake

The command is `/neo:register-spec` (file `.cursor/commands/neo:register-spec.md`). It reviews every `UNREGISTERED REQUIREMENTS` section, places each note in the system file, and registers an OpenSpec change `<system>-<feature>`.

Registered from that run:

| Change | What was registered |
| --- | --- |
| `esi-character-api` | Character API DTOs, generator, publish path. Destination later set to `neocom-esi` at `src/esi-api/characters` |
| `front-universe` | UNIV-003 added: front-end adapter and client cache for unauthenticated Universe data |

## neocom-esi

openapi-generator 7.6 generated the Character API from `openapi/eve-online-character-api-openapi.yml`. The uploaded file had a text preamble and `openapi: 3.2.0`; the stored copy starts at the document and is declared `3.0.3` so the generator can read it. `CharacterPublicInfoService` composes a public character from `GetCharactersCharacterIdOk`. `npm test` passed. Commit `c57c4bd` is tagged `v0.1.0`.

## Feature branches, commits, and pull requests

User example, preferred over the older `features/<feature>` guideline:

```text
feature/<feature-name>
```

Created from `develop`. If `develop` is missing, stop. Do not branch from `main`.

Applying an OpenSpec feature instructs `/neocom-git` to commit on that branch. Commits are not made on `develop` or `main`. The pull request targets `develop`. If a pull request for that branch already exists, add to it. Do not open a second one. The user validates the pull request.

`neocom-esi` packages that sequence as `npm run release`:

1. `npm run build`
2. `npm test`
3. `npm run version:sync`
4. `npm publish`
5. Commit on `feature/<feature>` when the tree changed
6. Push and open or update the pull request into `develop`

`/neocom-git` owns those git steps for `neocom-esi`, `neocom-domain`, `neocom-front`, `neocom-meta`, and `neocom-back`.
