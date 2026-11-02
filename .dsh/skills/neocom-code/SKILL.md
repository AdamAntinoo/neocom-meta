---
name: neocom-code
description: >-
  Implement product code in neocom-front or neocom-back (or neocom-domain)
  for a registered OpenSpec change or a scoped fix. Resolves destination
  first, then applies shared + destination-specific rules. Use when
  /neocom-code or when applying OpenSpec tasks in a product repo.
disable-model-invocation: true
---

# NEOCOM code (front / back)

Owned by the `neocom-code` agent. Slash `/neocom-code`.

One agent implements **front** and **back** product code. Rules that differ by destination are selected after resolving where to work.

## Arguments

```text
/neocom-code
/neocom-code front
/neocom-code back
/neocom-code domain
/neocom-code front <system>-<feature>
/neocom-code back <system>-<feature>
/neocom-code <system>-<feature>
```

| Argument | Meaning |
| --- | --- |
| `front` / `back` / `domain` | Force destination |
| `<system>-<feature>` | OpenSpec change to apply (system also implies destination when no explicit front/back) |
| *(none)* | Infer from conversation / open files / sole active change; ask if ambiguous |

## Steps

### 1. Resolve destination

Follow `.dsh/agents/neocom-code.md` → **Destination resolution**. Announce `Destination: …` and the repo root.

| Destination | Repo root (sibling of `neocom-meta`) |
| --- | --- |
| `front` | `neocom-front` |
| `back` | `neocom-back` |
| `domain` | `neocom-domain` |

Load **shared** rules, then the matching **Destination:** section from the agent file. Do not apply front stack rules while Destination is `back`, and vice versa.

### 2. Orient on the change (when applying OpenSpec)

1. Confirm OpenSpec root: from `neocom-meta`, `nvm use` then `npx openspec list --json`.
2. Read `openspec/changes/<system>-<feature>/` — proposal, specs for this destination’s system, design, tasks.
3. Implement only requirements stated for this destination. Leave other systems for a later destination hop.

### 3. Branch gate

Confirm you are on `feature/<feature>` from `develop` in the destination repo (or ask `/neocom-git` to create it). Do not code on `develop` / `main`.

For multi-destination changes, each repo has its own `feature/<feature>` (or shared feature name per repo convention).

### 4. Implement

1. `cd` to the destination repo; `nvm use`.
2. Match existing patterns (neighbours in the same folder). Prefer small diffs.
3. **Front-only:** Angular + Vitest + Cypress/Cucumber as applicable; `vn-` renders / `jsonClass` when painting domain nodes; page header/panel patterns when building pages.
4. **Back-only:** NestJS hexagonal neighbours; emit `jsonClass` on published domain payloads when specs require it. **Exceptions (first rule):** `throw ExceptionCatalog.ENTRY.doThrow(messageParams, payload)` — catalog entry = code + parametrized message; **builder builds payload only**; **`doThrow` returns** `NeocomBackendError` (equivalent to the old `new NeocomBackendError(HttpStatus, [entry])`); call site uses **`throw`**. See agent Destination `back`. Migrate anti-patterns like `get-space-location.usecase.ts` when touching them.
5. **Domain-only:** library exports only; no Nest/Angular bootstrap.

### 5. Verify

- Run tests the change names, or destination defaults (`npm test`; front e2e when UI acceptance is in scope).
- Do not invent a local deploy host.

### 6. Mark progress

1. Check off completed items in `openspec/changes/<…>/tasks.md`.
2. Update `neocom-meta/openspec/CHANGE-STATUS.md` (`applying`, task counts from `npx openspec list --json`, note destination repos touched).
3. When the sourcing epic’s Spec traceability should move to `applying`, update it and `sources/L1/TRACEABILITY.md` if this apply starts that transition.

### 7. Stop for developer review (no commit)

Do not commit and do not invoke `/neocom-git` to commit. Leave the working tree dirty so the developer can review the code before continuing.

- Summarize what changed and which OpenSpec tasks are done.
- **Stop.** Do not start the next destination, the next OpenSpec change, or further product edits until the developer says to continue (or asks for a commit via `/git:commit` / `/neocom-git`).
- If more destinations remain on the same change, name which is next and wait.

## Multi-destination order

Default when types must exist before wire/UI: **domain → back → front**. Override when the user or the change design says otherwise. Re-run destination resolution at each hop.

## Boundaries

- No commits, branches, PRs (→ `/neocom-git`).
- No L1/L2 authorship or `/neo:spec-evolution` (→ spec agents).
- No cross-repo file copies that break destination boundaries.

## Return

1. Destination(s) and paths changed
2. OpenSpec tasks completed
3. Verification result
4. Remaining destinations / git next steps
