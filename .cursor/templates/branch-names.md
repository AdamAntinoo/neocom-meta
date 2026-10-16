# Branch names

## Recorded guideline

Feature work is committed on a branch created from `develop`:

```text
features/<feature-name>
```

`<feature-name>` is the feature being applied (`pilot`, `universe`, `neocom-domain`, `developer-install`, `local-config`, `pipeline`).

If `develop` does not exist, stop and ask. Do not branch from `main`.

## User examples

Prefer this example over the guideline above.

```text
feature/<feature-name>
```

Recorded from the request that OpenSpec feature execution commit on `feature/<feature>`, created from `develop`. Example: `feature/character-api`.

## After creating a `neocom-front` branch

First task: set the app version to GitVersion `MajorMinorPatch` in `package.json`, both environment `appVersion` fields, and the loading text in `src/index.html`. Owned by `/neocom-git`.
