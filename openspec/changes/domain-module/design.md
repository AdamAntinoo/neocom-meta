# Design

## Approach

- Clone `neocom-domain` as a submodule of the parent `neocom` repo (DOMAIN-001).
- The repository is a Node package of TypeScript domain types (DOMAIN-002).
- Front and back depend on the published npm package rather than a relative path copy (DOMAIN-003).

## Decisions

| Topic | Decision |
| --- | --- |
| Remote | https://github.com/AdamAntinoo/neocom-domain.git |
| Language | TypeScript |
| Consumption | npm dependency from front and back |
| Delivery branch | `features/neocom-domain` from `develop` |

## Risks

- Publishing to npm needs an account and a package name that are not specified yet. Do not invent the package name in this change.
- `neocom-back` is not in the workspace yet; its dependency is still required by DOMAIN-003.
