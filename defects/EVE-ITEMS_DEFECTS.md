# Defects — `feature/eve-items`

Register of defects found while validating the current implementation on `feature/eve-items`. This file is the **intake log** only until a defect is promoted into the OpenSpec / epic flow.

Related OpenSpec: [`back-eve-items`](../openspec/changes/back-eve-items/).  
Related epics: [EPIC-013](../sources/L1/13.EPIC-EVE-ITEMS.md).

## Contents

- [Register](#register)

## How defects resolve (intended programme flow)

1. **Record here** — `/defect`; status `open` (or `prep`).
2. **Register the spec on the owning epic** — author or amend the L1 requirement on the owning epic. **Checking this checklist item assumes Review is accepted** → set the L1 cell to `[x] reviewed` (do **not** leave it at `[ ] to review`). Prefer **not** inventing behaviour beyond what the defect states.
3. **Mark to run the process** (developer, manual) — authorizes `/fix:defect` (Review is already `[x] reviewed` from step 2 when that item is checked).
4. `/fix:defect` — list defects + actions; wait for go-ahead; then implement Expected (all ready, or one `DEF-…`). May run extract → OpenSpec → product apply. Status `applying`. No commit.
5. **Developer validates** the product fix — then `/defect:fixed DEF-…` moves the defect (same structure and contents) to `defects/FIXED-DEFECTS.md` and removes it from this page.

Statuses: `open` · `prep` · `in openspec` · `applying` · `fixed` · `closed` · `wontfix`.

---

## Register

| ID | Title | Status | Owning epic / capability | OpenSpec (when known) | Found |
| --- | --- | --- | --- | --- | --- |

---
