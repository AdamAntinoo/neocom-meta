# CI/CD — GitHub repository setup (manual)

Status: L1 EPIC-017 §11 (`CICD-F/B-085…089`). Source: [`17.EPIC-CICD.md`](../../../../sources/L1/17.EPIC-CICD.md) §11.

This document is the **developer checklist** for configuring GitHub so front and back CI can run. Goal: **minimise** Settings UI work. Non-secret values live in **committed** workflow files (and Sonar / `.nvmrc` files), not in Actions **Variables**.

## What you configure in the GitHub UI

| Item | Type | Repos |
| --- | --- | --- |
| `SONAR_TOKEN` | Secret | `neocom-front`, `neocom-back` (org secret OK) |
| Actions enabled | Setting | `neocom-meta`, `neocom-front`, `neocom-back` |
| Access to reusable workflows/actions from meta | Setting | `neocom-meta` |
| Packages read/write (after first publish) | Setting | package / GHCR image |
| `NPM_TOKEN`, `NEOCOM_REPO_TOKEN` | Secret | `neocom-domain` only (existing publish path) |
| `GHCR_PULL_TOKEN` | Optional secret / local env | Local Docker host (pull), not required on github-hosted CI |

Built-in `GITHUB_TOKEN` needs no creation; caller workflows must declare `permissions` (committed YAML).

## What you do **not** put in Actions Variables

Set these in the **product repo** instead:

| Value                                    | Put it here                                                                                                                                    |
| ---------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| Node version                             | Caller workflow `with:` / `env:` or `.nvmrc` (example: `neocom-front/.github/workflows/build.yml` → `node-version: 24.21.0`)                   |
| Meta reusable workflow / action ref      | Caller `uses: AdamAntinoo/neocom-meta/…@<ref>`                                                                                                 |
| Sonar organization + Sonar analysis data | Per-repo committed `sonar-project.properties` — organization `**adamantinoo**` (used by Sonar upload)                                          |
| Sonar project key                        | Local caller workflow `SONAR_PROJECT_KEY`: front `**AdamAntinoo_neocom-front**`, back `**AdamAntinoo_neocom-back**` — not Actions Variables UI |
| GHCR image name                          | Caller workflow `env:` / inputs to the docker action                                                                                           |
| Workflow permissions                     | `permissions:` block in the caller YAML                                                                                                        |

Programme default: **no** GitHub Actions repository variables for CI.

## Manual steps

### 1. Enable Actions

On each of `neocom-meta`, `neocom-front`, and `neocom-back`:

1. Open **Settings → Actions → General**.
2. Allow Actions (and allow GitHub Actions to create/approve PRs only if you use version-sync auto-commit).

### 2. Allow product repos to use `neocom-meta` reusable workflows

On `**neocom-meta**`:

1. **Settings → Actions → General → Access**.
2. Allow access from repositories in the same user/org (or explicitly `neocom-front` and `neocom-back`).

Without this, callers such as `uses: AdamAntinoo/neocom-meta/.github/workflows/….yml@…` fail when meta is private.

### 3. Create Sonar projects beforehand, then commit config

1. **Before CI can upload**, ensure SonarCloud projects exist for front and back (keys below).
2. In each product repo, commit `sonar-project.properties` with `sonar.organization=adamantinoo` and other Sonar analysis data (sources, coverage report paths, exclusions, encoding, host URL if needed). The Sonar upload action uses this file.
3. In the local caller workflow, set and pass:
   - `neocom-front`: `SONAR_PROJECT_KEY=AdamAntinoo_neocom-front`
   - `neocom-back`: `SONAR_PROJECT_KEY=AdamAntinoo_neocom-back`
4. Do **not** add Sonar org or project key as GitHub Actions **Variables** UI entries.

### 4. Add `SONAR_TOKEN`

