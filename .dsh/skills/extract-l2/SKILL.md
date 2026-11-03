---
name: extract-l2
description: >-
  Convert L1 epics into L2 markdown files named after the epic (one or
  more files by topic). With no args, process epics that still have
  pending extract work; with args, only those epics. Applies the Review
  gate: only rows marked reviewed are extracted. Duplicates go to
  sources/L1/00.DUPLICATES.md. Use when /neo:extract-l2.
disable-model-invocation: true
---

# Extract L2

Meta command `/neo:extract-l2`. Owned by `neocom-spec-workflow`.

Converts L1 into L2. The L1 file is the epic itself, authored with `/epic`; there is no separate L1 generation step. This command does not register OpenSpec and does not implement product code.

## Gate model (replaces `UNREGISTERED REQUIREMENTS`)

**Deprecated.** Do **not** use an `UNREGISTERED REQUIREMENTS` (or `DUPLICATED`) heading on the epic or on new L2 extracts to control what is extractable. That inbox pattern is retired.

**Current control.** Requirements live **inside the epic** under authored sections (for example `## Section 19 — ServerStatusV1` with field tables, render contracts, and a requirements table). Every extractable unit carries a **Review** (status) cell from the list below. The developer adds new requirements at status `to review`. Only when the cell is changed to `reviewed` may this command extract that unit.

| Review / status | Extractable? | Meaning |
| --- | --- | --- |
| `to review` | **No** | Initial status for a new requirement or register row. Not extractable. |
| `reviewed` | **Yes** | Developer approved this batch. Extract this unit, then set the cell to `extracted`. |
| `extracted` | **No** | Already in L2. Re-extract only if set back to `reviewed`. |
| `duplicated` | **No** | Flagged as duplicate; content lives under `sources/L1/00.DUPLICATES.md`. |
| `superseded` | **Never** | Do not extract. |
| `out of scope` | **Never** | Do not extract. |

Only the exact value `reviewed` is extractable. Values such as `to review (PILOT-*)` are **not** extractable.

### Where the Review cell lives

Prefer, in order:

1. A **register** table on the epic (e.g. Section 02 model register) with a `Review` column — one row per section/topic.
2. A **requirements** table inside a section (`| ID | Review | … |`) — one row per requirement.
3. When a register row is `reviewed`, extract that section’s authored prose **and** every nested requirement row whose Review cell is `reviewed` (or that has no Review column and is part of the register unit). Nested rows still at `to review` stay in L1 and are not copied.

Do not invent Review cells. If an epic has no Review column yet, stop and ask the developer to add status tracking before extracting.

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

Non-epic L1 files (`REQUIREMENTS.md`, `UX.md`, `ESI.md`, `TRACEABILITY.md`, `00.DUPLICATES.md`) are never in the extract **source** set unless the user names a normal epic. `00.DUPLICATES` is a holding epic written by this command; it is not extracted into L2 by a default run.

### Pending (no arguments)

Read `sources/L1/TRACEABILITY.md` (and the L2 tree) to decide what is pending.

An epic has **pending** extract work when any of these is true:

- It has no `## \`NN.EPIC-….md\`` section in `sources/L1/TRACEABILITY.md`, or **Highest** is ⚪ `none`
- Highest is 📤 `extracted`, 📝 `registered`, or 🔨 `applying` (may still hold unextracted L1 passages — Sections still ⏳ / 👀)
- Highest is ✅ `applied` or 📦 `archived` **and** the L1 file has units at `reviewed` (or Sections 👀) not yet reflected in L2. If unsure, include it and let passage-level skip / duplicate handling decide

Skip an epic with no arguments only when Highest is `applied` or `archived` **and** a quick compare shows no L1 unit left at `reviewed` outside the L2 tree / applied OpenSpec coverage.

Report which epics were selected and which were skipped (with reason) before writing.

## Graphify (automatic first action)

