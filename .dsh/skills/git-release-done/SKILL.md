---
name: git-release-done
description: >-
  After the Release develop → main PR is merged, archive the OpenSpec changes
  listed on that PR and run L1 source-archive. Use when /git:release-done is invoked.
disable-model-invocation: true
---

# `/git:release-done`

Owned by `/neocom-git`. Archives the OpenSpec set from the **merged** Release PR and launches L1 source-archive (§6.7). Do not wait for a second confirmation.

Do **not** open a new Release PR. Do **not** archive while the Release PR is still open.

Programme baseline: `.dsh/METHODOLOGY.md` §6.6.3 / §6.7; control fields: `.dsh/templates/openspec-delivery-control.md` §D.

## Argument

Optional project list (same aliases as `/git:release`). Used to locate the merged Release PR(s). When omitted, resolve from DELIVERY-INDEX / open CHANGE-STATUS notes `in release PR #N`.

## Steps

1. Locate the Release PR(s) (`develop` → `main`, title `Release-…`). Confirm state **merged**. If still open, stop and say to merge first (or finish OpenSpec validation).
2. Collect OpenSpec ids from the PR body (**OpenSpec to validate / this release**). Reconfirm with the developer if the body is unclear. Do not invent ids.
3. For each id, run `/openspec-archive-change` (follow `.dsh/skills/openspec-archive-change/SKILL.md`).
4. Same turn after each successful archive: CHANGE-STATUS → **Archived**; TRACEABILITY; `openspec/DELIVERY-INDEX.md` archived rows.
5. Run **§6.7** L1 source-archive eligibility for epics fully covered by the archived set; move completed L1 files; refresh TRACEABILITY paths.
6. Do not archive ids that were never listed on that Release PR.
7. Return archived ids, L1 moves, and any skips.

## Return

Archived OpenSpec ids, L1 source-archive moves, Release PR URL/SHA evidence, or why the command stopped.
