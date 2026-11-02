---
name: "/neo:extract-l2"
id: "neo-extract-l2"
category: "NEOCOM Spec"
description: "Convert L1 epics into epic-named L2 files. No args: pending epics; args: only those epics. The L1 source epic is never modified; extract state is recorded in the traceability index."
---

Run **`/neo:extract-l2`** for the `neocom-spec-workflow` agent.

Read `sources/L1/NN.EPIC-NAME.md` (read-only) and write new notes under `UNREGISTERED REQUIREMENTS` in epic-named `sources/L2/NN.EPIC-NAME[.group].md` files, using the existing L2 tree plus `sources/L1/TRACEABILITY.md` as the skip index. Only `reviewed` models are extracted; `to review` sections are left pending.

The L1 epic is never modified. Extraction state (L2 paths, extracted requirement IDs) is recorded in `sources/L1/TRACEABILITY.md`. See `.dsh/skills/extract-l2/SKILL.md`.

Do not implement product features. Do not commit.
