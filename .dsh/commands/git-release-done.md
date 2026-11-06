---
name: "/git:release-done"
id: "git-release-done"
category: "NEOCOM Git"
description: "After Release PR merge: archive listed OpenSpec changes and run L1 source-archive."
---

Run **`/git:release-done`** for the `neocom-git` agent. Load `.dsh/skills/git-release-done/SKILL.md` and follow it.

```text
/git:release-done
/git:release-done neocom-front
```

Requires the Release PR to be **merged**. Archives the OpenSpec ids from that PR via `/openspec-archive-change`, then §6.7 L1 source-archive. Stop if the PR is still open.
