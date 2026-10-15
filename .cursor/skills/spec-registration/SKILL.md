---
name: spec-registration
description: >-
  Review L2 notes and move them into OpenSpec. Used by /neo:spec-evolution.
  Optional L2 paths limit the run to those files. L1 conversion is /neo:extract-l2.
disable-model-invocation: true
---

# Spec Evolution

`/neo:spec-evolution`. Owned by `/neocom-meta`.

Reviews L2 notes and moves them into OpenSpec. L1 conversion is `/neo:extract-l2`. Do not implement product code in `neocom-front` or `neocom-back`.

## Scope

Optional arguments after the command name are L2 file paths. When one or more are given, process only those files. When none are given, process every file under `05.REQUIREMENTS-DECOMPOSITION/L2/`.

Accept a path relative to `neocom-meta`, relative to `05.REQUIREMENTS-DECOMPOSITION/L2/`, or an absolute path. Resolve each argument to a file under `L2/`, or to every markdown slice under an epic directory when the argument is that directory. If an argument is missing or is outside `L2/`, stop and report that argument. Do not fall back to the full tree when any argument was given.

Examples:

- `/neo:spec-evolution` — every L2 file
- `/neo:spec-evolution L2/01.EPIC-LOGIN-PROCEDURE/` — every slice in that epic
- `/neo:spec-evolution L2/01.EPIC-LOGIN-PROCEDURE/front.md`
- `/neo:spec-evolution L2/01.EPIC-LOGIN-PROCEDURE/common.md L2/02.EPIC-ANGULAR-CODIFICATION/front.md`
- `/neo:spec-evolution L2/FRONT/04.DASHBOARD.md L2/ESI/ESI-LOGIN.md`

## Review

1. Resolve the scope above. With no arguments, read every file under `05.REQUIREMENTS-DECOMPOSITION/L2/`, including slices under `L2/NN.EPIC-NAME/` (`front.md`, `back.md`, `cicd.md`, `architecture.md`, `common.md`, and other named slices), nested system folders (`L2/FRONT/`, `L2/BACK/`, `L2/DOMAIN/`, `L2/ESI/`, and later `L2/CICD/`), and `L2/INFRASTRUCTURE-SPECS.md`. With arguments, read only the resolved files (a path may be an epic directory or a single slice). Do not read `L1/`.
2. Collect every section headed `UNREGISTERED REQUIREMENTS` that has one or more notes in the scoped files. Ignore every note under the heading `DUPLICATED`. Leave unscoped L2 files unchanged.
3. For each note, decide and record:
   - System: `front`, `infra`, `cicd`, `back`, `domain`, or a system the user names
   - Feature name (kebab-case)
   - Destination file. If the note is already in the right file, it stays there and leaves the unregistered section. If it is in the wrong file, move it to `L2/<SYSTEM>/<feature-file>.md` (create the file). Keep infrastructure rows that belong in `L2/INFRASTRUCTURE-SPECS.md` in that register.
   - Whether an OpenSpec change or an L2 row already states the same behavior, or a very similar one. When it does, do not register the note. Move it under the heading `DUPLICATED` in that L2 file for the user to review.
4. If a note is too ambiguous to choose a system or feature, ask before writing. Do not invent behavior the note does not state.
5. If no scoped L2 file has a note to register, stop.
6. Show this review before writing files: the scoped files, then each note, its system, its feature, and its destination.

## Graphify

Use the meta graph only to notice an existing requirement or OpenSpec change. It does not choose the system or the feature, and it does not add behavior.

When `neocom-meta/graphify-out/graph.json` exists, after the note is read and before a new change is created:

```bash
cd neocom-meta
graphify query "<subject of the note>" --graph graphify-out/graph.json
```

Keep a node only when its `src` is under `openspec/changes/` or `05.REQUIREMENTS-DECOMPOSITION/L2/` and that file already states the same behavior, or a very similar one. Move that note under `DUPLICATED` instead of registering it. Extend an existing change only when a returned node `src` is an OpenSpec change or an L2 file that already states the same behavior.

Ignore every other node. A query also returns code, tests, and unrelated proposals. If no source path qualifies, or `graph.json` is missing, decide from the note and the L2 files.

Do not rebuild the graph in this command. `graphify update` is AST-only and does not index these markdown specs.

## Move into OpenSpec

1. **Place the notes**
   - Give each new item a stable id, status `pending`, then `registered` after the OpenSpec change exists.
   - Leave every `UNREGISTERED REQUIREMENTS` heading in place and empty.

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
   - In the OpenSpec proposal (or a short `neocom-meta` note under `05.REQUIREMENTS-DECOMPOSITION/`), record which L2 IDs were registered and the OpenSpec change name(s).
   - Update `01.PROGRAMME-DEFINITION/` when the review names a new feature, including `FEATURES/` with the L2 IDs and OpenSpec change names.

6. **Boundaries**
   - Do not implement product code in front/back from this command.
   - Do not edit `neocom-front` / `neocom-back` application sources.
   - Meta writes, including OpenSpec artifacts, stay under `neocom-meta`.

## Return

1. The scope (all L2 files, or the list that was processed)
2. The review (notes found, system, feature, destination)
3. OpenSpec change names and paths
4. Notes skipped, and why
5. Next step: `/feature-delivery` when the user wants a registered feature applied
