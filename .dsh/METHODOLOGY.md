# NEOCOM methodology (DeepSeek Harness baseline)

This document extracts the **current** methodology as defined by `.dsh/` (agents, commands, skills, templates). It is the baseline for describing the pipeline and for later redefining or adjusting agent behaviour.

**Authority.** When this file and a live agent/skill disagree after a harness change, update this file to match `.dsh/`. When an epic’s prose describes a step differently from a skill, the skill wins (see Immutability). Product code does not live in `neocom-meta`; delivery commits land in the owning repository via `/neocom-git`.

**Path note.** Requirements live under `sources/` (`L0`, `L1`, `L2`, `COLLECTOR`).

---

## 1. Purpose and shape

The methodology moves requirements **unidirectionally** from executive intake through authored epics, extractable notes, registered OpenSpec changes, feature-branch apply (**stop before commit**), developer commit, PR into `develop` (**validation intake**), validation on the **`develop` tip**, then a release PR `develop` → `main` that **lists and triggers archive** of validated OpenSpec changes. After those OpenSpec changes are archived, **fully completed** L2 extracts and L1 epics move into `sources/L2/archive/` and `sources/L1/archive/` so the active L1/L2 directories stay uncluttered.

| Stage | Intent | Primary owner |
| --- | --- | --- |
| Intake | Open an epic; later attach L0 executive cards and optional legacy backtrack | `neocom-spec-collector`, `neocom-backtrack` |
| Spec progression | L1 → L2 extract → OpenSpec registration | `neocom-spec-workflow` |
| Delivery | Apply on `feature/<feature>` (default base `develop`; ask before stacking); stop before commit | `neocom-code` (destination rules) + OpenSpec apply |
| VCS + gates | Commit when asked; PR → develop (validation); validate on develop; PR → main (archive list) | `neocom-git` + delivery-control template |

```mermaid
flowchart TB
  subgraph intake["1. Intake"]
    L0["L0 executive cards<br/>sources/L0/executive/"]
    epic["/epic → L1 epic<br/>sources/L1/NN.EPIC-NAME.md"]
    criteria["Developer fills<br/>## Search criteria"]
    cards["Card collection<br/>into ## Sources"]
    backtrack["/neo:backtrack<br/>sources/COLLECTOR/"]
    L0 -.-> epic
    epic --> criteria
    criteria --> cards
    criteria --> backtrack
  end

  subgraph progression["2. Spec progression"]
    author["Author requirements in L1 sections<br/>status: to review"]
    review["Developer sets Review<br/>cells to reviewed"]
    extract["/neo:extract-l2<br/>→ L2 pending / 00.DUPLICATES"]
    evolve["/neo:spec-evolution<br/>→ OpenSpec change"]
    author --> review --> extract --> evolve
  end

  subgraph delivery["3. Delivery"]
    base["Branch base: develop default<br/>ask if siblings ahead"]
    apply["Apply on feature/&lt;feature&gt;<br/>stop before commit"]
    commit["/git:commit when asked"]
    prDev["PR feature → develop<br/>OpenSpec ready for validation"]
    val["Validate on develop tip"]
    prMain["PR develop → main<br/>Release-X.Y.Z + archive list"]
    archive["Archive listed OpenSpec changes"]
    srcArch["Move completed L2 then L1<br/>→ sources/*/archive/"]
    base --> apply --> commit --> prDev --> val --> prMain --> archive --> srcArch
  end

  cards --> review
  backtrack -.-> review
  evolve --> base
```

The overview stays linear on purpose. **Index and control files** sit beside that chain: agents **read** them to decide what is pending / skippable, and **write** them in the same turn as each transition. That map is a separate diagram so the stage flow above does not grow unreadable.

