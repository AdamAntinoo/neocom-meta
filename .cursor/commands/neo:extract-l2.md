---
name: "/neo:extract-l2"
id: "neo:extract-l2"
category: "NEOCOM Specs"
description: "Convert L1 epics into an L2 epic directory with front, back, cicd, architecture, and common slices"
---

Run **Extract L2** for the `/neocom-meta` agent.

Command: `/neo:extract-l2`

Follow `.cursor/skills/extract-l2/SKILL.md` in `neocom-meta`.

Read L1 files only. Create `L2/NN.EPIC-NAME/` and write slice files (`front.md`, `back.md`, `cicd.md`, `architecture.md`, `common.md` when needed). Use the current L2 tree to tell what is already generated. Do not register OpenSpec. Do not implement product features.
