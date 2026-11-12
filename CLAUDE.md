# NEOCOM meta · documentation and harness repository

Meta repository for the NEOCOM project: programme definition, requirements (L0 → L1), OpenSpec specifications, agent rules, and the shared harness. Product code lives in independent repositories (`neocom-front`, `neocom-back`, `neocom-domain`). This repository does not implement product code.

This file is the Claude entry point. The harness itself is model-neutral and lives in **`.dsh/`** (the DeepSeek Harness). It is the source of truth for agents, commands, skills, and templates, whichever model runs them. If this file and `.dsh/` disagree, `.dsh/` wins.

## Switching between Claude and DeepSeek

- Any model (Claude, DeepSeek, or another) works from `.dsh/`: read `.dsh/AGENT-CATALOG.md`, then the agent, command, or skill file that matches the task.
- Agent, command, and skill files are plain Markdown with a YAML frontmatter (`name`, `description`). Read them as text; do not depend on a loader or a model-specific feature.
- Keep `.dsh/` free of model-specific instructions. Model names, API keys, and endpoints stay in each tool's own configuration, outside this repository.
- If a task needs a feature that only one model has, say so in the reply. Do not change the harness to suit one model.

## Harness: where things live

| What                                    | Where                   |
| --------------------------------------- | ----------------------- |
| Index of agents, commands, and skills   | `.dsh/AGENT-CATALOG.md` |
| Agents (one file per agent)             | `.dsh/agents/`          |
| Commands (stubs that route to an agent) | `.dsh/commands/`        |
| Skills (step-by-step procedures)        | `.dsh/skills/`          |
| Commit, branch, and PR templates        | `.dsh/templates/`       |

Agents and their entry points:

| Agent                   | Commands                                                           | Role                                                                      |
| ----------------------- | ------------------------------------------------------------------ | ------------------------------------------------------------------------- |
| `neocom-spec-collector` | `/epic`, `/epic collect <epic>`                                   | Opens an L1 epic; collects L0 cards **only on explicit request**          |
| `neocom-spec-workflow`  | `/epic:extract`                          | Registers reviewed L1 units directly into OpenSpec                       |
| `neocom-backtrack`      | `/neo:backtrack <epic…>`                                           | Legacy backtrack **only on explicit request** (named epic required)       |
| `neocom-defect`         | `/defect`, `/fix:defect`, `/defect:fixed`                          | Register; fix marked defects; archive validated ones to `FIXED-DEFECTS.md` |
| `neocom-code`           | `/neocom-code`                                                     | Product coding for front and back (destination-selected rules); OpenSpec apply in product repos |
| `neocom-openapi`        | `/neocom-openapi`, `/openapi`                                      | OpenAPI writing/versioning for **neocom-back** only (`tools/openapi/`; minor bump + copy-rename; reverse-chrono CHANGELOG) |
| `neocom-git`            | `/neocom-git`, `/git:commit`, `/git:pr`, `/git:release`, `/git:release-done` | Commits, branches, PRs, releases, versions, and `openspec/DELIVERY-INDEX.md`; the only owner of git operations |
| `program-verifier`      | `/program-verifier`                                                | Read-only verification of the `program/` knowledge                        |

For a new task, read `.dsh/AGENT-CATALOG.md` first, then the matching agent or skill. Do not copy their procedures into this file.

## Specification flow

```text
/epic  →  sources/L1/NN.EPIC-NAME.md  (the L1 epic; its authored sections are read-only)
/epic:extract  →  openspec/changes/<system>-<feature>/  (reviewed L1 units; Review cell becomes registered)
```

Rules that are not negotiable:

- **Never rewrite authored L1 sections.** The L1 epic is the source of OpenSpec. `/epic:extract` may change only Review cells (`reviewed` → `registered` or `duplicated`) and `## Spec traceability` (keep it at the start of the file: status, OpenSpec changes, skip).
- **Traceability indexes:** `sources/L1/TRACEABILITY.md` is the authoritative record via per-epic **### Sections** (Review / pipeline). Each epic’s `## Spec traceability` must stay in sync after extract/apply. `sources/L0/executive/INDEX.md` records each card's state (`selected`, `returned`, `out of scope`, `deleted`). `openspec/CHANGE-STATUS.md` records OpenSpec programme status. `openspec/DELIVERY-INDEX.md` (owned by `/neocom-git`) holds commit/PR evidence. **Removed (do not recreate):** `sources/L2/`, `SPEC-EPIC-INDEX.md`, and TRACEABILITY **`### L2 delivery`**. Update the active indexes in the same turn as any change they reflect.
- **Only checked Review cells (`[x]` / legacy `reviewed`) are registered** from tables with a Review column. Unchecked `[ ]` (legacy `to review`), `superseded`, and `out of scope` are not registered. After registration the checkbox is replaced by a plain status word (`registered` / `duplicated`).
- **Do not invent behaviour.** If a note or an epic does not state something, ask or mark the gap; do not fill it in.

## Graphify

**Automatic before `/epic:extract` and `/neo:backtrack`.** The agent runs this as its first action — do not ask the user, do not skip, stop if it fails:

```bash
cd neocom-meta
graphify update .
```

Prefer `.venv/bin/graphify update .` when the project venv exists. Then use `graphify query`, `graphify path`, or `graphify explain` before reading files by hand. Read only what the graph points to. The graph lives in `graphify-out/`, which is not versioned.

## Environment

- Node: the nvm alias `neocom` (`.nvmrc`). Run `nvm use` before `npm`, `npx`, or `openspec`.
- OpenSpec: `npx openspec list --json` from this root. The OpenSpec root is this repository.
- Python: the scripts in `scripts/` run with `python3`.

## Version control

- Conventional Commits. Follow the templates in `.dsh/templates/`. When the user gives a new example, store it there.
- Work on the current branch. Do not commit on `develop` or `main` unless the user explicitly asks.
- Do not commit, push, or open a PR unless the user asks. The `/git:*` commands are that request. **OpenSpec apply stops before commit** (`/neocom-code`).
- Product OpenSpec branches: `feature/<name>` default from `develop`; if other feature tips are ahead, ask before stacking (see `/neocom-git` and `.dsh/METHODOLOGY.md` §6).
- PR feature → `develop` = product / PR validation intake; product smoke on develop / optional `/defect`. **`/git:release`** opens `develop` → `main` (`Release-X.Y.Z`) listing OpenSpec **to validate while the PR is open**. After merge, **`/git:release-done`** archives those OpenSpec changes and runs L1 source-archive (`.dsh/templates/openspec-delivery-control.md`, `.dsh/METHODOLOGY.md` §6.6–6.7).
- Do not write `SemVer` into `package.json`. The version is GitVersion `MajorMinorPatch` (hooks/CI).

## Finder duplicate files

Never create files named `* 2.*` or `* 2` (Finder or sync conflict copies). If they appear and the canonical file exists, remove them with:

```bash
python3 scripts/cleanup-finder-duplicates.py
```

## Boundaries

- Do not implement product code here. For frontend or backend work, say so and stop; that work belongs in the owning repository (`neocom-front`, `neocom-back`, `neocom-domain`).
- `neocom` (the parent repository) is deprecated. `neocom-esi` is set aside. Do not write to either.
- Do not edit `.cursor/` unless the user asks. It is an older harness; `.dsh/` is the current one for this repository.
