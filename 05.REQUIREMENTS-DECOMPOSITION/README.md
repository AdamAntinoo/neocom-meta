# Requirements decomposition

| Level | Path | Role |
| --- | --- | --- |
| Programme | `../01.PROGRAMME-DEFINITION/` | Architecture and active features (updated from inputs + development) |
| Sources | `../02.SOURCES/` | External docs and extracted notes |
| L1 | `L1/` | Atomic-oriented requirements list (from **Spec Collect**) |
| L2 | `L2/` | Decomposed / specialized specs (e.g. infrastructure) used with L1 in **Spec Registration** |

## Agent commands

1. `/spec-collect` — process `02.SOURCES` → update `L1/`
2. `/spec-registration` — when L1 is atomic enough, register selected L1 + L2 into OpenSpec at the parent `neocom/openspec/` root
