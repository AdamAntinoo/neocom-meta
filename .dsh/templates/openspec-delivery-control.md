# OpenSpec delivery control (PR contents)

Use this checklist so agents and developers control **what enters each pull request** and when OpenSpec status moves. Owning agent: `/neocom-git` (PRs) + OpenSpec archive skills (status + archive) + TRACEABILITY updates. Programme baseline: `.dsh/METHODOLOGY.md` §6.

## Pipeline (after apply)

```text
apply (feature/<name>) → stop before commit
  → developer review → /git:commit (optional)
  → PR feature → develop   = features ready for validation
  → merge to develop (when asked)
  → OpenSpec + product validation on develop / dev environment
  → developer selects OpenSpec changes to archive
  → archive selected changes (+ L1 source-archive when complete)
  → collect archived ids → draft PR develop → main (Release-X.Y.Z)
  → keep draft until archive set complete → mark ready → merge when asked
```

Do **not** archive while the change is only on a feature branch.  
Do **not** treat the Release PR as the archive trigger — **archive first**, then document.  
Do **not** mark the Release PR ready (or claim main/spec parity) while the selected archive set is incomplete.

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
| **Status move on merge** | After accept into `develop`: `applying` → `applied` (validation pending; archive later) | `CHANGE-STATUS.md`, epic Spec traceability, `TRACEABILITY.md` |
| **Delivery index** | Record commits / PR `#N` / develop tip per OpenSpec id (local; graphify) | `openspec/DELIVERY-INDEX.md` — owned by `/neocom-git` |

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

Run after the feature PR is **merged** into `develop` (or on a checkout of post-merge `develop`), including developer checks in the **dev environment**. Do not treat feature-branch checks as the validation gate.

| Field | Purpose |
| --- | --- |
| **Develop tip SHA** | Exact commit under validation |
| **Change set under test** | OpenSpec ids marked `applied` that this develop tip contains |
| **Validation commands** | Product: `nvm use` + unit / e2e named in each change; meta: `npx openspec list --json`, doctor/validate if used |
| **Spec vs code gaps** | Any `tasks.md` still open or behaviour missing vs delta specs |
| **Pass / fail** | Developer (or CI) decision recorded in CHANGE-STATUS notes |
| **Archive eligibility** | Only `applied` + tasks complete + **validated on develop** may be **selected** for archive (§C) |

Update `CHANGE-STATUS.md` notes for each change: `validated on develop @ <sha>` or `validation failed: …`.  
Update `openspec/DELIVERY-INDEX.md` **Validated**. Prefer the index over live GitHub for later traceability.

Do **not** open the Release PR in this step. Do **not** archive yet.

---

## C. Select + archive (before Release PR ready)

After validation passes, the **developer selects** which eligible OpenSpec changes to archive.

| Field | Purpose |
| --- | --- |
| **Selected to archive** | Explicit change ids from the validated pool |
| **Left open / deferred** | Still `applied` but not in this release set, or not validated / still registered |
| **Archive run** | `/openspec-archive-change` per selected id; CHANGE-STATUS → Archived; `openspec/specs/` synced |
| **L1 tracking** | Same turn: TRACEABILITY; §6.7 source-archive when an L1 epic is fully covered |
| **Release inventory** | Growing list of **successfully archived** ids (feeds the draft PR body) |

---

## D. Information required for **draft PR `develop` → `main`** (documents archive; not the trigger)

| Field | Purpose |
| --- | --- |
| **Release title** | `Release-<MajorMinorPatch>` (GitVersion on temp main∪develop merge; do not push that calc) |
| **Develop SHA** | Tip being released |
| **OpenSpec archived (this release)** | Inventory of changes **already archived** (not a to-do list) |
| **OpenSpec still open / deferred** | Not in this archive set — must remain unarchived |
| **Draft until** | Every selected change for this release is in the archived inventory |
| **Main specs impact** | Which `openspec/specs/<system>/<feature>/` paths already received deltas |
| **TRACEABILITY** | Epics/models at 📦 `archived` / source-archived paths |
| **Product repos in release** | Which app work already landed on develop for this release |

### PR → `main` body shape

```markdown
## Summary
- Release develop @ <sha> as Release-<X.Y.Z>
- Status: **draft** until archive set complete / **ready** when inventory matches selection

## OpenSpec archived (this release)
- `<system>-<feature>` — validated on develop @ <sha> — archived to `specs/…`
- …

## OpenSpec deferred / still open (do not archive in this release)
- `<system>-<feature>` — reason

## L1 source archive
- Moved / still active (per §6.7)

## Test plan
- [ ] Validation on develop accepted
- [ ] Selected archive set fully archived (`npx openspec list` / CHANGE-STATUS)
- [ ] Draft → ready only when inventory complete
```

Open with `gh pr create --draft` (or equivalent). Refresh the body as more selected changes are archived. **Mark ready** only when the selected archive set is complete. Merge only when the developer asks after ready.

---

## E. Anti-patterns

- Bundling unlisted OpenSpec changes into a develop or release PR
- Archiving from a feature branch before develop validation
- Opening a **ready** `develop` → `main` PR before the selected archive set is complete
- Treating the Release PR as the thing that “triggers” archive (archive runs first)
- Claiming main/spec parity while the Release PR is still draft with a partial inventory
- Silent fan of every apply from `develop` when siblings are ahead (see branch-names / neocom-git)
- Committing as part of apply without an explicit `/git:commit` / `/git:pr` / commit request
