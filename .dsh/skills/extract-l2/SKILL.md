---
name: extract-l2
description: >-
  Convert L1 epics into L2 markdown files named after the epic (one or
  more files by topic). With no args, process epics that still have
  pending extract work; with args, only those epics. Use when /neo:extract-l2.
disable-model-invocation: true
---

# Extract L2

Meta command `/neo:extract-l2`. Owned by `neocom-spec-workflow`.

Converts L1 into L2. It does not register OpenSpec and it does not implement product code.

## Scope (parameters)

Optional arguments after the command name select which L1 epics to process.

| Invocation | Scope |
| --- | --- |
| `/neo:extract-l2` | Every L1 epic that still has **pending** extract work (see below) |
| `/neo:extract-l2 <epic>…` | Only the epic(s) named by the argument(s), even if status is `applied` or `archived` |

**Prefer the epic number** (`01`, `02`, …) to select epics. Also accept:

| Form | Example |
| --- | --- |
| Number `NN` or `N` (preferred) | `01`, `1` → `sources/L1/01.EPIC-….md` |
| Epic id | `EPIC-001` |
| Epic stem | `01.EPIC-LOGIN-PROCEDURE` |
| Name fragment | `login`, `login-procedure`, `LOGIN PROCEDURE` |
| Path | `sources/L1/01.EPIC-LOGIN-PROCEDURE.md` or absolute path under `sources/L1/` |

Examples: `/neo:extract-l2 01` · `/neo:extract-l2 01 02`

Resolve each argument to exactly one `sources/L1/NN.EPIC-*.md`. If an argument matches none or more than one, stop and report it. Do not fall back to the full pending set when any argument was given.

Non-epic L1 files (`REQUIREMENTS.md`, `UX.md`, `ESI.md`, `TRACEABILITY.md`) are never in scope unless the user names a path that is somehow an epic (they are not).

### Pending (no arguments)

Read `sources/L1/TRACEABILITY.md` (and the L2 tree) to decide what is pending.

An epic has **pending** extract work when any of these is true:

- It has no row in `sources/L1/TRACEABILITY.md`, or status is `none`
- Status is `extracted`, `registered`, or `applying` (may still hold unextracted L1 passages)
- Status is `applied` or `archived` **and** the L1 file has material not yet reflected in the L2 tree (new passages since the last extract). If unsure, include it and let passage-level skip report “already generated”

Skip an epic with no arguments only when status is `applied` or `archived` **and** a quick compare shows no L1 passage left outside the L2 tree / applied OpenSpec coverage.

Report which epics were selected and which were skipped (with reason) before writing.

## Graphify (before processing)

Run `graphify update .` from `neocom-meta` before reading the L1 epics and the L2 tree, so `graphify-out/graph.json` reflects the current `sources/L1/`, `sources/L2/`, and `openspec/` files. Prefer `graphify query` to check whether a passage is already in the L2 tree; fall back to Read/Grep/Glob only on files the graph surfaces.

## Input

Read only the scoped epic files under `sources/L1/`.

Do not invent external source corpora. L1 is the only extract input; it is authored with `/epic`.

## Output naming (epic-traceable)

Do **not** require an epic directory or a fixed split per repository (`front.md` / `back.md` / …). Specs tend to aggregate into feature groups later; write L2 in the shape that fits the material.

Every new L2 file name **must include the epic stem** `NN.EPIC-NAME` so it stays traceable to `sources/L1/NN.EPIC-NAME.md`.

| Situation | File name |
| --- | --- |
| One coherent extract | `sources/L2/NN.EPIC-NAME.md` |
| Several topic groups | `sources/L2/NN.EPIC-NAME.<group>.md` — `<group>` is kebab-case (feature or topic), e.g. `login`, `dashboard-layout`, `sso-cookies` |
| Optional system folder | `sources/L2/<SYSTEM>/NN.EPIC-NAME.<group>.md` only when the whole file clearly belongs to one system (`FRONT`, `BACK`, `ESI`, …). The epic stem remains in the file name |

Choose **one file** when passages belong together. Choose **multiple files** when topics will likely register as separate OpenSpec capabilities or when keeping them in one file would mix unrelated notes. Do not invent empty files.

