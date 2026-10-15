# Pull requests

## Recorded guideline

After the user reviews and tests an applied feature, open a pull request from `feature/<feature-name>` into `develop`. Do not merge it unless the user asks. The next feature branches from `develop`.

When that feature's OpenSpec change is archived, open a pull request from `develop` into `main` for review and approval. Do not merge it unless the user asks.

The title of a pull request from `develop` into `main` is `Release-` plus the GitVersion `MajorMinorPatch` that merging `develop` into `main` generates. Example: `Release-0.1.0`. Calculate it with `gitversion /nocache /showvariable MajorMinorPatch` on a temporary branch named `main` after merging `origin/develop`. Restore the local `main` pointer and do not push that merge.

## Fallback body

Use the user example below. A pull request body lists the features the branch includes.

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
