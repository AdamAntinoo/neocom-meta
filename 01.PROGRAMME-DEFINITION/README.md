# Programme definition

Living programme documentation for NEOCOM. During development and spec processing, durable knowledge from **inputs** (`02.SOURCES`, L1/L2) and from **the work itself** (architecture decisions, active features, implementation notes) is recorded here.

| Path | Contents |
| --- | --- |
| `ARCHITECTURE/` | Repository and system architecture, including versioned business objects |
| `FEATURES/` | Active and planned features |

## How this relates to other trees

```text
02.SOURCES                    external docs / extracted notes
05.REQUIREMENTS-DECOMPOSITION L1/L2 requirements → OpenSpec
01.PROGRAMME-DEFINITION       programme architecture + features (this tree)
openspec/ (neocom root)       registered change artifacts
```

Agents and Spec Collect / Spec Registration should **update** programme-definition docs when architecture or active features change, without inventing product behavior that is not backed by sources, L1/L2, or explicit user decisions.
