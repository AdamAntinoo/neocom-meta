---
name: register-requirements
description: >-
  Register Requirements — review and process new requirements written under
  UNREGISTERED REQUIREMENTS in L1 and L2. Use when the user runs
  /neo:register-spec.
disable-model-invocation: true
---

# Register Requirements

Meta command `/neo:register-spec`. Owned by `/neocom-meta`.

Starts the review of new requirements and then registers them. Do not implement product code in `neocom-front` or `neocom-back`.

## Review

1. Read every file under `05.REQUIREMENTS-DECOMPOSITION/` (L1 and L2, including nested system folders).
2. Collect every section headed `UNREGISTERED REQUIREMENTS` that has one or more notes.
3. For each note, decide and record:
   - System: `front`, `infra`, `cicd`, `back`, `domain`, or a system the user names
   - Feature name (kebab-case)
   - Destination file. If the note is already in the right file, it stays there and leaves the unregistered section. If it is in the wrong file, move it.
   - Whether an OpenSpec change already covers it. Do not register a duplicate.
4. If a note is too ambiguous to choose a system or feature, ask before writing. Do not invent behavior the note does not state.

## Graphify

Use the meta graph only to notice an existing requirement or OpenSpec change. It does not choose the system or the feature, and it does not add behavior.

When `neocom-meta/graphify-out/graph.json` exists, after the note is read and before a new change is created:

```bash
cd neocom-meta
graphify query "<subject of the note>" --graph graphify-out/graph.json
```

Keep a node only when its `src` is under `openspec/changes/` or `05.REQUIREMENTS-DECOMPOSITION/` and that file already states the same behavior. Extend that change instead of registering a duplicate.

Ignore every other node. A query also returns code, tests, and unrelated proposals. If no source path qualifies, or `graph.json` is missing, decide from the note and the requirement files.

Do not rebuild the graph in this command. `graphify update` is AST-only and does not index these markdown specs.

Show this review before writing files: each note, its system, its feature, and its destination.

## Process

Follow `.cursor/skills/spec-registration/SKILL.md` for the notes in the review.

- Give each new item a stable id and status `registered` once the OpenSpec change exists.
- Leave every `UNREGISTERED REQUIREMENTS` heading in place and empty.
- OpenSpec change name: `<system>-<feature>`.
- Delta spec path: `openspec/changes/<system>-<feature>/specs/<system>/<feature>/spec.md`.
- Update `01.PROGRAMME-DEFINITION/` when the review names a new feature.

## Return

1. The review (notes found, system, feature, destination)
2. OpenSpec change names and paths
3. Notes skipped, and why
4. Next step: `/feature-delivery` when the user wants a registered feature applied
