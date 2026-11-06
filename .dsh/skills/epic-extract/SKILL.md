---
name: epic-extract
description: >-
  Register reviewed L1 epic units directly into OpenSpec. With no args,
  process epics that still have reviewed units; with args, only those epics.
  Only checked Review cells ([x] / reviewed) are registered. Duplicates go to
  sources/L1/00.DUPLICATES.md. Use when /epic:extract.
disable-model-invocation: true
---

# Epic extract

Meta command `/epic:extract`. Owned by `neocom-spec-workflow`.

Reads an L1 epic and registers reviewed units into OpenSpec. There is no L2 copy. The L1 file is the epic, authored with `/epic`. This command does not implement product code.

`/neo:extract-l2` and `/neo:spec-evolution` are removed. Do not recreate them or `sources/L2/`.

## Gate model

Requirements live **inside the epic** under authored sections. Every registrable unit carries a **Review** cell.

| Review cell (authored) | Logical status | Register? | Meaning |
| --- | --- | --- | --- |
| `[ ] to review` | `to review` | **No** | Unchecked. Still pending human review. |
| `[x] reviewed` or `[X] reviewed` | `reviewed` | **Yes** | Checked. Developer approved this unit. |
| `registered` | `registered` | **No** | Already in OpenSpec. **No checkbox.** Re-register only if set back to `[x] reviewed`. |
| `extracted` | `extracted` | **No** | Legacy, from the removed L2 copy. The text stays on this epic. **No checkbox.** Register only if set back to `[x] reviewed`. |
| `duplicated` | `duplicated` | **No** | Holding copy in `sources/L1/00.DUPLICATES.md`. **No checkbox.** |
| `superseded` | `superseded` | **Never** | **No checkbox.** |
| `out of scope` | `out of scope` | **Never** | **No checkbox.** |

Rules:

1. New requirement / register rows SHALL start as **`[ ] to review`**.
2. The developer marks ready by changing to **`[x] reviewed`**.
3. This command registers only cells whose checkbox is checked **`[x]` / `[X]`** or whose logical status is `reviewed` (preferred form: `[x] reviewed`). Unchecked `[ ] to review` is skipped.
4. After a successful registration, replace the whole cell with **`registered`**. After a duplicate move, replace it with **`duplicated`**. The checkbox disappears.
5. Legacy cells that still say only `[ ]`, only `[x]`, or exactly `to review` / `reviewed` remain accepted until rewritten.
6. Annotated non-registrable variants such as `[ ] to review (PILOT-*)` stay **not** registrable.

### Where the Review cell lives

Prefer, in order:

1. A **register** table on the epic with a `Review` column — one row per section/topic.
2. A **requirements** table inside a section (`| ID | Review | … |`) — one row per requirement.
3. When a register row is `[x]` / `reviewed`, register that section’s authored prose **and** every nested requirement row whose Review cell is `[x]` / `reviewed` (or that has no Review column and is part of the register unit). Nested rows still at `[ ]` / `to review` stay on the epic and are not registered.

Do not invent Review cells. If an epic has no Review column yet, stop and ask the developer to add status tracking before registering.

## Scope (parameters)

Optional arguments after the command name select which L1 epics to process.

| Invocation | Scope |
| --- | --- |
| `/epic:extract` | Every L1 epic that still has **pending** registration work |
| `/epic:extract <epic>…` | Only the epic(s) named, even if status is `applied` or `archived` |

**Prefer the epic number** (`01`, `02`, …). Also accept an epic id, epic stem, name fragment, or path under `sources/L1/`.

Examples: `/epic:extract 01` · `/epic:extract 01 02`

Resolve each argument to exactly one `sources/L1/NN.EPIC-*.md`. If an argument matches none or more than one, stop and report it. Do not fall back to the full pending set when any argument was given.

Non-epic L1 files (`REQUIREMENTS.md`, `UX.md`, `ESI.md`, `TRACEABILITY.md`, `00.DUPLICATES.md`) are never in the source set unless the user names a normal epic. `00.DUPLICATES` is a holding epic written by this command; a default run does not register it.

