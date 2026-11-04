---
name: defect-register
description: >-
  Register a NEOCOM validation defect under neocom-meta/defects/ on the page
  FEATURE-<branch-stem>_DEFECTS.md. Used by /defect (neocom-defect). Creates the
  page when missing; otherwise appends the next DEF-<CODE>-NNN entry.
---

# Defect register

## When to use

The user runs `/defect` or asks to log a validation defect for the current product feature branch. Owned by agent `neocom-defect`.

## Steps

### 1. Parse the prompt

From the text after `/defect`, take:

| Field | Source |
| --- | --- |
| Title | Leading short phrase (required) |
| Observed | What the product does wrong / incompletely (required before write) |
| Expected | What it SHALL do (required before write) |
| Surfaces / severity / epic hints | Optional; ask only if needed for a useful entry |

If Observed or Expected is missing, ask once; do not invent.

### 2. Resolve branch → page path

1. Product feature branch: prompt override, else `git -C <neocom-front> rev-parse --abbrev-ref HEAD` when `feature/*`, else same for `neocom-back`, else ask.
2. Reject `develop` / `main` / meta-only branches unless the user names a product `feature/<name>`.
3. Stem = branch name with optional `feature/` stripped, then uppercased, `_` → `-`.
4. Page = `neocom-meta/defects/FEATURE-<STEM>_DEFECTS.md`.

Example: `feature/industry-blueprints` → `FEATURE-INDUSTRY-BLUEPRINTS_DEFECTS.md`.

### 3. Create page if missing

If the file does not exist, write:

```markdown
# Defects — `feature/<name>`

Register of defects found while validating the current implementation on `feature/<name>`. This file is the **intake log** only until a defect is promoted into the OpenSpec / epic flow.

Related OpenSpec: _(fill when known)_.  
Related epics: _(fill when known)_.

## Contents

- [Register](#register)

## How defects resolve (intended programme flow)

1. **Record here** — `/defect`; status `open` (or `prep`).
2. **Register the spec on the epic** — author or amend the L1 requirement on the owning epic with Review `[ ] to review`. Prefer **not** inventing behaviour beyond what the defect states.
3. **Mark to run the process** (developer, manual) — checking that mark sets Review to `[x] reviewed` and then applies the flow through OpenSpec (`/neo:extract-l2` → `/neo:spec-evolution`; apply via `/neocom-code`). Defect management does **not** keep a separate “run L1 → OpenSpec” checklist step.
4. **Developer validates** the fix is resolved — mark defect `fixed` / `closed`.

Statuses: `open` · `prep` · `in openspec` · `applying` · `fixed` · `closed` · `wontfix`.

---

## Register

| ID | Title | Status | Owning epic / capability | OpenSpec (when known) | Found |
| --- | --- | --- | --- | --- | --- |

---
```

Do not leave a Finder `* 2.*` copy.

### 4. Allocate ID

- Read the page; collect existing `DEF-<CODE>-NNN` ids.
- Reuse the page's `<CODE>` when present.
- Else derive: first letter of each hyphen segment of the stem (`INDUSTRY-BLUEPRINTS` → `IB`); single segment → first two letters (`PILOT` → `PI`).
- Next `NNN` = max existing for that code + 1, zero-padded to three digits (start `001`).

### 5. Append register row + section

Add one row to `## Register` (Found = today's date `YYYY-MM-DD`).

Append a section (before any trailing material only if the page already ends with `---`; otherwise after the last defect):

```markdown
## DEF-<CODE>-NNN — <Title>

| Field | Value |
| --- | --- |
| Status | `open` |
| Severity | <user text or `TBD`> |
| Surfaces | <user text or `TBD`> |
| Found on | <context or `TBD`> |
| Branch tip | `<repo>` `feature/<name>` |
| L1 | <link or `TBD`> |

### Observed

<user observed>

### Expected

<user expected>

### Likely sources to amend

| Layer | Path / id | Notes |
| --- | --- | --- |
| L1 | TBD | |
| L2 | TBD | |
| OpenSpec | TBD | |
| Code | TBD | |

### Prep for resolution (checklist)

- [ ] Register the spec on the owning epic (L1 requirement row; Review starts `[ ] to review`)
- [ ] Mark to run the process — sets Review to `[x] reviewed` and applies the flow through OpenSpec
- [ ] Developer validates the fix is resolved — mark this defect `fixed` / `closed`

### Notes

<optional one line from prompt context>

---
```

Fill Likely sources only when the user or an obvious existing OpenSpec/epic link is known; otherwise leave `TBD`. Do not invent requirement ids.

### 6. Reply

Short confirmation: id, path relative to `neocom-meta`, status, branch. No commit.

## Boundaries

- Write only under `neocom-meta/defects/`.
- Do not implement product code, extract L2, or run OpenSpec registration in this skill.
- Do not rewrite authored L1 from `/defect`.
