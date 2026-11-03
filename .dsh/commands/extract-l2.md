---
name: "/neo:extract-l2"
id: "neo-extract-l2"
category: "NEOCOM Spec"
description: "Convert L1 epics into epic-named L2 files. Only requirements whose Review cell is reviewed are extracted (to review is not extractable). Duplicates go to sources/L1/00.DUPLICATES.md. L1 changes are Review cells plus ## Spec traceability."
---

Run **`/neo:extract-l2`** for the `neocom-spec-workflow` agent.

**First action (automatic):** `graphify update .` from `neocom-meta`. Do not ask. Do not skip. Stop if it fails.

Then read `sources/L1/NN.EPIC-NAME.md` (the L1 epic, authored with `/epic`). Requirements live under epic sections with a **Review** status. Initial status is `to review` (not extractable). Only rows whose Review cell is exactly `reviewed` are extracted into epic-named `sources/L2/NN.EPIC-NAME[.group].md` files as **pending** notes for OpenSpec. Do **not** use `UNREGISTERED REQUIREMENTS` headings.

When a `reviewed` unit duplicates behaviour already in L2 or applied/archived OpenSpec, move it to `sources/L1/00.DUPLICATES.md` and set the source Review cell to `duplicated`.

On each processed L1 epic: set processed Review cells to `extracted` or `duplicated`, and update `## Spec traceability` at the **start of the file**. Authored sections stay unchanged. Also update `sources/L1/TRACEABILITY.md`, `sources/L2/INDEX.md`, and each L2 file status header. Do **not** update `SPEC-EPIC-INDEX.md` (deprecated). See `.dsh/skills/extract-l2/SKILL.md`.

Do not implement product features. Do not commit.
