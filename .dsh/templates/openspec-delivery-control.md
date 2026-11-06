# OpenSpec delivery control (PR contents)

Use this checklist so agents and developers control **what enters each pull request** and when OpenSpec status moves. Owning agent: `/neocom-git` (PRs) + OpenSpec archive skills (status + archive) + TRACEABILITY updates. Programme baseline: `.dsh/METHODOLOGY.md` §6.

## Pipeline (after apply)

```text
apply (feature/<name>) → stop before commit
  → developer review → /git:commit (optional)
  → PR feature → develop   = product / PR validation intake
  → merge to develop (when asked)
  → product smoke / optional /defect on develop tip
  → /git:release [project…]   = open develop → main (Release-X.Y.Z)
       list OpenSpec to validate while PR open
  → validate listed OpenSpec while Release PR is open
  → merge Release PR (when asked)
  → /git:release-done         = archive listed OpenSpec + §6.7 L1
```

Do **not** archive while the change is only on a feature branch.  
Do **not** archive while the Release PR is still open.  
Do **not** claim main/spec parity until `/git:release-done` finishes for that release set.

---

## A. Information required before **PR → `develop`** (product validation intake)

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
| **Validation readiness** | Explicit: “ready for product validation on develop” | PR body checkbox |
| **Test plan** | Concrete commands / checks for reviewers | PR **Test plan** |
| **Out of scope** | OpenSpec changes **not** in this PR (prevent silent bundling) | PR body |
| **Status move on merge** | After accept into `develop`: `applying` → `applied` (eligible for `/git:release`; archive later via `/git:release-done`) | `CHANGE-STATUS.md`, epic Spec traceability, `TRACEABILITY.md` |
| **Delivery index** | Record commits / PR `#N` / develop tip per OpenSpec id (local; graphify) | `openspec/DELIVERY-INDEX.md` — owned by `/neocom-git` |

### PR → `develop` body shape (extend Features example)

```markdown
## Features
- <feature label>: <one sentence what lands>

## OpenSpec
- `<system>-<feature>` — tasks N/N — status after merge: `applied` (product validation on develop; OpenSpec programme validation on Release PR)
- …

## Out of scope
- `<other-change>` — still on feature/… or registered only

## Stack / base
- Head: `feature/<…>`
- Base: `develop`
- Stacked on (if any): `feature/<sibling>` @ `<sha>`

## Validation readiness
- [x] Ready for product validation on `develop` after merge
- [ ] Blocked: <reason>

## Test plan
- [ ] …
```

---

## B. Information required for **product validation on `develop`**

Run after the feature PR is **merged** into `develop` (or on a checkout of post-merge `develop`), including developer checks in the **dev environment**. This gate is **product / smoke**, not OpenSpec archive.

| Field | Purpose |
| --- | --- |
| **Develop tip SHA** | Exact commit under product validation |
| **Change set under test** | OpenSpec ids marked `applied` that this develop tip contains |
| **Validation commands** | Product: `nvm use` + unit / e2e named in each change |
| **Pass / fail** | Developer (or CI) decision; optional `/defect` path |
| **Release eligibility** | `applied` + tasks complete may be **selected** on `/git:release` (§C) |

Do **not** archive yet. Do **not** require OpenSpec programme validation here (that runs while the Release PR is open).

---

## C. Information required for **`/git:release`** (`develop` → `main`)

Opens (or refreshes) the Release PR. OpenSpec listed here is **to validate while the PR is open** — not already archived.

| Field | Purpose |
| --- | --- |
| **Release title** | `Release-<MajorMinorPatch>` (GitVersion on temp main∪develop merge; do not push that calc) |
| **Develop SHA** | Tip being released |
| **OpenSpec to validate (this release)** | Developer-selected ids from the `applied` pool |
| **OpenSpec deferred / still open** | Not in this release set — must remain unarchived |
| **Product repos in release** | Which app work already landed on develop for this release |
| **Delivery index** | Release PR `#N`, OpenSpec ids, state `open`; CHANGE-STATUS note `in release PR #N` |

### PR → `main` body shape

```markdown
## Summary
- Release develop @ <sha> as Release-<X.Y.Z>
- OpenSpec listed below is validated **while this PR is open**; archive runs after merge via `/git:release-done`

## OpenSpec to validate (this release)
- `<system>-<feature>` — tasks N/N — `applied` on develop @ <sha>
- …

## OpenSpec deferred / still open (do not archive in this release)
- `<system>-<feature>` — reason

## Product repos
- `neocom-front` / `neocom-back` / … @ develop tips

## Test plan
- [ ] OpenSpec programme validation (spec vs code) for each listed change
- [ ] `npx openspec list --json` / CHANGE-STATUS notes `validated for release @ <sha>`
- [ ] Merge only when asked after OpenSpec validation passes
```

Do **not** archive on this command. Do **not** merge unless asked.

---

## D. Information required for **`/git:release-done`** (archive after Release merge)

Run after the Release PR is **merged**. Archives the same OpenSpec ids listed on that PR, then §6.7 L1 source-archive.

| Field | Purpose |
| --- | --- |
| **Release PR** | Merged `#N` / URL; confirm state `merged` |
| **OpenSpec to archive** | Exact ids from the Release PR body (or developer reconfirm) |
| **Archive run** | `/openspec-archive-change` per id; CHANGE-STATUS → Archived; `openspec/specs/` synced |
| **L1 tracking** | Same turn: TRACEABILITY; §6.7 source-archive when an L1 epic is fully covered |
| **Delivery index** | Move/refresh archived rows; Release PR state `merged` |

Stop if the Release PR is still open. Do not archive ids never listed on that PR.

---

## E. Anti-patterns

- Bundling unlisted OpenSpec changes into a develop or release PR
- Archiving from a feature branch
- Archiving while the Release PR is still open
- Archiving before `/git:release-done` (or an explicit developer archive ask outside a release)
- Claiming main/spec parity before `/git:release-done` completes for the listed set
- Silent fan of every apply from `develop` when siblings are ahead (see branch-names / neocom-git)
- Committing as part of apply without an explicit `/git:commit` / `/git:pr` / commit request
