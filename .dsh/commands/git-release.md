---
name: "/git:release"
id: "git-release"
category: "NEOCOM Git"
description: "Open develop → main Release-X.Y.Z listing OpenSpec to validate while the PR is open."
---

Run **`/git:release`** for the `neocom-git` agent. Load `.dsh/skills/git-release/SKILL.md` and follow it.

```text
/git:release
/git:release neocom-front
/git:release front back
```

Opens (or refreshes) `develop` → `main` titled `Release-<MajorMinorPatch>`. Body lists **OpenSpec to validate**. Do not archive. Do not merge unless asked. After merge, use `/git:release-done`.
