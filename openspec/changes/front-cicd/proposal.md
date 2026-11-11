# Change: front-cicd

## Why

EPIC-017 groups all **front** CI/CD and testing contracts under one OpenSpec change with `CICD-F-*` ids. This supersedes the former split changes `front-bdd-cypress`, `front-mock-fixtures`, and the front application of `cicd-coverage-sonar`, `cicd-testing-gates`, and `infra-test-commands`.

## What Changes

- Cypress / Gherkin SDD→BDD→TDD and `cy-*` UI validation (CICD-F-001…004)
- Automated mock fixtures from back real endpoint captures; not for development user testing (CICD-F-010…013 registered; CICD-F-014…016 still L1 to review)
- Front coverage, SonarCloud, CI job order, and shared test-command catalog (CICD-F-020…044)
- Domain-node unit tests and front Gherkin step catalog remain L1 `[ ] to review` (CICD-F-050…061) until marked reviewed

## Impact

- Affected specs: `front/cicd`
- Affected code: `neocom-front` (and front CI)
- Supersedes: `front-bdd-cypress`, `front-mock-fixtures`; front half of `cicd-coverage-sonar`, `cicd-testing-gates`, `infra-test-commands`

## Extract 2026-11-11 (EPIC-017)

Registered previously L1-only units into this change:
- Mock fixtures CICD-F-014…016
- Deployment/CD CICD-F-080…082 (GitVersion/imageTag/GHCR naming)
- Logging CICD-F-110…122, F-124
- CI pipeline CICD-F-070…079, F-083…089 (lint-first, triggers, Sonar keys, Packages/GHCR, local Docker handoff, GitHub setup doc)
- Developer install CICD-F-092…095, F-097…098
- Local configuration CICD-F-101…103, F-105…108

## Extract 2026-11-11b

- Domain node unit tests CICD-F-050…053
- Logging F-124
- Front step catalog + cy-* CICD-F-060…067

## Extract 2026-11-11c

- SemVer bump / named release / feature≡image naming CICD-F-130…133
