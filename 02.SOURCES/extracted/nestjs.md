# NestJS (marketing / product home)

- URL: https://nestjs.com/
- Fetched: 2026-10-12

## Summary

NestJS is presented as a progressive Node.js framework for efficient, reliable, scalable server-side applications. It is built on TypeScript and Node.js, with a modular architecture. The landing page emphasizes modules, dependency injection, TypeScript type safety, decorators, microservices, and web apps. Official docs, courses (including Authentication & Authorization), CLI (`@nestjs/cli` / `nest new`), and enterprise support are linked; deep normative API requirements are not on this page.

## Requirements

- (None normative on this marketing page.) Product claims only: organize apps into self-contained modules; use built-in dependency injection; TypeScript type safety; TypeScript decorators; support for microservice and web application styles.
- Getting-started surface shown: install `@nestjs/cli` globally and run `nest new project-name`.

## Concepts / tokens

- NestJS / Nest
- TypeScript, Node.js
- Modules, Dependency Injection, Decorators
- Controllers, Bootstrap (sample labels on page)
- Microservices, Web Apps
- Observability / Devtools / Mau (AWS deploy tooling) — product add-ons, not framework core requirements
- Authentication & Authorization (course topic named; no protocol detail here)

## Implications for NEOCOM

- **neocom-back** candidate stack signal: Nest + TypeScript aligns with NEOCOM’s recorded interest in Nest as a backend framework option.
- Angular-inspired modular DI story on the page is consistent with pairing Nest back + Angular front, but this page alone does not mandate Nest adoption or auth design.
- Prefer Nest official documentation (linked from this site, not fetched in this extract) for concrete HTTP/auth module requirements when Spec Collect runs.

## Open questions

- Which Nest docs pages (Authentication, Guards, Passport, Config) should be added to `02.SOURCES/SOURCES.md` for atomic L1 auth/infra requirements?
- Is Nest confirmed for `neocom-back`, or still a candidate pending programme decision?
