---
name: git-release
description: >-
  Open or refresh the develop → main Release-X.Y.Z PR listing OpenSpec changes
  to validate while the PR is open. Use when /git:release is invoked.
disable-model-invocation: true
---

# `/git:release`

Owned by `/neocom-git`. Opens the **Release** pull request (`develop` → `main`). Do not wait for a second confirmation.

VCS + delivery index only. Do **not** archive OpenSpec. Do **not** merge unless the user asks.

This is a **git** command (`/git:…`). Programme baseline: `.dsh/METHODOLOGY.md` §6.6; control fields: `.dsh/templates/openspec-delivery-control.md` §C.

## Argument

Optional project list after `/git:release` (same aliases as `/git:pr`: `neocom-meta` / `meta`, `neocom-front` / `front`, `neocom-back` / `back`, `neocom-domain` / `domain`).

| Argument | Meaning |
| --- | --- |
| One or more projects | Open/refresh Release PRs for those repos |
| *(none)* | Ask which product repos to include, or use the repos that carry the selected OpenSpec set |

`neocom` / `neocom-esi` are aside — skip if named.

## Steps

1. Read `.dsh/templates/pull-requests.md` and `openspec-delivery-control.md` §C. Follow `/neocom-git` Release title calc (temp worktree GitVersion `MajorMinorPatch`).
2. Resolve OpenSpec ids for this release from the `applied` pool (`openspec/CHANGE-STATUS.md`). **Ask** the developer which ids to include when ambiguous. Do not invent.
3. For each selected product repo: ensure `develop` and `main` exist; orient with `git fetch`, status, `git log origin/main..origin/develop`.
4. If a Release PR `develop` → `main` already exists, refresh its body/title and report the URL — do not open a duplicate.
5. Otherwise `gh pr create --base main --head develop` with title `Release-<MajorMinorPatch>` and body shape from delivery-control §C (**OpenSpec to validate**, deferred, product repos, test plan).
6. Same turn: CHANGE-STATUS notes `in release PR #N — awaiting OpenSpec validation` for each listed id; upsert `openspec/DELIVERY-INDEX.md` (Release PR #, URL, develop tip, OpenSpec ids, state `open`).
7. Remind: validate listed OpenSpec **while the PR is open**; after merge run `/git:release-done`.
8. Do **not** run `/openspec-archive-change`. Do **not** merge unless asked.

## Return

Repository name(s), Release PR URL(s), OpenSpec ids listed to validate, or why the command stopped.
