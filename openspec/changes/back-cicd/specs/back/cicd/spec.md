# back/cicd Specification

## Purpose

EPIC-017 back CI/CD and testing set (`CICD-B-*`). Supersedes `back/testing` and the back application of coverage/gates/test-commands.

## ADDED Requirements

### Requirement: Same testing guidelines as front

`neocom-back` SHALL follow the same testing guidelines as the front (SDD→BDD→TDD, coverage and quality gates, SonarCloud, shared command catalog intent, automated mock fixtures from real runs where applicable) (CICD-B-001).

#### Scenario: Back mirrors front guidelines

- **WHEN** a back feature is delivered
- **THEN** it is subject to the same SDD→BDD→TDD and gate intent as front

### Requirement: WireMock for stable upstream data

Backend acceptance and integration scenarios that need **stable, predefined data** SHALL use **mocked sources**, with **WireMock** (or an equivalent HTTP mock) replacing upstream dependencies for those scenarios (CICD-B-002).

#### Scenario: Upstream replaced by WireMock

- **WHEN** a back acceptance scenario needs stable upstream data
- **THEN** WireMock (or equivalent) replaces that upstream

### Requirement: Universe ESI may use real feeds

**Universe ESI** reference data MAY use **real ESI feeds** when that is acceptable for the scenario (CICD-B-003).

#### Scenario: Real ESI for universe when allowed

- **WHEN** a scenario opts into real Universe ESI
- **THEN** real feeds MAY be used

### Requirement: Case-by-case mock vs live recorded

Every other external source SHALL be decided **case by case** (mock vs live), and the choice SHALL be recorded for that scenario (CICD-B-004).

#### Scenario: Choice recorded

- **WHEN** a scenario uses an external source that is not Universe ESI under CICD-B-003
- **THEN** mock vs live is recorded for that scenario

### Requirement: Backend Gherkin BDD acceptance

Backend BDD acceptance tests SHALL use **Gherkin** with **Cucumber** (or another BDD runner that consumes the same Gherkin scenarios) so acceptance behaviour is expressed the same way as Cypress-driven front acceptance (CICD-B-005).

#### Scenario: Backend acceptance in Gherkin

- **WHEN** a back acceptance behaviour is specified
- **THEN** it is expressed as a Gherkin scenario

### Requirement: Back coverage measurement tool

`neocom-back` SHALL provide a tool to measure and control code testing coverage; results available locally and in CI (CICD-B-020).

#### Scenario: Coverage available locally and in CI

- **WHEN** a developer or CI runs back unit tests with coverage
- **THEN** coverage results are produced

### Requirement: Back quality-gate rules on coverage

`neocom-back` SHALL define quality-gate rules that use coverage (and related test outcomes) to pass or fail a change; a feature SHALL NOT be complete when required gates fail (CICD-B-021).

#### Scenario: Failed gate blocks completeness

- **WHEN** a required back quality gate fails
- **THEN** the feature is not considered complete

### Requirement: Back recorded thresholds and suites

Back gate thresholds and which suites they apply to SHALL be recorded so agents and CI enforce the same rules (CICD-B-022).

#### Scenario: Thresholds documented

- **WHEN** agents or CI enforce back gates
- **THEN** they use the recorded thresholds and suite list

### Requirement: Back reports to SonarCloud

`neocom-back` SHALL report to SonarCloud for coverage, quality gates, and other quality findings (CICD-B-023).

#### Scenario: Analysis reaches SonarCloud

- **WHEN** back CI runs Sonar analysis
- **THEN** findings are available in SonarCloud

### Requirement: Back CI upload and Sonar gate completeness

Back CI SHALL upload analysis (and coverage where applicable) to SonarCloud; a change that fails the configured SonarCloud quality gate SHALL NOT be considered complete (CICD-B-024).

#### Scenario: Sonar fail blocks completeness

- **WHEN** the back SonarCloud quality gate fails
- **THEN** the change is not considered complete

### Requirement: Back unit and acceptance may run in parallel

Back CI unit-testing and acceptance-testing tasks MAY run in parallel (CICD-B-030).

#### Scenario: Parallel back jobs allowed

- **WHEN** back CI is configured
- **THEN** unit and acceptance jobs MAY run concurrently

