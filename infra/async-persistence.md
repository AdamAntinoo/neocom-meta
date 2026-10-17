# Async persistence provision (INFRA-050 … INFRA-055)

OpenSpec: `infra-async-persistence`. Companions: `back-async-sse`, `front-async-sse`.

## Services

| Service | Role | Compose |
| --- | --- | --- |
| PostgreSQL 16 | Durable store for processed / calculated node records | `infra/docker-compose.async-persistence.yml` |
| Redis 7 | BullMQ broker + optional SSE fan-out pub/sub | same file |

```bash
cd neocom-meta
docker compose -f infra/docker-compose.async-persistence.yml up -d
```

Default local endpoints:

- Postgres: `postgresql://neocom:neocom@localhost:5432/neocom_async`
- Redis: `redis://localhost:6379`

## Persistence record shape (INFRA-052)

| Field | Purpose |
| --- | --- |
| `scopeKey` | List scope (e.g. pilot id + list name) |
| `nodeId` | Node identity within the scope |
| `simplified` | JSON payload for first paint / partial rows |
| `calculated` | JSON calculated fields (indexes, costs, …) |
| `ready` | Completion / readiness flag |
| `updatedAt` | Last write time |
| `staleAfter` | Optional staleness horizon |

Operations (implemented in `neocom-back`):

1. **listByScope** — HTTP list response
2. **upsertItem** — worker finish
3. **queryIncompleteOrStale** — worker pickup

Schema + migrations: **`neocom-back`** (INFRA-053).

## Environment secrets (INFRA-054)

### Back (`neocom-back`)

Add to `.env.application` (or a dedicated `.env.async` loaded by ConfigModule):

```env
DATABASE_URL=postgresql://neocom:neocom@localhost:5432/neocom_async
REDIS_URL=redis://localhost:6379
ASYNC_SSE_CHANNEL_PREFIX=neocom:sse:
```

### Front (`neocom-front`)

```env
# or environment.ts / environment.development.ts
sseBasePath=/api/sse
```

Browser calls same-origin `/api/sse/...` (proxied to Nest).

## Checklist (INFRA-055)

| Item | Owner | Status |
| --- | --- | --- |
| PostgreSQL provisioned | infra compose | provisioned (compose) |
| Nest persistence module + migrations | `back-async-sse` | applying with companion |
| Redis + BullMQ | `back-async-sse` | applying with companion |
| Nest `@Sse()` + Redis fan-out | `back-async-sse` | applying with companion |
| Front adapter HTTP + cache + SSE | `front-async-sse` | applying with companion |
| Front panel in-place merge | `front-async-sse` | applying with companion |
| DB/Redis secrets in back envs | infra + back | documented |
| SSE base path in front envs | infra + front | documented |
