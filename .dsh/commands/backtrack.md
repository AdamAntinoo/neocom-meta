---
name: "/neo:backtrack"
id: "neo-backtrack"
category: "NEOCOM Spec"
description: "Backtrack legacy code referenced by an epic. Searches /Users/adam/IdeaProjects/neocom-infinity for the classes, methods, and flows an epic names, and records them in sources/COLLECTOR."
---

Run **`/neo:backtrack`** for the `neocom-backtrack` agent.

The agent detects which epics changed version (SHA-256 fingerprint against `neocom-meta/sources/COLLECTOR/TRACKER.md`), ensures the legacy graphify index is current, reads each due epic for the classes, methods, and flows it references, and backtracks them in the legacy code under `/Users/adam/IdeaProjects/neocom-infinity`.

Findings are written to `neocom-meta/sources/COLLECTOR/NN.EPIC-NAME.md` (indexed, with a mermaid diagram when elements connect), and the register is updated. When the search target is unclear, the agent asks the developer and records the answer to trim later runs.

Do not implement product features. Do not commit.