```mermaid
flowchart LR
  subgraph stages["Spec progression stages"]
    direction TB
    S0["/epic + Search / cards / backtrack"]
    S1["Author L1<br/>Review = to review"]
    S2["Developer → reviewed"]
    S3["/neo:extract-l2"]
    S4["/neo:spec-evolution"]
    S5["Apply → commit → PR develop<br/>→ validate → Release + OpenSpec archive"]
    S6["Archive completed L2 / L1<br/>→ sources/*/archive/"]
    S0 --> S1 --> S2 --> S3 --> S4 --> S5 --> S6
  end

  subgraph controls["Index and control files"]
    direction TB
    L0idx["sources/L0/executive/INDEX.md<br/>card → epic / state"]
    TRidx["sources/L1/TRACEABILITY.md<br/>epic status · L2 backlog · Review gate record"]
    SpcHdr["L1 ## Spec traceability<br/>must match TRACEABILITY row"]
    SpecIdx["sources/L1/SPEC-EPIC-INDEX.md<br/>cross-epic Review dashboard"]
    Dup["sources/L1/00.DUPLICATES.md<br/>holding duplicates"]
    L2idx["sources/L2/INDEX.md<br/>+ each file <!-- L2-STATUS -->"]
    CSchg["openspec/CHANGE-STATUS.md<br/>+ SPECS-ABSTRACT when folding"]
    ColTrk["sources/COLLECTOR/TRACKER.md<br/>backtrack fingerprints"]
    Gfy["graphify-out/graph.json<br/>refresh before every /neo:*"]
  end

  S0 -. write .-> L0idx
  S0 -. write .-> TRidx
  S0 -. write .-> SpcHdr
  S0 -. write .-> ColTrk
  S0 -. update .-> Gfy

  S3 -. read/write .-> TRidx
  S3 -. write .-> SpcHdr
  S3 -. write .-> SpecIdx
  S3 -. write .-> L2idx
  S3 -. append .-> Dup
  S3 -. first: update .-> Gfy

  S4 -. read .-> L2idx
  S4 -. write .-> L2idx
  S4 -. write .-> TRidx
  S4 -. write .-> SpcHdr
  S4 -. write .-> CSchg
  S4 -. append .-> Dup
  S4 -. first: update .-> Gfy

  S5 -. write .-> TRidx
  S5 -. write .-> SpcHdr
  S5 -. write .-> CSchg
```

| Control file | Role | Who updates it |
| --- | --- | --- |
| `sources/L0/executive/INDEX.md` | Card usage: `selected` / `returned` / `out of scope` / `deleted` — prevents double collection | `/epic` collector (after Search criteria) |
| `sources/L1/TRACEABILITY.md` | **Authoritative** epic → L2 → OpenSpec map; **L2 backlog**; **Review gate record** (`Last seen` / `Processed`); paths after L1/L2 source archive | `/epic`, extract, evolution, apply, OpenSpec archive, L1/L2 source archive |
| L1 `## Spec traceability` | Per-epic header; must stay in sync with the TRACEABILITY row | Same as TRACEABILITY (status-only on the epic) |
| `sources/L1/SPEC-EPIC-INDEX.md` | Cross-epic Review dashboard (🟢 reviewed → 🔵 extracted, …); drop or mark archived epics when moved | `/neo:extract-l2`, L1 source archive |
| `sources/L1/00.DUPLICATES.md` | Holding epic for near-duplicates (review / reinsert / remove) | extract and evolution when a duplicate is found |
| `sources/L2/INDEX.md` + `<!-- L2-STATUS -->` | L2 file backlog (📥 inbox / 📭 cleared / 📌 placed / …); Spec Evolution queue; paths after L2 source archive | extract, evolution, L2 source archive |
| `sources/L1/archive/`, `sources/L2/archive/` | Completed L1 epics / L2 extracts whose OpenSpec coverage is fully archived (active dirs stay lean) | After OpenSpec archive (§6.7) |
| `openspec/CHANGE-STATUS.md` | OpenSpec change register (task counts from `npx openspec list --json`); notes for develop validation | evolution, apply, PR accept, validate, archive |
| `.dsh/templates/openspec-delivery-control.md` | Required fields that **control PR contents** (feature→develop and develop→main) | `/neocom-git` / `/git:pr` when drafting PRs |
| `sources/COLLECTOR/TRACKER.md` | Legacy backtrack fingerprints / findings paths | `/neo:backtrack` |
| `graphify-out/graph.json` | Knowledge graph for skip / duplicate detection | **First action** on every `/neo:*` (`graphify update .`) |

Do not invent another dashboard beyond these. Skip decisions come from TRACEABILITY + the L2 tree + `L2/INDEX.md` (+ CHANGE-STATUS for OpenSpec coverage).

---

## 2. Agents, commands, and skills

### 2.1 Agents

| Agent | Commands | Owns |
| --- | --- | --- |
| `neocom-spec-collector` | `/epic` | Epic creation, deferred card collection, L0 index, L1 TRACEABILITY row at `none` |
| `neocom-spec-workflow` | `/neo:extract-l2`, `/neo:spec-evolution` | L1→L2 and L2→OpenSpec; Review cells + Spec traceability; indexes |
| `neocom-backtrack` | `/neo:backtrack` | Legacy code findings under `sources/COLLECTOR/` (read-only on epics) |
| `neocom-code` | `/neocom-code` | Product coding: resolve **destination** (`front` / `back` / `domain`) first; shared pipeline + destination stack rules; OpenSpec apply; **never commits** |
| `neocom-git` | `/neocom-git`, `/git:commit`, `/git:pr` | All VCS: branch-base consult, commits, PRs (validation intake + release/archive), version hooks ownership |
| `program-verifier` | `/program-verifier` | Read-only check of SPDD `program/` (separate meta tree; not the NEOCOM product pipeline) |

