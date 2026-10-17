---
name: "/git:commit"
id: "git:commit"
category: "NEOCOM Git"
description: "Commit all pending changes on one repository to its current branch"
---

Run **`/git:commit`** for the `/neocom-git` agent.

Command: `/git:commit <project>`

The project argument is required (`neocom-meta` / `meta`, `neocom-front` / `front`, or `neocom-back` / `back`). Commit all pending changes in that repository on its **current** branch. Do not create a pull request.

Follow `.cursor/skills/git-commit/SKILL.md` in `neocom-meta`. Delegate the commit to `/neocom-git`. Use the recorded examples in `.cursor/templates/`.

Do not implement product features. Do not push unless the user asks.
