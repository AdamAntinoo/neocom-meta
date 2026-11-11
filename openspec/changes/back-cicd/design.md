# Design: back-cicd

## Context

EPIC-017 nomenclature: `CICD-B-NNN`. One OpenSpec change owns all registered back testing/CI requirements.

## Decisions

| Topic | Decision |
| --- | --- |
| Change shape | Single change `back-cicd` with capability `back/cicd` |
| BDD | Gherkin + Cucumber (or equivalent); OpenAPI feature files (CICD-B-006…007) when reviewed |
| Steps | Separate back step catalog (CICD-B-060…); initial steps await developer specs |
| Shared CI | Coverage / gates / commands duplicated as CICD-B vs CICD-F so each repo set is complete |

## Open questions

- Exact Cucumber runner and OpenAPI assertion library at apply time

## Extract 2026-11-11 notes

- Reusable GitHub Actions/workflows live in `neocom-meta`; thin callers in `back` repo.
- Sonar: org `adamantinoo` in `sonar-project.properties`; project key in local workflow env.
- Image tags: `{majorMinorPatch}-{commits}.{channel}.{shortSha}` → GHCR (see EPIC-017 §08).
- Local Docker deploy is post-CI / self-hosted, not github-hosted.