### 2.2 Spec and OpenSpec skills

| Skill | Slash | Role in the chain |
| --- | --- | --- |
| `extract-l2` | `/neo:extract-l2` | L1 Review gate → epic-named L2 (`pending`); duplicates → `00.DUPLICATES` |
| `spec-registration` | `/neo:spec-evolution` | L2 `pending` notes → placement + OpenSpec `<system>-<feature>` |
| `openspec-explore` | `/openspec-explore` | Discovery only; never implements |
| `openspec-propose` | `/openspec-propose` | Planning artifacts only (alternate/direct OpenSpec entry) |
| `openspec-update-change` | `/openspec-update-change` | Revise planning artifacts; no code |
| `openspec-apply-change` | `/openspec-apply-change` | Implement tasks; mark checkboxes (NEOCOM product apply still stops before commit via `neocom-code`) |
| `openspec-sync-specs` | `/openspec-sync-specs` | Merge deltas into main specs |
| `openspec-archive-change` | `/openspec-archive-change` | Archive completed change (NEOCOM: after develop validation, driven by release PR archive list) |
| `neocom-code` | `/neocom-code` | Destination-gated product apply; stop before commit |

### 2.3 Git skills and templates

| Skill / template | Role |
| --- | --- |
| `git-commit` | `/git:commit <project>` — commit on current branch (explicit developer request) |
| `git-pr` | `/git:pr [project]` — commit + **PR feature → develop** (validation intake); release PR is separate |
| `neocom-git-workflow` | Playbook loaded by `/neocom-git` |
| `templates/branch-names.md` | Feature/meta branches; default from `develop`; ask before stacking |
| `templates/commit-messages.md` | Conventional Commits examples |
| `templates/pull-requests.md` | PR title/body examples |
| `templates/openspec-delivery-control.md` | **Required fields** controlling OpenSpec lists on both PR kinds |

```mermaid
flowchart LR
  collector["neocom-spec-collector"] --> workflow["neocom-spec-workflow"]
  backtrack["neocom-backtrack"] -.-> workflow
  workflow --> code["neocom-code apply<br/>stop before commit"]
  code --> git["neocom-git commit / PR"]
  git --> val["validate on develop"]
  val --> rel["Release PR + archive list"]
```

---

## 3. Artifact levels and dependency key

Each evolution step **reads** a source level and **writes** only the generated level plus indexes (plus the narrow L1 status exceptions below).

| Level | Path | Authored / written by |
| --- | --- | --- |
| L0 executive | `sources/L0/executive/*.md` + `INDEX.md` | Human / collector |
| L1 epic | `sources/L1/NN.EPIC-NAME.md` | `/epic` (+ later appends) |
| Legacy findings | `sources/COLLECTOR/NN.EPIC-NAME.md` + `TRACKER.md` | `/neo:backtrack` |
| L2 extract | `sources/L2/NN.EPIC-NAME[.group].md` | `/neo:extract-l2` |
| L2 placement | `sources/L2/<SYSTEM>/`, `INFRASTRUCTURE-SPECS.md` | `/neo:spec-evolution` |
| OpenSpec change | `openspec/changes/<system>-<feature>/` | `/neo:spec-evolution` (or propose) |
| Product code | `neocom-front` / `neocom-back` / `neocom-domain` | `/neocom-code` (destination rules in `.dsh/agents/neocom-code.md`) |

**Dependency key:** the epic stem `NN.EPIC-NAME` links L1 → L2 filenames → OpenSpec citations → TRACEABILITY row. A source change must evolve into the **same** derived files, not a parallel copy.

```mermaid
flowchart LR
  stem["Stem NN.EPIC-NAME"] --> L1["sources/L1/NN.EPIC-NAME.md"]
  stem --> L2["sources/L2/NN.EPIC-NAME[.group].md"]
  stem --> OS["openspec/changes/&lt;system&gt;-&lt;feature&gt;"]
  stem --> TR["L1/TRACEABILITY.md row"]
  L1 --> L2 --> OS
  L1 --> TR
  L2 --> TR
  OS --> TR
```

---

## 4. Status machines and indexes

