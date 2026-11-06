---
name: "/epic:extract"
id: "epic-extract"
category: "NEOCOM Spec"
description: "Register L1 epic units whose Review cell is [x] reviewed into OpenSpec. Duplicates go to sources/L1/00.DUPLICATES.md. L1 changes are Review cells plus ## Spec traceability."
---

Run **`/epic:extract`** for the `neocom-spec-workflow` agent.

**First action (automatic):** `graphify update .` from `neocom-meta`. Do not ask. Do not skip. Stop if it fails.

Then read `sources/L1/NN.EPIC-NAME.md` (the L1 epic, authored with `/epic`). Requirements live under epic sections with a **Review** status. Initial status is **`[ ] to review`** (not registrable). Only rows whose Review cell is **`[x] reviewed`** (or legacy **`[x]`** / exact `reviewed`) are registered into an OpenSpec change `<system>-<feature>`. After registration, replace the cell with plain **`registered`** (or **`duplicated`**).

There is no L2 copy. Do not write `sources/L2/`. Do not run `/neo:extract-l2` or `/neo:spec-evolution` (both removed).

When a checked/`reviewed` unit duplicates behaviour already in OpenSpec, move it to `sources/L1/00.DUPLICATES.md` and set the source Review cell to `duplicated`.

On each processed L1 epic: set processed Review cells to `registered` or `duplicated` (checkbox removed), and update `## Spec traceability` at the **start of the file**. Authored sections stay unchanged. Also update `sources/L1/TRACEABILITY.md` and `openspec/CHANGE-STATUS.md`. See `.dsh/skills/epic-extract/SKILL.md`.

Do not implement product features. Do not commit.