### Pending (no arguments)

Read `sources/L1/TRACEABILITY.md`.

An epic has **pending** work when any of these is true:

- It has no `## \`NN.EPIC-….md\`` section in `sources/L1/TRACEABILITY.md`, or **Highest** is ⚪ `none`
- Highest is 📝 `registered` or 🔨 `applying` and Sections still show 👀 `reviewed` (or L1 still has `[x] reviewed`)
- Highest is ✅ `applied` or 📦 `archived` **and** the L1 file has units at `reviewed`. If unsure, include it and let passage-level skip / duplicate handling decide

Skip an epic with no arguments only when Highest is `applied` or `archived` **and** no L1 unit remains at `reviewed`.

Legacy Highest 📤 `extracted` (the removed L2 step) is not a queue. Those units stay on the L1 epic until a developer sets a cell back to `[x] reviewed`.

Report which epics were selected and which were skipped (with reason) before writing.

## Graphify (automatic first action)

**Before any other step**, run the graph refresh automatically. Do not ask the user. Do not skip.

```bash
cd neocom-meta
graphify update .
```

Prefer `.venv/bin/graphify update .` when the project venv exists. If the update fails, stop and report; do not register against a stale graph.

After a successful update, prefer `graphify query` to check whether a passage is already in OpenSpec; fall back to Read/Grep/Glob only on files the graph surfaces.

When `neocom-meta/graphify-out/graph.json` exists, after the unit is read and before a new change is created:

```bash
cd neocom-meta
graphify query "<subject of the unit>" --graph graphify-out/graph.json
```

Keep a node only when its `src` is under `openspec/changes/` or `openspec/specs/` and that file already states the same behavior, or a very similar one. Treat that as a **duplicate**. Extend an existing change only when a returned node `src` is an OpenSpec change that already states the same behavior.

Ignore every other node. If no source path qualifies, or `graph.json` is missing after a failed update, stop inventing duplicates — only flag when a qualifying path matches.

## Input

Read only the scoped epic files under `sources/L1/`. Authored sections and register / requirement tables are the input. The file is read-only except Review cells and `## Spec traceability`.

Do not invent behavior the L1 text does not state. Do not open units that are still `to review`.

## Review

1. Resolve the scope. Collect every `[x] reviewed` unit in the scoped epics.
2. For each unit, decide and record:
   - System: `front`, `infra`, `cicd`, `back`, `domain`, or a system the user names
   - Feature name (kebab-case)
   - OpenSpec change `<system>-<feature>` (extend an existing change when it already states this behavior)
   - Whether an OpenSpec change or main spec already states the same behavior, or a very similar one
3. If a unit is too ambiguous to choose a system or feature, ask before writing. Do not invent behavior.
4. If no scoped epic has a unit to register, stop.
5. Show this review before writing files: the scoped epics, then each unit, its system, its feature, and its destination (or duplicate target).

## Duplicates → `00.DUPLICATES`

When a `reviewed` unit matches behavior already in an OpenSpec change or main spec:

1. Do **not** register it again.
2. **Move** the unit into `sources/L1/00.DUPLICATES.md` (create the file from the template below if missing). Record: source epic path, section/id, the requirement text, the path that already holds the behaviour, and the date.
3. On the **source** epic, set that unit’s Review cell to `duplicated`.
4. Report the move for the developer (review, reinsertion into an epic, or removal).

### `00.DUPLICATES` file shape

```markdown
# EPIC-000 - DUPLICATES

## Spec traceability

| Field | Value |
| --- | --- |
| Status | holding |
| Purpose | Specs flagged as duplicate during `/epic:extract` for user review, reinsertion, or removal |
| Index | `L1/TRACEABILITY.md` |

## Goals

Holding area for duplicate or near-duplicate requirements. Not a product epic. Do not run `/epic:extract` on this file as a normal source.

## Duplicates

### <SOURCE-EPIC-STEM> / <ID or section> — YYYY-MM-DD

| Field | Value |
| --- | --- |
| Source | `sources/L1/NN.EPIC-NAME.md` |
| Already in | `<OpenSpec path>` |
| Review on source | set to `duplicated` |

<requirement text verbatim>
```

