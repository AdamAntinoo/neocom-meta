---
name: "/defect"
id: "defect"
category: "NEOCOM Spec"
description: "Register a validation defect on the FEATURE-<branch>_DEFECTS page under neocom-meta/defects. Prompt is a short title, then observed / expected behaviour."
---

Run **`/defect`** for the `neocom-defect` agent.

Load `.dsh/skills/defect-register/SKILL.md` and follow it.

The prompt is one sequence: short title, then observed / expected (and optional surfaces / severity).

```text
/defect <short title> <observed; expected; optional context>
```

Resolve the product feature branch (`feature/<name>`), then use or create:

```text
neocom-meta/defects/FEATURE-<NAME-UPPERCASE>_DEFECTS.md
```

Example: branch `feature/industry-blueprints` → `defects/FEATURE-INDUSTRY-BLUEPRINTS_DEFECTS.md`.

Append the next `DEF-<CODE>-NNN` register row and defect section. Do not implement product code. Do not commit.