### Requirement: Both back tests before Sonar

Both back unit testing and acceptance testing SHALL complete successfully before the SonarCloud analysis / quality-gate step (CICD-B-031).

#### Scenario: Sonar waits for back tests

- **WHEN** back unit or acceptance has not passed
- **THEN** Sonar analysis does not start

### Requirement: Back Sonar starts only after tests and artifacts

Back Sonar gate SHALL NOT start until those test tasks have passed (and their coverage artifacts are available when the analysis requires them) (CICD-B-032).

#### Scenario: Artifacts present before Sonar

- **WHEN** coverage artifacts are required for Sonar
- **THEN** they are available before Sonar starts

### Requirement: Back shared testing command catalog

`neocom-back` SHALL implement the shared catalog of short, clear testing command names (CICD-B-040).

#### Scenario: Catalog names exist on back

- **WHEN** a developer runs back testing via the catalog
- **THEN** short clear command names are available

### Requirement: Back catalog names align with front

Back catalog names and intent SHALL stay aligned with the front catalog (implementations MAY differ) (CICD-B-041).

#### Scenario: Same vocabulary

- **WHEN** agents refer to TDD/BDD/SDD commands
- **THEN** front and back share the same names and intent

### Requirement: Back TDD BDD and SDD layers

Back catalog SHALL cover TDD, BDD, and SDD (SDD later) as separate entries (CICD-B-042).

#### Scenario: Layers listed separately

- **WHEN** the back catalog is inspected
- **THEN** TDD, BDD, and SDD appear as separate entries

### Requirement: Back environment setup per entry

Each back catalog entry SHALL include the environment setup required to run that layer (CICD-B-043).

#### Scenario: Setup documented per layer

- **WHEN** a catalog entry is run
- **THEN** its required environment setup is defined

### Requirement: Back run all layers in sequence

Back SHALL provide a command that runs all testing layers in sequence (TDD, then BDD, then SDD when defined) (CICD-B-044).

#### Scenario: Run-all order

- **WHEN** the back run-all command executes
- **THEN** TDD runs before BDD, and BDD before SDD when SDD is defined

## ADDED Requirements (EPIC-017 extract 2026-11-11)

### Requirement: Back CI/CD is in scope: implement back deployment / promotion workflows for `dev` → `st…

Back CI/CD is **in scope**: implement back deployment / promotion workflows for `dev` → `staging` → `prod` from the available L1 / OpenSpec specs, including the **versioning and image/artifact naming** contract in this section (GitVersion → `imageTag` / `commitTag` / GHCR `ghcr.io/{owner}/{artifactName}:{imageTag}` + `:latest`; pattern extracted from `smartydevops-reusable-workflows-cecabank-pagos/.github`) (CICD-B-080; EPIC-017).

#### Scenario: CICD-B-080 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-080 holds

### Requirement: Back artifact publication SHALL come from the GitHub workflow to GitHub Packages / GHCR…

Back artifact publication SHALL come from the **GitHub workflow** to **GitHub Packages** / **GHCR**. Package/`commitTag` on `main` SHALL be **MajorMinorPatch**; on other branches (including `develop` → staging) SHALL be the full **GitVersion** `imageTag`. Docker images SHALL be tagged with `imageTag` and pushed to `ghcr.io/{owner}/{artifactName}` as `:{imageTag}` and `:latest` (was INFRA-037; naming from sample `gitversion` + `deploy-github-image`) (CICD-B-081; EPIC-017).

#### Scenario: CICD-B-081 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-081 holds

### Requirement: Back `staging` and `prod` deployments SHALL target a Docker engine (Docker deployment f…

Back `**staging**` and `**prod**` deployments SHALL target a **Docker engine** (Docker deployment for `develop` → `staging`, `main` → `prod`) (CICD-B-082; EPIC-017).

#### Scenario: CICD-B-082 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-082 holds

### Requirement: `neocom-back` SHALL provide logging that application / adapter / domain code uses for p…

`neocom-back` SHALL provide logging that application / adapter / domain code uses for programme logs under a shared logging API (CICD-B-110; EPIC-017).

#### Scenario: CICD-B-110 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-110 holds

### Requirement: Back logging SHALL be driven by a configuration file that sets the log level for differ…

