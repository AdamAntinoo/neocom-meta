---
name: spec-collect
description: >-
  Spec Collect — gather requirements from neocom-meta/02.SOURCES and produce an
  L1 requirements list under 05.REQUIREMENTS-DECOMPOSITION. Use when the user
  runs /spec-collect or asks to collect/decompose requirements from sources.
disable-model-invocation: true
---

# Spec Collect

Agent command for **requirement collection**. Stay inside `neocom-meta` for all writes.

## Goal

Process documentation at `02.SOURCES` and generate / refresh the **L1** requirements list under `05.REQUIREMENTS-DECOMPOSITION/L1/`.

## Pipeline

```text
02.SOURCES  -->  (extract + Graphify)  -->  L1 requirements list
                                         -->  readiness for Spec Registration
```

## Steps

1. **Orient on sources**
   - Read `02.SOURCES/SOURCES.md`.
   - Follow `.cursor/skills/extract-requirements-from-urls/SKILL.md` to fetch/update corpus under `02.SOURCES/raw/`, write notes under `02.SOURCES/extracted/`, and build Graphify token maps under `02.SOURCES/graphify-out/` when `graphify` is available.

2. **Synthesize L1**
   - Create or update `05.REQUIREMENTS-DECOMPOSITION/L1/REQUIREMENTS.md` as the master L1 list.
   - Optionally split by domain into additional files under `L1/` (e.g. `AUTH.md`, `PLATFORM.md`) if the list grows large — keep `REQUIREMENTS.md` as the index.
   - Each L1 item must include:
     - Stable ID (`L1-XXX`)
     - Short title
     - Statement (one testable or decidable need)
     - Source URL(s) from `02.SOURCES`
     - Status: `draft` | `candidate` | `atomic-ready`
     - Suggested owner: `front` | `back` | `meta` | `infra` | `undecided`

3. **Do not invent product behavior**
   - Only requirements supported by sources or explicit user input.
   - Mark gaps under **Open questions**; do not fill them with guesses.

4. **Atomicity gate (report only)**
   - Judge whether the L1 set is **enough atomic** to advance the project via **Spec Registration**.
   - Atomic-ready means: clear, non-duplicated, source-backed items that can drive OpenSpec changes without further discovery for that slice.
   - If not ready: list what is still coarse and what sources or decisions are missing. **Do not** run Spec Registration or write to OpenSpec from this command.

5. **L2**
   - Do not rewrite L2 during Spec Collect unless the user asks. L2 (`05.REQUIREMENTS-DECOMPOSITION/L2/`) is refined later and consumed by Spec Registration.
   - Keep any `UNREGISTERED REQUIREMENTS` heading. Spec Collect does not move those notes. `/neo:extract-l2` converts an L1 epic into L2, and `/neo:spec-evolution` moves L2 specs into OpenSpec.

6. **Programme definition**
   - If collection clarifies architecture or active features, update `01.PROGRAMME-DEFINITION/` (link new L1 IDs on feature docs such as Login and Initialization when applicable).

## Output shape for `L1/REQUIREMENTS.md`

```markdown
# L1 requirements

- Collected: <ISO date>
- Sources: 02.SOURCES/SOURCES.md
- Spec Registration readiness: <not-ready | partial | ready>
- Notes: <one short paragraph>

## Requirements

| ID | Title | Statement | Sources | Owner | Status |
| --- | --- | --- | --- | --- | --- |
| L1-001 | ... | ... | ... | ... | draft |

## Open questions

- ...
```

## Return to user

1. Paths updated under `02.SOURCES/` and `05.REQUIREMENTS-DECOMPOSITION/L1/`
2. Count of L1 items by status
3. Spec Registration readiness verdict and why
4. If ready, tell them to run `/neo:extract-l2`, then `/neo:spec-evolution` to move the L2 specs into OpenSpec
