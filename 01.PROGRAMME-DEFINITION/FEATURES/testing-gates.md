# CI testing gates order

Status: registered. OpenSpec change: `cicd-testing-gates`.

Unit and acceptance CI tasks MAY run in parallel; both must succeed before SonarCloud analysis starts (with coverage artifacts when required).

L2 IDs: GATE-001 … GATE-003. Source: `05.REQUIREMENTS-DECOMPOSITION/L2/CICD/02.TESTING-GATES.md` (EPIC-003).
