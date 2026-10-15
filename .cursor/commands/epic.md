---
name: "/epic"
id: "epic"
category: "NEOCOM Methodology"
description: "Open a new epic. The prompt is the epic name, then a brief description of its purpose, scope, and other details"
---

Run **`/epic`** for the `/neocom-methodology` agent.

The prompt is one sequence. The name and the description are not placed on separate lines.

```text
/epic login procedure A brief description of the purpose, scope, and other details of the epic that will expand into a set of features.
```

`login procedure` is the epic name. The words that follow in the same prompt are the description: purpose, scope, and other details. That epic is expected to expand into a set of features.

Follow `.cursor/skills/epic/SKILL.md` in `neocom-meta`. Create `05.REQUIREMENTS-DECOMPOSITION/L1/NN.EPIC-NAME.md`. `NN` is the next two-digit number, starting at `01`. `EPIC-NAME` is `EPIC-` plus the name in uppercase, with words separated by `-`. The first login epic is `01.EPIC-LOGIN-PROCEDURE.md`.

The file matches this template. The title is the id, then the name in uppercase. `## Goals` is the description from the prompt.

```markdown
# EPIC-001 - LOGIN PROCEDURE
## Goals
The goal of this epic is to define the login procedure for the application.
```

Later prompts add templates, designs, and other material that describes the features inside this epic. Append that material to the same file.

Do not implement product features. Do not commit.