**Before any other step**, run the graph refresh automatically. Do not ask the user. Do not skip.

```bash
cd neocom-meta
graphify update .
```

Prefer `.venv/bin/graphify update .` when the project venv exists. If the update fails, stop and report; do not extract against a stale graph.

After a successful update, prefer `graphify query` to check whether a passage is already in the L2 tree or OpenSpec; fall back to Read/Grep/Glob only on files the graph surfaces.

## Input

Read only the scoped epic files under `sources/L1/`. Each one is an L1 file: its authored sections and its register / requirement tables are the input. The file is read-only except for the status rules under Write rules (Review cells + `## Spec traceability`).

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

### L2 file shape (no `UNREGISTERED REQUIREMENTS`)

Write extracted units as normal sections / requirement tables under the L2 file. Mark each newly extracted requirement (or block) with registration status **`pending`** so `/neo:spec-evolution` can find the queue. Do **not** create `## UNREGISTERED REQUIREMENTS` or `## DUPLICATED` headings.

At the top of each generated or updated extract file, state the source epic, then the **L2 status header**, then the notes. Example:

```markdown
# L2 notes from sources/L1/01.EPIC-LOGIN-PROCEDURE.md

<!-- L2-STATUS: inbox -->

| Field | Value |
| --- | --- |
| Status | 📥 `inbox` |
| Kind | extract |
| Epic | EPIC-001 |
| OpenSpec | — |
| Pending | <count or short list of IDs awaiting /neo:spec-evolution> |
| Next | `/neo:spec-evolution sources/L2/01.EPIC-LOGIN-PROCEDURE.md` |
| Index | [`L2/INDEX.md`](INDEX.md) |

## ServerStatusV1 (from L1 Section 19)

| ID | Status | Requirement |
| --- | --- | --- |
| SRV-001 | pending | … |
```

Status tokens for L2 files (icons optional but preferred): 📥 `inbox` (has `pending` notes awaiting OpenSpec), 📭 `cleared` (no pending notes), 📌 `placed`, 🔗 `pointer`, ⛔ `parked`. Legend and queue live in `sources/L2/INDEX.md`.

**Legacy:** older L2 files may still contain `## UNREGISTERED REQUIREMENTS`. Do not add new content under that heading. `/neo:spec-evolution` may still drain a legacy heading once; new extracts use `pending` rows only.

## Existing L2 tree (skip index)

The current L2 tree is the record of what was already generated. Progress dashboards are `sources/L1/TRACEABILITY.md` (L1 → OpenSpec) and `sources/L2/INDEX.md` (L2 file backlog). Do not invent a third dashboard.

Treat as already holding material:

| L2 path | Role |
| --- | --- |
| `sources/L2/NN.EPIC-NAME.md` and `sources/L2/NN.EPIC-NAME.*.md` | Current epic-named extracts |
| `sources/L2/<SYSTEM>/NN.EPIC-NAME.*.md` | Epic-named extracts under a system folder |
| `sources/L2/NN.EPIC-NAME/**` | **Legacy** epic directories (`front.md`, `back.md`, …). Still valid for skip checks; do not create new ones |
| `sources/L2/<SYSTEM>/*.md` | Placed requirements (id + status) after Spec Evolution |
| `sources/L2/DOMAIN/MODELS/` | Model files |
| `sources/L2/INFRASTRUCTURE-SPECS.md` | Infrastructure rows |

## Duplicates → `00.DUPLICATES` (not an L2 `DUPLICATED` heading)

During extract, before writing a `reviewed` unit to L2, check whether the same behaviour (or a very similar one) already exists in the L2 tree or in an OpenSpec change listed on the epic with status `applied` or `archived` (prefer `graphify query`).

When it **does**:

1. **Do not** write the unit into the epic’s L2 extract as a new pending note.
2. **Move** the unit into the special epic `sources/L1/00.DUPLICATES.md` (create the file from the template below if missing). Record: source epic path, section/id, the requirement text, the path that already holds the behaviour, and the date.
3. On the **source** epic, set that unit’s Review cell to `duplicated` (not `extracted`).
4. Report the move for the developer (review, reinsertion into an epic, or removal).

