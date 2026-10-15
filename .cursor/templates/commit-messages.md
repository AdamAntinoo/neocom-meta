# Commit messages

## Fallback

Use the user example below. A commit message names the change, then lists what the commit includes.

## User examples

Recorded from the `neocom-back` commit on `feature/service` for server startup and GitVersion. Later commits use this shape.

```text
feat(back): start the server from the local environment and GitVersion

- Server startup reads PORT, ENVIRONMENT, LOGLEVEL, VERSION, and an optional BANNER, then prints them before accepting connections.
- GitVersion continuous deployment starts at 0.0.1 and increments the minor version on main.
```
