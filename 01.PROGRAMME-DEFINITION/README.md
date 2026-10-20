# Programme definition

Living programme documentation for NEOCOM. During development and spec processing, durable knowledge from **L1/L2** and from **the work itself** (architecture decisions, active features, implementation notes) is recorded here.

| Path | Contents |
| --- | --- |
| `ARCHITECTURE/` | Repository and system architecture; `MODELS.md` holds applied/implemented domain-model docs and hierarchy diagrams |
| `FEATURES/` | Active and planned features |

## How this relates to other trees

```text
05.REQUIREMENTS-DECOMPOSITION L1 (via /epic) → L2 → OpenSpec
01.PROGRAMME-DEFINITION       programme architecture + features (this tree)
openspec/                     registered change artifacts
```

Agents and Spec Registration should **update** programme-definition docs when architecture or active features change, without inventing product behavior that is not backed by L1/L2 or explicit user decisions.
