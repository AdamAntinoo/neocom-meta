# cicd/pipeline Specification

## Purpose

CI for the front application and the limit of CD. Source: INFRA-030 … INFRA-039 and the local Kubernetes note in `L2/INFRASTRUCTURE-SPECS.md`.

## ADDED Requirements

### Requirement: CI Node pin

CI SHALL run with a documented Node version that matches `.nvmrc` and the Angular engines, preferring the `neocom` pin 24.21.0 (INFRA-030).

#### Scenario: CI uses the pinned Node

- **WHEN** a front CI job starts
- **THEN** it uses the Node version recorded in `.nvmrc`

### Requirement: Front verification jobs

Front CI SHALL run unit tests (`npm test` / Vitest, non-watch) on every relevant pull request (INFRA-031). Front CI SHALL run lint and format checks once those scripts are defined (INFRA-032). Front CI SHALL produce a production build (`npm run build`) and SHALL fail the pipeline on build errors (INFRA-033).

#### Scenario: Pull request runs the build

- **WHEN** a relevant front pull request is opened
- **THEN** the production build runs and a build error fails the pipeline

### Requirement: Acceptance job without a live backend

Acceptance tests (Cypress + Cucumber) SHALL run in CI on a defined job. That job SHALL start the app and WireMock or equivalent mocks (INFRA-034). Front-only CI SHALL NOT require a live `neocom-back` (INFRA-035).

#### Scenario: Cypress uses mocks

- **WHEN** the acceptance CI job runs
- **THEN** WireMock or committed stubs answer HTTP calls
- **AND** a live `neocom-back` is not required

### Requirement: CD stays undefined until promotion rules exist

Deployment targets, environments, and promotion rules from dev to staging to prod SHALL be defined before the first CD pipeline. Until then CD implementation is out of scope (INFRA-036). Artifacts that CD later publishes SHALL be versioned and traceable to a git SHA (INFRA-037).

#### Scenario: No remote promotion pipeline yet

- **WHEN** promotion rules are not defined
- **THEN** agents do not add a staging or production deploy workflow

### Requirement: In-repo workflows and secret store

Pipeline definitions SHALL live in the owning repository, for example GitHub Actions (INFRA-038). CI/CD secrets SHALL use the host secret store and SHALL NOT be committed (INFRA-039).

#### Scenario: Workflow file is in the repo

- **WHEN** a developer looks for the front build pipeline
- **THEN** the workflow file is in the owning repository
- **AND** credentials are not in that file

### Requirement: Local Kubernetes target

Local Kubernetes SHALL be the deployment target. The `neocom-meta` scripts `k8s:start` and `k8s:dashboard` SHALL bootstrap that local cluster.

#### Scenario: Local cluster bootstrap

- **WHEN** a developer starts the local deployment target
- **THEN** the meta Kubernetes scripts are the bootstrap for that cluster
