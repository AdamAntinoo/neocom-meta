---
name: extract-requirements-from-urls
description: >-
  Extracts textual requirements and domain information from URLs listed in
  neocom-meta/02.SOURCES, saves structured notes under 02.SOURCES/extracted,
  and builds Graphify token/knowledge maps from the fetched corpus. Use when
  the user asks to read sources, extract requirements from documentation URLs,
  ingest NestJS or EVE Online SSO docs, or generate Graphify maps from 02.SOURCES.
---

# Extract requirements from URLs

Work only under `neocom-meta`. Default catalog: [`02.SOURCES/SOURCES.md`](../../../02.SOURCES/SOURCES.md).

## When to use

- User asks to extract requirements or information from documentation URLs
- User points at `02.SOURCES` or NestJS / EVE Online developer docs
- User wants Graphify token maps (concept/entity graphs) from those sources

## Workflow

### 1. Resolve the URL list

1. Read `02.SOURCES/SOURCES.md`.
2. Use every URL in the machine-friendly list unless the user named a subset.
3. If the user adds new URLs, append them to `SOURCES.md` before extracting.

### 2. Fetch and build the Graphify corpus (token map)

Graphify can fetch URLs into a local corpus and update a knowledge graph (token/concept map). Prefer the CLI when available:

```bash
cd neocom-meta/02.SOURCES
graphify add "https://example.com/docs" --dir raw
```

Repeat for each source URL. Then, from `02.SOURCES`:

```bash
# Build or refresh the graph over the saved corpus (docs need semantic pass / configured LLM when required)
graphify .
# or incremental:
graphify update .
```

Outputs typically land under `02.SOURCES/graphify-out/` (`graph.json`, `GRAPH_REPORT.md`, optional `graph.html`).

If `graphify` is missing, report that and fall back to step 3 only (WebFetch / browser). Do not invent graph files.

After the graph exists, orient with:

```bash
cd neocom-meta/02.SOURCES
graphify god-nodes --graph graphify-out/graph.json
graphify query "authorization code PKCE SSO requirements" --graph graphify-out/graph.json
```

Treat god-nodes / query results as the **token map** view of the documentation corpus.

### 3. Extract textual requirements

For each URL (WebFetch or the markdown saved under `raw/`):

1. Pull the page text (prefer saved `raw/` content when present).
2. Extract:
   - Normative requirements (MUST / SHOULD / constraints)
   - Actors, tokens, endpoints, scopes, security rules
   - Open questions and out-of-scope notes
3. Write one markdown file per source under `02.SOURCES/extracted/`, named from the source (examples):
   - `nestjs.md`
   - `eve-developers.md`
   - `eve-sso.md`
   - `eve-sso-pkce.md`

Use this shape:

```markdown
# <Source title>

- URL: <url>
- Fetched: <ISO date>

## Summary

## Requirements

- ...

## Concepts / tokens

- ...

## Implications for NEOCOM

- Front / back / meta ownership if clear

## Open questions
```

### 4. Optional handoff into decomposition

If the user asks to promote findings into specs, copy or summarize into `05.REQUIREMENTS-DECOMPOSITION/` (do not invent infrastructure detail that was not in the sources). Prefer OpenSpec at the `neocom` root when they want a formal change proposal.

## Rules

- Stay inside `neocom-meta` for writes.
- Do not implement product features in front/back from this skill.
- Cite the source URL on every extracted requirement file.
- Prefer Graphify for corpus ingest + token maps; prefer structured `extracted/*.md` for human-readable requirements.
- If Graphify fails (no CLI, no LLM key for docs), still deliver `extracted/*.md` and state what blocked the graph.

## Return to caller

1. URLs processed
2. Paths written under `extracted/` (and `raw/` / `graphify-out/` if produced)
3. Notable requirements (short list)
4. Graphify status (built / partial / skipped + why)
