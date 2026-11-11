# CI testing gates order

Status: registered. OpenSpec changes: `front-cicd` + `back-cicd`.

Unit and acceptance CI tasks MAY run in parallel; both must succeed before SonarCloud analysis starts (with coverage artifacts when required). Applied per repo via `CICD-F-030…032` and `CICD-B-030…032`.

Requirement ids: CICD-F/B-030 … 032 (was GATE-001 … GATE-003). Source: L1 EPIC-017 §04.