Do **not** use a `## DUPLICATED` heading inside L2 files for new work.

### `00.DUPLICATES` file shape

```markdown
# EPIC-000 - DUPLICATES

## Spec traceability

| Field | Value |
| --- | --- |
| Status | holding |
| Purpose | Specs flagged as duplicate during `/neo:extract-l2` (or `/neo:spec-evolution`) for user review, reinsertion, or removal |
| Index | `L1/TRACEABILITY.md` |

## Goals

Holding area for duplicate or near-duplicate requirements. Not a product epic. Do not run `/neo:extract-l2` on this file as a normal source.

## Duplicates

### <SOURCE-EPIC-STEM> / <ID or section> — YYYY-MM-DD

| Field | Value |
| --- | --- |
| Source | `sources/L1/NN.EPIC-NAME.md` |
| Already in | `<L2 or OpenSpec path>` |
| Review on source | set to `duplicated` |

<requirement text verbatim>
```

Append new duplicate blocks; never delete historical blocks unless the user asks. Reinsertion is a **human** edit: copy back into a product epic at `to review` or `reviewed`, then clear or annotate the holding block.

## Already processed (per passage)

Read `sources/L1/TRACEABILITY.md` first.

A passage is already generated when the same behaviour, or a very similar one, is already in any path above, or in an OpenSpec change listed on that epic’s TRACEABILITY **L2 delivery** / Highest with status `applied` or `archived` — handle via **Duplicates → `00.DUPLICATES`** when the L1 unit is still at `reviewed`, or skip silently when it is already `extracted` / `duplicated`.

Append only **new** L1 units that are `reviewed` and not duplicates. Prefer updating an existing `sources/L2/NN.EPIC-NAME*.md` file when the new notes belong to the same group; otherwise create another `sources/L2/NN.EPIC-NAME.<group>.md`.

## Review gate (process only `reviewed`)

| Review cell | Action by `/neo:extract-l2` |
| --- | --- |
| `reviewed` | Extract to L2 as `pending`, then set cell to `extracted` — **unless** duplicate → `00.DUPLICATES` and cell → `duplicated` |
| `to review` | Skip. Leave section and rows untouched |
| `extracted` | Skip. Process again only when set back to `reviewed` |
| `duplicated` | Skip. Content is under `00.DUPLICATES` |
| `superseded`, `out of scope` | Never |

### Record of processing (index)

The record lives in `sources/L1/TRACEABILITY.md` under that epic’s **### Sections** table (`Section | Item | Status`). One row per register / requirement item.

For each gated row, in order:

1. L1 Review cell is `reviewed` and TRACEABILITY Sections Status is not already 📤 `extracted` / 🔁 `duplicated` for this cycle → **process** (extract or move to duplicates), set L1 Review to `extracted` or `duplicated`, then set Sections Status to 📤 `extracted` or 🔁 `duplicated` and bump the epic **Last updated**.
2. L1 Review is `reviewed` but Sections already shows 📤 `extracted` from an earlier pass without being reset → **skip** (already processed).
3. Any other L1 Review cell → **skip**; keep or refresh Sections Status to match (`to review`, `out of scope`, …).

Consequences the developer must know:

- The only Review cells this command writes are those it processes: `reviewed` → `extracted`, or `reviewed` → `duplicated`.
- An item that was `extracted` and is set back to `reviewed` on L1 (and Sections) is processed again on the next run.
- Run the command after each review batch so a flip `reviewed` → `to review` → `reviewed` without an intervening run is not missed.

### Precedence

This skill takes precedence over any text in the L1 file that describes the procedure differently. Follow this skill; do not edit the file's prose to match (except Review cells and Spec traceability as allowed).

## Write rules

