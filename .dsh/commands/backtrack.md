---
name: "/neo:backtrack"
id: "neo-backtrack"
category: "NEOCOM Spec"
description: "On explicit request, backtrack legacy code for named epic(s). Requires epic argument(s). Disabled by default — does not auto-scan on epic change."
---

Run **`/neo:backtrack`** for the `neocom-backtrack` agent.

**On request only.** Name one or more epics. With no epic argument, stop and ask — do not scan all L1 epics or all fingerprint-changed rows.

```text
/neo:backtrack 06
/neo:backtrack EPIC-USER-INTERFACE
/neo:backtrack 06.EPIC-USER-INTERFACE.md
```

**First action (after epics resolve):** refresh graphify indexes (meta `graphify update .`, then legacy extract if needed). Do not ask. Do not skip.

Then for each **named** epic whose `## Search criteria` are filled, backtrack classes, methods, and flows in the legacy code under `/Users/adam/IdeaProjects/neocom-infinity`. Empty criteria → skip that epic and report; do not invent a search.

Findings are written to `neocom-meta/sources/COLLECTOR/NN.EPIC-NAME.md` (indexed, with a mermaid diagram when elements connect), and the register is updated. When the search target is unclear, the agent asks the developer and records the answer to trim later runs.

Do not implement product features. Do not commit.