Back logging SHALL be driven by a **configuration file** that sets the **log level** for different **sections** of the application (CICD-B-111; EPIC-017).

#### Scenario: CICD-B-111 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-111 holds

### Requirement: Every back log call SHALL include log level, section, and message

Every back log call SHALL include **log level**, **section**, and **message** (CICD-B-113; EPIC-017).

#### Scenario: CICD-B-113 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-113 holds

### Requirement: The back logger SHALL emit a log only when the call’s level is allowed for that section…

The back logger SHALL emit a log only when the call’s level is allowed for that section by the active configuration (CICD-B-114; EPIC-017).

#### Scenario: CICD-B-114 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-114 holds

### Requirement: Back logging configuration file ownership SHALL stay in `neocom-back`; secrets SHALL NO…

Back logging configuration file ownership SHALL stay in `neocom-back`; secrets SHALL NOT be required for log-level settings (CICD-B-115; EPIC-017).

#### Scenario: CICD-B-115 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-115 holds

### Requirement: Back sections used in log calls SHALL be stable named identifiers documented for the back

Back sections used in log calls SHALL be **stable named identifiers** documented for the back (CICD-B-116; EPIC-017).

#### Scenario: CICD-B-116 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-116 holds

### Requirement: Emitted back log lines that pass the filter SHALL retain level, section, and message so…

Emitted back log lines that pass the filter SHALL retain **level**, **section**, and **message** so operators can still filter by section after emission (CICD-B-117; EPIC-017).

#### Scenario: CICD-B-117 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-117 holds

### Requirement: Back log messages MAY include placeholders; when additional parameters are supplied on …

Back log messages MAY include **placeholders**; when additional parameters are supplied on the log call, the logger SHALL replace those placeholders with the **JSON representation** of the corresponding parameters (CICD-B-118; EPIC-017).

#### Scenario: CICD-B-118 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-118 holds

### Requirement: Back programme log call levels SHALL be `DEBUG`, `INFO`, and `PRODUCTION`; section conf…

Back programme log **call** levels SHALL be `**DEBUG`**,** `**INFO`, and `**PRODUCTION`**; section configuration MAY also use** `**NONE` (CICD-B-119; EPIC-017).

#### Scenario: CICD-B-119 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-119 holds

### Requirement: Back logs at level `PRODUCTION` SHALL not be filtered out even when the application run…

Back logs at level `**PRODUCTION**` SHALL **not** be filtered out even when the application runs in a **production** environment (CICD-B-120; EPIC-017).

#### Scenario: CICD-B-120 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-120 holds

### Requirement: On a production environment, back section log levels SHALL default to `NONE`, meaning t…

On a **production** environment, back section log levels SHALL **default to** `NONE`, meaning the affected section SHALL not generate logs (aside from `**PRODUCTION`**-level calls, which still emit) (CICD-B-121; EPIC-017).

#### Scenario: CICD-B-121 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-121 holds

### Requirement: When a back section’s configured level is `NONE`, that section SHALL not emit `DEBUG` o…

When a back section’s configured level is `**NONE**`, that section SHALL not emit `**DEBUG**` or `**INFO**` logs (CICD-B-122; EPIC-017).

#### Scenario: CICD-B-122 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-122 holds

### Requirement: Emitted back log lines SHALL be properly formatted in a Spring Boot–like style, includi…

Emitted back log lines SHALL be **properly formatted** in a Spring Boot–like style, including at least **timestamp**, **log level**, **section**, **message**, and **trace-id** (CICD-B-123; EPIC-017).

#### Scenario: CICD-B-123 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-123 holds

### Requirement: Every inbound HTTP request to `neocom-back` SHALL create a new `trace-id` that represen…

Every inbound HTTP request to `neocom-back` SHALL create a new `**trace-id**` that represents that request for logging and traceability (CICD-B-124; EPIC-017).

#### Scenario: CICD-B-124 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-124 holds

### Requirement: Back log lines produced while handling a request SHALL include that request’s `trace-id`

Back log lines produced while handling a request SHALL include that request’s `**trace-id**` (CICD-B-125; EPIC-017).

#### Scenario: CICD-B-125 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-125 holds

### Requirement: The request `trace-id` SHALL be stored in a request-scoped context (Nest/Node equivalen…

