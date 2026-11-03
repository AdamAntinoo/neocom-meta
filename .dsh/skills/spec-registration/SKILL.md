---
name: spec-registration
description: >-
  Review L2 notes and move them into OpenSpec. Used by /neo:spec-evolution.
  Optional L2 paths limit the run to those files. L1 conversion is
  /neo:extract-l2. Duplicates go to sources/L1/00.DUPLICATES.md.
disable-model-invocation: true
---

# Spec Evolution

`/neo:spec-evolution`. Owned by `neocom-spec-workflow`.

Reviews L2 notes and moves them into OpenSpec. L1 conversion is `/neo:extract-l2`. Do not implement product code in `neocom-front` or `neocom-back`.

## Queue model (replaces `UNREGISTERED REQUIREMENTS`)

**Deprecated.** Do not rely on `## UNREGISTERED REQUIREMENTS` / `## DUPLICATED` as the control for what to register. New extracts from `/neo:extract-l2` put requirements in L2 with registration status **`pending`**. The L1 **Review** gate (`to review` → `reviewed` → extract) already decided what may leave the epic.

**Current queue.** Process L2 notes that are still awaiting OpenSpec:

1. Requirement / note rows whose Status (or equivalent) cell is `pending`.
2. Epic-named extract files whose L2 header is 📥 `inbox` (has pending notes).
3. **Legacy only:** notes still under `## UNREGISTERED REQUIREMENTS` in older L2 files — drain them once, then leave that heading empty or remove it; do not add new content there.

Do **not** open L1 to pull sections that are still `to review`. Those stay on the epic until Review is `reviewed` and `/neo:extract-l2` writes them.

## Scope

Optional arguments after the command name are L2 file paths. When one or more are given, process only those files. When none are given, process every file under `sources/L2/`.

Accept a path relative to `neocom-meta`, relative to `sources/L2/`, or an absolute path. Resolve each argument to a file under `sources/L2/`. A glob or prefix such as `sources/L2/01.EPIC-LOGIN-PROCEDURE` may mean every matching `sources/L2/01.EPIC-LOGIN-PROCEDURE.md` and `sources/L2/01.EPIC-LOGIN-PROCEDURE.*.md` (and a legacy epic directory if it still exists). If an argument is missing or is outside `sources/L2/`, stop and report that argument. Do not fall back to the full tree when any argument was given.

Examples:

- `/neo:spec-evolution` — every L2 file
- `/neo:spec-evolution sources/L2/01.EPIC-LOGIN-PROCEDURE.md` — one epic extract
- `/neo:spec-evolution sources/L2/01.EPIC-LOGIN-PROCEDURE.login.md`
- `/neo:spec-evolution sources/L2/01.EPIC-LOGIN-PROCEDURE` — all files whose names start with that epic stem
- `/neo:spec-evolution sources/L2/FRONT/04.DASHBOARD.md sources/L2/ESI/ESI-LOGIN.md`

## Graphify (automatic first action)

**Before any other step**, run the graph refresh automatically. Do not ask the user. Do not skip.

```bash
cd neocom-meta
graphify update .
```

Prefer `.venv/bin/graphify update .` when the project venv exists. If the update fails, stop and report; do not register against a stale graph.

After a successful update, use the meta graph only to notice an existing requirement or OpenSpec change. It does not choose the system or the feature, and it does not add behavior.

When `neocom-meta/graphify-out/graph.json` exists, after the note is read and before a new change is created:

```bash
cd neocom-meta
graphify query "<subject of the note>" --graph graphify-out/graph.json
```

Keep a node only when its `src` is under `openspec/changes/` or `sources/L2/` and that file already states the same behavior, or a very similar one. Treat that as a **duplicate** (see below). Extend an existing change only when a returned node `src` is an OpenSpec change or an L2 file that already states the same behavior.

Ignore every other node. A query also returns code, tests, and unrelated proposals. If no source path qualifies, or `graph.json` is missing after a failed update, stop inventing duplicates — only flag when a qualifying path matches.

## Review

1. Resolve the scope above. With no arguments, read every file under `sources/L2/`, including epic-named extracts, legacy epic directories if present, nested system folders (`FRONT`, `BACK`, `DOMAIN`, `ESI`, `CICD`, …), and `INFRASTRUCTURE-SPECS.md`. With arguments, read only the resolved files. Do not read product L1 epics to invent new notes.
2. Collect every **pending** note in the scoped files (and any legacy `UNREGISTERED REQUIREMENTS` notes). Ignore empty headings. Leave unscoped L2 files unchanged.
3. For each note, decide and record:
   - System: `front`, `infra`, `cicd`, `back`, `domain`, or a system the user names
   - Feature name (kebab-case)
   - Destination file. If the note is already in the right `sources/L2/<SYSTEM>/` file, it stays there and its status becomes `registered` after OpenSpec exists. If it is in the wrong file, move it to `sources/L2/<SYSTEM>/<feature-file>.md` (create the file). Keep infrastructure rows that belong in `sources/L2/INFRASTRUCTURE-SPECS.md` in that register.
   - Whether an OpenSpec change or an L2 row already states the same behavior, or a very similar one. When it does, **do not register** — move the note to `sources/L1/00.DUPLICATES.md` (same shape as `/neo:extract-l2`), remove or mark it cleared from the L2 extract, and if the sourcing L1 Review cell is still settable via the extract skill’s duplicate path, prefer recording provenance on `00.DUPLICATES` for the user. Do **not** create a new `## DUPLICATED` heading in L2.
