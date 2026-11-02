---
name: extract-l2
description: >-
  Convert L1 epics into L2 markdown files named after the epic (one or
  more files by topic). With no args, process epics that still have
  pending extract work; with args, only those epics. Applies the Review
  gate: only rows marked reviewed are extracted. Use when /neo:extract-l2.
disable-model-invocation: true
---

# Extract L2

Meta command `/neo:extract-l2`. Owned by `neocom-spec-workflow`.

Converts L1 into L2. The L1 file is the epic itself, authored with `/epic`; there is no separate L1 generation step. This command does not register OpenSpec and does not implement product code.

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

## Graphify (automatic first action)

**Before any other step**, run the graph refresh automatically. Do not ask the user. Do not skip.

```bash
cd neocom-meta
graphify update .
```

Prefer `.venv/bin/graphify update .` when the project venv exists. If the update fails, stop and report; do not extract against a stale graph.

After a successful update, prefer `graphify query` to check whether a passage is already in the L2 tree; fall back to Read/Grep/Glob only on files the graph surfaces.

## Input

Read only the scoped epic files under `sources/L1/`. Each one is an L1 file: its authored sections and its register are the input. The file is read-only except for the status rules under Write rules (Review cells + `## Spec traceability`).

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

At the top of each generated file, state the source epic, then the **L2 status header**, then the notes. Example:

```markdown
# L2 notes from sources/L1/01.EPIC-LOGIN-PROCEDURE.md

<!-- L2-STATUS: inbox -->

| Field | Value |
| --- | --- |
| Status | 📥 `inbox` |
| Kind | extract |
| Epic | EPIC-001 |
| OpenSpec | — |
| Unregistered | <count or short list> |
| Next | `/neo:spec-evolution sources/L2/01.EPIC-LOGIN-PROCEDURE.md` |
| Index | [`L2/INDEX.md`](INDEX.md) |

## UNREGISTERED REQUIREMENTS
```

Status tokens for L2 files (icons optional but preferred): 📥 `inbox` (has unregistered notes), 📭 `cleared` (unregistered empty), 📌 `placed`, 🔗 `pointer`, ⛔ `parked`. Legend and queue live in `sources/L2/INDEX.md`.

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

## Already processed (per passage)

Read `sources/L1/TRACEABILITY.md` first.

A passage is already generated when the same behavior, or a very similar one, is already in any path above, or in an OpenSpec change listed on the epic row with status `applied` or `archived`.

Leave that passage where it is. Do not copy it again. Report the L2 or OpenSpec path that holds it.

Append only **new** L1 passages that are in scope for this iteration. Prefer updating an existing `sources/L2/NN.EPIC-NAME*.md` file when the new notes belong to the same group; otherwise create another `sources/L2/NN.EPIC-NAME.<group>.md`.

## Review gate (process only `reviewed`)

The register of the L1 file (its `## Section 02 — … register` table, with a `Review` column) is the switch. Only rows whose Review cell is exactly `reviewed` are extracted. A processed row takes its model section and the requirement table inside that section with it.

| Review cell | Extracted by `/neo:extract-l2` |
| --- | --- |
| `reviewed` | Yes, unless the record shows it already processed in this `reviewed` cycle. After processing, the cell is set to `extracted` |
| `to review`, or any other value such as `to review (PILOT-*)` | No. The section stays untouched and no L2 note is written for it |
| `extracted` | No. It is already in L2. Processed again only when the cell is set back to `reviewed` |
| `superseded`, `out of scope` | Never |

Only the exact value `reviewed` counts.

### Record of processing (index)

The record lives in `sources/L1/TRACEABILITY.md`, section **Review gate record**. One row per register item (`epic`, `item`), with:

- `Last seen`: the Review cell value after the last run (blank if never seen).
- `Processed`: the date of the last processing (blank if never processed).

For each register row, in order:

1. Cell is `reviewed` and `Last seen` is not `reviewed` (blank or any other value) → **process** the row, set its Review cell to `extracted`, then set `Processed` to the run date and `Last seen` to `extracted`.
2. Cell is `reviewed` and `Last seen` is `reviewed` → **skip**; it was processed in this cycle.
3. Any other cell → **skip**; set `Last seen` to that value.

Consequences the developer must know:

