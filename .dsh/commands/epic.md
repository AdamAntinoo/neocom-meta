---
name: "/epic"
id: "epic"
category: "NEOCOM Spec"
description: "Open a new epic, append material, or (on explicit request) collect L0 cards. Card collection is disabled by default."
---

Run **`/epic`** for the `neocom-spec-collector` agent.

## Create

The prompt is one sequence. The name and the description are not placed on separate lines.

```text
/epic login procedure A brief description of the purpose, scope, and other details of the epic that will expand into a set of features.
```

`login procedure` is the epic name. The words that follow in the same prompt are the description: purpose, scope, and other details. That epic is expected to expand into a set of features.

Create `neocom-meta/sources/L1/NN.EPIC-NAME.md`. `NN` is the next two-digit number, starting at `01`. `EPIC-NAME` is `EPIC-` plus the name in uppercase, with words separated by `-`. The first login epic is `01.EPIC-LOGIN-PROCEDURE.md`.

The file matches this template. The title is the id, then the name in uppercase. `## Goals` is the description from the prompt. Leave `## Search criteria` and `## Sources` empty. Register the epic in `sources/L1/TRACEABILITY.md`. Append the version card footer.

**Do not** collect executive cards and **do not** run `/neo:backtrack` during creation. Those run only on explicit request.

## Collect cards (on request only)

```text
/epic collect 06
/epic collect EPIC-USER-INTERFACE
```

Only then scan `sources/L0/executive/` into the epic’s `## Sources` and update `sources/L0/executive/INDEX.md`. Require filled `## Search criteria`. Filling criteria alone does not trigger collection.

## Append

Later prompts add templates, designs, and other material that describes the features inside this epic. Append that material to the same file. Do not collect cards unless the developer also requests collect.

Do not implement product features. Do not commit.
