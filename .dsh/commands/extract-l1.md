---
name: "/neo:extract-l1"
id: "neo-extract-l1"
category: "NEOCOM Spec"
description: "Generate an L1 epic file from an epic. Requires an epic argument (number, id, stem, name, or path). The epic source is never modified; only the generated L1 file and the traceability indexes are updated."
---

Run **`/neo:extract-l1`** for the `neocom-spec-workflow` agent.

Requires one argument: the epic to process (`/neo:extract-l1 08`, `/neo:extract-l1 EPIC-008`). Read the epic's authored sections (`## Goals`, `## Search criteria`, `## Sources`) and generate the L1 spec (`## Spec traceability` + requirement/model registers) in `sources/L1/NN.EPIC-NAME.md`, without rewriting the authored sections.

Record the transition in `sources/L1/TRACEABILITY.md`. See `.dsh/skills/extract-l1/SKILL.md`.

Do not implement product features. Do not commit.
