---
name: "/neocom-openapi"
id: "neocom-openapi"
category: "NEOCOM OpenAPI"
description: "Write and version neocom-back OpenAPI specs under tools/openapi/. Minor bump + copy-rename on API content changes; reverse-chrono CHANGELOG. Alias: /openapi."
---

Run **`/neocom-openapi`** (alias **`/openapi`**) for the `neocom-openapi` agent.

```text
/neocom-openapi
/neocom-openapi <adapter>
/neocom-openapi <adapter> <contract change summary>
/openapi
/openapi <adapter>
```

1. **Scope:** `neocom-back/tools/openapi/` only.
2. Follow `.dsh/agents/neocom-openapi.md` and `.dsh/skills/neocom-openapi/SKILL.md`.
3. On API content change: **bump minor**, **copy** `…-vX.Y.Z.yaml` → `…-vX.(Y+1).0.yaml`, edit only the copy, prepend **CHANGELOG** (newest first).
4. Align with `openspec/specs/back/openapi/spec.md` (OpenAPI first; domain model wins).

Do not implement Nest code (`/neocom-code`) or commit (`/neocom-git`).
