# infra/sso-config Specification

## Purpose

SSO environment variables and deployment secrets. Source: INFRA-041 and INFRA-042 in `L2/INFRASTRUCTURE-SPECS.md`.

## ADDED Requirements

### Requirement: SSO environment variables

The environment variables for this login SHALL be `EVE_SSO_CLIENT_ID`, `EVE_SSO_CLIENT_SECRET`, `EVE_SSO_CALLBACK_URL`, and `EVE_SSO_SCOPES`. The front configuration file for the environment SHALL hold the client id and the client secret. The back SHALL read those values when it exchanges the authorization code. `EVE_SSO_CALLBACK_URL` SHALL be used by the back and SHALL match the registered callback. `EVE_SSO_SCOPES` SHALL be used by the front and the back: the registered scope names, separated by spaces, with no wildcard (INFRA-041).

#### Scenario: Front env holds client credentials locally

- **WHEN** a developer runs the front for an environment
- **THEN** that environment's configuration file holds `EVE_SSO_CLIENT_ID` and `EVE_SSO_CLIENT_SECRET`
- **AND** the back can read the same values for the token request

### Requirement: Kubernetes secrets for deployment

When deployment is ready, the client id and the client secret SHALL come from Kubernetes secrets into the same front configuration entries used locally. On local development those values SHALL be written in the front configuration file and SHALL NOT be secured (INFRA-042).

#### Scenario: Deployed values come from Kubernetes secrets

- **WHEN** the application is deployed
- **THEN** client id and client secret are supplied from Kubernetes secrets
- **AND** they populate the same configuration entries used locally
