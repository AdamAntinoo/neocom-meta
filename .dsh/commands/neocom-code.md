---
name: "/neocom-code"
id: "neocom-code"
category: "NEOCOM Code"
description: "Implement product code in neocom-front or neocom-back (or domain). Optional destination and OpenSpec change name. Destination-specific stack rules apply after front|back|domain is resolved."
---

Run **`/neocom-code`** for the `neocom-code` agent.

```text
/neocom-code
/neocom-code front
/neocom-code back
/neocom-code front <system>-<feature>
/neocom-code back <system>-<feature>
/neocom-code <system>-<feature>
```

1. Resolve **destination** (`front` → `neocom-front`, `back` → `neocom-back`, `domain` → `neocom-domain`). Announce it.
2. Apply **shared** coding rules, then the **destination-specific** rules in `.dsh/agents/neocom-code.md`.
3. Follow `.dsh/skills/neocom-code/SKILL.md` for OpenSpec apply, branch gate, implement, verify, and CHANGE-STATUS updates.

Do not commit or open a pull request — that is `/neocom-git`. Do not register new OpenSpec changes from L1 — that is `/epic:extract`.
