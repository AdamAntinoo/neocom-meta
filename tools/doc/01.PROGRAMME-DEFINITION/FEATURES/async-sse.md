# Async SSE

Status: registered. OpenSpec changes: `front-async-sse`, `back-async-sse`.

Heavy pages paint a partial list first; background enrichment pushes updates over SSE. Front: adapter cache → HTTP → authenticated SSE merge into panel (`notifyDataChanged` in place). Back: persistence-first list API, BullMQ one-by-one jobs, Nest `@Sse`, ESI on miss, Redis pub/sub for multi-replica fan-out.

Requirement ids: FASSE-001 … FASSE-010, BASSE-001 … BASSE-012. Sources: ,  (EPIC-002). Companion: `infra-async-persistence`.
