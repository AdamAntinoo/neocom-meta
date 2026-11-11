# front/cicd Specification

## Purpose

EPIC-017 front CI/CD and testing set (`CICD-F-*`). Supersedes `front/bdd-cypress`, `front/mock-fixtures`, and the front application of coverage/gates/test-commands.

## ADDED Requirements

### Requirement: SDD to BDD to TDD design model

`neocom-front` SHALL follow an SDD→BDD→TDD design model: from spec, create Gherkin scenarios that SHALL be validated before the feature is considered complete (CICD-F-001).

#### Scenario: Feature blocked without Gherkin pass

- **WHEN** a feature has OpenSpec acceptance scenarios
- **THEN** those Gherkin scenarios are run and pass before the feature is considered complete

### Requirement: Cypress validates flows, contents, and UI aspects

Cypress SHALL validate navigation flows and also the **contents** of panels and items and their **UI aspects**, including colour and other visual or structural properties that the application publishes for tests through documented `cy-*` attributes (for example `cy-section-name`, `cy-field-value`, `cy-field-label`, `cy-name`, and any further catalogued Cypress properties) (CICD-F-002).

#### Scenario: Content checked via cy-* attribute

- **WHEN** a Cypress scenario covers a panel field
- **THEN** it locates the field through a documented `cy-*` attribute
- **AND** it asserts the published content or UI property

### Requirement: Gherkin asserts published properties

Gherkin scenarios that cover a page or panel SHALL assert against those published properties so content and UI validity are checked with stable selectors before the feature is considered complete (CICD-F-003).

#### Scenario: Scenario uses stable selectors

- **WHEN** a Gherkin scenario covers a page or panel
- **THEN** steps assert against published `cy-*` properties

### Requirement: Pages and panels expose cy-* properties

Pages and panels under test SHALL expose the relevant `cy-*` properties so Cypress can locate and verify them (CICD-F-004).

#### Scenario: Panel under test is addressable

- **WHEN** a page or panel is covered by acceptance tests
- **THEN** it exposes the relevant documented `cy-*` properties for Cypress

### Requirement: Configurable replaceable test adapters

The front automated suite SHALL provide mocked scenarios and configurations with predefined and stable data; adapters SHALL be configurable and replaceable on the automated testing environment (CICD-F-010).

#### Scenario: Adapter swapped for automated run

- **WHEN** an automated Gherkin suite runs
- **THEN** it can use a replaceable adapter with predefined fixture data

### Requirement: Mock data from real runs

Automated front testing SHALL use **mock data extracted from real runs**, including errors and stale/incorrect data, not only happy-path payloads (CICD-F-011).

#### Scenario: Error and stale fixtures available

- **WHEN** fixtures are prepared for automated Gherkin
- **THEN** they include error and stale/incorrect shapes observed from real runs

### Requirement: Stable fixtures reflecting edge cases

Captured fixtures SHALL be stable and predefined while still reflecting shapes and edge cases from back endpoint / production-like runs (CICD-F-012).

#### Scenario: Fixture set is stable

- **WHEN** the automated suite selects a named fixture
- **THEN** the payload shape is stable across runs

### Requirement: Gherkin selects fixtures

Gherkin scenarios SHALL be able to select those fixtures so Cypress can validate how pages and panels render each variation (CICD-F-013).

#### Scenario: Scenario picks a fixture

- **WHEN** a Gherkin scenario names a fixture
- **THEN** Cypress validates the page/panel against that fixture variation

### Requirement: Front coverage measurement tool

`neocom-front` SHALL provide a tool to measure and control code testing coverage; results available locally and in CI (CICD-F-020).

#### Scenario: Coverage available locally and in CI

- **WHEN** a developer or CI runs front unit tests with coverage
- **THEN** coverage results are produced

### Requirement: Front quality-gate rules on coverage

`neocom-front` SHALL define quality-gate rules that use coverage (and related test outcomes) to pass or fail a change; a feature SHALL NOT be complete when required gates fail (CICD-F-021).

#### Scenario: Failed gate blocks completeness

- **WHEN** a required front quality gate fails
- **THEN** the feature is not considered complete

### Requirement: Front recorded thresholds and suites

