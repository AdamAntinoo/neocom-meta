# Versioned business objects

Business objects and data models are versioned so application work can add a new shape without breaking features that still use an older one.

- The version is part of the type name (`PublicPilotV1`, `PilotV2`, `PublicCorporationV1`).
- A new version is a new type. The old type stays in the domain package.
- A feature depends on the version it was built for. It is not moved onto a later version unless that feature changes.
- Field lists live under `05.REQUIREMENTS-DECOMPOSITION/L2/DOMAIN/MODELS/`.
