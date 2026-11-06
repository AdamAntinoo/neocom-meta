---
name: "/defect:fixed"
id: "defect-fixed"
category: "NEOCOM Spec"
description: "After developer validation, move one or more DEF ids from <stem>_DEFECTS.md into defects/FIXED-DEFECTS.md with the same register row and section contents (status fixed/closed)."
---

Run **`/defect:fixed`** for the `neocom-defect` agent.

Load `.dsh/skills/defect-fixed/SKILL.md` and follow it.

```text
/defect:fixed DEF-IB-001
/defect:fixed DEF-IB-001 DEF-IB-002
```

| Argument | Meaning |
| --- | --- |
| One or more `DEF-<CODE>-NNN` | Move those validated defects |
| *(none)* | Ask for id(s) |

1. Resolve the open page `neocom-meta/defects/<STEM>_DEFECTS.md`.
2. Copy each Register row + full defect section into `neocom-meta/defects/FIXED-DEFECTS.md` (create the archive if missing), set Status `fixed` (or `closed` if asked), check Developer validates.
3. Remove the same row + section from the open feature page.

Do not implement product code. Do not commit.
