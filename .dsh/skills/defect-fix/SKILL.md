---
name: defect-fix
description: >-
  Fix NEOCOM validation defects from defects/FEATURE-<branch-stem>_DEFECTS.md.
  Used by /fix:defect (neocom-defect). Optional DEF-<CODE>-NNN; with no id,
  fix every defect marked ready on the page. Always lists defects and planned
  actions first and waits for developer go-ahead before processing.
---

# Defect fix

## When to use

The user runs `/fix:defect` or asks to implement marked defects from the feature defect page. Owned by agent `neocom-defect`.

## Arguments

```text
/fix:defect
/fix:defect DEF-<CODE>-NNN
/fix:defect <CODE>-NNN
```

| Argument | Meaning |
| --- | --- |
| *(none)* | All **ready** defects on the resolved feature page |
| Id | That one defect only (normalize to `DEF-<CODE>-NNN`) |

## Ready (marked) defects

A defect is **ready to fix** when **all** of these hold on its section:

1. Prep checklist has **Mark to run the process** checked: `- [x] Mark to run the process…`
2. Prep checklist still has **Developer validates** unchecked: `- [ ] Developer validates…`
3. Register / section **Status** is not `fixed`, `closed`, or `wontfix`

With an explicit id: include that defect even if the Mark-to-run box is still unchecked — but **warn** once in the plan if Observed/Expected is incomplete. Still refuse `fixed` / `closed` / `wontfix` unless the user overrides in the same prompt.

When there is no id and no ready defects, say so and stop.

## Steps

### 1. Resolve branch → page

Same rules as `defect-register`:

1. Product `feature/<name>`: prompt override, else `neocom-front` current branch when `feature/*`, else `neocom-back`, else ask.
2. Reject `develop` / `main` / meta-only branches unless the user names a product `feature/<name>`.
3. Page = `neocom-meta/defects/FEATURE-<STEM>_DEFECTS.md` (stem = name uppercased, `_` → `-`).

Stop if the page is missing.

### 2. Select defects

1. Parse the page Register + each `## DEF-…` section.
2. Build the work list (ascending id order).
3. Do **not** edit product code, L1 Review cells, OpenSpec, or defect Status yet.

### 3. Plan — list defects and actions (mandatory; stop here)

**Before any processing**, present a plan for developer validation and **stop**. Do not implement, extract, register, or change Status until the developer explicitly approves (e.g. “go”, “proceed”, “yes”, “run the plan”, or an edited subset of ids).

For each selected defect, show:

| Field | Content |
| --- | --- |
| **Id / title** | `DEF-…` and title |
| **Status** | current register status |
| **Expected (short)** | one or two lines from Expected — do not invent |
| **Destination** | `front` / `back` / `domain` (from Branch tip / Code / OpenSpec system) |
| **Actions** | ordered checklist of what this run would do (see below) |
| **Risks / gaps** | missing Expected, TBD OpenSpec, Mark-to-run unchecked, ambiguous destination |

**Actions** (only those that apply for that defect), for example:

1. Set L1 Review to `[x] reviewed` for named requirement ids when **Register the spec** and/or **Mark to run** is `[x]` and cells are still at `to review` (selecting Register the spec **assumes Review accepted**).
2. Run `/epic:extract` for owning epic(s).
3. Apply / amend OpenSpec change `<system>-<feature>` (name it when known).
4. Implement Expected in listed Code paths (name concrete files/folders when Likely sources has them).
5. Set defect Status → `applying` and append a Notes line.
6. Leave uncommitted for developer product validation (Developer validates checklist stays `[ ]`).

Also state once for the whole run:

- Feature page path
- Product branch tip
- Order of defects
- That **no edits run until approval**
- That commit stays with `/git:commit` / `/neocom-git`

If the developer rejects or edits the plan, update the work list and re-show the plan; do not process the old list.

### 4. Process (only after developer approval)

Process **one approved defect at a time**. Do not invent behaviour beyond **Expected** (and linked L1 / OpenSpec text). Follow the approved Actions for that id.

1. **Status → `applying`** on the Register row and the section Status field (same turn as the first product edit for that defect).
2. **Spec readiness (when Register the spec and/or Mark to run is `[x]` and the plan included it):**
   - Set named L1 Review cells to `[x] reviewed` (Register-the-spec checked ⇒ Review accepted). Do not invent new L1 rows beyond the defect Expected.
   - Run `.dsh/skills/epic-extract/SKILL.md` when the plan said so. Graphify first, as that skill requires.
   - When OpenSpec is already named and registered, skip re-registration unless the plan said amend.
3. **Implement** Expected in the product repo:
   - Follow `.dsh/skills/neocom-code/SKILL.md` (destination rules, branch gate on `feature/<name>`, verify, CHANGE-STATUS when touching OpenSpec tasks).
   - Prefer the smallest change that satisfies Expected.
4. **Notes** — append one short line: what changed (paths / OpenSpec tasks). Do **not** check Developer validates. Do **not** set `fixed` / `closed`.
5. Continue to the next approved defect only after the current one is implemented (or blocked). If blocked, report why; continue with the rest only when the approved list included them.

### 5. Stop for developer product validation

- Summarize each id: done / blocked / skipped, repos touched, OpenSpec changes touched.
- Leave working trees **uncommitted**. Commit is `/git:commit` / `/neocom-git`.
- Developer validates in the app, then runs **`/defect:fixed DEF-…`** to move the defect into `defects/FIXED-DEFECTS.md` (same row + section). Do **not** archive from `/fix:defect`.

## Boundaries

- **Plan-first:** never process before the developer validates the defect list and actions.
- Writes (after approval only): product repos; `neocom-meta/defects/` status/notes; OpenSpec task / CHANGE-STATUS / L1 Review cells only when the approved plan requires it.
- Do not commit, push, or open a PR.
- Do not mark Developer validates, close the defect, or move it to `FIXED-DEFECTS.md` yourself.
- Do not invent Expected behaviour or undeclared L1 requirements.
- `/defect` remains intake-only; `/fix:defect` is the fix path; `/defect:fixed` is the validated archive move.
