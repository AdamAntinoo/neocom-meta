# OpenSpec delivery index (commits & PRs)

Local register of **which git commits and pull requests** carried each OpenSpec change. Owned by **`/neocom-git`**. Programme status (`registered` / `applying` / `applied` / `archived`) stays in [`CHANGE-STATUS.md`](./CHANGE-STATUS.md); this file holds **delivery evidence** so agents can answer “which PR / SHA?” **without calling GitHub**.

Graphify indexes this path under `neocom-meta` (`graphify update .`). Prefer `graphify query` / `explain` on delivery questions before `gh` or the GitHub API.

**Do not** treat this file as a substitute for CHANGE-STATUS or L1 TRACEABILITY. Cross-link only.

Last refreshed: 2026-11-03 (`neocom-meta@6d7986c` on `feature/process-epics` — EPIC-006/010 folds registered).

## When `/neocom-git` must update this file

Same turn as the git event (do not defer):

| Event | What to write |
| --- | --- |
| Commit on a feature branch that implements OpenSpec work (`/git:commit`) | Append or refresh **Commits** for each OpenSpec id in the commit (repo, SHA, branch, date) |
| PR opened feature → `develop` (`/git:pr`) | Set **PR** (`owner/repo#N`, URL, head SHA, base `develop`, state `open`) for every OpenSpec id listed in the PR body |
| PR updated (push / retitle / body OpenSpec list change) | Refresh head SHA and OpenSpec id list on that PR row |
| PR merged into `develop` (user reported or agent verified locally) | Set PR state `merged`, **merge / develop tip SHA**, date; align CHANGE-STATUS → `applied` |
| Validation on develop recorded | Set **validated** tip SHA(s) per repo (may match merge tip) |
| Release PR `develop` → `main` opened / merged | Add **release PR** + archive note; on archive, keep historical rows (do not delete) |

If GitHub API / `gh` is unavailable, still write what local git knows (`repo@sha`, branch, commit subjects). Fill `owner/repo#N` when the PR number is known from a prior successful `gh pr create` or the user.

## Column legend

| Field | Meaning |
| --- | --- |
| OpenSpec | Change folder name under `openspec/changes/` |
| Repos | Product/meta clones that received the work |
| Branch | Feature (or release) branch tip when committed / PR opened |
| Commits | One or more `repo@sha` (short SHA fine); optional subject |
| PR | `owner/repo#N` or `—` if never opened / unknown |
| PR state | `none` · `open` · `merged` · `closed` |
| Develop tip | SHA on `develop` after merge (per primary repo) |
| Validated | `validated on develop @ <sha>` (or multi-repo tips) when §6.5 done |
| Updated | ISO date of last index edit for this row |

---

## Active delivery rows

