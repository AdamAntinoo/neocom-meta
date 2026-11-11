# Change: back-cicd

## Why

EPIC-017 groups all **back** CI/CD and testing contracts under one OpenSpec change with `CICD-B-*` ids. This supersedes the former `back-testing` change and the back application of `cicd-coverage-sonar`, `cicd-testing-gates`, and `infra-test-commands`.

## What Changes

- Backend SDD→BDD→TDD guidelines, WireMock, Gherkin/Cucumber (CICD-B-001…005)
- OpenAPI Gherkin feature files + scenario test data still L1 `[ ] to review` (CICD-B-006…007)
- Back coverage, SonarCloud, CI job order, and shared test-command catalog (CICD-B-020…044)
- Back Gherkin step catalog remains L1 `[ ] to review` (CICD-B-060…061) until marked reviewed

## Impact

- Affected specs: `back/cicd`
- Affected code: `neocom-back` (and back CI)
- Supersedes: `back-testing`; back half of `cicd-coverage-sonar`, `cicd-testing-gates`, `infra-test-commands`

## Extract 2026-11-11 (EPIC-017)

Registered previously L1-only units into this change:
- Deployment/CD CICD-B-080…082 (GitVersion/imageTag/GHCR naming)
- Logging CICD-B-110…111, B-113…127
- CI pipeline CICD-B-070…079, B-083…089

## Extract 2026-11-11b

- OpenAPI Gherkin CICD-B-006…009
- Mock catalog CICD-B-010…017
- Back step catalog CICD-B-060…061

## Extract 2026-11-11c

- SemVer bump / named release / feature≡image naming CICD-B-130…133
