---
name: extract-l2
description: >-
  Convert L1 epics into L2 markdown files named after the epic (one or
  more files by topic). With no args, process epics that still have
  pending extract work; with args, only those epics. Use when /neo:extract-l2.
disable-model-invocation: true
---

# Extract L2

Meta command `/neo:extract-l2`. Owned by `/neocom-meta`.

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
| Number `NN` or `N` (preferred) | `01`, `1` → `L1/01.EPIC-….md` |
| Epic id | `EPIC-001` |
| Epic stem | `01.EPIC-LOGIN-PROCEDURE` |
| Name fragment | `login`, `login-procedure`, `LOGIN PROCEDURE` |
| Path | `L1/01.EPIC-LOGIN-PROCEDURE.md` or absolute path under `L1/` |

Examples: `/neo:extract-l2 01` · `/neo:extract-l2 01 02`

Resolve each argument to exactly one `L1/NN.EPIC-*.md`. If an argument matches none or more than one, stop and report it. Do not fall back to the full pending set when any argument was given.

Non-epic L1 files (`REQUIREMENTS.md`, `UX.md`, `ESI.md`, `TRACEABILITY.md`) are never in scope unless the user names a path that is somehow an epic (they are not).

### Pending (no arguments)

Read `L1/TRACEABILITY.md` and each epic’s `## Spec traceability`.

An epic has **pending** extract work when any of these is true:

- It has no row in `L1/TRACEABILITY.md`, or status is `none`
- Status is `extracted`, `registered`, or `applying` (may still hold unextracted L1 passages)
- Status is `applied` or `archived` **and** the L1 file has material not yet reflected in the L2 tree (new passages since the last extract). If unsure, include it and let passage-level skip report “already generated”

Skip an epic with no arguments only when status is `applied` or `archived` **and** a quick compare shows no L1 passage left outside the L2 tree / applied OpenSpec coverage.

Report which epics were selected and which were skipped (with reason) before writing.

## Input

Read only the scoped epic files under `05.REQUIREMENTS-DECOMPOSITION/L1/`.

Do not invent external source corpora. L1 is the only extract input; it is authored with `/epic`.

## Output naming (epic-traceable)

Do **not** require an epic directory or a fixed split per repository (`front.md` / `back.md` / …). Specs tend to aggregate into feature groups later; write L2 in the shape that fits the material.

Every new L2 file name **must include the epic stem** `NN.EPIC-NAME` so it stays traceable to `L1/NN.EPIC-NAME.md`.

| Situation | File name |
| --- | --- |
| One coherent extract | `L2/NN.EPIC-NAME.md` |
| Several topic groups | `L2/NN.EPIC-NAME.<group>.md` — `<group>` is kebab-case (feature or topic), e.g. `login`, `dashboard-layout`, `sso-cookies` |
| Optional system folder | `L2/<SYSTEM>/NN.EPIC-NAME.<group>.md` only when the whole file clearly belongs to one system (`FRONT`, `BACK`, `ESI`, …). The epic stem remains in the file name |

Choose **one file** when passages belong together. Choose **multiple files** when topics will likely register as separate OpenSpec capabilities or when keeping them in one file would mix unrelated notes. Do not invent empty files.

Each file holds new notes under `UNREGISTERED REQUIREMENTS` (and later `DUPLICATED` when Spec Evolution says so).

At the top of each generated file, state the source epic in one line, for example:

```markdown
# L2 notes from L1/01.EPIC-LOGIN-PROCEDURE.md

## UNREGISTERED REQUIREMENTS
```

## Existing L2 tree (skip index)

The current L2 tree is the record of what was already generated. Do not add a second index beyond `L1/TRACEABILITY.md`.

Treat as already holding material:

| L2 path | Role |
| --- | --- |
| `L2/NN.EPIC-NAME.md` and `L2/NN.EPIC-NAME.*.md` | Current epic-named extracts |
| `L2/<SYSTEM>/NN.EPIC-NAME.*.md` | Epic-named extracts under a system folder |
| `L2/NN.EPIC-NAME/**` | **Legacy** epic directories (`front.md`, `back.md`, …). Still valid for skip checks; do not create new ones |
| `L2/<SYSTEM>/*.md` | Placed requirements (id + status) after Spec Evolution |
| `L2/DOMAIN/MODELS/` | Model files |
| `L2/INFRASTRUCTURE-SPECS.md` | Infrastructure rows |

## Already processed (per passage)

Read `L1/TRACEABILITY.md` and the epic’s `## Spec traceability` section first.

A passage is already generated when the same behavior, or a very similar one, is already in any path above, or in an OpenSpec change listed on the L1 epic with status `applied` or `archived`.

Leave that passage where it is. Do not copy it again. Report the L2 or OpenSpec path that holds it.

Append only **new** L1 passages that are in scope for this iteration. Prefer updating an existing `L2/NN.EPIC-NAME*.md` file when the new notes belong to the same group; otherwise create another `L2/NN.EPIC-NAME.<group>.md`.

## Reviewed models only (EPIC-004 and any later epic that uses a Review column)

When the L1 file has a model register whose **Review** column uses the values below, extract is iterative. Read that column before copying any model section.

| Review cell | Extract |
| --- | --- |
| `reviewed` | In scope. Copy that model’s section (and requirement rows that live in it) into L2. |
| `to review` | Pending. Leave the section and the cell untouched. Do not write L2 notes for it. |
| `extracted` | Already taken. Skip unless the cell is set back to `reviewed` for a later iteration. |
| `superseded`, `out of scope` | Never extract. |

A cell is `reviewed` only when that is the whole cell. `to review` and `to review (PILOT-*)` stay pending.

After the L2 notes for a `reviewed` model are written, set that register cell to `extracted`. Do not edit the prose of a pending section. Framing sections (versioning rules, the register, the hierarchy diagram, deployment) are not model sections; extract a framing section only when its own register row is `reviewed`.

Report three lists: models extracted this iteration, models left pending, models skipped because they are already `extracted`, superseded, or out of scope.

## Write rules

- Do not invent behavior the L1 text does not state.
- Do not rewrite L1 goals or body text. **Do** update only `## Spec traceability`, `L1/TRACEABILITY.md` (status at least `extracted`; list the L2 file path(s) written), and the **Review** cell of each model extracted in this iteration (`reviewed` → `extracted`). Do not edit a `to review` row or its section.
- Do not place notes into final `L2/<SYSTEM>/` feature registers and do not assign stable ids. That is `/neo:spec-evolution`.
- Do not write OpenSpec.
- Multi-repository passages may stay in **one** epic-named file when they are one shared contract (cookies, SSO parameters). Split into topic files when groups will diverge later — not automatically into one file per repo.

## Return

1. Scope: pending set, or the resolved epic list from arguments; epics skipped and why
2. L1 files read
3. L2 files created or updated (full paths; epic stem in each name)
4. Notes newly written, by file
5. Why single vs multiple files was chosen
6. Passages already generated, each with the path that holds it
7. Models left pending (`to review`) and not written
8. That L1 `## Spec traceability` and `L1/TRACEABILITY.md` were updated, and each extracted model’s Review cell is now `extracted`
9. Next step: `/neo:spec-evolution` for the new notes under `UNREGISTERED REQUIREMENTS` (optionally scoped to those L2 paths). Pending models are not in those notes.