The request `**trace-id**` SHALL be stored in a **request-scoped context** (Nest/Node equivalent of Spring **MDC**) so it is accessible to **all processes** that run for that request without each call site passing the id manually (CICD-B-126; EPIC-017).

#### Scenario: CICD-B-126 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-126 holds

### Requirement: The back request-scoped context SHALL use Node `AsyncLocalStorage` (directly or via a N…

The back request-scoped context SHALL use Node `**AsyncLocalStorage**` (directly or via a Nest CLS wrapper such as `nestjs-cls` or equivalent) entered at request start and available across inbound → application → domain → outbound for that request (CICD-B-127; EPIC-017).

#### Scenario: CICD-B-127 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-127 holds

### Requirement: Back CI SHALL run with a documented Node version that matches `.nvmrc`, preferring the …

Back CI SHALL run with a documented Node version that matches `.nvmrc`, preferring the `neocom` pin (currently 24.21.0) (was INFRA-030) (CICD-B-070; EPIC-017).

#### Scenario: CICD-B-070 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-070 holds

### Requirement: Back CI SHALL run unit tests (project unit runner, non-watch) as part of the back CI wo…

Back CI SHALL run **unit tests** (project unit runner, non-watch) as part of the back CI workflow; that workflow (and its testing) SHALL run for `feature/**`, `develop`, and `main` (push and pull request) and for **all tags** (CICD-B-071; EPIC-017).

#### Scenario: CICD-B-071 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-071 holds

### Requirement: Back CI SHALL run lint and format checks as the first pipeline step after setup and bef…

Back CI SHALL run **lint and format** checks as the **first pipeline step after setup** and **before** unit or acceptance testing, once those scripts are defined; a failed lint/format SHALL fail the pipeline (was INFRA-032) (CICD-B-072; EPIC-017).

#### Scenario: CICD-B-072 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-072 holds

### Requirement: Back CI SHALL produce a production build and SHALL fail the pipeline on build errors

Back CI SHALL produce a production build and SHALL fail the pipeline on build errors (CICD-B-073; EPIC-017).

#### Scenario: CICD-B-073 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-073 holds

### Requirement: Back acceptance (Gherkin / Cucumber, including OpenAPI scenarios) SHALL run in CI on a …

Back **acceptance** (Gherkin / Cucumber, including OpenAPI scenarios) SHALL run in CI on a defined job; that job MAY run **in parallel** with unit tests (order with Sonar per §04) (CICD-B-074; EPIC-017).

#### Scenario: CICD-B-074 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-074 holds

### Requirement: Back SHALL keep a thin caller workflow in `neocom-back`; reusable composite actions and…

Back SHALL keep a **thin caller workflow** in `neocom-back`; reusable composite actions and reusable workflows that encapsulate each CI feature SHALL live in `neocom-meta` and be referenced by that caller (extends INFRA-038) (CICD-B-076; EPIC-017).

#### Scenario: CICD-B-076 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-076 holds

### Requirement: Back CI/CD secrets SHALL use the host secret store and SHALL NOT be committed (was INFR…

Back CI/CD secrets SHALL use the host secret store and SHALL NOT be committed (was INFRA-039) (CICD-B-077; EPIC-017).

#### Scenario: CICD-B-077 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-077 holds

### Requirement: Back CI SHALL upload analysis to the Sonar project and validate the quality gate only a…

Back CI SHALL upload analysis to the Sonar project and **validate the quality gate** only after unit and acceptance jobs have passed; the Sonar project SHALL already exist; upload SHALL use back’s committed `sonar-project.properties` (organization `adamantinoo` + Sonar data) and local workflow `SONAR_PROJECT_KEY=AdamAntinoo_neocom-back` (implements §03 / §04) (CICD-B-078; EPIC-017).

#### Scenario: CICD-B-078 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-078 holds

### Requirement: After the back Sonar gate passes, back CI SHALL publish the versioned artifact to GitHu…

After the back Sonar gate passes, back CI SHALL **publish** the versioned artifact to **GitHub Packages** (branch/version rules per CICD-B-081) (CICD-B-079; EPIC-017).

#### Scenario: CICD-B-079 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-079 holds

### Requirement: Back CI SHALL generate a Docker deployable image configured for a Docker engine and pus…

