# Pull requests

Control fields for OpenSpec delivery: **`.dsh/templates/openspec-delivery-control.md`**. Use that checklist when drafting either PR kind below.

## Recorded guideline

### 1. Feature → `develop` (validation intake)

After apply **stops before commit**, the developer reviews, then commits (`/git:commit` / `/git:pr`). Open a pull request from `feature/<feature-name>` (or stacked tip) into **`develop`**. That PR declares the OpenSpec features **ready for validation**. Do not merge unless the user asks.

Validation of OpenSpec / programme acceptance runs on **`develop` after merge**, not only on the feature branch.

### 2. `develop` → `main` (release + archive trigger)

When changes are **validated on develop**, open a pull request from `develop` into **`main`**. Title: `Release-` plus GitVersion `MajorMinorPatch` (example `Release-0.1.0`). Calculate with `gitversion /nocache /showvariable MajorMinorPatch` on a temporary `main` after merging `origin/develop`. Restore the local `main` pointer; do not push that merge.

The release PR **lists the OpenSpec changes to archive**. Archiving those completed, validated changes is part of the release path (see delivery-control template). Do not merge unless the user asks.

## Fallback body

Use the user example below for feature → develop. Prefer the fuller OpenSpec / Out of scope / Validation readiness sections from `openspec-delivery-control.md` when OpenSpec changes are included.

## User examples

Recorded from the `neocom-back` pull request for `feature/esi-client` into `develop`. Later pull requests use this shape: a list of the features the branch includes.

```markdown
## Features
- Backend hexagonal: the Pilot endpoint is published on the hexagonal NestJS server. Generated Pilot client support files stay out of Git.
- ESI client: `@lgriffin/esi.ts` is installed in neocom-back, with the upstream documentation kept beside the package.
- Backend service: the pilot service returns the versioned DTO and raises request errors as `NeocomBackendError` in the NeocomError shape.
- Server startup: startup reads PORT, ENVIRONMENT, LOGLEVEL, VERSION, and an optional BANNER. GitVersion continuous deployment starts at 0.0.1 and increments the minor version on main.

## Test plan
- [ ] `nvm use`, then `npm test` and `npm run test:e2e`
- [ ] GET /v1/pilots/93813310 omits the private section when no Authorization header is sent
- [ ] GET /v1/pilots/not-a-number returns the NeocomError payload
- [ ] `@lgriffin/esi.ts` is installed and `doc/lgriffin-esi.ts/` is present
```
