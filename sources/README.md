# Requirements decomposition

| Level | Path | Role |
| --- | --- | --- |
| Programme | `../01.PROGRAMME-DEFINITION/` | Architecture and active features (updated from L1 + development) |
| L1 | `L1/NN.EPIC-NAME.md` | One file per epic, opened by `/epic`. `NN` starts at `01`. Each epic has `## Spec traceability` linking OpenSpec |
| L1 index | `L1/TRACEABILITY.md` | Per-epic Sections (Review / pipeline). Agents skip `applied` / `archived` material on later `/epic:extract` runs |

L1 is authored with `/epic` (and refined in the epic file). There is no `/spec-collect` step and no `02.SOURCES` intake into L1. There is no L2 copy. `sources/L2/` is removed.

`/epic:extract` reads L1 only. It registers rows whose Review cell is `[x] reviewed` into an OpenSpec change `<system>-<feature>` with the spec at `openspec/changes/<system>-<feature>/specs/<system>/<feature>/spec.md`. A note that duplicates an existing OpenSpec requirement, or is very similar to one, is appended to `sources/L1/00.DUPLICATES.md` and is not registered.

## Agent commands

1. `/epic` — author or extend an L1 epic under `L1/`
2. `/epic:extract` — register reviewed L1 units into OpenSpec. No args: pending epics; args: only those epics
3. `/feature-delivery` — apply a registered feature on `feature/<feature>` from `develop` and commit. The user reviews and tests. Then open a pull request into `develop`. Archive opens a pull request from `develop` into `main`

OpenSpec changes cite the L1 epic and L1 requirement ids. L1 epics record the same linkage under `## Spec traceability` and in `L1/TRACEABILITY.md` so a later `/epic:extract` skips passages already processed or applied.