Back CI SHALL **generate a Docker deployable image** configured for a Docker engine and push it to **GHCR** (GitHub Packages), after the Packages publish / gate sequence for that run (CICD-B-083; EPIC-017).

#### Scenario: CICD-B-083 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-083 holds

### Requirement: Loading / running the back image on the local Docker engine SHALL not run on github-hos…

Loading / running the back image on the **local Docker engine** SHALL **not** run on github-hosted runners; it SHALL use a **post-CI local pull/deploy script** or a **self-hosted runner** deploy job that pulls from GHCR (CICD-B-084; EPIC-017).

#### Scenario: CICD-B-084 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-084 holds

### Requirement: `neocom-back` GitHub Actions SHALL be configured with secret `SONAR_TOKEN` and SHALL us…

`neocom-back` GitHub Actions SHALL be configured with secret `SONAR_TOKEN` and SHALL use built-in `GITHUB_TOKEN` with `packages: write` (and `contents` as required) for Packages/GHCR; optional `NPM_TOKEN` / `GHCR_PULL_TOKEN` only when the cases in the secrets table apply (CICD-B-085; EPIC-017).

#### Scenario: CICD-B-085 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-085 holds

### Requirement: Back non-secret CI config SHALL be committed: Node / `.nvmrc`, meta `uses` `@ref`, GHCR…

Back non-secret CI config SHALL be committed: Node / `.nvmrc`, meta `uses` `@ref`, GHCR `artifactName`, and local workflow `SONAR_PROJECT_KEY=AdamAntinoo_neocom-back`; back `sonar-project.properties` SHALL set organization `adamantinoo` plus other Sonar data — **not** GitHub Actions repository variables (programme default: none) (CICD-B-086; EPIC-017).

#### Scenario: CICD-B-086 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-086 holds

### Requirement: Back CI callers SHALL declare the workflow `permissions` required for the stages they r…

Back CI callers SHALL declare the workflow `permissions` required for the stages they run (`contents`, `packages: write`, and PR/check write only when Sonar PR decoration is enabled) and SHALL NOT rely on a called meta workflow to elevate `GITHUB_TOKEN` (CICD-B-087; EPIC-017).

#### Scenario: CICD-B-087 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-087 holds

### Requirement: `neocom-meta` Actions access SHALL allow `neocom-back` (and `neocom-front`) to use its …

`neocom-meta` Actions access SHALL allow `neocom-back` (and `neocom-front`) to use its reusable workflows and composite actions; Packages permissions SHALL allow the publishing identity and the local-pull identity to read/write the back image/package as required (CICD-B-088; EPIC-017).

#### Scenario: CICD-B-088 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-088 holds

### Requirement: The same developer documentation SHALL cover back CI manual GitHub setup (secrets + Act…

The same developer documentation SHALL cover **back** CI manual GitHub setup (secrets + Actions/Packages access), with non-secret values in committed `neocom-back` workflows / Sonar files (CICD-B-089; EPIC-017).

#### Scenario: CICD-B-089 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-089 holds

## ADDED Requirements (EPIC-017 extract 2026-11-11b)

### Requirement: `neocom-back` SHALL provide Gherkin feature files that validate behaviour against the p…

`neocom-back` SHALL provide Gherkin **feature files** that validate behaviour against the published **OpenAPI** specifications for the endpoints under test (was BTEST-006) (CICD-B-006; EPIC-017).

#### Scenario: CICD-B-006 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-006 holds

### Requirement: OpenAPI Gherkin scenarios SHALL prefer defining test data on the scenario (Examples / D…

OpenAPI Gherkin scenarios SHALL **prefer defining test data on the scenario** (Examples / Doc Strings / bound steps), including data the scenario **loads into caches**, so each check is tied to **specific requests** and all cases under test stay visible in the feature file (was BTEST-007) (CICD-B-007; EPIC-017).

#### Scenario: CICD-B-007 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-007 holds

### Requirement: When an ESI API mock (WireMock or equivalent) supplies OpenAPI scenario data instead of…

When an **ESI API mock** (WireMock or equivalent) supplies OpenAPI scenario data instead of (or in addition to) scenario-inline data, stub responses SHALL be **tied to the scenario** by **additional request headers** that select the correct response for each case; do not rely on opaque WireMock mappings that hide the data from developers reading the scenario (CICD-B-008; EPIC-017).