- Do not invent behavior the L1 text does not state.
- **L1 edits allowed only for status.** On each processed epic, change (1) the Review status cell of each unit this command processed (`reviewed` → `extracted` or `duplicated`), and (2) the `## Spec traceability` table (see below). Do not edit Goals, Sources, section prose, IDs, or any other cell of a row that was not processed.
- Creating or appending `sources/L1/00.DUPLICATES.md` is allowed when duplicates are found.
- Do not place notes into final `sources/L2/<SYSTEM>/` feature registers as the OpenSpec registration step. That is `/neo:spec-evolution` (it may assign stable placement ids there).
- Do not write OpenSpec.
- Multi-repository passages may stay in **one** epic-named file when they are one shared contract (cookies, SSO parameters). Split into topic files when groups will diverge later — not automatically into one file per repo.

### Spec traceability on the epic (mandatory after extract)

After a successful extract on an epic, update that epic’s `## Spec traceability` so it matches the indexes. Keep the section **at the start of the file** (immediately under the `# EPIC-…` title, before Table of contents / Goals). If it sits lower in the file, move it up when updating.

| Field | After `/neo:extract-l2` |
| --- | --- |
| Status | At least 📤 `extracted` (keep a higher status if already `registered` / `applying` / …) |
| L2 | Epic-named L2 path(s) written or updated; note 📥 inbox when pending notes remain; keep useful pointers |
| OpenSpec changes | Leave unchanged unless already filled |
| Skip | What later extracts must skip or leave pending (rows still `to review`; re-extract only rows set back to `reviewed`; duplicates in `00.DUPLICATES`) |
| Index | `L1/TRACEABILITY.md` · `L2/INDEX.md` |

Do not invent OpenSpec change names here. Prefer the same icons/tokens as `TRACEABILITY.md`.

## Update traceability (mandatory)

After writing the L2 file(s) and the L1 status cells, update the indexes **and** the epic header:

- The epic’s `## Spec traceability` — as in the table above (start of file).
- `sources/L1/TRACEABILITY.md` — upsert that epic’s section (`## \`NN.EPIC-NAME.md\``): set **Highest** at least 📤 `extracted`; update **### Sections** for every gated row seen; add/refresh **### L2 delivery** rows for each epic-named L2 file written (OpenSpec status 📤 / changes `—` until Spec Evolution; Delivery `—`). Mirror inbox/cleared via `L2/INDEX.md`. If `00.DUPLICATES` was updated, note duplicated items in Sections (🔁).
- Do **not** update `sources/L1/SPEC-EPIC-INDEX.md` (deprecated; frozen for possible recovery).
- `sources/L2/INDEX.md` — add or refresh the row for each L2 file created or updated (status 📥 `inbox` when pending notes remain). Keep the legend and queue summary accurate.
- Each touched L2 file — keep the `<!-- L2-STATUS: … -->` header table in sync with the index row.

## Return

1. Scope: pending set, or the resolved epic list from arguments; epics skipped and why
2. Units processed this run (Review `reviewed` → `extracted` or `duplicated`), and units skipped with the reason (`to review`, `extracted`, `duplicated`, `superseded`, `out of scope`, or already processed in this cycle)
3. L1 files read
4. L2 files created or updated (full paths; epic stem in each name)
5. Notes newly written, by file (pending for OpenSpec)
6. Why single vs multiple files was chosen
7. Duplicates moved to `sources/L1/00.DUPLICATES.md`, each with the path that already holds the behaviour
8. Units left pending (`to review`) and not written
9. L1 changes: Review cells flipped, and `## Spec traceability` updated (confirm authored sections untouched)
10. That `sources/L2/INDEX.md` and each L2 file status header were updated (`SPEC-EPIC-INDEX.md` not touched — deprecated)
11. Next step: `/neo:spec-evolution` for L2 notes still `pending` (optionally scoped to those L2 paths). Units still `to review` on L1 are not in those notes.
