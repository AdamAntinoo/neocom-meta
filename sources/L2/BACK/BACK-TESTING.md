# Backend testing guidelines

<!-- L2-STATUS: placed -->

| Field | Value |
| --- | --- |
| Status | 📌 `placed` |
| Kind | placed |
| Epic | — |
| OpenSpec | `back-testing` |
| Unregistered | 0 |
| Next | See `openspec/CHANGE-STATUS.md` |
| Index | [`L2/INDEX.md`](../INDEX.md) |

System: `back`. Feature: `testing`.
OpenSpec change: `back-testing` → `specs/back/testing/spec.md`.

Source: `L2/03.EPIC-TESTING.backend-testing.md` (EPIC-003).

| ID | Status | Requirement |
| --- | --- | --- |
| BTEST-001 | registered | `neocom-back` SHALL follow the **same testing guidelines** as the front (SDD→BDD→TDD, coverage and quality gates, SonarCloud, shared command catalog intent, mock fixtures from real runs where applicable). |
| BTEST-002 | registered | Backend acceptance and integration scenarios that need **stable, predefined data** SHALL use **mocked sources**, with **WireMock** (or an equivalent HTTP mock) replacing upstream dependencies for those scenarios. |
| BTEST-003 | registered | **Universe ESI** reference data MAY use **real ESI feeds** when that is acceptable for the scenario. |
| BTEST-004 | registered | Every other external source SHALL be decided **case by case** (mock vs live), and the choice SHALL be recorded for that scenario. |
| BTEST-005 | registered | Backend BDD acceptance tests SHALL use **Gherkin** with **Cucumber** (or another BDD runner that consumes the same Gherkin scenarios) so acceptance behaviour is expressed the same way as Cypress-driven front acceptance. |

## UNREGISTERED REQUIREMENTS

## DUPLICATED