- The only Review cell this command writes is the one it processes, from `reviewed` to `extracted`. No other cell changes.
- An item that was processed (`extracted`) and is set back to `reviewed` is processed again on the next run. The change is visible because `Last seen` holds `extracted`.
- An item still at `reviewed` that is set to `to review` and back to `reviewed` before a run is not seen. Run the command after each review batch to avoid that.

### Precedence

This skill takes precedence over any text in the L1 file that describes the procedure differently. Follow this skill; do not edit the file's prose to match.

## Write rules

- Do not invent behavior the L1 text does not state.
- **L1 edits allowed only for status.** On each processed epic, change (1) the Review status cell of each row this command processed, from `reviewed` to `extracted`, and (2) the `## Spec traceability` table (see below). Do not edit Goals, Sources, model sections, headings, prose, IDs, or any other cell of a register row that was not processed.
- Do not place notes into final `sources/L2/<SYSTEM>/` feature registers and do not assign stable ids. That is `/neo:spec-evolution`.
- Do not write OpenSpec.
- Multi-repository passages may stay in **one** epic-named file when they are one shared contract (cookies, SSO parameters). Split into topic files when groups will diverge later — not automatically into one file per repo.

### Spec traceability on the epic (mandatory after extract)

After a successful extract on an epic, update that epic’s `## Spec traceability` so it matches the indexes. Keep the section **at the start of the file** (immediately under the `# EPIC-…` title, before Table of contents / Goals). If it sits lower in the file, move it up when updating.

| Field | After `/neo:extract-l2` |
| --- | --- |
| Status | At least 📤 `extracted` (keep a higher status if already `registered` / `applying` / …) |
| L2 | Epic-named L2 path(s) written or updated; note 📥 inbox when `UNREGISTERED REQUIREMENTS` still has notes; keep useful pointers (e.g. front pointer files) |
| OpenSpec changes | Leave unchanged unless already filled |
| Skip | What later extracts must skip or leave pending (e.g. rows still `to review`; re-extract only rows set back to `reviewed`) |
| Index | `L1/TRACEABILITY.md` · `L2/INDEX.md` |

Do not invent OpenSpec change names here. Prefer the same icons/tokens as `TRACEABILITY.md`.

## Update traceability (mandatory)

After writing the L2 file(s) and the L1 status cells, update the indexes **and** the epic header:

- The epic’s `## Spec traceability` — as in the table above (start of file).
- `sources/L1/TRACEABILITY.md` — set the epic row status at least `extracted`, fill **L2 path** with the file paths written, set **L2 backlog** to reflect inbox/cleared extracts for that epic (e.g. 📥 `1 inbox`), note the requirement IDs (or model names) extracted this iteration so a later run skips them, and update the **Review gate record** for every register row seen in this run.
- `sources/L1/SPEC-EPIC-INDEX.md` — for every register row (and related requirement IDs) processed this run, set Review/Status to 🔵 `extracted`, put the L2 path in Notes, and refresh **Current Status Summary**. Also set `Last seen` rows that were only observed (not processed) so this index still matches the epic. Do not leave extracted work stuck at 🟢 `reviewed` here.
- `sources/L2/INDEX.md` — add or refresh the row for each L2 file created or updated (status 📥 `inbox` when `UNREGISTERED REQUIREMENTS` has notes; OpenSpec/Next/Unregistered columns). Keep the legend and queue summary accurate.
- Each touched L2 file — keep the `<!-- L2-STATUS: … -->` header table in sync with the index row.

## Return

1. Scope: pending set, or the resolved epic list from arguments; epics skipped and why
2. Register rows processed this run (Review cell `reviewed` → `extracted`), and rows skipped with the reason (`to review`, `extracted`, `superseded`, `out of scope`, or already processed in this cycle)
3. L1 files read
4. L2 files created or updated (full paths; epic stem in each name)
5. Notes newly written, by file
6. Why single vs multiple files was chosen
7. Passages already generated, each with the path that holds it
8. Models left pending (`to review`) and not written
9. L1 changes: Review cells flipped, and `## Spec traceability` updated (confirm authored sections untouched)
10. That `sources/L2/INDEX.md`, `sources/L1/SPEC-EPIC-INDEX.md`, and each L2 file status header were updated
11. Next step: `/neo:spec-evolution` for the new notes under `UNREGISTERED REQUIREMENTS` (optionally scoped to those L2 paths). Pending models are not in those notes.
