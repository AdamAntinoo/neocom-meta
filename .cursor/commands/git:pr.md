---
name: "/git:pr"
id: "git:pr"
category: "NEOCOM Git"
description: "Commit pending work and prepare pull requests for one active project, or for neocom-meta, neocom-front, and neocom-back"
---

Run **`/git:pr`** for the `/neocom-git` agent.

Command: `/git:pr` or `/git:pr <project>`

The text after the command is the project. When that text is empty, the command applies to `neocom-meta`, `neocom-front`, and `neocom-back`. Name `neocom-domain` / `domain` to include the library. `neocom` is deprecated. `neocom-esi` stays aside.

Follow `.cursor/skills/git-pr/SKILL.md` in `neocom-meta`. Delegate the commits and pull requests to `/neocom-git`. Use the recorded examples in `.cursor/templates/`.

Do not implement product features. Do not merge the pull requests.
