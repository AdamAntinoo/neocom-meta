---
name: "/neo:spec-evolution"
id: "neo-spec-evolution"
category: "NEOCOM Spec"
description: "Review L2 notes and move them into OpenSpec. Optional L2 paths limit the run to those files. L2 source notes and L1 epics are never modified; status is recorded in the indexes."
---

Run **`/neo:spec-evolution`** for the `neocom-spec-workflow` agent.

**First action (automatic):** `graphify update .` from `neocom-meta`. Do not ask. Do not skip. Stop if it fails.

Then read `sources/L2/` only and move each `UNREGISTERED REQUIREMENTS` note into the owning `sources/L2/<SYSTEM>/<feature>.md` file and the OpenSpec change `<system>-<feature>`. Skip notes under `DUPLICATED`.

The L2 source notes and the L1 epics are never modified. Registration is recorded in `openspec/CHANGE-STATUS.md` and `sources/L1/TRACEABILITY.md`. See `.dsh/skills/spec-registration/SKILL.md`.

Do not implement product features. Do not commit.
