# Proposal

## Why

CI intent is written in L2 and only partly present as a front build workflow. The pipeline requirements need an OpenSpec change before more jobs are added.

## What Changes

- Pin CI Node to the `neocom` / `.nvmrc` version
- Require front unit tests, lint when scripts exist, a production build, and Cypress with WireMock
- Keep front-only CI independent of a live `neocom-back`
- Keep remote CD out of scope until promotion rules exist
- Record local Kubernetes as the deployment target already stated in L2
- Keep workflow files in-repo and secrets in the host secret store

## Capabilities

### New Capabilities

- `cicd/pipeline`: Continuous integration for the front app and the boundary of continuous delivery

### Modified Capabilities

- *(none)*

## Impact

- GitHub Actions in `neocom-front` (build workflow already exists)
- Out of scope: implementing staging and production promotion, and adding jobs that L2 does not name
