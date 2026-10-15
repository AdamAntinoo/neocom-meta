---
name: epic
description: >-
  Open a new epic. The prompt after /epic is the epic name, then the initial
  description of its goals. Use when the user runs /epic.
disable-model-invocation: true
---

# `/epic`

The first methodology action. Owned by `/neocom-methodology`. Do not implement product code. Do not commit.

## Prompt

The text after `/epic` is one prompt. Do not split the name and the description onto separate lines.

The epic name is the short title at the start, as in `login procedure`. The rest of the same prompt is a brief description of the purpose, the scope, and the other details. The epic is expected to expand into a set of features.

```text
/epic login procedure A brief description of the purpose, scope, and other details of the epic that will expand into a set of features.
```

When the name or the description is missing, stop and ask. Do not invent either one.

## File

Create `05.REQUIREMENTS-DECOMPOSITION/L1/NN.EPIC-NAME.md`.

`NN` is the next two-digit number. Look at every `L1/*.EPIC-*.md` file, take the highest `NN`, and add 1. When none exist, `NN` is `01`.

`EPIC-NAME` is the prefix `EPIC-` plus the epic name in uppercase, with words separated by `-`. `login procedure` is `EPIC-LOGIN-PROCEDURE`, so the first file is `01.EPIC-LOGIN-PROCEDURE.md`.

## Contents

Write the file in this shape. The title is the epic id, then ` - `, then the epic name in uppercase. The words of the name stay separated by spaces.

```markdown
# EPIC-001 - LOGIN PROCEDURE
## Goals
The goal of this epic is to define the login procedure for the application.
```

`## Goals` holds the description from the prompt, unchanged.

## Later prompts

A later prompt that adds a template, a design, or any other material that describes the features inside an epic is appended to that epic file. It does not open another epic. A new epic starts only with `/epic`.

When the prompt names an epic id or an epic name, append to that file. When it does not, append to the epic file most recently created.

## Return

1. The epic id and the epic name
2. The L1 path
3. That the next methodology step is `/neo:extract-l2` for this open epic