Each file holds new notes under `UNREGISTERED REQUIREMENTS` (and later `DUPLICATED` when Spec Evolution says so).

At the top of each generated file, state the source epic in one line, for example:

```markdown
# L2 notes from sources/L1/01.EPIC-LOGIN-PROCEDURE.md

## UNREGISTERED REQUIREMENTS
```

## Existing L2 tree (skip index)

The current L2 tree is the record of what was already generated. Do not add a second index beyond `sources/L1/TRACEABILITY.md`.

Treat as already holding material:

| L2 path | Role |
| --- | --- |
| `sources/L2/NN.EPIC-NAME.md` and `sources/L2/NN.EPIC-NAME.*.md` | Current epic-named extracts |
| `sources/L2/<SYSTEM>/NN.EPIC-NAME.*.md` | Epic-named extracts under a system folder |
| `sources/L2/NN.EPIC-NAME/**` | **Legacy** epic directories (`front.md`, `back.md`, …). Still valid for skip checks; do not create new ones |
| `sources/L2/<SYSTEM>/*.md` | Placed requirements (id + status) after Spec Evolution |
| `sources/L2/DOMAIN/MODELS/` | Model files |
| `sources/L2/INFRASTRUCTURE-SPECS.md` | Infrastructure rows |

## Already processed (per passage)

Read `sources/L1/TRACEABILITY.md` first.

A passage is already generated when the same behavior, or a very similar one, is already in any path above, or in an OpenSpec change listed on the epic row with status `applied` or `archived`.

Leave that passage where it is. Do not copy it again. Report the L2 or OpenSpec path that holds it.

Append only **new** L1 passages that are in scope for this iteration. Prefer updating an existing `sources/L2/NN.EPIC-NAME*.md` file when the new notes belong to the same group; otherwise create another `sources/L2/NN.EPIC-NAME.<group>.md`.

## Reviewed models only (EPIC-004 and any later epic that uses a Review column)

When the L1 file has a model register whose **Review** column uses the values below, extract is iterative. Read that column before copying any model section.

| Review cell | Extract |
| --- | --- |
| `reviewed` | In scope. Copy that model’s section (and requirement rows that live in it) into L2. |
| `to review` | Pending. Leave the section untouched. Do not write L2 notes for it. |
| `extracted` | Already taken. Skip. |
| `superseded`, `out of scope` | Never extract. |

A cell is `reviewed` only when that is the whole cell. `to review` and `to review (PILOT-*)` stay pending.

## Write rules

- Do not invent behavior the L1 text does not state.
- **Do not modify the L1 source epic.** The L1 epic file is read-only during extract. Do not edit `## Spec traceability`, do not edit the Review cells, and do not edit its prose. The record of what was extracted lives in `sources/L1/TRACEABILITY.md`, not in the epic.
- Do not place notes into final `sources/L2/<SYSTEM>/` feature registers and do not assign stable ids. That is `/neo:spec-evolution`.
- Do not write OpenSpec.
- Multi-repository passages may stay in **one** epic-named file when they are one shared contract (cookies, SSO parameters). Split into topic files when groups will diverge later — not automatically into one file per repo.

## Update traceability (mandatory)

After writing the L2 file(s), update the traceability index (never the epic file):

- `sources/L1/TRACEABILITY.md` — set the epic row status at least `extracted`, fill **L2 path** with the file paths written, and note the requirement IDs (or model names) extracted this iteration so a later run skips them.

## Return

1. Scope: pending set, or the resolved epic list from arguments; epics skipped and why
2. L1 files read
3. L2 files created or updated (full paths; epic stem in each name)
4. Notes newly written, by file
5. Why single vs multiple files was chosen
6. Passages already generated, each with the path that holds it
7. Models left pending (`to review`) and not written
8. That `sources/L1/TRACEABILITY.md` was updated (and that the L1 epic file was left untouched)
9. Next step: `/neo:spec-evolution` for the new notes under `UNREGISTERED REQUIREMENTS` (optionally scoped to those L2 paths). Pending models are not in those notes.
