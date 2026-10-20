---
name: "/neo:extract-l2"
id: "neo:extract-l2"
category: "NEOCOM Specs"
description: "Convert L1 epics into epic-named L2 files. No args = pending epics; args = only those epics"
---

Run **Extract L2** for the `/neocom-meta` agent.

Command: `/neo:extract-l2` or `/neo:extract-l2 <epic>…`

| Arguments | Scope |
| --- | --- |
| _(none)_ | Every L1 epic that still has pending extract work |
| one or more epic numbers | **Preferred:** `01`, `02`, or `1` — only those epics |
| other refs (also accepted) | `EPIC-001`, `login`, `01.EPIC-LOGIN-PROCEDURE`, or an `L1/…` path |

Examples: `/neo:extract-l2 01` · `/neo:extract-l2 01 02`

Follow `.cursor/skills/extract-l2/SKILL.md` in `neocom-meta`.

Read L1 files only (scoped as above). Write `L2/NN.EPIC-NAME.md` and/or `L2/NN.EPIC-NAME.<group>.md` as the material requires. When the epic has a Review column, write notes only for models marked `reviewed`, then set those cells to `extracted`. Leave `to review` sections untouched. Do not force an epic directory or a per-repository split. Keep the epic stem in every file name for traceability. Use the current L2 tree to skip passages already generated. Do not register OpenSpec. Do not implement product features.
