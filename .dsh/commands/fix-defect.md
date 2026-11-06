---
name: "/fix:defect"
id: "fix-defect"
category: "NEOCOM Spec"
description: "Plan then fix validation defects from <branch>_DEFECTS. Optional DEF id; with no id, all ready defects. Always lists defects and actions first and waits for developer go-ahead before processing."
---

Run **`/fix:defect`** for the `neocom-defect` agent.

Load `.dsh/skills/defect-fix/SKILL.md` and follow it.

```text
/fix:defect
/fix:defect DEF-IB-001
/fix:defect IB-001
```

| Argument | Meaning |
| --- | --- |
| *(none)* | Plan **all** ready defects on the feature page |
| `DEF-<CODE>-NNN` or `<CODE>-NNN` | Plan that one defect |

Resolve the product feature branch → `neocom-meta/defects/<STEM>_DEFECTS.md`.

**Mandatory before any edits:** list each selected defect (id, title, Expected short, destination) and the **actions** that would run on it. Stop and wait for developer validation of that plan. Only after explicit go-ahead, implement Expected (via `.dsh/skills/neocom-code/SKILL.md` when coding), set Status `applying`, and leave trees uncommitted.

Do **not** mark Developer validates / `fixed` / `closed`. Do **not** move defects into `FIXED-DEFECTS.md` — that is **`/defect:fixed`** after validation. Do **not** commit — that is `/neocom-git`.
