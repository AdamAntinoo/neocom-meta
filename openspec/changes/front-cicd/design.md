# Design: front-cicd

## Context

EPIC-017 nomenclature: `CICD-F-NNN`. One OpenSpec change owns all registered front testing/CI requirements.

## Decisions

| Topic | Decision |
| --- | --- |
| Change shape | Single change `front-cicd` with capability `front/cicd` |
| Fixtures | Capture from back real endpoints; automated Gherkin only |
| Steps | Separate front step catalog (CICD-F-060…); initial steps await developer specs |
| Shared CI | Coverage / gates / commands duplicated as CICD-F vs CICD-B so each repo set is complete |

## Open questions

- Exact Cypress + Cucumber wiring and fixture capture tooling at apply time

## Extract 2026-11-11 notes

- Reusable GitHub Actions/workflows live in `neocom-meta`; thin callers in `front` repo.
- Sonar: org `adamantinoo` in `sonar-project.properties`; project key in local workflow env.
- Image tags: `{majorMinorPatch}-{commits}.{channel}.{shortSha}` → GHCR (see EPIC-017 §08).
- Local Docker deploy is post-CI / self-hosted, not github-hosted.
