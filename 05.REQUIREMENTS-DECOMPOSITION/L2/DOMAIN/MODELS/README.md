# Domain models

Business objects and data models are versioned. A change of shape is a new version, named on the type (`V1`, `V2`). The previous version stays, so a feature written against the old model keeps using it.

Versions are not rewritten in place. A feature chooses the version it needs.

`Pilot` is the current example. [PublicPilotV1](./Pilot.md) is the public model and needs no ESI login. [PilotV2](./Pilot.md) adds the private fields and needs an ESI token. Features that only have public data stay on `PublicPilotV1`.