Front gate thresholds and which suites they apply to SHALL be recorded so agents and CI enforce the same rules (CICD-F-022).

#### Scenario: Thresholds documented

- **WHEN** agents or CI enforce front gates
- **THEN** they use the recorded thresholds and suite list

### Requirement: Front reports to SonarCloud

`neocom-front` SHALL report to SonarCloud for coverage, quality gates, and other quality findings (CICD-F-023).

#### Scenario: Analysis reaches SonarCloud

- **WHEN** front CI runs Sonar analysis
- **THEN** findings are available in SonarCloud

### Requirement: Front CI upload and Sonar gate completeness

Front CI SHALL upload analysis (and coverage where applicable) to SonarCloud; a change that fails the configured SonarCloud quality gate SHALL NOT be considered complete (CICD-F-024).

#### Scenario: Sonar fail blocks completeness

- **WHEN** the front SonarCloud quality gate fails
- **THEN** the change is not considered complete

### Requirement: Front unit and acceptance may run in parallel

Front CI unit-testing and acceptance-testing tasks MAY run in parallel (CICD-F-030).

#### Scenario: Parallel front jobs allowed

- **WHEN** front CI is configured
- **THEN** unit and acceptance jobs MAY run concurrently

### Requirement: Both front tests before Sonar

Both front unit testing and acceptance testing SHALL complete successfully before the SonarCloud analysis / quality-gate step (CICD-F-031).

#### Scenario: Sonar waits for front tests

- **WHEN** front unit or acceptance has not passed
- **THEN** Sonar analysis does not start

### Requirement: Front Sonar starts only after tests and artifacts

Front Sonar gate SHALL NOT start until those test tasks have passed (and their coverage artifacts are available when the analysis requires them) (CICD-F-032).

#### Scenario: Artifacts present before Sonar

- **WHEN** coverage artifacts are required for Sonar
- **THEN** they are available before Sonar starts

### Requirement: Front shared testing command catalog

`neocom-front` SHALL implement the shared catalog of short, clear testing command names (CICD-F-040).

#### Scenario: Catalog names exist on front

- **WHEN** a developer runs front testing via the catalog
- **THEN** short clear command names are available

### Requirement: Front catalog names align with back

Front catalog names and intent SHALL stay aligned with the back catalog (implementations MAY differ) (CICD-F-041).

#### Scenario: Same vocabulary

- **WHEN** agents refer to TDD/BDD/SDD commands
- **THEN** front and back share the same names and intent

### Requirement: Front TDD BDD and SDD layers

Front catalog SHALL cover TDD, BDD, and SDD (SDD later) as separate entries (CICD-F-042).

#### Scenario: Layers listed separately

- **WHEN** the front catalog is inspected
- **THEN** TDD, BDD, and SDD appear as separate entries

### Requirement: Front environment setup per entry

Each front catalog entry SHALL include the environment setup required to run that layer (CICD-F-043).

#### Scenario: Setup documented per layer

- **WHEN** a catalog entry is run
- **THEN** its required environment setup is defined

### Requirement: Front run all layers in sequence

Front SHALL provide a command that runs all testing layers in sequence (TDD, then BDD, then SDD when defined) (CICD-F-044).

#### Scenario: Run-all order

- **WHEN** the front run-all command executes
- **THEN** TDD runs before BDD, and BDD before SDD when SDD is defined

## ADDED Requirements (EPIC-017 extract 2026-11-11)

### Requirement: Mock / captured data from real runs SHALL be used only for automated testing; it SHALL …

Mock / captured data from real runs SHALL be used **only** for **automated testing**; it SHALL **never** be used as the data feed for **development user testing** (was FIX-005) (CICD-F-014; EPIC-017).

#### Scenario: CICD-F-014 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-014 holds

### Requirement: The data feed for automated Gherkin testing SHALL be obtained from back real endpoint r…

The data feed for automated Gherkin testing SHALL be obtained from **back real endpoint results** (programme API responses captured from real endpoint runs) (was FIX-006) (CICD-F-015; EPIC-017).

#### Scenario: CICD-F-015 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-015 holds

### Requirement: Captured back endpoint result data SHALL be the source that Gherkin scenarios select an…