4. If a note is too ambiguous to choose a system or feature, ask before writing. Do not invent behavior the note does not state.
5. If no scoped L2 file has a note to register, stop.
6. Show this review before writing files: the scoped files, then each note, its system, its feature, and its destination (or duplicate target).

## Move into OpenSpec

1. **Place the notes**
   - Give each new item a stable id if missing; status `pending`, then `registered` after the OpenSpec change exists.
   - Clear the extract queue: no leftover `pending` rows for what was registered; leave legacy `UNREGISTERED REQUIREMENTS` empty if drained.

2. **Select the slice**
   - Include the items just placed, plus L2 rows still `pending`.
   - If the user named ids or a feature, use that subset.
   - Skip items that are still `draft` unless the user overrides.

3. **Confirm OpenSpec root**
   - From `neocom-meta/`: run `npx openspec list --json` and confirm `"root"` is this repository.
   - If missing, stop and ask the user to init OpenSpec here (do not create it as a side effect).

4. **Register into OpenSpec**
   For each feature:
   - Change name: `<system>-<feature>` (hyphens only; the CLI rejects `/`).
   - Delta spec path: `openspec/changes/<system>-<feature>/specs/<system>/<feature>/spec.md`.
   - Create with `openspec new change "<system>-<feature>"`, then author proposal, specs, design, and tasks.
   - Cite the L2 id. Cite an L1 id only when the L2 note already names it.
   - Do not invent behavior that is not in the L2 text.

5. **Traceability**
   - In the OpenSpec proposal (or a short `neocom-meta` note under `sources/L2/`), record which L2 IDs were registered and the OpenSpec change name(s).
   - Update `01.PROGRAMME-DEFINITION/` / `tools/doc/01.PROGRAMME-DEFINITION/` when the review names a new feature, including `FEATURES/` with the L2 IDs and OpenSpec change names.
   - **Traceability index (mandatory):** for each L1 epic that sourced the notes (via the epic stem in the L2 file name, a legacy epic directory, or the L2 file’s source line), update that epic’s section in `sources/L1/TRACEABILITY.md`: set **Highest** at least 📝 `registered`; on **### L2 delivery** rows, set OpenSpec status/changes for the placed L2 files (and epic extract rows); Delivery stays `—` until `/neocom-git` records commits/PRs. Refresh `L2/INDEX.md` backlog (📭 cleared when extracts have no `pending` notes). **Also update that epic’s `## Spec traceability`**. Do not edit authored L1 sections. Later runs skip `applied` / `archived` via TRACEABILITY + CHANGE-STATUS.
   - **L2 index (mandatory):** update `sources/L2/INDEX.md` for every extract or placed file touched this run. When no `pending` notes remain, set the extract to 📭 `cleared`; new or updated system registers are 📌 `placed` (🔗 `pointer` when pointer-only). Sync each file’s `<!-- L2-STATUS: … -->` header (Status, OpenSpec, Pending, Next) with the index row.

6. **Change status register (mandatory)**
   - Update `openspec/CHANGE-STATUS.md` for every new or changed OpenSpec change in this run.
   - Refresh task counts with `npx openspec list --json`. Add or adjust rows (`registered`, notes, system/feature). Do not leave the register stale.
   - When folding several changes into one feature, also refresh `openspec/SPECS-ABSTRACT.md`.

7. **Boundaries**
   - Do not implement product code in front/back from this command, **except** the visual-appearance capture exception below.
   - Do not edit `neocom-back` application sources from this command.
   - Meta writes, including OpenSpec artifacts and `00.DUPLICATES` appends, stay under `neocom-meta`.
   - Do not pull `to review` L1 sections into this run.
   - **Visual appearance capture (allowed):** when registering a visual feature whose L1 Appearance needs a real PNG, you **MAY** add a specimen of the proposed render on `neocom-front` `model-strip-page` and capture it into `neocom-meta/sources/L1/media/*.png`. Prefer a live strip capture over a generated stand-in. Limit front edits to that specimen/render; do not use this path for unrelated product work.

## Return

1. The scope (all L2 files, or the list that was processed)
2. The review (notes found, system, feature, destination)
3. OpenSpec change names and paths
4. That `openspec/CHANGE-STATUS.md`, `sources/L1/TRACEABILITY.md`, `sources/L2/INDEX.md`, and each sourcing epic’s `## Spec traceability` were updated (authored L1 sections left untouched)
5. Notes skipped or moved to `sources/L1/00.DUPLICATES.md`, and why
6. Next step: apply / feature delivery when the user wants a registered feature applied
