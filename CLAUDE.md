# NEOCOM meta · documentation and harness repository

Meta repository for the NEOCOM project: programme definition, requirements (L0 → L1 → L2), OpenSpec specifications, agent rules, and the shared harness. Product code lives in independent repositories (`neocom-front`, `neocom-back`, `neocom-domain`). This repository does not implement product code.

This file is the entry point for any LLM (Claude, DeepSeek, or another). The source of truth for agents, commands, skills, and templates is **`.dsh/`**. If this file and `.dsh/` disagree, `.dsh/` wins.

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
| `neocom-spec-collector` | `/epic`                                                            | Opens an L1 epic and collects the L0 cards that match its search criteria |
| `neocom-spec-workflow`  | `/neo:extract-l1 <epic>`, `/neo:extract-l2`, `/neo:spec-evolution` | Controls the progression epic → L1 → L2 → OpenSpec                        |
| `neocom-backtrack`      | `/neo:backtrack`                                                   | Finds in the legacy code the classes, methods, and flows an epic cites    |
| `neocom-git`            | `/neocom-git`, `/git:commit <project>`, `/git:pr [project]`        | Commits, branches, PRs, and versions; the only owner of git operations    |
| `program-verifier`      | `/program-verifier`                                                | Read-only verification of the `program/` knowledge                        |

For a new task, read `.dsh/AGENT-CATALOG.md` first, then the matching agent or skill. Do not copy their procedures into this file.

## Specification flow

```text
/epic  →  sources/L1/NN.EPIC-NAME.md  (the epic; its authored sections are read-only)
/neo:extract-l1 <epic>  →  generated L1 section in the same file
/neo:extract-l2  →  sources/L2/NN.EPIC-NAME[.group].md  (under UNREGISTERED REQUIREMENTS)
/neo:spec-evolution  →  openspec/changes/<system>-<feature>/  and sources/L2/<SYSTEM>/
```

Rules that are not negotiable:

- **Never modify the source level.** Generating L1 writes only the generated section, never the epic's authored sections. Generating L2 does not touch L1. Registering in OpenSpec does not rewrite L2 notes.
- **Traceability indexes:** `sources/L1/TRACEABILITY.md` is the authoritative record of what is generated, extracted, and registered. `sources/L0/executive/INDEX.md` records each card's state (`selected`, `returned`, `out of scope`, `deleted`). `openspec/CHANGE-STATUS.md` records OpenSpec changes. Update them in the same turn as any change they reflect.
- **Only `reviewed` models are extracted** from tables with a Review column. `to review`, `superseded`, and `out of scope` are not extracted.
- **Do not invent behaviour.** If a note or an epic does not state something, ask or mark the gap; do not fill it in.

## Graphify

Before processing any specification, refresh the graph from `neocom-meta`:

```bash
cd neocom-meta
graphify update .
```

Then use `graphify query`, `graphify path`, or `graphify explain` before reading files by hand. Read only what the graph points to. The graph lives in `graphify-out/`, which is not versioned.

## Environment

- Node: the nvm alias `neocom` (`.nvmrc`). Run `nvm use` before `npm`, `npx`, or `openspec`.
- OpenSpec: `npx openspec list --json` from this root. The OpenSpec root is this repository.
- Python: the scripts in `scripts/` run with `python3`.

## Version control

- Conventional Commits. Follow the templates in `.dsh/templates/`. When the user gives a new example, store it there.
- Work on the current branch. Do not commit on `develop` or `main` unless the user explicitly asks.
- Do not commit, push, or open a PR unless the user asks. The `/git:*` commands are that request.
- Feature branches: `feature/<name>` from `develop`. An OpenSpec change is applied on its own branch.
- Do not write `SemVer` into `package.json`. The version is GitVersion `MajorMinorPatch`.

## Finder duplicate files

Never create files named `* 2.*` or `* 2` (Finder or sync conflict copies). If they appear and the canonical file exists, remove them with:

```bash
python3 scripts/cleanup-finder-duplicates.py
```

## Boundaries

- Do not implement product code here. For frontend or backend work, say so and stop; that work belongs in the owning repository (`neocom-front`, `neocom-back`, `neocom-domain`).
- `neocom` (the parent repository) is deprecated. `neocom-esi` is set aside. Do not write to either.
- Do not edit `.cursor/` unless the user asks. It is an older harness; `.dsh/` is the current one for this repository.
