---
name: "/neo:extract-l2"
id: "neo-extract-l2"
category: "NEOCOM Spec"
description: "Convert L1 epics into epic-named L2 files. No args: pending epics; args: only those epics. Only rows marked reviewed are extracted; L1 changes are Review cells (reviewed → extracted) plus ## Spec traceability (status, L2 paths, skip)."
---

Run **`/neo:extract-l2`** for the `neocom-spec-workflow` agent.

**First action (automatic):** `graphify update .` from `neocom-meta`. Do not ask. Do not skip. Stop if it fails.

Then read `sources/L1/NN.EPIC-NAME.md` (the L1 epic, authored with `/epic`) and write new notes under `UNREGISTERED REQUIREMENTS` in epic-named `sources/L2/NN.EPIC-NAME[.group].md` files, using the existing L2 tree plus `sources/L1/TRACEABILITY.md` as the skip index. Only register rows whose Review cell is exactly `reviewed` are extracted; `to review` sections are left pending.

On each processed L1 epic: set processed Review cells to `extracted`, and update `## Spec traceability` at the **start of the file** (status at least 📤 `extracted`, L2 paths, skip for pending rows, index links). Authored sections stay unchanged. Also update `sources/L1/TRACEABILITY.md`, `sources/L1/SPEC-EPIC-INDEX.md` (processed items → 🔵 `extracted`), `sources/L2/INDEX.md`, and each L2 file status header. See `.dsh/skills/extract-l2/SKILL.md`.

Do not implement product features. Do not commit.