Captured back endpoint result data SHALL be the source that Gherkin scenarios select and assert against for automated front acceptance checks (was FIX-007) (CICD-F-016; EPIC-017).

#### Scenario: CICD-F-016 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-016 holds

### Requirement: Front CI/CD is in scope: implement front deployment / promotion workflows for `dev` → `…

Front CI/CD is **in scope**: implement front deployment / promotion workflows for `dev` → `staging` → `prod` from the available L1 / OpenSpec specs, including the **versioning and image/artifact naming** contract in this section (supersedes former “remote CD out of scope” INFRA-036; naming pattern from the smartydevops reusable-workflows sample) (CICD-F-080; EPIC-017).

#### Scenario: CICD-F-080 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-080 holds

### Requirement: Front artifact publication SHALL come from the GitHub workflow to GitHub Packages / GHC…

Front artifact publication SHALL come from the **GitHub workflow** to **GitHub Packages** / **GHCR**. Package/`commitTag` on `main` SHALL be **MajorMinorPatch**; on other branches (including `develop` → staging) SHALL be the full **GitVersion** `imageTag`. Docker images SHALL be tagged with `imageTag` and pushed to `ghcr.io/{owner}/{artifactName}` as `:{imageTag}` and `:latest` (was INFRA-037; naming from sample `gitversion` + `deploy-github-image`) (CICD-F-081; EPIC-017).

#### Scenario: CICD-F-081 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-081 holds

### Requirement: Front `staging` and `prod` deployments SHALL target a Docker engine (Docker deployment …

Front `**staging**` and `**prod**` deployments SHALL target a **Docker engine** (Docker deployment for `develop` → `staging`, `main` → `prod`) (CICD-F-082; EPIC-017).

#### Scenario: CICD-F-082 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-082 holds

### Requirement: Front SemVer patch on develop merge, minor on default main merge, tag on main

Front SemVer: when a merge into `develop` completes, increment **patch**; when a merge into `main` completes on the default path, increment **minor** (reset patch); on every completed `main` merge, create an annotated git tag equal to the resulting `MajorMinorPatch` (CICD-F-130; EPIC-017).

#### Scenario: CICD-F-130 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-130 holds

### Requirement: Front named release/X.Y.Z from main; version+tag only on main merge

Front named release: create `release/X.Y.Z` **from `main`**, merge `develop` into that branch; do **not** set version to `X.Y.Z` until the release merges to `main`; on that `main` merge, set version to the branch-named `X.Y.Z` and create git tag `X.Y.Z` (CICD-F-131; EPIC-017).

#### Scenario: CICD-F-131 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-131 holds

### Requirement: Front named release merge uses branch-named version not default minor bump

Front: a named `release/X.Y.Z` → `main` merge SHALL use the branch-named version instead of the default minor bump for that merge (CICD-F-132; EPIC-017).

#### Scenario: CICD-F-132 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-132 holds

### Requirement: Front feature commit versioning equals artifact/image SemVer string

Front feature (and other non-`main`) versioning SHALL use the same SemVer-derived string as artifact / image naming for that commit (`commitTag` ≡ `imageTag` = `{majorMinorPatch}-{commits}.{channel}.{shortSha}`); on `main`, both are plain `MajorMinorPatch` (CICD-F-133; EPIC-017).

#### Scenario: CICD-F-133 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-133 holds

### Requirement: `neocom-front` SHALL provide logging through a provider API that application code uses …

`neocom-front` SHALL provide logging through a **provider API** that application code uses for all programme logs (not ad-hoc console calls) (CICD-F-110; EPIC-017).

#### Scenario: CICD-F-110 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-110 holds

### Requirement: Front logging configuration SHALL control which logs are shown by section and log level…

Front logging configuration SHALL control **which logs are shown** by **section** and **log level**, without requiring call-site code changes (CICD-F-111; EPIC-017).

#### Scenario: CICD-F-111 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-111 holds

### Requirement: Every front log call through the provider SHALL include log level, section, and message

Every front log call through the provider SHALL include **log level**, **section**, and **message** (CICD-F-112; EPIC-017).

#### Scenario: CICD-F-112 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-112 holds

### Requirement: The front logging provider SHALL emit a log only when the call’s level is allowed for t…

