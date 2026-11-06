# CI testing gates order

Status: registered. OpenSpec change: `cicd-testing-gates`.

Unit and acceptance CI tasks MAY run in parallel; both must succeed before SonarCloud analysis starts (with coverage artifacts when required).

Requirement ids: GATE-001 … GATE-003. Source: L1 (EPIC-003).
