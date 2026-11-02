---
name: "/neo:spec-evolution"
id: "neo-spec-evolution"
category: "NEOCOM Spec"
description: "Review L2 pending notes and move them into OpenSpec. Optional L2 paths limit the run. Duplicates go to sources/L1/00.DUPLICATES.md. Status is recorded in the indexes."
---

Run **`/neo:spec-evolution`** for the `neocom-spec-workflow` agent.

**First action (automatic):** `graphify update .` from `neocom-meta`. Do not ask. Do not skip. Stop if it fails.

Then read `sources/L2/` only and move each **pending** note into the owning `sources/L2/<SYSTEM>/<feature>.md` file and the OpenSpec change `<system>-<feature>`. Do not pull L1 rows that are still `to review`. Duplicates append to `sources/L1/00.DUPLICATES.md` (not an L2 `DUPLICATED` heading). Legacy `UNREGISTERED REQUIREMENTS` sections may be drained once.

Registration is recorded in `openspec/CHANGE-STATUS.md` and `sources/L1/TRACEABILITY.md`. See `.dsh/skills/spec-registration/SKILL.md`.

Do not implement product features. Do not commit.
