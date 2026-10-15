---
name: "/neo:pr"
id: "neo:pr"
category: "NEOCOM Git"
description: "Commit pending work and prepare pull requests for one active project, or for neocom-meta, neocom-front, and neocom-back"
---

Run **`/neo:pr`** for the `/neocom-git` agent.

Command: `/neo:pr` or `/neo:pr <project>`

The text after the command is the project. When that text is empty, the command applies to the active repositories: `neocom-meta`, `neocom-front`, and `neocom-back`. `neocom` is deprecated. `neocom-domain` and `neocom-esi` stay aside.

Follow `.cursor/skills/neo-pr/SKILL.md` in `neocom-meta`. Delegate the commits and pull requests to `/neocom-git`. Use the recorded examples in `.cursor/templates/`.

Do not implement product features. Do not merge the pull requests.
