# Tasks

<!-- REAPPLY 2026-11-03: Flyway + tools/docker Postgres/Redis now live under neocom-back (cherry-pick a6028c7 → side/industry @ 2c14f3c). Re-validate INFRA-050…055 against back tooling + meta compose companion. -->

- [ ] Document and provision PostgreSQL (or approved equivalent) for processed/calculated node data (INFRA-050, INFRA-051, INFRA-053, INFRA-054)
- [ ] Define persistence record shape and operations (scope, identity, fields, staleness, list/upsert/incomplete query) (INFRA-052)
- [ ] Provision Redis for BullMQ and optional SSE fan-out pub/sub; record back secrets and front SSE base path (INFRA-054)
- [ ] Track async enrichment infra checklist to completion with companion front/back changes (INFRA-055)
