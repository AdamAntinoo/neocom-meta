---
name: defect-fixed
description: >-
  When the developer has validated a product fix, move the defect from
  <stem>_DEFECTS.md into neocom-meta/defects/FIXED-DEFECTS.md with the
  same register row and section contents. Used by /defect:fixed (neocom-defect).
---

# Defect fixed (archive move)

## When to use

The user runs `/defect:fixed` or states that they have **validated** a defect fix and it should be closed/archived. Owned by agent `neocom-defect`.

## Arguments

```text
/defect:fixed DEF-<CODE>-NNN
/defect:fixed <CODE>-NNN
/defect:fixed DEF-A DEF-B …
```

| Argument | Meaning |
| --- | --- |
| One or more ids | Move those defects (normalize each to `DEF-<CODE>-NNN`) |
| *(none)* | Ask which id(s) — do not guess |

Refuse `wontfix` unless the user explicitly asks to archive that outcome into FIXED-DEFECTS with status `wontfix`.

## Paths

| Role | Path |
| --- | --- |
| Open register | `neocom-meta/defects/<STEM>_DEFECTS.md` (resolve stem like `defect-register`) |
| Fixed archive | `neocom-meta/defects/FIXED-DEFECTS.md` (single programme file; create if missing) |

Never create Finder `* 2.*` copies.

## Steps

### 1. Resolve source page and ids

1. Resolve product `feature/<name>` → open register path (same branch rules as `/defect`).
2. Normalize each id. Stop if an id is missing from the open register (search other `*_DEFECTS.md` only when the user names that feature or the id is unique across pages — otherwise ask).

### 2. Prepare the moved payload

For each id, **copy** without inventing new behaviour:

1. The full Register table **row** for that id.
2. The full `## DEF-…` section through its trailing `---` (or through the next `## DEF-` / EOF).

Then **normalize** on the copy only:

1. Status field and Register Status cell → `fixed` (or `closed` if the user said closed).
2. Prep checklist: set Developer validates to `- [x] …` if still unchecked.
3. Notes: append one line `Validated YYYY-MM-DD — moved to FIXED-DEFECTS.md` (today’s date).
4. Keep Observed / Expected / Likely sources / other checklist items and all other fields **unchanged**.

### 3. Create `FIXED-DEFECTS.md` if missing

```markdown
# Fixed defects

Archive of defects whose product fix the developer has **validated**. Entries are **moved** here from `<stem>_DEFECTS.md` via `/defect:fixed`. Structure matches the open register (Register row + defect section).

## Contents

- [Register](#register)

## How entries land here

1. Defect lived on `defects/<STEM>_DEFECTS.md`.
2. Developer validated the product fix.
3. `/defect:fixed DEF-…` sets status `fixed` (or `closed`), appends the same row + section here, and removes them from the open feature page.

Statuses on this page: `fixed` · `closed` · (rarely) `wontfix`.

---

## Register

| ID | Title | Status | Owning epic / capability | OpenSpec (when known) | Found | Source feature |
| --- | --- | --- | --- | --- | --- | --- |

---
```

When appending to an existing archive that still has the older Register header **without** `Source feature`, add that column on new rows only if the table already has it; if the table lacks the column, keep the same column set as the open page and put the source stem in Notes instead — do not break existing table shape mid-file. Prefer extending the header to include **Source feature** (`feature/<name>` or stem) when creating a new file or when the archive is empty of data rows.

### 4. Append to the archive

1. Add the Register row (include **Source feature** when the archive table has that column).
2. Append the defect section after the last archived defect (before any trailing-only material).
3. Optionally add a Contents link for the new heading.

### 5. Remove from the open feature page

1. Delete the Register row for that id.
2. Delete the `## DEF-…` section.
3. Remove Contents links for that defect when present.
4. Do not leave empty orphan `---` clutter; keep page structure tidy.

### 6. Reply

List each id moved, open-page path, and `defects/FIXED-DEFECTS.md`. No commit.

## Boundaries

- Writes only under `neocom-meta/defects/` (and harness when updating agent docs).
- Do not implement product code. Do not re-open extract/OpenSpec from this skill.
- Do not invent Observed/Expected. Do not commit.
- Moving is the archive step after validation — `/fix:defect` must not move defects itself.