| OpenSpec | Repos | Branch | Commits | PR | PR state | Develop tip | Validated | Updated |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `login` | front, back | (merged; was `feature/login`) | `neocom-front@e3356db`; `neocom-back@3317849` (SSO commits on develop; distinct login PR id not recorded locally) | — | none | front `e3356db` · back `3317849` | front `@ e3356db` · back `@ 3317849` | 2026-11-03 |
| `front-infrastructure` | front | (merged) | `neocom-front@e3356db` | — | none | `e3356db` | `@ e3356db` | 2026-11-03 |
| `front-angular-structure` | front | (merged) | `neocom-front@e3356db` | — | none | `e3356db` | `@ e3356db` | 2026-11-03 |
| `front-node-render` | front | (merged) | `neocom-front@e3356db` | — | none | `e3356db` | `@ e3356db` | 2026-11-03 |
| `front-async-sse` | front | (merged) | `neocom-front@e3356db` | — | none | `e3356db` | `@ e3356db` | 2026-11-03 |
| `front-pilot` | front | (merged) | `neocom-front@e3356db` | — | none | `e3356db` | `@ e3356db` | 2026-11-03 |
| `front-pilot-panel` | front | (merged) | `neocom-front@e3356db` | — | none | `e3356db` | `@ e3356db` | 2026-11-03 |
| `back-async-sse` | back | `feature/industry` | tip before merge included session bind; develop `@ 3317849` | `AdamAntinoo/neocom-back#4` | merged | `3317849` | `@ 3317849` | 2026-11-03 |
| `infra-async-persistence` | back, meta | `feature/industry` (+ meta tools) | back `@ 3317849`; meta companion under `tools/infra` | `AdamAntinoo/neocom-back#4` (back portion) | merged | back `3317849` | back `@ 3317849` | 2026-11-03 |
| `back-spacelocations` | back | `feature/industry` | `@ 3317849` | `AdamAntinoo/neocom-back#4` | merged | `3317849` | `@ 3317849` | 2026-11-03 |
| `back-openapi` | back | `feature/industry` | `@ 3317849` | `AdamAntinoo/neocom-back#4` | merged | `3317849` | `@ 3317849` | 2026-11-03 |
| `back-industry-blueprints` | back | `feature/industry` | `@ 3317849` | `AdamAntinoo/neocom-back#4` | merged | `3317849` | `@ 3317849` | 2026-11-03 |
| `domain-pilot` | domain | (merged; was `feature/domain-models`) | `neocom-domain@477ee33` | — | none | `477ee33` | `@ 477ee33` | 2026-11-03 |
| `domain-blueprint` | domain | (merged) | `neocom-domain@477ee33` | — | none | `477ee33` | `@ 477ee33` | 2026-11-03 |
| `domain-application-info` | domain | (merged) | `neocom-domain@477ee33` | — | none | `477ee33` | `@ 477ee33` | 2026-11-03 |
| `domain-server-status` | domain | (merged) | `neocom-domain@477ee33` | — | none | `477ee33` | `@ 477ee33` | 2026-11-03 |
| `domain-spacelocation` | domain | (merged) | `neocom-domain@477ee33` | — | none | `477ee33` | `@ 477ee33` | 2026-11-03 |
| `domain-locations` | domain | (merged) | `neocom-domain@477ee33` | — | none | `477ee33` | `@ 477ee33` | 2026-11-03 |
| `domain-jsonclass` | domain, front, back | (merged) | domain `@ 477ee33`; front `@ e3356db`; back `@ 3317849` | back portion `AdamAntinoo/neocom-back#4` | mixed | see tips | multi-repo tips 2026-11-03 | 2026-11-03 |
| `domain-layout` | domain | (merged) | `neocom-domain@477ee33` | — | none | `477ee33` | `@ 477ee33` | 2026-11-03 |
| `domain-ports` | domain | (merged) | `neocom-domain@477ee33` | — | none | `477ee33` | `@ 477ee33` | 2026-11-03 |
| `domain-deprecations` | domain | (merged) | `neocom-domain@477ee33` | — | none | `477ee33` | `@ 477ee33` | 2026-11-03 |

## Not yet delivered (no commit/PR required in index until apply commits)

Registered / deferred changes appear in CHANGE-STATUS only until `/git:commit` or `/git:pr` records delivery. Optional stub:

| OpenSpec | Notes |
| --- | --- |
| `nestjs-sso-config` | registered 0/2 — no delivery row yet |
| `esi-character-api` | deferred (`neocom-esi` aside) |
| EPIC-003 cluster (`front-bdd-cypress`, …) | registered — no delivery row yet |
| `front-app-shell` | registered — no delivery row yet |
| `front-dashboard-shell` | registered meta `@ 6d7986c`; seed on `neocom-front` `feature/dashboard-shell` `@ 22d2e06` (apply not finished) |
| `front-industry-blueprints` | registered meta `@ 6d7986c`; early UI seed also on `feature/dashboard-shell` `@ 22d2e06` (own feature branch not cut yet) |

## Archived delivery (historical)

When a change is OpenSpec-archived, **move** its row here (keep PR/SHA forever).

| OpenSpec | Repos | PR / commits | Archived | Updated |
| --- | --- | --- | --- | --- |
| *(none yet beyond pre-index archives)* | | See CHANGE-STATUS Archived for `2026-10-15-*` — delivery SHAs not backfilled | | |

---

## Agent lookup order (traceability)

1. `graphify query` / `explain` mentioning the OpenSpec change or `DELIVERY-INDEX`
2. Read this file’s row for that change
3. Only if the row is missing or marked incomplete → local `git log` / `gh` / user

## How to update (checklist)

1. Identify OpenSpec ids touched (PR body, CHANGE-STATUS, or commit scope).
2. Upsert one table row per OpenSpec id (multi-repo → multiple SHAs in Commits / Develop tip).
3. Never invent a PR number. Use `—` / `none` until known.
4. Bump **Last refreshed** and the row **Updated** date.
5. Keep CHANGE-STATUS / TRACEABILITY status moves in the **same turn** when merge or validation happens.