The front logging provider SHALL emit a log only when the call’s level is allowed for that section by the active configuration (CICD-F-113; EPIC-017).

#### Scenario: CICD-F-113 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-113 holds

### Requirement: Front logging configuration SHALL live with front local / environment configuration own…

Front logging configuration SHALL live with front local / environment configuration ownership (see [Section 13](#section-13--local-configuration)); secrets SHALL NOT be required for log-level settings (CICD-F-114; EPIC-017).

#### Scenario: CICD-F-114 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-114 holds

### Requirement: Front sections used in log calls SHALL be stable named identifiers documented for the f…

Front sections used in log calls SHALL be **stable named identifiers** documented for the front (catalog can grow; do not invent the first catalog here beyond “named sections”) (CICD-F-115; EPIC-017).

#### Scenario: CICD-F-115 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-115 holds

### Requirement: Emitted front log lines that pass the filter SHALL retain level, section, and message s…

Emitted front log lines that pass the filter SHALL retain **level**, **section**, and **message** so operators can still filter by section after emission (CICD-F-116; EPIC-017).

#### Scenario: CICD-F-116 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-116 holds

### Requirement: Front log messages MAY include placeholders; when additional parameters are supplied on…

Front log messages MAY include **placeholders**; when additional parameters are supplied on the log call, the provider SHALL replace those placeholders with the **JSON representation** of the corresponding parameters (CICD-F-117; EPIC-017).

#### Scenario: CICD-F-117 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-117 holds

### Requirement: Front programme log call levels SHALL be `DEBUG`, `INFO`, and `PRODUCTION`; section con…

Front programme log **call** levels SHALL be `**DEBUG`**,** `**INFO`, and `**PRODUCTION`**; section configuration MAY also use** `**NONE` (CICD-F-118; EPIC-017).

#### Scenario: CICD-F-118 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-118 holds

### Requirement: Front logs at level `PRODUCTION` SHALL not be filtered out even when the application ru…

Front logs at level `**PRODUCTION**` SHALL **not** be filtered out even when the application runs in a **production** environment (CICD-F-119; EPIC-017).

#### Scenario: CICD-F-119 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-119 holds

### Requirement: On a production environment, front section log levels SHALL default to `NONE`, meaning …

On a **production** environment, front section log levels SHALL **default to** `NONE`, meaning the affected section SHALL not generate logs (aside from `**PRODUCTION`**-level calls, which still emit) (CICD-F-120; EPIC-017).

#### Scenario: CICD-F-120 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-120 holds

### Requirement: When a front section’s configured level is `NONE`, that section SHALL not emit `DEBUG` …

When a front section’s configured level is `**NONE**`, that section SHALL not emit `**DEBUG**` or `**INFO**` logs (CICD-F-121; EPIC-017).

#### Scenario: CICD-F-121 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-121 holds

### Requirement: Front programme logs that pass the filter SHALL be sent to the browser console

Front programme logs that pass the filter SHALL be sent to the **browser console** (CICD-F-122; EPIC-017).

#### Scenario: CICD-F-122 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-122 holds

### Requirement: Front CI SHALL run with a documented Node version that matches `.nvmrc` and the Angular…

Front CI SHALL run with a documented Node version that matches `.nvmrc` and the Angular engines, preferring the `neocom` pin (currently 24.21.0) (was INFRA-030) (CICD-F-070; EPIC-017).

#### Scenario: CICD-F-070 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-070 holds

### Requirement: Front CI SHALL run unit tests (`npm test` / Vitest, non-watch) as part of the front CI …

Front CI SHALL run **unit tests** (`npm test` / Vitest, non-watch) as part of the front CI workflow; that workflow (and its testing) SHALL run for `feature/**`, `develop`, and `main` (push and pull request) and for **all tags** (was INFRA-031) (CICD-F-071; EPIC-017).

#### Scenario: CICD-F-071 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-071 holds

### Requirement: Front CI SHALL run lint and format checks as the first pipeline step after setup and be…

Front CI SHALL run **lint and format** checks as the **first pipeline step after setup** and **before** unit or acceptance testing, once those scripts are defined; a failed lint/format SHALL fail the pipeline (was INFRA-032) (CICD-F-072; EPIC-017).

#### Scenario: CICD-F-072 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-072 holds

### Requirement: Front CI SHALL produce a production build (`npm run build`) and SHALL fail the pipeline…

Front CI SHALL produce a production build (`npm run build`) and SHALL fail the pipeline on build errors (was INFRA-033) (CICD-F-073; EPIC-017).

#### Scenario: CICD-F-073 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-073 holds

### Requirement: Front acceptance (Cypress + Cucumber) SHALL run in CI on a defined job that starts the …

Front **acceptance** (Cypress + Cucumber) SHALL run in CI on a defined job that starts the app and WireMock or equivalent mocks; that job MAY run **in parallel** with unit tests (was INFRA-034; order with Sonar per §04) (CICD-F-074; EPIC-017).

#### Scenario: CICD-F-074 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-074 holds

### Requirement: Front-only CI SHALL NOT require a live `neocom-back` (was INFRA-035)

Front-only CI SHALL NOT require a live `neocom-back` (was INFRA-035) (CICD-F-075; EPIC-017).

#### Scenario: CICD-F-075 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-075 holds

### Requirement: Front SHALL keep a thin caller workflow in `neocom-front`; reusable composite actions a…

Front SHALL keep a **thin caller workflow** in `neocom-front`; reusable composite actions and reusable workflows that encapsulate each CI feature SHALL live in `neocom-meta` and be referenced by that caller (extends INFRA-038; proven by existing `build.yml` → meta `front-build.yml`) (CICD-F-076; EPIC-017).

#### Scenario: CICD-F-076 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-076 holds

### Requirement: Front CI/CD secrets SHALL use the host secret store and SHALL NOT be committed (was INF…

Front CI/CD secrets SHALL use the host secret store and SHALL NOT be committed (was INFRA-039) (CICD-F-077; EPIC-017).

#### Scenario: CICD-F-077 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-077 holds

### Requirement: Front CI SHALL upload analysis to the Sonar project and validate the quality gate only …

Front CI SHALL upload analysis to the Sonar project and **validate the quality gate** only after unit and acceptance jobs have passed; the Sonar project SHALL already exist; upload SHALL use front’s committed `sonar-project.properties` (organization `adamantinoo` + Sonar data) and local workflow `SONAR_PROJECT_KEY=AdamAntinoo_neocom-front` (implements §03 / §04) (CICD-F-078; EPIC-017).

#### Scenario: CICD-F-078 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-078 holds

### Requirement: After the front Sonar gate passes, front CI SHALL publish the versioned artifact to Git…

After the front Sonar gate passes, front CI SHALL **publish** the versioned artifact to **GitHub Packages** (branch/version rules per CICD-F-081) (CICD-F-079; EPIC-017).

#### Scenario: CICD-F-079 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-079 holds

### Requirement: Front CI SHALL generate a Docker deployable image configured for a Docker engine and pu…

Front CI SHALL **generate a Docker deployable image** configured for a Docker engine and push it to **GHCR** (GitHub Packages), after the Packages publish / gate sequence for that run (CICD-F-083; EPIC-017).

#### Scenario: CICD-F-083 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-083 holds

### Requirement: Loading / running the front image on the local Docker engine SHALL not run on github-ho…

Loading / running the front image on the **local Docker engine** SHALL **not** run on github-hosted runners; it SHALL use a **post-CI local pull/deploy script** or a **self-hosted runner** deploy job that pulls from GHCR (CICD-F-084; EPIC-017).

#### Scenario: CICD-F-084 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-084 holds

### Requirement: `neocom-front` GitHub Actions SHALL be configured with secret `SONAR_TOKEN` and SHALL u…

`neocom-front` GitHub Actions SHALL be configured with secret `SONAR_TOKEN` and SHALL use built-in `GITHUB_TOKEN` with `packages: write` (and `contents` as required) for Packages/GHCR; optional `NPM_TOKEN` / `GHCR_PULL_TOKEN` only when the cases in the secrets table apply (CICD-F-085; EPIC-017).

#### Scenario: CICD-F-085 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-085 holds

### Requirement: Front non-secret CI config SHALL be committed: Node / `.nvmrc`, meta `uses` `@ref`, GHC…

Front non-secret CI config SHALL be committed: Node / `.nvmrc`, meta `uses` `@ref`, GHCR `artifactName`, and local workflow `SONAR_PROJECT_KEY=AdamAntinoo_neocom-front`; front `sonar-project.properties` SHALL set organization `adamantinoo` plus other Sonar data — **not** GitHub Actions repository variables (programme default: none) (CICD-F-086; EPIC-017).

#### Scenario: CICD-F-086 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-086 holds

### Requirement: Front CI callers SHALL declare the workflow `permissions` required for the stages they …

Front CI callers SHALL declare the workflow `permissions` required for the stages they run (`contents`, `packages: write`, and PR/check write only when Sonar PR decoration is enabled) and SHALL NOT rely on a called meta workflow to elevate `GITHUB_TOKEN` (CICD-F-087; EPIC-017).

#### Scenario: CICD-F-087 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-087 holds

### Requirement: `neocom-meta` Actions access SHALL allow `neocom-front` (and `neocom-back`) to use its …

`neocom-meta` Actions access SHALL allow `neocom-front` (and `neocom-back`) to use its reusable workflows and composite actions; Packages permissions SHALL allow the publishing identity and the local-pull identity to read/write the front image/package as required (CICD-F-088; EPIC-017).

#### Scenario: CICD-F-088 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-088 holds

### Requirement: `neocom-meta` SHALL maintain developer documentation for the manual GitHub repo configu…

`neocom-meta` SHALL maintain developer documentation for the **manual** GitHub repo configuration checklist (secrets + Actions/Packages access settings), stating that non-secret values are edited in committed workflows / Sonar files; the doc SHALL be enough for a developer to complete front CI setup without Actions Variables UI (CICD-F-089; EPIC-017).

#### Scenario: CICD-F-089 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-089 holds

### Requirement: A script SHALL perform initial installation from scratch. Its first check SHALL run `nv…

A script SHALL perform initial installation from scratch. Its first check SHALL run `nvm list` and verify that an nvm alias named `neocom` points at Node **24.21.0** — that alias is the shared environment for all NEOCOM projects and is expected to already be configured in the developer’s shell init script; if the check fails, the script SHALL instruct the developer to configure the shell and nvm properly so `neocom` → 24.21.0 conforms before continuing (CICD-F-092; EPIC-017).

#### Scenario: CICD-F-092 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-092 holds

### Requirement: After the nvm check, the install script SHALL clone every active repository listed in `…

After the nvm check, the install script SHALL clone every **active** repository listed in `neocom-meta` `[PROGRAMME.md` §1 Active projects](../../PROGRAMME.md#1-active-projects) (including `**neocom-domain`**), using each row’s Clone URL, as sibling directories; it SHALL NOT clone aside or deprecated repositories unless explicitly requested (CICD-F-093; EPIC-017).

#### Scenario: CICD-F-093 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-093 holds

### Requirement: After the repositories are cloned, the install script SHALL run `npm install` in `neoco…

After the repositories are cloned, the install script SHALL run `npm install` in `**neocom-domain**`, `**neocom-back**`, and `**neocom-front**`, each with `nvm use neocom` active (all code repos from `PROGRAMME.md` §1; was INFRA-013) (CICD-F-094; EPIC-017).

#### Scenario: CICD-F-094 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-094 holds

### Requirement: WireMock SHALL be available for local front automated testing (not for development; dev…

WireMock SHALL be available for local front **automated testing** (not for development; development uses real `neocom-back`) (was INFRA-014 / former CICD-F-094) (CICD-F-095; EPIC-017).

#### Scenario: CICD-F-095 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-095 holds

### Requirement: After `npm install` in each active repository, the install script SHALL install Graphif…

After `npm install` in each active repository, the install script SHALL **install Graphify into that repository** (`neocom-meta`, `neocom-domain`, `neocom-back`, `neocom-front`, and any later active repo) so each project has its own Graphify tooling (replaces former INFRA-016 “document separately / do not block” wording) (CICD-F-097; EPIC-017).

#### Scenario: CICD-F-097 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-097 holds

### Requirement: After OpenSpec actions that change code finish for a target project, that project’s Gra…

After **OpenSpec actions** that change code finish for a **target project**, that project’s Graphify index SHALL be **updated** in that repository (for example: when all OpenSpec code operations for front are finished, update Graphify in `neocom-front`; same rule for `neocom-back`, `neocom-domain`, and `neocom-meta` when they are the target) (CICD-F-098; EPIC-017).

#### Scenario: CICD-F-098 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-098 holds

### Requirement: WireMock port, mappings directory, and the start command SHALL be pinned in `neocom-fro…

WireMock port, mappings directory, and the start command SHALL be pinned in `neocom-front` once stubs exist, for **automated testing** only (was INFRA-021) (CICD-F-101; EPIC-017).

#### Scenario: CICD-F-101 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-101 holds

### Requirement: Front service ports SHALL differ by named environment: `dev` (`start:dev`, local manual…

Front service ports SHALL differ by named environment: `**dev**` (`start:dev`, local manual testing) in `**600x**`, `**staging**` (Docker for `develop`) in `**601x**`, `**prod**` (Docker for `main` / production) in `**602x**`, and **testing** ports for the different front services in `**609x`** (replaces former INFRA-022 / Angular CLI default `4200`) (CICD-F-102; EPIC-017).

#### Scenario: CICD-F-102 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-102 holds

### Requirement: Environment names and config files SHALL use the consistent names `dev`, `staging`, and…

Environment names and config files SHALL use the consistent names `**dev**`, `**staging**`, and `**prod**` (`dev` = local `start:dev` manual testing; `staging` = Docker from `develop`; `prod` = Docker from `main`); files SHALL be owned by the relevant repository and secrets SHALL NOT be committed (was INFRA-023) (CICD-F-103; EPIC-017).

#### Scenario: CICD-F-103 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-103 holds

### Requirement: On hosts where `sass-embedded` cannot run, front scripts MAY set `NG_BUILD_SASS_EMBEDDE…

On hosts where `sass-embedded` cannot run, front scripts MAY set `NG_BUILD_SASS_EMBEDDED=0` so builds use pure-JS Sass (was INFRA-025) (CICD-F-105; EPIC-017).

#### Scenario: CICD-F-105 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-105 holds

### Requirement: Programme architecture docs SHALL stay under `neocom-meta` programme definition and sta…

Programme architecture docs SHALL stay under `neocom-meta` programme definition and stay aligned with the L1 / OpenSpec registers (was INFRA-026; L2 removed) (CICD-F-106; EPIC-017).

#### Scenario: CICD-F-106 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-106 holds

### Requirement: `neocom-front` SHALL support a watch run mode that compiles on the fly; that mode SHALL…

`neocom-front` SHALL support a **watch** run mode that compiles on the fly; that mode SHALL be the one used for local development and testing (CICD-F-107; EPIC-017).

#### Scenario: CICD-F-107 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-107 holds

### Requirement: `neocom-front` SHALL support a server run mode that starts the application with `server…

`neocom-front` SHALL support a **server** run mode that starts the application with `server.js` at the repository root; that mode SHALL also be the run mode used for deployment running (CICD-F-108; EPIC-017).

#### Scenario: CICD-F-108 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-108 holds

## ADDED Requirements (EPIC-017 extract 2026-11-11b)

### Requirement: The testing process SHALL review all front domain NeoCom node classes for unit-test cov…

The testing process SHALL **review** all front domain NeoCom node classes for unit-test coverage and record gaps (was DNODE-001) (CICD-F-050; EPIC-017).

#### Scenario: CICD-F-050 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-050 holds

### Requirement: For each domain node lacking adequate unit tests, the process SHALL create Vitest unit …

For each domain node lacking adequate unit tests, the process SHALL **create** Vitest unit tests covering construction/mapping, `jsonClass`, and the accessors / behaviours that renders and panels rely on (was DNODE-002) (CICD-F-051; EPIC-017).

#### Scenario: CICD-F-051 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-051 holds

### Requirement: New domain NeoCom nodes SHALL include unit tests in the same delivery as the node class…

New domain NeoCom nodes SHALL include unit tests in the same delivery as the node class (TDD); domain nodes without a defined unit suite are incomplete (was DNODE-003) (CICD-F-052; EPIC-017).

#### Scenario: CICD-F-052 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-052 holds

### Requirement: Domain-node unit tests SHALL live with the domain module (co-located `*.spec.ts` or an …

Domain-node unit tests SHALL live with the domain module (co-located `*.spec.ts` or an agreed domain test folder) and run in the standard front unit-test CI job (was DNODE-004) (CICD-F-053; EPIC-017).

#### Scenario: CICD-F-053 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-053 holds

### Requirement: Front programme logs from the Angular provider SHALL not be required to appear in the n…

Front programme logs from the Angular provider SHALL **not** be required to appear in the **npm /** `ng serve` **/ watch terminal**; that terminal is the Node/CLI process. Bridging programme logs into that terminal is **out of scope** until explicitly specified (CICD-F-124; EPIC-017).

#### Scenario: CICD-F-124 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-124 holds

### Requirement: `neocom-front` SHALL maintain a catalog of Gherkin/Cypress steps used by front acceptan…

`neocom-front` SHALL maintain a **catalog of Gherkin/Cypress steps** used by front acceptance feature files; scenarios SHALL reuse catalog steps rather than defining ad-hoc one-off steps per feature (was STEP-FRONT-001) (CICD-F-060; EPIC-017).

#### Scenario: CICD-F-060 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-060 holds

### Requirement: The front step catalog SHALL stay small; variation SHALL be achieved by parametrization…

The front step catalog SHALL stay **small**; variation SHALL be achieved by **parametrization** of existing steps (was STEP-FRONT-002). Step **types** SHALL follow the front step-family table in this section (pattern from `Printer3D-frontend/cypress`) (CICD-F-061; EPIC-017).

#### Scenario: CICD-F-061 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-061 holds

### Requirement: Front catalog SHALL include parametrized steps for application bootstrap, feature/dock …

Front catalog SHALL include parametrized steps for **application bootstrap**, **feature/dock navigation**, **page activation**, **page panel/section counts**, and **dialog open/close** (CICD-F-062; EPIC-017).

#### Scenario: CICD-F-062 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-062 holds

### Requirement: Front catalog SHALL include parametrized steps for target selection (panel type, item b…

Front catalog SHALL include parametrized steps for **target selection** (panel type, item by id, nested named field) that set reusable Cypress aliases (`@target-page`, `@target-panel`, `@target`, and dialog/feature aliases as needed) (CICD-F-063; EPIC-017).

#### Scenario: CICD-F-063 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-063 holds

### Requirement: Front catalog SHALL include parametrized steps for field label/value assertions, button…

Front catalog SHALL include parametrized steps for **field label/value assertions**, **buttons and actionable images** (click, enabled/disabled, present/missing), **selection/variant**, **child counts**, **loading**, and **form fill** against `cy-*` locators (CICD-F-064; EPIC-017).

#### Scenario: CICD-F-064 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-064 holds

### Requirement: Front acceptance SHALL use a symbolic-name → selector translation (page/panel/render/di…

Front acceptance SHALL use a **symbolic-name → selector translation** (page/panel/render/dialog) so scenarios name logical types and the support layer resolves component tags / `cy-*` (Printer3D `SupportService.translateTag` pattern) (CICD-F-065; EPIC-017).

#### Scenario: CICD-F-065 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-065 holds

### Requirement: Pages, sections, panels, and renders under acceptance test SHALL publish the required `…

Pages, sections, panels, and renders under acceptance test SHALL publish the required `cy-*` attributes listed in this section (`cy-name`, `cy-field-label`, `cy-field-value`, `cy-section-name`, and optional `cy-field-mark` / `cy-input-type` / `cy-focus` / `cy-dialog` where applicable) (CICD-F-066; EPIC-017).

#### Scenario: CICD-F-066 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-066 holds

### Requirement: Front Gherkin scenarios SHALL assert page/panel/render content and UI through those `cy…

Front Gherkin scenarios SHALL assert page/panel/render **content and UI** through those `cy-*` attributes (aligns with CICD-F-002…004); scenarios SHALL NOT depend on brittle unstructured CSS class chains as the primary locator (CICD-F-067; EPIC-017).

#### Scenario: CICD-F-067 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-F-067 holds

