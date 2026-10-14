# Design

## Approach

- Read the documentation of `@lgriffin/esi.ts` and record whether it is useful for NEOCOM (ESI-006). Do not keep `esijs`.
- Download the `@lgriffin/esi.ts` documentation (ESI-007). The note does not name a URL or a file format.
- Add `@lgriffin/esi.ts` as a dependency of `neocom-esi` (ESI-008). The note gives the install command `npm install @lgriffin/esi.ts`.
- Add a `doc` folder in `neocom-esi` with the URL links to `@lgriffin/esi.ts` (ESI-009).
- Implement requirements that concern ESI in `neocom-esi` (ESI-010).

## Decisions

| Topic | Decision |
| --- | --- |
| Owner | `neocom-esi` |
| Package named | `@lgriffin/esi.ts` |
| Package installed | `@lgriffin/esi.ts` |
| Delivery branch | `feature/client` from `develop` |

## Risks

- Usefulness is not decided by the note. Exploration records a finding; it does not by itself adopt the package as the ESI implementation.