Append new duplicate blocks; never delete historical blocks unless the user asks. Reinsertion is a **human** edit: copy back into a product epic at `[ ]` or `[x]`, then clear or annotate the holding block.

## Register into OpenSpec

1. **Confirm OpenSpec root.** From `neocom-meta/`: run `npx openspec list --json` and confirm `"root"` is this repository. If missing, stop and ask the user to init OpenSpec here (do not create it as a side effect).
2. **Register.** For each feature:
   - Change name: `<system>-<feature>` (hyphens only; the CLI rejects `/`).
   - Delta spec path: `openspec/changes/<system>-<feature>/specs/<system>/<feature>/spec.md`.
   - Create with `openspec new change "<system>-<feature>"` when the change does not exist, then author proposal, specs, design, and tasks.
   - Cite the L1 epic stem and the L1 requirement id. Do not cite an L2 path.
   - Do not invent behavior that is not in the L1 text.
3. **L1 status.** On each processed epic, set the Review cell of each registered unit to `registered`, or `duplicated` when moved. Do not edit Goals, Sources, section prose, IDs, or any other cell of a row that was not processed.
4. **Spec traceability.** Update that epic’s `## Spec traceability` at the **start of the file** (immediately under the `# EPIC-…` title). If it sits lower, move it up when updating. Fields: Status (at least `registered`; keep a higher status), OpenSpec changes, Skip (rows still `to review`; re-register only rows set back to `reviewed`; duplicates in `00.DUPLICATES`), Index (`L1/TRACEABILITY.md`). Do not add an L2 field. Do not invent OpenSpec change names.
5. **Traceability index.** Upsert that epic’s section in `sources/L1/TRACEABILITY.md`: set **Highest** at least 📝 `registered`; refresh **### Sections** for every gated row. Do **not** recreate **`### L2 delivery`**.
6. **Change status register.** Update `openspec/CHANGE-STATUS.md` for every new or changed OpenSpec change. Refresh task counts with `npx openspec list --json`. When folding several changes into one feature, refresh the Specs abstract sections in that same file (clusters, change abstracts, capability index). Do not recreate `openspec/SPECS-ABSTRACT.md`.
7. Update `01.PROGRAMME-DEFINITION/` when the review names a new feature, including `FEATURES/` with the L1 ids and OpenSpec change names.

### Precedence

This skill takes precedence over any text in the L1 file that describes the procedure differently. Follow this skill; do not edit the file's prose to match (except Review cells and Spec traceability as allowed).

## Boundaries

- Do not implement product code in front/back from this command, **except** the visual-appearance capture exception below.
- Do not edit `neocom-back` application sources from this command.
- Meta writes, including OpenSpec artifacts and `00.DUPLICATES` appends, stay under `neocom-meta`.
- Do not pull `to review` L1 sections into this run.
- Do not write `sources/L2/` or any L2 status header.
- **Visual appearance capture (allowed):** when registering a visual feature whose L1 Appearance needs a real PNG, you **MAY** add a specimen of the proposed render on `neocom-front` `model-strip-page` and capture it into `neocom-meta/sources/L1/media/*.png`. Prefer a live strip capture over a generated stand-in. Limit front edits to that specimen/render; do not use this path for unrelated product work.

## Return

1. Scope: pending set, or the resolved epic list; epics skipped and why
2. Units processed (`reviewed` → `registered` or `duplicated`), and units skipped with the reason
3. L1 files read
4. OpenSpec change names and paths
5. Duplicates moved to `sources/L1/00.DUPLICATES.md`, each with the path that already holds the behaviour
6. Units left at `to review`
7. L1 changes: Review cells flipped, and `## Spec traceability` updated (authored sections untouched)
8. That `openspec/CHANGE-STATUS.md` and `sources/L1/TRACEABILITY.md` were updated
9. Next step: apply / feature delivery when the user wants a registered feature applied
