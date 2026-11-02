# Branch names

## Recorded guideline

Feature work in product repositories is committed on a branch created from `develop`:

```text
feature/<feature-name>
```

`<feature-name>` is the feature being applied (`pilot`, `universe`, `login`, `pipeline`, …).

If `develop` does not exist, stop and ask. Do not branch from `main`.

## User examples

Prefer these examples over the guideline above.

### Product repositories (`neocom-front`, `neocom-back`)

```text
feature/<feature-name>
```

Recorded from the request that OpenSpec feature execution commit on `feature/<feature>`, created from `develop`. Example: `feature/character-api`.

### `neocom-meta` (no product code)

`neocom-meta` holds docs, agents, rules, skills, sources, and OpenSpec — not application code. Do **not** open a new `feature/<product-feature>` branch per OpenSpec apply (for example not `feature/login`).

| Branch | Use |
| --- | --- |
| `feature/agents` | Default and usually the single active branch. General system behaviour: agents, Cursor rules/skills, programme docs, OpenSpec pipeline, Graphify, sources. Commit meta work here unless the user names another meta branch. |
| `feature/cicd` | CI/CD ecosystem functionality only. Use when the user commands work on that branch. |

When the user commands work on `feature/cicd`, rebase it onto the latest tip of `feature/agents` when that branch is ahead and the cicd work needs it; otherwise rebase onto the latest `develop`. Ask before a force push if the branch is already on the remote. Do not force-push `develop` or `main`.

Create either meta branch from `develop` when it does not exist yet. Prefer continuing `feature/agents` over creating short-lived meta feature branches.

## After creating a `neocom-front` / `neocom-back` branch

No agent `version:sync` step. The next commit runs `.githooks/pre-commit`; GitHub `version-sync` relays on push (GitVersion `MajorMinorPatch`).