Which stage reads or writes each control file is in the **Index and control files** diagram under [section 1](#1-purpose-and-shape). This section defines the status tokens those files carry.

### 4.1 Epic / OpenSpec status (`TRACEABILITY.md`)

```text
none → extracted → registered → applying → applied → archived
```

- Authoritative central record: `sources/L1/TRACEABILITY.md` (includes **L2 backlog**).
- Each epic’s `## Spec traceability` must stay in sync after extract / register / apply / archive.
- Material covered by `applied` or `archived` changes is skipped on later extract/register; only new L1 material is processed.
- When an epic’s TRACEABILITY status is `archived` **and** every OpenSpec change it cites is archived, the L1 file (and its fully archived L2 extracts) become eligible for **source archive** (§6.7) — move under `sources/L1/archive/` / `sources/L2/archive/`, then refresh indexes to the new paths.

### 4.2 Review gate (L1 sections / requirements) — replaces `UNREGISTERED`

Requirements are authored under epic sections (register + requirement tables). **Initial status is `to review`** (not extractable). `UNREGISTERED REQUIREMENTS` / L2 `DUPLICATED` headings are deprecated.

| Review cell | `/neo:extract-l2` |
| --- | --- |
| `to review` (any variant) | Skip — not extractable |
| `reviewed` | Extract to L2 as `pending`, then `extracted`; or → `00.DUPLICATES` + `duplicated` |
| `extracted` | Skip (re-extract only if set back to `reviewed`) |
| `duplicated` | Skip — holding copy in `sources/L1/00.DUPLICATES.md` |
| `superseded`, `out of scope` | Never |

Processing record: `TRACEABILITY.md` **Review gate record** (`Last seen` / `Processed`). Cross-epic dashboard: `sources/L1/SPEC-EPIC-INDEX.md`. Holding epic: `sources/L1/00.DUPLICATES.md`.

### 4.3 L2 file status (`L2/INDEX.md`)

| Token | Meaning |
| --- | --- |
| 📥 `inbox` | Has notes with status `pending` awaiting OpenSpec |
| 📭 `cleared` | No pending notes |
| 📌 `placed` | In system/feature register |
| 🔗 `pointer` | Pointer-only |
| ⛔ `parked` | Parked |

Each L2 file carries `<!-- L2-STATUS: … -->` aligned with the index. Spec Evolution queue = inbox / `pending` rows.

### 4.4 L0 card states (`sources/L0/executive/INDEX.md`)

| State | In epic `## Sources` |
| --- | --- |
| `selected` | Yes |
| `returned` | No — re-associated to another epic |
| `out of scope` | No — other domain / later epic |
| `deleted` | No — archived under `sources/L0/archive/` |

Never collect `BUG`-tagged cards from `BUGS.md` into specs.

### 4.5 OpenSpec register (`CHANGE-STATUS.md`)

After **any** OpenSpec write: refresh `openspec/CHANGE-STATUS.md` from `npx openspec list --json`. When folding features, refresh `openspec/SPECS-ABSTRACT.md`.

| Status | Meaning (NEOCOM delivery) |
| --- | --- |
| `registered` | Change under `openspec/changes/<name>/` with proposal, specs, design, tasks |
| `applying` | Implementation on `feature/<feature>` (default from `develop`; may be stacked). Apply **stops before commit** |
| `applied` | Merged (or accepted) onto **`develop`**; eligible for **validation on develop**; not archived yet. Note `validated on develop @ <sha>` when validation passes |
| `archived` | Listed on a **release PR** archive set; moved to `changes/archive/` and merged into `openspec/specs/` |

PR content control: `.dsh/templates/openspec-delivery-control.md`.

```mermaid
stateDiagram-v2
  [*] --> none: /epic
  none --> extracted: /neo:extract-l2
  extracted --> registered: /neo:spec-evolution
  registered --> applying: apply starts stop before commit
  applying --> applied: PR merged to develop
  applied --> applied: validated on develop tip
  applied --> archived: Release PR archive list
```

---

## 5. Stage detail: inception → registered change

### 5.1 Open an epic (`/epic`)

1. Prompt is one sequence: short name, then purpose/scope description. Missing either → ask; do not invent.
2. Create `sources/L1/NN.EPIC-NAME.md` (`NN` = next number; name collision → stop / merge / rename — ask).
3. Write skeleton: `## Spec traceability` (`none`), `## Goals`, empty `## Search criteria`, empty `## Sources`, `## Version card`.
4. Register row in `sources/L1/TRACEABILITY.md` at `none`.
5. `graphify update .` in `neocom-meta`.
6. **Do not** search cards or legacy code until Search criteria are filled.

Later prompts that add designs/templates **append** to the same epic; only `/epic` opens a new one.

### 5.2 Search criteria, cards, backtrack

When the developer fills `## Search criteria`:

- **Collector:** match clear cards from `FRONT` / `BACK` / `DATAMANAGEMENT` / `INFRA` / `TESTING` → `## Sources` as `[selected]`; update L0 index. Skip already `selected`/`deleted`; handle `returned`/`out of scope` per re-association.
- **Backtrack (`/neo:backtrack`):** fingerprint epics; only changed ones; search under `/Users/adam/IdeaProjects/neocom-infinity` only; write `sources/COLLECTOR/NN.EPIC-NAME.md` + mermaid connections; update `TRACKER.md`. Empty criteria → pending, no search.

Both are optional inputs to authoring; they do not themselves extract L2.

### 5.3 Author and review L1

Developers expand the epic under **sections** (example: `## Section 19 — ServerStatusV1` with fields, render contract, and a requirements table). Every new requirement or register row starts at **`to review`**. Extraction waits until the developer sets the cell to **`reviewed`**. Authored L1 sections are otherwise immutable for the workflow agent. Do not use an epic-level `UNREGISTERED REQUIREMENTS` inbox.

### 5.4 Extract L2 (`/neo:extract-l2`)

**First action (hard):** `graphify update .` (prefer `.venv/bin/graphify`). Failure → stop.

Then:

1. Scope: no args → pending epics from TRACEABILITY + L2 tree; args → named epics only (prefer `01`, `02`).
2. Input: L1 only. Review gate: only `reviewed` rows (`to review` skipped).
3. Output: `sources/L2/NN.EPIC-NAME.md` and/or `….<group>.md` with notes at status **`pending`** (no `UNREGISTERED REQUIREMENTS` heading).
4. Duplicates (same / very similar already in L2 or applied/archived OpenSpec) → append `sources/L1/00.DUPLICATES.md`, set source Review to `duplicated`.
5. L1 edits allowed: Review `reviewed` → `extracted` or `duplicated`, and `## Spec traceability` only.
6. Update TRACEABILITY, SPEC-EPIC-INDEX, L2/INDEX, L2 status headers.
7. Do **not** write OpenSpec or final `L2/<SYSTEM>/` placement as the registration step.

```mermaid
flowchart TD
  g1["graphify update ."] --> scope["Resolve pending / named epics"]
  scope --> gate{"Review cell == reviewed?"}
  gate -->|no| skip["Skip to review / extracted / …"]
  gate -->|yes| pass{"Already in L2 / applied OpenSpec?"}
  pass -->|yes| dup["Append 00.DUPLICATES<br/>Review → duplicated"]
  pass -->|no| write["Write L2 note status pending"]
  write --> flip["Review → extracted"]
  dup --> idx["Update Spec traceability + indexes"]
  flip --> idx
```

### 5.5 Spec evolution (`/neo:spec-evolution`)

**First action (hard):** `graphify update .`.

Then:

1. Scope: all L2, or given L2 paths. Read L2 only — not L1 for `to review` models.
2. Collect notes with status **`pending`** (legacy `UNREGISTERED REQUIREMENTS` drained once if present).
3. Per note: system / feature / destination. Ambiguous → ask. Do not invent behaviour.
4. Graphify same-or-similar → append `00.DUPLICATES`, do not register (no L2 `DUPLICATED` heading).
5. Place with stable id; mark registered; create/update OpenSpec change `<system>-<feature>`; cite L2 id.
6. Update TRACEABILITY + epic Spec traceability (≥ `registered`), L2/INDEX, CHANGE-STATUS; optionally PROGRAMME-DEFINITION / SPECS-ABSTRACT.

```mermaid
flowchart TD
  g2["graphify update ."] --> notes["L2 notes status pending"]
  notes --> dup{"Same / very similar in L2 or OpenSpec?"}
  dup -->|yes| D["sources/L1/00.DUPLICATES.md"]
  dup -->|no| place["L2/SYSTEM/feature.md + stable id"]
  place --> os["openspec/changes/system-feature/"]
  os --> reg["TRACEABILITY = registered<br/>CHANGE-STATUS updated"]
```

---

## 6. Stage detail: registered change → release

Authority for this stage: `.dsh/agents/neocom-code.md`, `.dsh/agents/neocom-git.md` (OpenSpec feature flow), `.dsh/templates/openspec-delivery-control.md`.

### 6.0 Pipeline (summary)

```text
choose base → apply (stop before commit) → /git:commit when asked
  → PR feature → develop (validation intake)
  → merge → validate on develop tip
  → PR develop → main (Release-X.Y.Z + archive list)
  → archive only listed validated OpenSpec changes
  → source-archive completed L2 then L1 (§6.7)
```

### 6.1 Destination and branch base

**`/neocom-code`** resolves one primary destination per hop (`front` → `neocom-front`, `back` → `neocom-back`, `domain` → `neocom-domain`). Multi-system changes hop one destination at a time (default **domain → back → front** when types must exist first).

**`/neocom-git`** owns branch creation for product OpenSpec work:

1. Integration branch: **`develop`**. If missing, stop — do not use `main`.
2. Default create `feature/<feature-name>` from **`develop`**.
3. Before creating: list open `feature/*` tips **ahead of `develop`**. If any exist → **ask** the developer: stay on `develop`, or **stack** from a named sibling tip. Do not invent a base; do not silently fan every apply off `develop`.
4. **`neocom-meta`:** use **`feature/agents`** (default) or **`feature/cicd`** when commanded — not `feature/<product-feature>` per apply.
5. Do not open a PR at branch creation. Do not run an agent `version:sync` chore (hooks/CI own app versions).

### 6.2 Apply — stop before commit

1. Implement OpenSpec tasks for the active destination (`/neocom-code` / `openspec-apply-change`). Mark `- [x]`; refresh CHANGE-STATUS → **`applying`**.
2. **Stop before any commit.** Leave the working tree dirty for developer review. Applying OpenSpec is **not** a commit request.
3. Do not start the next destination or next change until the developer says to continue (or asks for a commit).
4. Commit only via `/git:commit`, `/git:pr`, or clear “commit” language through `/neocom-git`.

```mermaid
flowchart TD
  develop[develop] --> check{"Other feature tips ahead of develop?"}
  check -->|no| fromDev["feature/new from develop"]
  check -->|yes| ask["Ask developer: develop or stack sibling?"]
  ask --> fromDev
  ask --> fromSib["feature/new from sibling tip"]
  fromDev --> apply["OpenSpec apply — stop before commit"]
  fromSib --> apply
  apply --> commit["/git:commit when asked"]
  commit --> pr["PR feature → develop<br/>validation intake"]
```

### 6.3 Rebase rules

- Rebase onto another open feature **only** when this feature needs that code (or that stack was chosen at branch creation); otherwise rebase onto current `develop` before the develop PR.
- Dependent feature waits until the dependency has been rebased onto `develop`.
- Ask before force-pushing a rewritten remote feature branch. Never force-push `develop` or `main`.

### 6.4 Pull request into `develop` — validation intake (`/git:pr`)

After apply stopped and the developer asked to commit:

1. Orient: status, diffs, log, `develop..HEAD`.
2. Work must be on the correct feature/fix branch (not `develop`/`main`).
3. Push `-u` if needed; `gh pr create --base develop`.
4. Body **must** satisfy `.dsh/templates/openspec-delivery-control.md` §A (and the Features shape in `pull-requests.md`): repositories, head/base, **OpenSpec change ids** + task N/N, feature labels, commit range, stack note, **out of scope**, **validation readiness**, test plan.
5. One PR may stack several features; every included OpenSpec change is named. Silent bundling of unlisted changes is forbidden.
6. Do **not** merge unless asked. Do **not** archive on this PR.
7. On accept into `develop`: CHANGE-STATUS → **`applied`** (awaiting develop validation); sync Spec traceability / TRACEABILITY. Next apply runs the branch-base consult again.

### 6.5 Validation on `develop`

1. Run against the **post-merge `develop` tip** (SHA recorded), not only the old feature branch.
2. Commands: those named by the included changes (unit/e2e); `npx openspec list --json`; gap check vs delta specs.
3. CHANGE-STATUS notes: `validated on develop @ <sha>` or `validation failed: …`.
4. Only **complete + validated** changes may appear on a release archive list.

### 6.6 Release PR `develop` → `main` — archive trigger

1. When develop validation is accepted, open PR **`develop` → `main`**, title `Release-<MajorMinorPatch>` (temp worktree: merge develop into main, `gitversion /nocache /showvariable MajorMinorPatch`; do not push that calculation; restore local `main`).
2. Body **must** satisfy delivery-control §C: develop SHA, **OpenSpec archive** list, **OpenSpec deferred** list, test plan.
3. Archive **only** the listed changes (`/openspec-archive-change`); update CHANGE-STATUS → **Archived**, main `openspec/specs/`, TRACEABILITY.
4. Do not merge the release PR unless asked. Tag `vX.Y.Z` only when the user requests a release tag.
5. Immediately after the OpenSpec archive step succeeds, run **§6.7 Source archive (L2 then L1)** for any files that are now fully complete.

### 6.7 Source archive — L2 extracts and L1 epics (declutter)

After OpenSpec changes are archived into `openspec/changes/archive/` and main `openspec/specs/`, move **fully completed** requirement sources out of the active trees so `sources/L1/` and `sources/L2/` only hold work still in flight. Same idea as L0 cards under `sources/L0/archive/`.

**Order:** archive eligible **L2** files first, then eligible **L1** epics (an epic must not move while it still has active L2 extracts in the inbox tree).

#### L2 — when to move

An L2 file under `sources/L2/` (epic-named extract or a placed `L2/<SYSTEM>/…` register note set) **may** move to `sources/L2/archive/` (preserve relative path under the archive root, e.g. `sources/L2/archive/02.EPIC-….md` or `sources/L2/archive/<SYSTEM>/…`) when **all** of the following hold:

1. Every OpenSpec change that this L2 file (or its notes) registered is **`archived`** in `openspec/CHANGE-STATUS.md` (none remain `registered` / `applying` / `applied`).
2. The file has **no** notes still `pending` and is not an Spec Evolution inbox (L2 status is cleared / placed / otherwise done — not 📥).
3. TRACEABILITY / Spec traceability for the sourcing epic already lists those changes as archived (or the epic itself is at status `archived`).

Do **not** move an L2 file that still feeds an open or deferred OpenSpec change, or that still has `pending` notes.

#### L1 — when to move

An L1 epic `sources/L1/NN.EPIC-NAME.md` **may** move to `sources/L1/archive/NN.EPIC-NAME.md` when **all** of the following hold:

1. Epic TRACEABILITY status is **`archived`**.
2. **Every** OpenSpec change cited for that epic is **`archived`** (no deferred / applying / applied leftovers for that epic).
3. **Every** L2 extract that belonged to that epic is already under `sources/L2/archive/` (or never existed).
4. No Review cells remain at `to review` or `reviewed` that still need extract (leftover `to review` / `reviewed` → do **not** archive the epic; leave it active).

Do **not** move shared index files (`TRACEABILITY.md`, `SPEC-EPIC-INDEX.md`, `00.DUPLICATES.md`, `L2/INDEX.md`) into archive.

#### Index updates (same turn)

When moving files:

1. Update `sources/L1/TRACEABILITY.md` paths to the archive locations; keep the epic row (status `archived`) so history and skip logic remain.
2. Sync the epic’s `## Spec traceability` if the file still exists (now under archive) or note the archived path on the TRACEABILITY row.
3. Update `sources/L1/SPEC-EPIC-INDEX.md` and `sources/L2/INDEX.md` (mark archived / point at `archive/` paths; remove from active inbox lists).
4. Do not invent parallel dashboards; do not delete history — **move**, do not erase.

New work on a formerly archived epic is a **new** L1 append or a new epic (§8); do not silently resurrect by editing only under `archive/` without restoring to the active tree when reopening scope.

### 6.8 Information that controls PR contents (required)

Full tables: `.dsh/templates/openspec-delivery-control.md`. Incomplete control data → stop and ask before opening the PR.

| Gate | Must declare |
| --- | --- |
| **feature → develop** | Repos; head/base; OpenSpec ids + N/N; features; `develop..HEAD`; stack; out of scope; validation readiness; test plan; status move `applying` → `applied` on merge |
| **validate on develop** | Develop tip SHA; change set; validation commands; pass/fail notes; archive eligibility |
| **develop → main** | `Release-X.Y.Z`; develop SHA; archive list; deferred list; main-spec paths / TRACEABILITY impact |

```mermaid
sequenceDiagram
  participant Dev as Developer
  participant Spec as Spec agents
  participant Code as neocom-code
  participant Git as neocom-git

  Dev->>Spec: /epic … Review=reviewed
  Spec->>Spec: extract-l2 → spec-evolution
  Dev->>Code: apply registered change
  Code-->>Dev: stop before commit
  Dev->>Git: /git:commit then PR feature → develop
  Note over Git: OpenSpec list = ready for validation
  Dev->>Git: merge to develop when asked
  Dev->>Spec: validate on develop tip
  Dev->>Git: PR develop → main Release-X.Y.Z
  Note over Spec,Git: archive list on release PR
  Spec->>Spec: archive validated OpenSpec changes
  Spec->>Spec: move completed L2 then L1 → sources/*/archive/
```

---

## 7. Hard invariants (agent behaviour)

These are non-negotiable in the current harness; changing them is a methodology change, not a silent agent improvisation.

1. **Unidirectional levels.** Do not rewrite authored L1 sections. Extract may only flip Review cells and Spec traceability (and append `00.DUPLICATES`); evolution may only refresh Spec traceability on sourcing epics (plus L2 moves/indexes/OpenSpec/`00.DUPLICATES`).
2. **No invented behaviour.** Gaps → ask or mark; never fill from assumption.
3. **Review gate exactness.** New requirements start at `to review` (not extractable). Only the cell value `reviewed` extracts. `UNREGISTERED REQUIREMENTS` is deprecated.
4. **Graphify before `/neo:*`.** First action on extract, evolution, and backtrack; stop if update fails.
5. **Skip indexes are complete.** TRACEABILITY + L2 tree + L2/INDEX (+ CHANGE-STATUS for OpenSpec) — do not invent parallel dashboards.
6. **Repo boundaries.** Spec workflow writes only under `neocom-meta`. Product code only in owning clones. `neocom` / `neocom-esi` aside.
7. **Git ownership.** Only `neocom-git` (and `/git:*`) commits, branches, and opens PRs. **OpenSpec apply never commits.** Commit only when asked or when `/git:commit` / `/git:pr` run.
8. **Branch-base consult.** Product OpenSpec branches default from `develop`; if other `feature/*` tips are ahead, ask before stacking — no silent fanning from `develop`.
9. **PR content control.** Feature→develop and develop→main bodies must carry the OpenSpec control fields in `openspec-delivery-control.md`. No silent bundling; no archive of unlisted changes.
10. **Validate then archive.** Validation runs on the **`develop` tip** after merge. OpenSpec archive runs from the **release PR archive list**, not from the feature branch.
11. **Source archive after OpenSpec archive.** When every OpenSpec change for an L2 file (then for an L1 epic) is archived, **move** that file to `sources/L2/archive/` / `sources/L1/archive/` and refresh TRACEABILITY + indexes in the same turn. Do not leave completed epics cluttering the active L1/L2 directories; do not move partial work.
12. **Deferred search.** Cards and legacy backtrack wait on filled `## Search criteria`.
13. **No Finder duplicate files.** Never create `* 2.*` conflict copies.
14. **OpenSpec naming.** Change = `<system>-<feature>` (hyphens only); delta under `specs/<system>/<feature>/spec.md`.
15. **Destination boundaries.** `/neocom-code` edits only the active destination repo; front≠back≠domain file ownership.

---

## 8. Iteration loop

Design and spec repeat without resetting delivery:

1. New material → append to L1 sections at Review `to review` (or new `/epic`).
2. Set relevant Review cells to `reviewed`.
3. `/neo:extract-l2` writes new `pending` L2 notes (or moves duplicates to `00.DUPLICATES`).
4. `/neo:spec-evolution` registers pending notes (or appends `00.DUPLICATES`).
5. Apply (stop before commit) → commit when asked → PR → develop → validate → Release + OpenSpec archive → source-archive completed L2/L1 (§6.7) as above.

```mermaid
flowchart LR
  L1u["Update L1 at to review"] --> R[reviewed]
  R --> E[extract-l2]
  E --> S[spec-evolution]
  S --> A["apply stop before commit"]
  A --> P["PR develop → validate → Release"]
  P --> Arch["OpenSpec archive → L2/L1 source archive"]
  Arch --> L1u
```

---

## 9. Command cheat sheet (pipeline order)

| Step | Command | Output |
| --- | --- | --- |
| 1 | `/epic <name> <description>` | `sources/L1/NN.EPIC-NAME.md`, TRACEABILITY `none` |
| 2 | (human) fill Search criteria; optional re-invoke collector / `/neo:backtrack` | Sources / COLLECTOR |
| 3 | (human) author L1 sections; new rows at `to review`; set batch → `reviewed` | L1 register / requirements |
| 4 | `/neo:extract-l2` [`NN`…] | L2 `pending` notes or `00.DUPLICATES`; status ≥ `extracted` |
| 5 | `/neo:spec-evolution` [`L2 paths`…] | OpenSpec change; status ≥ `registered` |
| 6 | Apply change on `feature/<feature>` (default from `develop`; ask before stacking) | Code — stop before commit |
| 7 | `/git:commit` then developer review | Commits on feature branch |
| 8 | `/git:pr <project>` | PR **feature → develop** (OpenSpec ready for validation) |
| 9 | Validate on **develop** tip | CHANGE-STATUS notes; still `applied` |
| 10 | Release PR + archive list | `develop` → `main` as `Release-X.Y.Z`; archive validated OpenSpec changes |
| 11 | Source archive (§6.7) | Move fully archived L2 → `sources/L2/archive/`, then L1 → `sources/L1/archive/`; refresh indexes |

Alternate OpenSpec-only planning: `/openspec-explore` → `/openspec-propose` → apply — still lands on the same git delivery rules when implemented for NEOCOM.

---

## 10. How to use this document

- **Describe** the methodology: cite sections 1–6 and the diagrams.
- **Adjust agent behaviour:** edit the owning file under `.dsh/agents/` or `.dsh/skills/`, then update **this** file in the same change so the baseline stays true.
- **Do not** treat `PROGRAMME.md` path leftovers or an epic’s internal procedure prose as overriding `.dsh/` skills.

*Baseline extracted from `.dsh/AGENT-CATALOG.md`; agents `neocom-spec-collector`, `neocom-spec-workflow`, `neocom-backtrack`, `neocom-code`, `neocom-git`; skills `extract-l2`, `spec-registration`, `neocom-code`, OpenSpec apply/archive/propose, `git-commit`, `git-pr`, `neocom-git-workflow`; templates `branch-names`, `commit-messages`, `pull-requests`, `openspec-delivery-control`. Re-sync this file whenever those specs change.*
