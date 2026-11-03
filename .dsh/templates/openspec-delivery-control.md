# OpenSpec delivery control (PR contents)

Use this checklist so agents and developers control **what enters each pull request** and when OpenSpec status moves. Owning agent: `/neocom-git` (PRs) + `/neocom-code` / OpenSpec archive (status + archive). Programme baseline: `.dsh/METHODOLOGY.md` §6.

## Pipeline (after apply)

```text
apply (feature/<name>) → stop before commit
  → developer review → /git:commit (optional)
  → PR feature → develop   = features ready for validation
  → merge to develop (when asked)
  → OpenSpec validation on develop
  → PR develop → main (Release-X.Y.Z)
  → archive completed OpenSpec changes tied to that release
```

Do **not** archive while the change is only on a feature branch. Do **not** open `develop` → `main` until validation on `develop` is accepted.

---

## A. Information required before **PR → `develop`** (validation intake)

Fill this for every product / meta PR into `develop`. Incomplete rows → stop and ask.

| Field | Purpose | Where it lives |
| --- | --- | --- |
| **Repositories** | Which clones are in this PR (`neocom-front`, `neocom-back`, `neocom-domain`, `neocom-meta`) | PR title/body + `/git:pr` scope |
| **Head branch** | Tip of the stacked feature line | `feature/<…>` |
| **Base** | Always `develop` for this PR kind | `gh pr create --base develop` |
| **OpenSpec change ids** | Exact `openspec/changes/<system>-<feature>/` names included | PR body **OpenSpec** list; `CHANGE-STATUS.md` |
| **Task completion** | Each listed change is `N/N` (or name unfinished tasks excluded) | `tasks.md` + `npx openspec list --json` |
| **Feature names** | Human labels for the Features list (same shape as recorded PR example) | `.dsh/templates/pull-requests.md` |
| **Commit range** | Commits this PR adds vs `develop` | `git log develop..HEAD --oneline` |
| **Dependencies / stack** | Sibling features already merged or stacked under this tip | PR body note |
| **Validation readiness** | Explicit: “ready for validation on develop” | PR body checkbox |
| **Test plan** | Concrete commands / checks for reviewers | PR **Test plan** |
| **Out of scope** | OpenSpec changes **not** in this PR (prevent silent bundling) | PR body |
| **Status move on merge** | After accept into `develop`: `applying` → `applied` (validation pending archive) | `CHANGE-STATUS.md`, epic Spec traceability, `TRACEABILITY.md` |

### PR → `develop` body shape (extend Features example)

```markdown
## Features
- <feature label>: <one sentence what lands>

## OpenSpec
- `<system>-<feature>` — tasks N/N — status after merge: `applied` (validation on develop)
- …

## Out of scope
- `<other-change>` — still on feature/… or registered only

## Stack / base
- Head: `feature/<…>`
- Base: `develop`
- Stacked on (if any): `feature/<sibling>` @ `<sha>`

## Validation readiness
- [x] Ready for OpenSpec / programme validation on `develop` after merge
- [ ] Blocked: <reason>

## Test plan
- [ ] …
```

---

## B. Information required for **validation on `develop`**

Run after the feature PR is **merged** into `develop` (or on a checkout of post-merge `develop`). Do not treat feature-branch checks as the validation gate.

| Field | Purpose |
| --- | --- |
| **Develop tip SHA** | Exact commit under validation |
| **Change set under test** | OpenSpec ids marked `applied` that this develop tip contains |
| **Validation commands** | Product: `nvm use` + unit / e2e named in each change; meta: `npx openspec list --json`, doctor/validate if used |
| **Spec vs code gaps** | Any `tasks.md` still open or behaviour missing vs delta specs |
| **Pass / fail** | Developer (or CI) decision recorded in CHANGE-STATUS notes |
| **Archive eligibility** | Only changes that are `applied`, tasks complete, and **validated on develop** may enter the release PR archive list |

Update `CHANGE-STATUS.md` notes for each change: `validated on develop @ <sha>` or `validation failed: …`.

---

## C. Information required before **PR `develop` → `main`** (release + archive trigger)

| Field | Purpose |
| --- | --- |
| **Release title** | `Release-<MajorMinorPatch>` (GitVersion on temp main∪develop merge; do not push that calc) |
| **Develop SHA** | Tip being released |
| **OpenSpec to archive** | Explicit list of change names that are complete + validated on develop |
| **OpenSpec to leave open** | Changes still `applying` / `registered` / not validated — must **not** be archived |
| **Main specs impact** | Which `openspec/specs/<system>/<feature>/` paths will receive deltas |
| **TRACEABILITY** | Epics/models moving `applied` → `archived` |
| **Product repos in release** | Which app PRs already landed on develop for this release |
| **Archive timing** | Archive runs when this release PR is opened / accepted per programme rule — list changes in the PR body so archive is controlled, not implied |

### PR → `main` body shape

```markdown
## Summary
- Release develop @ <sha> as Release-<X.Y.Z>

## OpenSpec archive (this release)
- `<system>-<feature>` — validated on develop @ <sha> — archive to `specs/…`
- …

## OpenSpec deferred (do not archive)
- `<system>-<feature>` — reason

## Test plan
- [ ] Validation notes on develop accepted
- [ ] `npx openspec list --json` matches archive list
```

After merge to `main` (when the user asks to merge), run `/openspec-archive-change` (or batch) **only** for the archive list in the PR. Refresh `CHANGE-STATUS.md` → **Archived**, sync main specs, update TRACEABILITY. Then source-archive fully completed L2 → `sources/L2/archive/` and L1 → `sources/L1/archive/` (`.dsh/METHODOLOGY.md` §6.7).

---

## D. Anti-patterns

- Bundling unlisted OpenSpec changes into a develop or release PR
- Archiving from a feature branch before develop validation
- Opening `develop` → `main` with an empty or “all applying” archive list
- Silent fan of every apply from `develop` when siblings are ahead (see branch-names / neocom-git)
- Committing as part of apply without an explicit `/git:commit` / `/git:pr` / commit request
