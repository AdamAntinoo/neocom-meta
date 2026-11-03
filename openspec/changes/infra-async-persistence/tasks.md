# Tasks

<!-- REAPPLY 2026-11-03: validated — back owns Flyway + tools/docker; meta tools/infra companion; sseBasePath=/v1; INFRA-055 checklist complete. -->

- [x] Document and provision PostgreSQL (or approved equivalent) for processed/calculated node data (INFRA-050, INFRA-051, INFRA-053, INFRA-054)
- [x] Define persistence record shape and operations (scope, identity, fields, staleness, list/upsert/incomplete query) (INFRA-052)
- [x] Provision Redis for BullMQ and optional SSE fan-out pub/sub; record back secrets and front SSE base path (INFRA-054)
- [x] Track async enrichment infra checklist to completion with companion front/back changes (INFRA-055)