1. Open the SonarCloud **project roles** page for front and confirm your account can analyze the project:

   [https://sonarcloud.io/project/roles?id=AdamAntinoo_neocom-front](https://sonarcloud.io/project/roles?id=AdamAntinoo_neocom-front)  
    Do the same for back: [https://sonarcloud.io/project/roles?id=AdamAntinoo_neocom-back](https://sonarcloud.io/project/roles?id=AdamAntinoo_neocom-back).  
    Your user (or the group you belong to) needs permission to **Analyze** (and usually **Browse**) on both projects.
2. Still signed in to SonarCloud as that user, create an analysis token:
   - Go to [https://sonarcloud.io/account/security](https://sonarcloud.io/account/security) (SonarCloud → avatar → **My Account** → **Security**).  
   - Under **Generate Tokens**, enter a name (e.g. `neocom-ci`), choose a token type that can run analysis, and generate.  
   - Copy the token **once** (SonarCloud will not show it again).
3. In GitHub, add a repository secret (or one org secret shared by both repos) named `SONAR_TOKEN` on `neocom-front` and `neocom-back`:

   **Settings → Secrets and variables → Actions → New repository secret** → paste the token.
4. Never commit the token. One user/org token with Analyze on both projects is enough for front and back CI.

### 5. Confirm committed caller workflows

In `neocom-front` and `neocom-back` `.github/workflows/`:

1. Trigger CI on **`feature/**`**, **`develop`**, and **`main`** (push + pull_request) and on **all tags** (`tags: ['*']` or equivalent) so unit/acceptance testing runs for those refs.
2. Pin **Node** version (or read `.nvmrc`).
3. Pin **meta** `@ref` on every `uses: AdamAntinoo/neocom-meta/…`.
4. Declare `permissions` (`contents: read` or `write` if needed; `packages: write` for Packages/GHCR; PR/check write only if Sonar decorates PRs).
5. Set `**artifactName**` (short image name, e.g. `neocom-front` / `neocom-back`) in the caller workflow. Image tags come from GitVersion: `{majorMinorPatch}-{commits}.{channel}.{shortSha}` (see EPIC-017 §08); GHCR path is `ghcr.io/{owner}/{artifactName}`.
6. Pass `secrets: inherit` (or map `SONAR_TOKEN`) into reusable workflows that need the Sonar secret.

### 6. Packages / GHCR after first publish

1. Run a workflow that publishes the package or pushes the image (or publish once manually if required to create the package).
2. Open the package / GHCR image → **Package settings → Manage Actions access** (and visibility) so the repo workflow can write and the local-pull identity can read.
3. On the machine that loads images into the local Docker engine, prefer `gh auth login` + `docker pull`; use `GHCR_PULL_TOKEN` only if that host cannot use `gh` or interactive login.

#### How to get `GHCR_PULL_TOKEN` (optional — local Docker host only)

GitHub-hosted CI pushes images with `GITHUB_TOKEN` and does **not** need this secret. Use `GHCR_PULL_TOKEN` on the **local deploy machine** (or self-hosted runner) when you must `docker login` / `docker pull` from **GHCR** without `gh`.

1. Sign in to GitHub as a user who can **read** the package/image (same owner as `ghcr.io/AdamAntinoo/…`, and Package settings allow that identity to read).
2. Create a token with **read packages** (and SSO authorize if the org requires it):
   - **Fine-grained PAT (preferred):** [https://github.com/settings/personal-access-tokens/new](https://github.com/settings/personal-access-tokens/new)  
     - Resource owner: the owner of the GHCR packages (`AdamAntinoo`).  
     - Repository access: the repos that own the packages (e.g. `neocom-front`, `neocom-back`), or account-level package access as GitHub presents for GHCR.  
     - Permissions → **Packages: Read** (read-only is enough for pull).  
     - Generate and copy once.
   - **Classic PAT (alternative):** [https://github.com/settings/tokens/new](https://github.com/settings/tokens/new)  
     - Enable scope `**read:packages**`.  
     - If packages are private and tied to private repos, you may also need `**repo**`.  
     - Generate and copy once.
3. Store the token on the **local Docker host** (environment variable or a private file — **not** required as a GitHub Actions secret on front/back for github-hosted jobs). Example name: `GHCR_PULL_TOKEN`.
4. Authenticate Docker to GHCR, then pull:

```bash
echo "$GHCR_PULL_TOKEN" | docker login ghcr.io -u YOUR_GITHUB_USERNAME --password-stdin
docker pull ghcr.io/AdamAntinoo/neocom-front:<imageTag>
# or neocom-back, matching the artifactName in the caller workflow
```

5. Prefer `**gh auth login**` + `docker pull` when the host can use the GitHub CLI; then you do not need a long-lived `GHCR_PULL_TOKEN`. Never commit the token.

### 7. Domain publish secrets (if not already set)

On `**neocom-domain**` only (not required for front/back CI itself):

- `NPM_TOKEN` — npm publish
- `NEOCOM_REPO_TOKEN` — PAT so domain CI can bump front/back after publish

#### How to get `NEOCOM_REPO_TOKEN`

`GITHUB_TOKEN` in the `neocom-domain` workflow **cannot** push to other repositories. Domain’s `npm-publish.yml` needs a **Personal Access Token (PAT)** (or fine-grained token) that can write to `neocom-front` and `neocom-back`.

1. Sign in to GitHub as a user who can push to `**AdamAntinoo/neocom-front**` and `**AdamAntinoo/neocom-back**`.
2. Create a token:
   - **Fine-grained PAT (preferred):** [https://github.com/settings/personal-access-tokens/new](https://github.com/settings/personal-access-tokens/new)  
     - Resource owner: your user/org that owns the repos.  
     - Repository access: only `**neocom-front**` and `**neocom-back**`.  
     - Permissions → Repository permissions → **Contents: Read and write** (needed to push dependency bumps on `develop`).  
     - Generate and copy the token once.
   - **Classic PAT (alternative):** [https://github.com/settings/tokens/new](https://github.com/settings/tokens/new)  
     - Enable scope `**repo**` (full control of private repositories) if the consumer repos are private.  
     - Generate and copy once.
3. On `**neocom-domain**`: GitHub → **Settings → Secrets and variables → Actions → New repository secret**
   - Name: `NEOCOM_REPO_TOKEN`  
   - Value: paste the PAT.
4. Never commit the token. Rotate it if it leaks; domain publish will fail with a clear error if the secret is missing (see `neocom-domain` README / `npm-publish.yml`).

See `/neocom-git` Versioning for domain. Front/back CI does not need `NEOCOM_REPO_TOKEN` unless a job there must push to another NEOCOM repo.

## Local Docker pull (not GitHub UI)

Github-hosted jobs cannot reach your local Docker engine. After CI pushes to GHCR:

1. On the Docker host: authenticate with `gh auth login`, or with `GHCR_PULL_TOKEN` as in §6 above.
2. `docker pull ghcr.io/AdamAntinoo/<artifactName>:<imageTag>` (names from the committed workflow / §08).
3. Run / compose as documented when the deploy script lands (EPIC-017 §11 CICD-F/B-084).

## Back CI caller (parity with front)

Committed in `neocom-back` (CICD-B-076 / B-085…089):

| Item | Value |
| --- | --- |
| Caller | `.github/workflows/build.yml` → `neocom-meta/.github/workflows/back-ci.yml@feature/cicd` |
| Node | `24.21.0` |
| Sonar key | `AdamAntinoo_neocom-back` (input `sonar-project-key`) |
| Artifact / GHCR name | `neocom-back` |
| Permissions | `contents`, `packages`, `pull-requests`, `checks`: write |
| Secret | `SONAR_TOKEN` (host secret store only) |
| Version sync | `workflow_dispatch` only (same as front) |

Github-hosted CI publishes npm to GitHub Packages and the Docker image to GHCR. Loading the image onto a local Docker engine is **not** a github-hosted job (CICD-B-084) — use §6 / Local Docker pull above.

## Verification

- [x] Sonar projects `AdamAntinoo_neocom-front` / `AdamAntinoo_neocom-back` exist; each repo has `sonar-project.properties` with org `adamantinoo`.
- [x] Caller workflows set the matching `SONAR_PROJECT_KEY` / `sonar-project-key`; a run reaches Sonar with `SONAR_TOKEN`.
- [x] Front and back thin callers commit meta `uses` `@feature/cicd` (Actions access on meta still required in UI — §2).
- [ ] Packages/GHCR publish succeeds with `packages: write` on the caller (verify after first green publish).
- [ ] No CI-required values were added under Actions → Variables (unless an exception is documented here later).

## Related

- L1: [EPIC-017 §11](../../../../sources/L1/17.EPIC-CICD.md#section-11--continuous-integration-pipeline)
- Coverage / Sonar requirements: [coverage-sonar.md](./coverage-sonar.md)
- Back gate table: `neocom-back/docs/ci-gates.md` (product repo)
- Pipeline / CD boundary: EPIC-017 §08