#### Scenario: CICD-B-008 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-008 holds

### Requirement: OpenAPI Gherkin scenarios MAY use real ESI API results for a pilot whose data is valid,…

OpenAPI Gherkin scenarios MAY use **real ESI API** results for a **pilot** whose data is **valid, traceable, and considered static** for the test; that choice SHALL be recorded on the scenario (CICD-B-009; EPIC-017).

#### Scenario: CICD-B-009 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-009 holds

### Requirement: When OpenAPI specs and the corresponding endpoint implementations are committed via `/g…

When OpenAPI specs and the corresponding endpoint implementations are committed via `**/git:commit**`, `neocom-back` SHALL **generate sample outputs** for those endpoints to be used in automated testing (CICD-B-010; EPIC-017).

#### Scenario: CICD-B-010 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-010 holds

### Requirement: `neocom-back` SHALL maintain a catalog of test mock data that is always ready and is th…

`neocom-back` SHALL maintain a **catalog of test mock data** that is **always ready** and is the **source of truth** for automated Gherkin / fixture selection (front and back) (CICD-B-011; EPIC-017).

#### Scenario: CICD-B-011 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-011 holds

### Requirement: Sample outputs produced on those `/git:commit` deliveries SHALL be added or updated in …

Sample outputs produced on those `/git:commit` deliveries SHALL be **added or updated** in the mock catalog so the catalog stays current with committed OpenAPI + endpoint behaviour (CICD-B-012; EPIC-017).

#### Scenario: CICD-B-012 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-012 holds

### Requirement: For testing purposes, back mock data of each type SHALL be reducible to 2 samples; rema…

For testing purposes, back mock data of each type SHALL be **reducible to 2 samples**; remaining samples of that type SHALL be **removed** from the trimmed set (CICD-B-013; EPIC-017).

#### Scenario: CICD-B-013 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-013 holds

### Requirement: The trimmed mock data SHALL be stored along with the original full mock data in the cat…

The **trimmed** mock data SHALL be **stored along with the original** full mock data in the catalog (both retained) (CICD-B-014; EPIC-017).

#### Scenario: CICD-B-014 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-014 holds

### Requirement: Automated tests / Gherkin scenarios SHALL be able to select whether to use the original…

Automated tests / Gherkin scenarios SHALL be able to **select** whether to use the **original** or the **trimmed** catalog set for a run (CICD-B-015; EPIC-017).

#### Scenario: CICD-B-015 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-015 holds

### Requirement: When defining test data inside the scenario would be complex, the scenario SHALL use st…

When defining test data **inside the scenario** would be **complex**, the scenario SHALL **use stored mock data** from the catalog (original or trimmed) instead of inlining that full definition, so the testing process stays simpler (CICD-B-016; EPIC-017).

#### Scenario: CICD-B-016 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-016 holds

### Requirement: A scenario that uses stored mocks under CICD-B-016 SHALL still name which catalog entry…

A scenario that uses stored mocks under CICD-B-016 SHALL still **name** which catalog entry and whether **original** or **trimmed** applies (via CICD-B-015), so the binding remains visible on the scenario (CICD-B-017; EPIC-017).

#### Scenario: CICD-B-017 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-017 holds

### Requirement: `neocom-back` SHALL maintain a separate catalog of Gherkin steps used by back acceptanc…

`neocom-back` SHALL maintain a **separate catalog of Gherkin steps** used by back acceptance feature files (including OpenAPI scenarios); scenarios SHALL reuse catalog steps rather than defining ad-hoc one-off steps per endpoint (was STEP-BACK-001) (CICD-B-060; EPIC-017).

#### Scenario: CICD-B-060 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-060 holds

### Requirement: The back step catalog SHALL stay small; variation SHALL be achieved by parametrization …

The back step catalog SHALL stay **small**; variation SHALL be achieved by **parametrization** of existing steps (was STEP-BACK-002) (CICD-B-061; EPIC-017).

#### Scenario: CICD-B-061 satisfied

- **WHEN** the corresponding CI/CD or product behaviour is implemented
- **THEN** the requirement stated for CICD-B-061 holds

