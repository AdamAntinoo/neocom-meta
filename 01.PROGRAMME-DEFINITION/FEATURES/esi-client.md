# ESI client

Status: recorded. OpenSpec change: `back-esi-client`.

`@lgriffin/esi.ts` is the ESI client installed in `neocom-back`. Its documentation is explored and downloaded, the package is installed there, and a `doc` folder in `neocom-esi` holds the URL links. References to `esijs` are removed. ESI-010 is cancelled.

## Finding

`@lgriffin/esi.ts` 12.0.0 is useful as the ESI client for `neocom-back`. It is a TypeScript client for the ESI API, it runs on Node 22.12 or later (the `neocom` Node alias is 24), and public calls need no token. `esijs` is not used. Zod validation, ETag caching, rate limiting, and retry are upstream behavior. They are not NEOCOM requirements.

Source: `05.REQUIREMENTS-DECOMPOSITION/L2/ESI/ESI-CLIENT.md` (ESI-006 … ESI-010).
