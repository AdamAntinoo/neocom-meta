# Executive actions — INFRA

> Infrastructure & programme — build, deploy, CI/CD, config, project setup, epics.
> 215 open action(s) across 17 feature(s) · generated 2026-10-30 · source: Trello board `neocom-infinity` (L0).

| Feature | To do | In progress | Testing | Total |
| --- | --- | --- | --- | --- |
| Data & persistence | 31 | 1 | 3 | 35 |
| General | 19 | 2 | 8 | 29 |
| Mining | 20 | 1 | 5 | 26 |
| Login & authentication | 19 | 1 | 2 | 22 |
| Infrastructure & build | 16 | 0 | 4 | 20 |
| Industry & fittings | 17 | 0 | 0 | 17 |
| Refactoring | 14 | 2 | 0 | 16 |
| Testing | 10 | 0 | 3 | 13 |
| Bugs & fixes | 8 | 0 | 0 | 8 |
| ESI integration | 4 | 1 | 3 | 8 |
| Documentation | 6 | 0 | 0 | 6 |
| Domain models | 3 | 0 | 1 | 4 |
| Pilot & character | 3 | 0 | 0 | 3 |
| Assets | 3 | 0 | 0 | 3 |
| Market | 2 | 0 | 0 | 2 |
| Planetary | 2 | 0 | 0 | 2 |
| Universe & locations | 1 | 0 | 0 | 1 |

## Data & persistence

### To do (31)

- [ ] `INFRA-001` [Replace Redis by a memory cache temporarily until Redis is fixed.](https://trello.com/c/qYGTyv13/1064-back-story-replace-redis-by-a-memory-cache-temporarily-until-redis-is-fixed) · _BACK-STORY_ · `MPV-Prepare`
- [ ] `INFRA-005` [The annotation library does not go with the library so any external service cannot locate the local maven packages. Use integrated deployment or project dependency to solve integration exceptions.](https://trello.com/c/8avIZvpH/17-ci-the-annotation-library-does-not-go-with-the-library-so-any-external-service-cannot-locate-the-local-maven-packages-use-integr) · _CI_ · `BACKLOG`
- [ ] `INFRA-006` [Get the version to be published from a central version definition point. This requires some research about Gradle.](https://trello.com/c/PnMweys1/294-configuration-get-the-version-to-be-published-from-a-central-version-definition-point-this-requires-some-research-about-gradle) · _CONFIGURATION_ · `BACKLOG`
- [ ] `INFRA-007` [Make the Configuration Provider be able to identify profiles so each profile(dev, stage, prod) can have its own set of configuration files and properties.](https://trello.com/c/bEOebvsD/183-configuration-make-the-configuration-provider-be-able-to-identify-profiles-so-each-profiledev-stage-prod-can-have-its-own-set-of) · _CONFIGURATION_ · `BACKLOG`
- [ ] `INFRA-009` [Fix the Staging configuration to use the pods available on Kubernetes. Use NodePorts if required.](https://trello.com/c/pnbNdeNf/1083-config-fix-the-staging-configuration-to-use-the-pods-available-on-kubernetes-use-nodeports-if-required) · _CONFIG_ · `MPV-Prepare`
- [ ] `INFRA-010` [Simplify the backend service configuration and use only a subset of the environment properties to be consistent.](https://trello.com/c/8ujqMjnp/1086-config-simplify-the-backend-service-configuration-and-use-only-a-subset-of-the-environment-properties-to-be-consistent) · _CONFIG_ · `MPV-Prepare`
- [ ] `INFRA-011` [Use environment configuration for NIN.](https://trello.com/c/AXSbXNg9/1084-config-use-environment-configuration-for-nin) · _CONFIG_ · `MPV-Prepare`
- [ ] `INFRA-012` [Add back the LiquiBase database features to control the table and database record management on production.](https://trello.com/c/2ajoaabW/39-deploy-add-back-the-liquibase-database-features-to-control-the-table-and-database-record-management-on-production) · _DEPLOY_ · `BACKLOG`
- [ ] `INFRA-013` [Prepare the production configuration properties with the correct set of values.](https://trello.com/c/Kwru7q65/324-deploy-prepare-the-production-configuration-properties-with-the-correct-set-of-values) · _DEPLOY_ · `BACKLOG`
- [ ] `INFRA-014` [Start deploying libraries to maven public repository.](https://trello.com/c/Wj9XyRA5/301-deploy-start-deploying-libraries-to-maven-public-repository) · _DEPLOY_ · `BACKLOG`
- [ ] `INFRA-015` [Automate the POM version so the jar name and the deployment use the same version configuration. Update the version with gitversion and the Gradle tool.](https://trello.com/c/v31ljbYJ/1122-fix-automate-the-pom-version-so-the-jar-name-and-the-deployment-use-the-same-version-configuration-update-the-version-with-gitve) · _FIX_ · `MPV-Prepare`
- [ ] `INFRA-016` [Fix the deployment configuration to solve the problems identified.](https://trello.com/c/syDhBjN0/1116-fix-fix-the-deployment-configuration-to-solve-the-problems-identified) · _FIX_ · `MPV-Prepare`
- [ ] `INFRA-017` [Reconfigure properties and environment to have a complete set of architecture parameters.](https://trello.com/c/dYFERSaz/1072-project-reconfigure-properties-and-environment-to-have-a-complete-set-of-architecture-parameters) · _PROJECT_ · `MPV-Prepare`
- [ ] `INFRA-018` [Reconfigure the development project to run from a similar configuration as the production.](https://trello.com/c/XHMpt4a8/1075-project-reconfigure-the-development-project-to-run-from-a-similar-configuration-as-the-production) · _PROJECT_ · `MPV-Prepare`
- [ ] `INFRA-019` [Change the Configuration Provider a Configuration Service.](https://trello.com/c/CEXcBUKq/43-refactor-change-the-configuration-provider-a-configuration-service) · _REFACTOR_ · `BACKLOG`
- [ ] `INFRA-020` [DAO references cannot be injected. Inject the Database Manager and then get the reference from it as when using builders.](https://trello.com/c/1gFP9eOV/802-refactor-dao-references-cannot-be-injected-inject-the-database-manager-and-then-get-the-reference-from-it-as-when-using-builders) · _REFACTOR_ · `BACKLOG`
- [ ] `INFRA-021` [Recode the NeoCom database service from the DM Integration implementation and remove the builder construction pattern.](https://trello.com/c/89GJOphQ/898-refactor-recode-the-neocom-database-service-from-the-dm-integration-implementation-and-remove-the-builder-construction-pattern) · _REFACTOR_ · `BACKLOG`
- [ ] `INFRA-022` [Remove the double log line for the scheduler.](https://trello.com/c/fDDRy40V/877-refactor-remove-the-double-log-line-for-the-scheduler) · _REFACTOR_ · `BACKLOG`
- [ ] `INFRA-023` [Replace access to configuration constants by a local access to a field content preloaded at configuration time.](https://trello.com/c/ck2Iam5Z/179-refactor-replace-access-to-configuration-constants-by-a-local-access-to-a-field-content-preloaded-at-configuration-time) · _REFACTOR_ · `BACKLOG`
- [ ] `INFRA-025` [Upgrade the exception management to report the exceptions on the best practices way.](https://trello.com/c/jNJukISl/70-refactor-upgrade-the-exception-management-to-report-the-exceptions-on-the-best-practices-way) · _REFACTOR_ · `BACKLOG`
- [ ] `INFRA-026` [A way to use two different sets of dependencies, one for development and the other for production so production uses the 'deploy' folder while development used direct library dependencies through local maven repository](https://trello.com/c/znUdpHq5/40-research-a-way-to-use-two-different-sets-of-dependencies-one-for-development-and-the-other-for-production-so-production-uses-the) · _RESEARCH_ · `BACKLOG`
- [ ] `INFRA-027` [Create a bitbucket pipeline to generate the backend application to be deployed to heroku with an specific command and not by repository push.](https://trello.com/c/p83g9jsJ/686-research-create-a-bitbucket-pipeline-to-generate-the-backend-application-to-be-deployed-to-heroku-with-an-specific-command-and-n) · _RESEARCH_ · `BACKLOG`
- [ ] `INFRA-029` [search for a Nest logger similar to the one used on java.](https://trello.com/c/U6dXFipV/1093-research-search-for-a-nest-logger-similar-to-the-one-used-on-java) · _RESEARCH_ · `MPV-Prepare`
- [ ] `INFRA-030` [Spring boot configuration seems not to work as expected. Remove it until fixed.](https://trello.com/c/RZNWrWom/321-researh-spring-boot-configuration-seems-not-to-work-as-expected-remove-it-until-fixed) · _RESEARH_ · `BACKLOG`
- [ ] `INFRA-031` [Add a new function to cleanup the scheduler to a application startup state.](https://trello.com/c/iRLnTlJC/50-support-add-a-new-function-to-cleanup-the-scheduler-to-a-application-startup-state) · _SUPPORT_ · `BACKLOG`

### In progress (1)

- [~] `INFRA-032` [Remove NEOCOM_DATABASE_URL and use instead the definitions for the SpringBoot JPA.](https://trello.com/c/7l24Dw46/1149-refactor-remove-neocomdatabaseurl-and-use-instead-the-definitions-for-the-springboot-jpa) · _REFACTOR_ · `WIP-P`

### In testing (3)

- [ ] `INFRA-033` [Add environment configuration to the Nest backend.](https://trello.com/c/m9Gfms17/1053-project-add-environment-configuration-to-the-nest-backend) · _PROJECT_ · `to TEST`
- [ ] `INFRA-034` [Add the Redis service as another docker service on the docker set like the database.](https://trello.com/c/q7pZHqss/1063-project-add-the-redis-service-as-another-docker-service-on-the-docker-set-like-the-database) · _PROJECT_ · `to TEST`
- [ ] `INFRA-035` [Parametrize errors in a similar way it is done with Java exceptions.](https://trello.com/c/cHoadCcD/1089-research-parametrize-errors-in-a-similar-way-it-is-done-with-java-exceptions) · _RESEARCH_ · `to TEST`

## General

### To do (19)

- [ ] `INFRA-036` [Add the spring boot application management registration.](https://trello.com/c/pXjTm2Ub/322-cloud-add-the-spring-boot-application-management-registration) · _CLOUD_ · `BACKLOG`
- [ ] `INFRA-037` [There should be some type of contract between the applications so if there is a change on the API it will be reflected by a failure on the contract.](https://trello.com/c/JJmtsXKM/308-contracts-there-should-be-some-type-of-contract-between-the-applications-so-if-there-is-a-change-on-the-api-it-will-be-reflected) · _CONTRACTS_ · `BACKLOG`
- [ ] `INFRA-038` [Restart the application in a new PRD environment in local hosting.](https://trello.com/c/93PcEySy/971-epicrestart-the-application-in-a-new-prd-environment-in-local-hosting) · _EPIC_ · `BACKLOG`
- [ ] `INFRA-039` [The project should be restarted from scratch and should use profiles to allow the dynamic load of features under construction.](https://trello.com/c/QW5JiL5F/976-epicv0210the-project-should-be-restarted-from-scratch-and-should-use-profiles-to-allow-the-dynamic-load-of-features-under-constr) · _EPICv0.21.0_ · `BACKLOG`
- [ ] `INFRA-040` [Verify that a result cookie sent by the backend is sent in next call from the frontend.](https://trello.com/c/pPZBuWqr/209-poc-verify-that-a-result-cookie-sent-by-the-backend-is-sent-in-next-call-from-the-frontend) · _POC_ · `BACKLOG`
- [ ] `INFRA-042` [Add a live and a ready endpoints to application services running on pods.](https://trello.com/c/njKj14Fx/1150-project-add-a-live-and-a-ready-endpoints-to-application-services-running-on-pods) · _PROJECT_ · `MPV-Prepare`
- [ ] `INFRA-043` [Add drag & drop support and the libraries to activate this functionality.](https://trello.com/c/1WHqAmqq/575-project-add-drag-drop-support-and-the-libraries-to-activate-this-functionality) · _PROJECT_ · `BACKLOG`
- [ ] `INFRA-044` [Continue renaming files to the new nomenclature.](https://trello.com/c/ZZiTDbZS/1012-project-continue-renaming-files-to-the-new-nomenclature) · _PROJECT_ · `MPV-Prepare`
- [ ] `INFRA-045` [Create new interfaces for render components that help to identify the required methods to be created/overrided.](https://trello.com/c/pgnFsTlW/1034-project-create-new-interfaces-for-render-components-that-help-to-identify-the-required-methods-to-be-created-overrided) · _PROJECT_ · `MPV-Prepare`
- [ ] `INFRA-046` [Define the architecture for the service at the Stage level.](https://trello.com/c/Gc19VK6l/1050-project-define-the-architecture-for-the-service-at-the-stage-level) · _PROJECT_ · `MPV-Prepare`
- [ ] `INFRA-047` [Prepare one new OpenApi service to publish the OpenApi definition for Nest endpoints.](https://trello.com/c/DgNrMpGu/1036-project-prepare-one-new-openapi-service-to-publish-the-openapi-definition-for-nest-endpoints) · _PROJECT_ · `MPV-Prepare`
- [ ] `INFRA-048` [Remove bootstrap styling form the project since this siual style is not going to be used on Infinity.](https://trello.com/c/64i8KyJU/154-project-remove-bootstrap-styling-form-the-project-since-this-siual-style-is-not-going-to-be-used-on-infinity) · _PROJECT_ · `BACKLOG`
- [ ] `INFRA-050` [Add some wait time between the stop and the start of some processes.](https://trello.com/c/DdFFdzy6/966-projectadd-some-wait-time-between-the-stop-and-the-start-of-some-processes) · _PROJECT_ · `BACKLOG`
- [ ] `INFRA-051` [Remove the need to use port 80 for the application since there are no external hosts on the service.](https://trello.com/c/BDbR20lC/982-projectremove-the-need-to-use-port-80-for-the-application-since-there-are-no-external-hosts-on-the-service) · _PROJECT_ · `BACKLOG`
- [ ] `INFRA-052` [Research how to reset and endpoint to return the first answer of a set.](https://trello.com/c/nlTtcUim/970-projectresearch-how-to-reset-and-endpoint-to-return-the-first-answer-of-a-set) · _PROJECT_ · `BACKLOG`
- [ ] `INFRA-053` [Research how to return different outputs for a same endpoint in sequence.](https://trello.com/c/ApJMzRdU/969-projectresearch-how-to-return-different-outputs-for-a-same-endpoint-in-sequence) · _PROJECT_ · `BACKLOG`
- [ ] `INFRA-054` [Use Kubernetes Config Maps to parametrize applications and reduce the number os images generated.](https://trello.com/c/To6otIAC/1068-research-use-kubernetes-config-maps-to-parametrize-applications-and-reduce-the-number-os-images-generated) · _RESEARCH_ · `MPV-Prepare`

### In progress (2)

- [~] `INFRA-055` [NIF Page review and change to show the list of processed blueprints.](https://trello.com/c/kGI8sDjp/1134-epic-029-nif-page-review-and-change-to-show-the-list-of-processed-blueprints) · _EPIC-0.29_ · `WIP-P`
- [~] `INFRA-056` [Move secret and encrypted values to Kubernetes secrets.](https://trello.com/c/wTOBTaTk/1148-project-move-secret-and-encrypted-values-to-kubernetes-secrets) · _PROJECT_ · `WIP-P`

### In testing (8)

- [ ] `INFRA-057` [Add OpenApi functionality and code generation from the api definition.](https://trello.com/c/jrrFMOau/1046-project-add-openapi-functionality-and-code-generation-from-the-api-definition) · _PROJECT_ · `to TEST`
- [ ] `INFRA-058` [All literals should be written in english. Spanish should be considered localization.](https://trello.com/c/lhWMpbTj/983-project-all-literals-should-be-written-in-english-spanish-should-be-considered-localization) · _PROJECT_ · `to TEST`
- [ ] `INFRA-059` [Check the contents and the usage of the shared library on the backend project.](https://trello.com/c/3NSsZYDD/1048-project-check-the-contents-and-the-usage-of-the-shared-library-on-the-backend-project) · _PROJECT_ · `to TEST`
- [ ] `INFRA-060` [Clean unused files from the Nest backend. Just publish what is in use.](https://trello.com/c/ZTj20yTK/1037-project-clean-unused-files-from-the-nest-backend-just-publish-what-is-in-use) · _PROJECT_ · `to TEST`
- [ ] `INFRA-061` [Create a new backend server with NestJs technology to start serving the frontend. At an initial approach it will be between the front and the back made with SpringBoot.](https://trello.com/c/LJMEPuvL/990-project-create-a-new-backend-server-with-nestjs-technology-to-start-serving-the-frontend-at-an-initial-approach-it-will-be-betwe) · _PROJECT_ · `to TEST`
- [ ] `INFRA-062` [Create a shared module because now the code that is valid for the front end is also valid for the backend. Put that code into a library that can be set as a NPM dependency.](https://trello.com/c/hIptdltU/1039-project-create-a-shared-module-because-now-the-code-that-is-valid-for-the-front-end-is-also-valid-for-the-backend-put-that-code) · _PROJECT_ · `to TEST`
- [ ] `INFRA-063` [Move new DTO classes to the shared library that should also be used at the frontend.](https://trello.com/c/CVu9xMUD/1090-project-move-new-dto-classes-to-the-shared-library-that-should-also-be-used-at-the-frontend) · _PROJECT_ · `to TEST`
- [ ] `INFRA-064` [Remove shortcut paths from projects until stable.](https://trello.com/c/KhHGj0a0/1049-project-remove-shortcut-paths-from-projects-until-stable) · _PROJECT_ · `to TEST`

## Mining

### To do (20)

- [ ] `INFRA-065` [Add the resource name to the Mining Extraction exported data.](https://trello.com/c/KFDXbDdo/339-add-the-resource-name-to-the-mining-extraction-exported-data) · `BACKLOG`
- [ ] `INFRA-066` [Add the system name to the mining extraction published information.](https://trello.com/c/cZOLZ2kW/341-add-the-system-name-to-the-mining-extraction-published-information) · `BACKLOG`
- [ ] `INFRA-067` [Create a process to keep the server running once I have started mining.](https://trello.com/c/p7DWnGPM/340-create-a-process-to-keep-the-server-running-once-i-have-started-mining) · `BACKLOG`
- [ ] `INFRA-071` [Add a builder to the NeoComException](https://trello.com/c/KlDNZXbN/1080-chore-add-a-builder-to-the-neocomexception) · _CHORE_ · `MPV-Prepare`
- [ ] `INFRA-072` [Add additional logs to frontend to display the configuration in use on the startup to check for values on Kubernetes.](https://trello.com/c/t7UyuYeG/1070-chore-add-additional-logs-to-frontend-to-display-the-configuration-in-use-on-the-startup-to-check-for-values-on-kubernetes) · _CHORE_ · `MPV-Prepare`
- [ ] `INFRA-073` [Backend services usually return a subscription that is managed automatically by the Panel.](https://trello.com/c/OxB85Nl5/1077-chore-backend-services-usually-return-a-subscription-that-is-managed-automatically-by-the-panel) · _CHORE_ · `MPV-Prepare`
- [ ] `INFRA-074` [Mining extractions schedule should be the one recommended by ESI but only on production.](https://trello.com/c/667VJWFI/47-deploy-mining-extractions-schedule-should-be-the-one-recommended-by-esi-but-only-on-production) · _DEPLOY_ · `BACKLOG`
- [ ] `INFRA-075` [Add the feature of the list of mining operations, the current if available and all last operations ordered by date descending.](https://trello.com/c/bZyVzsKP/981-epicv0210-add-the-feature-of-the-list-of-mining-operations-the-current-if-available-and-all-last-operations-ordered-by-date-desc) · _EPICv0.21.0_ · `MPV-Prepare`
- [ ] `INFRA-076` [Each hour I aggregate the mining profit into a one hour report. At the same time I update the market data for asteroids and minerals that should be accessed again every hour.](https://trello.com/c/F6YPaI42/159-mining-each-hour-i-aggregate-the-mining-profit-into-a-one-hour-report-at-the-same-time-i-update-the-market-data-for-asteroids-an) · _MINING_ · `BACKLOG`
- [ ] `INFRA-078` [Move the angular command and snippets to the Frontend project and store under a md document type.](https://trello.com/c/Lk3LNvif/196-project-move-the-angular-command-and-snippets-to-the-frontend-project-and-store-under-a-md-document-type) · _PROJECT_ · `BACKLOG`
- [ ] `INFRA-080` [Get the coorect script to run the Cucumber set of tests.](https://trello.com/c/AOxZYPoC/967-projectget-the-coorect-script-to-run-the-cucumber-set-of-tests) · _PROJECT_ · `BACKLOG`
- [ ] `INFRA-081` [Do the same with the MiningExtraction process because all that code should be shared.](https://trello.com/c/EZYmIJEW/327-refactor-do-the-same-with-the-miningextraction-process-because-all-that-code-should-be-shared) · _REFACTOR_ · `BACKLOG`
- [ ] `INFRA-082` [Remove the delta from mining extractions since it is only a local calculated field and should not be persisted.](https://trello.com/c/KSsGDMwz/337-refactor-remove-the-delta-from-mining-extractions-since-it-is-only-a-local-calculated-field-and-should-not-be-persisted) · _REFACTOR_ · `BACKLOG`
- [ ] `INFRA-083` [Replace occurrences to the logger by the new Core logger.](https://trello.com/c/mSNN8OAe/71-refactor-replace-occurrences-to-the-logger-by-the-new-core-logger) · _REFACTOR_ · `BACKLOG`
- [ ] `INFRA-084` [Add caching functionality to the new NeoItem service so the items are stored locally.](https://trello.com/c/EeB0A3vd/577-research-add-caching-functionality-to-the-new-neoitem-service-so-the-items-are-stored-locally) · _RESEARCH_ · `BACKLOG`

### In progress (1)

- [~] `INFRA-085` [Create a procedure to check for external system dependencies at startup so declare missing item before the process fails.](https://trello.com/c/2Klx5mFZ/1145-refactor-nib-create-a-procedure-to-check-for-external-system-dependencies-at-startup-so-declare-missing-item-before-the-process) · _REFACTOR-NIB_ · `WIP-P`

### In testing (5)

- [ ] `INFRA-086` [Add ESI generated code to the NIN to replace all the classes that mimic the ESI data model.](https://trello.com/c/1s9UD7W9/1091-chore-add-esi-generated-code-to-the-nin-to-replace-all-the-classes-that-mimic-the-esi-data-model) · _CHORE_ · `to TEST`
- [ ] `INFRA-087` [Configure the production Esi request and test that the stage version is able to reach and collect mining data.](https://trello.com/c/Wlg82cfx/1057-chore-configure-the-production-esi-request-and-test-that-the-stage-version-is-able-to-reach-and-collect-mining-data) · _CHORE_ · `to TEST`
- [ ] `INFRA-088` [Use namespaces to define the use case inputs and outputs.](https://trello.com/c/seRBEyCj/1058-chore-use-namespaces-to-define-the-use-case-inputs-and-outputs) · _CHORE_ · `to TEST`
- [ ] `INFRA-089` [Validate input parameters and throw exception if wrong for 401.](https://trello.com/c/Xwl2ivG8/1055-chore-validate-input-parameters-and-throw-exception-if-wrong-for-401) · _CHORE_ · `to TEST`
- [ ] `INFRA-090` [Update the resulting link for mining operations space location.](https://trello.com/c/vmBruNfM/1112-fix-update-the-resulting-link-for-mining-operations-space-location) · _FIX_ · `to TEST`

## Login & authentication

### To do (19)

- [ ] `INFRA-091` [Replace the input for Credential entities. It should be a POJO that can be transformed into an entity.](https://trello.com/c/xlLyBO5z/336-replace-the-input-for-credential-entities-it-should-be-a-pojo-that-can-be-transformed-into-an-entity) · `BACKLOG`
- [ ] `INFRA-092` [Add a new endpoint to receive Credential data store it on the repository. With that data we can create a JWTToken to be used by the client to authorize next calls.](https://trello.com/c/ohucXkNx/33-authorization-add-a-new-endpoint-to-receive-credential-data-store-it-on-the-repository-with-that-data-we-can-create-a-jwttoken-t) · _AUTHORIZATION_ · `BACKLOG`
- [ ] `INFRA-100` [Upgrade current 'exchangeAuthorizationEntryPoint' to generate the private session structure and return the header token to be used on next calls to retrieve the session owner and be able to resolve the database access.](https://trello.com/c/Azyy2kj7/112-login-upgrade-current-exchangeauthorizationentrypoint-to-generate-the-private-session-structure-and-return-the-header-token-to-b) · _LOGIN_ · `BACKLOG`
- [ ] `INFRA-102` [The selection of the datasource Tranquility or Singularity should be done at the Frontend. The server and scopes should travel with the login request and be used on the credential so there should be no global storage for the datasource since any request should use the data on the database Credential.](https://trello.com/c/Wd00em7z/126-project-the-selection-of-the-datasource-tranquility-or-singularity-should-be-done-at-the-frontend-the-server-and-scopes-should-t) · _PROJECT_ · `BACKLOG`
- [ ] `INFRA-104` [Log all the authentication for Credential process to avoid block development depending on missing authentication data.](https://trello.com/c/B0K2LunH/677-refactor-log-all-the-authentication-for-credential-process-to-avoid-block-development-depending-on-missing-authentication-data) · _REFACTOR_ · `BACKLOG`
- [ ] `INFRA-105` [Replace Credential class name by NeoComCredential because there are interferences with public Angular names.](https://trello.com/c/FouKo784/644-refactor-replace-credential-class-name-by-neocomcredential-because-there-are-interferences-with-public-angular-names) · _REFACTOR_ · `BACKLOG`
- [ ] `INFRA-106` [Review the wired dependencies for Credential required services.](https://trello.com/c/eDOuN54N/691-refactor-review-the-wired-dependencies-for-credential-required-services) · _REFACTOR_ · `BACKLOG`
- [ ] `INFRA-107` [The authentication service should now use the OAuth flow and remove the old authentication code.](https://trello.com/c/JYGJ2HKv/333-refactor-the-authentication-service-should-now-use-the-oauth-flow-and-remove-the-old-authentication-code) · _REFACTOR_ · `BACKLOG`
- [ ] `INFRA-108` [The responses for the token validation and the authentication state are so close that they can be merged into a single class.](https://trello.com/c/ZV0wJAmV/903-refactor-the-responses-for-the-token-validation-and-the-authentication-state-are-so-close-that-they-can-be-merged-into-a-single) · _REFACTOR_ · `BACKLOG`
- [ ] `INFRA-109` [Add the delete all Credentials support endpoint.](https://trello.com/c/zP0FDFus/314-support-add-the-delete-all-credentials-support-endpoint) · _SUPPORT_ · `BACKLOG`

### In progress (1)

- [~] `INFRA-110` [New Authorization token refresh flow.](https://trello.com/c/APeF40bB/1128-epic-027-new-authorization-token-refresh-flow) · _EPIC-0.27_ · `WIP-P`

### In testing (2)

- [ ] `INFRA-111` [Expand the callback link for ESI authentication into a list of editable or configurable elements.](https://trello.com/c/CBpGtttO/1069-chore-expand-the-callback-link-for-esi-authentication-into-a-list-of-editable-or-configurable-elements) · _CHORE_ · `to TEST`
- [ ] `INFRA-112` [Replace the current login URL definition for other that is more suitable fro ESI data.](https://trello.com/c/yf7K9CoM/1071-chore-replace-the-current-login-url-definition-for-other-that-is-more-suitable-fro-esi-data) · _CHORE_ · `to TEST`

## Infrastructure & build

### To do (16)

- [ ] `INFRA-115` [Resolve unmanaged dependencies.](https://trello.com/c/FrTmECHp/232-heroku-resolve-unmanaged-dependencies) · _HEROKU_ · `BACKLOG`
- [ ] `INFRA-117` [Start to develop a deployment process for already compiled and prepared code to deply the first Production version to the public. There should be no compilation because some modules and libraries are not available outside IntelliJ. Also it should only contain backend or frontend code. No single app at this time.](https://trello.com/c/w8n7DG36/525-heroku-start-to-develop-a-deployment-process-for-already-compiled-and-prepared-code-to-deply-the-first-production-version-to-the) · _HEROKU_ · `BACKLOG`
- [ ] `INFRA-119` [Deploy Backend on Docker and try to get it on Kubernetes.](https://trello.com/c/jheBOkE6/1085-project-deploy-backend-on-docker-and-try-to-get-it-on-kubernetes) · _PROJECT_ · `MPV-Prepare`
- [ ] `INFRA-120` [Deploy the Frontend and the Java Backend to Kubernetes for a first Stage full version.](https://trello.com/c/HOP9xVbP/1061-project-deploy-the-frontend-and-the-java-backend-to-kubernetes-for-a-first-stage-full-version) · _PROJECT_ · `MPV-Prepare`
- [ ] `INFRA-121` [Deploy the Java backend to Docker for Stage.](https://trello.com/c/M9u51sBc/1062-project-deploy-the-java-backend-to-docker-for-stage) · _PROJECT_ · `MPV-Prepare`
- [ ] `INFRA-122` [Normalise again the endpoint urls. There should be a differentiation by backend service and the difference by version.](https://trello.com/c/O0ryqk09/1141-project-normalise-again-the-endpoint-urls-there-should-be-a-differentiation-by-backend-service-and-the-difference-by-version) · _PROJECT_ · `MPV-Prepare`
- [ ] `INFRA-123` [Replace the BitBucket pipelines by a CircleCI CD implementation.](https://trello.com/c/PlM6BJ5R/571-project-replace-the-bitbucket-pipelines-by-a-circleci-cd-implementation) · _PROJECT_ · `BACKLOG`
- [ ] `INFRA-124` [To avoid problems with containers and docker or Kubernetes, the locahost name is not allowed. Use a neocom name for referencing.](https://trello.com/c/8NCS7sD2/1065-project-to-avoid-problems-with-containers-and-docker-or-kubernetes-the-locahost-name-is-not-allowed-use-a-neocom-name-for-refere) · _PROJECT_ · `MPV-Prepare`
- [ ] `INFRA-125` [Update frontend application package dependencies.](https://trello.com/c/aR61dWgc/1027-project-update-frontend-application-package-dependencies) · _PROJECT_ · `MPV-Prepare`
- [ ] `INFRA-126` [Check and configure docker for the NeoCom project.](https://trello.com/c/ByeomwA7/965-projectcheck-and-configure-docker-for-the-neocom-project) · _PROJECT_ · `BACKLOG`
- [ ] `INFRA-127` [Remove version from DTO objects since dot versioning should be disallowed.](https://trello.com/c/fZUAmkC0/1107-refactor-remove-version-from-dto-objects-since-dot-versioning-should-be-disallowed) · _REFACTOR_ · `MPV-Prepare`
- [ ] `INFRA-128` [Replace the Notifications module by the most used ngx that is compatible to all Angular versions.](https://trello.com/c/TqOWFOM2/570-refactor-replace-the-notifications-module-by-the-most-used-ngx-that-is-compatible-to-all-angular-versions) · _REFACTOR_ · `BACKLOG`

### In testing (4)

- [ ] `INFRA-129` [Add CI to the current project state under CircleCI. Stop deployment.](https://trello.com/c/tqtEu0GZ/1044-project-add-ci-to-the-current-project-state-under-circleci-stop-deployment) · _PROJECT_ · `to TEST`
- [ ] `INFRA-130` [Automate the deployment process on the local Kubernetes.](https://trello.com/c/WN9479vp/1052-project-automate-the-deployment-process-on-the-local-kubernetes) · _PROJECT_ · `to TEST`
- [ ] `INFRA-131` [Evaluate TeamCity on local as the CI/CD tool to create deployments in local.](https://trello.com/c/zoDjbtPo/1054-project-evaluate-teamcity-on-local-as-the-ci-cd-tool-to-create-deployments-in-local) · _PROJECT_ · `to TEST`
- [ ] `INFRA-132` [Research the build pattern on Typescript.](https://trello.com/c/rM883omH/1060-research-research-the-build-pattern-on-typescript) · _RESEARCH_ · `to TEST`

## Industry & fittings

### To do (17)

- [ ] `INFRA-133` [Add the code to download and process the corporation ship building yards. This requires new classes.](https://trello.com/c/gMXn9bIX/579-add-the-code-to-download-and-process-the-corporation-ship-building-yards-this-requires-new-classes) · `BACKLOG`
- [ ] `INFRA-134` [Add the hull type name to the box where we show the fitting information.](https://trello.com/c/0vgKQ8IS/633-add-the-hull-type-name-to-the-box-where-we-show-the-fitting-information) · `BACKLOG`
- [ ] `INFRA-135` [Aggregate identical items while processing the elements that compose a Fitting.](https://trello.com/c/2nEKLWCY/635-aggregate-identical-items-while-processing-the-elements-that-compose-a-fitting) · `BACKLOG`
- [ ] `INFRA-136` [Once we have the buy location identifier we can create the logistic records to move items from the buy location to the manufacture location.](https://trello.com/c/OsD8pPGa/634-once-we-have-the-buy-location-identifier-we-can-create-the-logistic-records-to-move-items-from-the-buy-location-to-the-manufactu) · `BACKLOG`
- [ ] `INFRA-137` [Order the fitting categories alphabetically.](https://trello.com/c/LUdsLvCm/623-order-the-fitting-categories-alphabetically) · `BACKLOG`
- [ ] `INFRA-138` [The items to be bought or manufactured should be multiplied by the number of copies requested.](https://trello.com/c/YR4w0kZq/624-the-items-to-be-bought-or-manufactured-should-be-multiplied-by-the-number-of-copies-requested) · `BACKLOG`
- [ ] `INFRA-139` [To the list of items required for the manufacturing job we should have to remove all the items already available at the ship construction yard.](https://trello.com/c/KzEs0wAe/626-to-the-list-of-items-required-for-the-manufacturing-job-we-should-have-to-remove-all-the-items-already-available-at-the-ship-con) · `BACKLOG`
- [ ] `INFRA-140` [Generate a test page to show all the Containers and their names/locations. This is most important to be able to select one of them as the startpoint for Corporation industry jobs.](https://trello.com/c/xsHeKd9b/125-poc-generate-a-test-page-to-show-all-the-containers-and-their-names-locations-this-is-most-important-to-be-able-to-select-one-of) · _POC_ · `BACKLOG`
- [ ] `INFRA-142` [Once the Fitting is set onto the right place change to a green border as the final card. Test anumations to see if color change can be animated.](https://trello.com/c/rntJ9BBa/146-poccorporation-job-once-the-fitting-is-set-onto-the-right-place-change-to-a-green-border-as-the-final-card-test-anumations-to-se) · _POC · CORPORATION JOB_ · `BACKLOG`
- [ ] `INFRA-144` [Once the job is completed and the data is set up we can show the launch button to start the database registration and processing.](https://trello.com/c/GFUnz8Cl/144-poccorporation-job-once-the-job-is-completed-and-the-data-is-set-up-we-can-show-the-launch-button-to-start-the-database-registra) · _POC · CORPORATION JOB_ · `BACKLOG`
- [ ] `INFRA-146` [Start configuring the Corporation Job page following the latest code improvements. Allow drag & drop functionalities to compose the Job Request.](https://trello.com/c/f2wyV4JT/130-poccorporation-job-start-configuring-the-corporation-job-page-following-the-latest-code-improvements-allow-drag-drop-functionali) · _POC · CORPORATION JOB_ · `BACKLOG`
- [ ] `INFRA-148` [Industry group and hull groups are both enumerated and constants so they should be represented in uppercase.](https://trello.com/c/HUkAi70r/681-refactor-industry-group-and-hull-groups-are-both-enumerated-and-constants-so-they-should-be-represented-in-uppercase) · _REFACTOR_ · `BACKLOG`
- [ ] `INFRA-149` [New dependency isolation requires a complete new set of domain classes and node components. Start creating them on the Industry branch and lates generalize the code](https://trello.com/c/0QQu6StV/794-refactor-new-dependency-isolation-requires-a-complete-new-set-of-domain-classes-and-node-components-start-creating-them-on-the-i) · _REFACTOR_ · `BACKLOG`

## Refactoring

### To do (14)

- [ ] `INFRA-150` [Axios does not create instances but applies interfaces. Check the possibility to replace classes by interfaces at the DTO level. That will reactivate openapi automatic generation.](https://trello.com/c/ZQSW2EMl/1132-refactor-axios-does-not-create-instances-but-applies-interfaces-check-the-possibility-to-replace-classes-by-interfaces-at-the-dt) · _REFACTOR_ · `MPV-Prepare`
- [ ] `INFRA-151` [Check if the OnInit of parent classes is executed if the current component has not one.](https://trello.com/c/08x3Z8GP/829-refactor-check-if-the-oninit-of-parent-classes-is-executed-if-the-current-component-has-not-one) · _REFACTOR_ · `BACKLOG`
- [ ] `INFRA-152` [Check the reason why the 'accessDecodedPayload' has an error as parameter.](https://trello.com/c/vrrydxKi/676-refactor-check-the-reason-why-the-accessdecodedpayload-has-an-error-as-parameter) · _REFACTOR_ · `BACKLOG`
- [ ] `INFRA-153` [Copy the Axios response to the adapter global state so it can be checked on caller if required.](https://trello.com/c/qAkz98Nx/1131-refactor-copy-the-axios-response-to-the-adapter-global-state-so-it-can-be-checked-on-caller-if-required) · _REFACTOR_ · `MPV-Prepare`
- [ ] `INFRA-154` [Normalize the object creation by passing the object composer to the root of the hierarchy. So all instances remove the Object.assign](https://trello.com/c/bbktcxr1/795-refactor-normalize-the-object-creation-by-passing-the-object-composer-to-the-root-of-the-hierarchy-so-all-instances-remove-the-o) · _REFACTOR_ · `BACKLOG`
- [ ] `INFRA-155` [Remove the dependency from EVariants on the public interface. Variants are generated at the project level but used as strings on all api calls.](https://trello.com/c/cc8BxoHw/708-refactor-remove-the-dependency-from-evariants-on-the-public-interface-variants-are-generated-at-the-project-level-but-used-as-st) · _REFACTOR_ · `BACKLOG`
- [ ] `INFRA-156` [Replace environment constants that cannot change between run stages by their references on the 'platform-constants'.](https://trello.com/c/kXSwy0VM/843-refactor-replace-environment-constants-that-cannot-change-between-run-stages-by-their-references-on-the-platform-constants) · _REFACTOR_ · `BACKLOG`
- [ ] `INFRA-157` [Replace multiple scenario features by independent files each one with an scenario to allow selective execution.](https://trello.com/c/XRffgI0U/607-refactor-replace-multiple-scenario-features-by-independent-files-each-one-with-an-scenario-to-allow-selective-execution) · _REFACTOR_ · `BACKLOG`
- [ ] `INFRA-158` [Replace the application font by the Open Sans font that should be applied to all items but some fields.](https://trello.com/c/FSvRUdRe/578-refactor-replace-the-application-font-by-the-open-sans-font-that-should-be-applied-to-all-items-but-some-fields) · _REFACTOR_ · `BACKLOG`
- [ ] `INFRA-159` [Replace the environment variables by the new platform global variables.](https://trello.com/c/h2mvBbiY/640-refactor-replace-the-environment-variables-by-the-new-platform-global-variables) · _REFACTOR_ · `BACKLOG`
- [ ] `INFRA-160` [Research classes that are suitable to be reused on all environments and projects.](https://trello.com/c/eHRs0wkd/1092-refactor-research-classes-that-are-suitable-to-be-reused-on-all-environments-and-projects) · _REFACTOR_ · `MPV-Prepare`
- [ ] `INFRA-161` [Set the class names to the correct suffix DTO](https://trello.com/c/lUlnlPwy/727-refactor-set-the-class-names-to-the-correct-suffix-dto) · _REFACTOR_ · `BACKLOG`
- [ ] `INFRA-162` [The Feature Dock should be a component configurable with the file that contains the feature definitions.](https://trello.com/c/2vcxniMI/952-refactor-the-feature-dock-should-be-a-component-configurable-with-the-file-that-contains-the-feature-definitions) · _REFACTOR_ · `BACKLOG`
- [ ] `INFRA-163` [Unify the platform constants into a single file. There should not be differences on the different environments. Merge the constants from the 'environment' so env files have data that depend on the running env and NeoComConstants what is constant.](https://trello.com/c/vx2Yu8sP/1079-refactor-unify-the-platform-constants-into-a-single-file-there-should-not-be-differences-on-the-different-environments-merge-the) · _REFACTOR_ · `MPV-Prepare`

### In progress (2)

- [~] `INFRA-164` [Implement a better LogWrapper that does not fail while processing stack traces.](https://trello.com/c/bClfAcZ9/1147-refactor-implement-a-better-logwrapper-that-does-not-fail-while-processing-stack-traces) · _REFACTOR_ · `WIP-P`
- [~] `INFRA-165` [NIN. Check the response from Axios and reject the request if the result is a string. This is a parse error that should be fixed.](https://trello.com/c/gP9xvUU6/1130-refactor-nin-check-the-response-from-axios-and-reject-the-request-if-the-result-is-a-string-this-is-a-parse-error-that-should-be) · _REFACTOR_ · `WIP-P`

## Testing

### To do (10)

- [ ] `INFRA-166` [Prepare the backend project to be deployed on the Heroku server. Check all tests and code review supplied by Sonar to comply with most of the production requirements.](https://trello.com/c/PxIBTFDZ/748-ci-prepare-the-backend-project-to-be-deployed-on-the-heroku-server-check-all-tests-and-code-review-supplied-by-sonar-to-comply-w) · _CI_ · `BACKLOG`
- [ ] `INFRA-167` [Document the API contracts so there can be automated tests to validate the compatibility across applications.](https://trello.com/c/yOeTg5sX/246-documentation-document-the-api-contracts-so-there-can-be-automated-tests-to-validate-the-compatibility-across-applications) · _DOCUMENTATION_ · `BACKLOG`
- [ ] `INFRA-169` [Activate code coverage for Nest application.](https://trello.com/c/hnOCEGmK/1096-project-activate-code-coverage-for-nest-application) · _PROJECT_ · `MPV-Prepare`
- [ ] `INFRA-170` [Move ApiSimulator page responses from ApiSimulator to WireMock to understand better the matches and the general behaviour.](https://trello.com/c/EewUTlxz/1076-project-move-apisimulator-page-responses-from-apisimulator-to-wiremock-to-understand-better-the-matches-and-the-general-behaviou) · _PROJECT_ · `MPV-Prepare`
- [ ] `INFRA-171` [Setup a automatic test platform so every commit is checked and tested. Use PR to validate end to end tests.](https://trello.com/c/nVoQLHja/1108-project-setup-a-automatic-test-platform-so-every-commit-is-checked-and-tested-use-pr-to-validate-end-to-end-tests) · _PROJECT_ · `MPV-Prepare`
- [ ] `INFRA-172` [Start to control project code coverage. Research if we can use Sonar for all the pieces.](https://trello.com/c/lHsOG411/1094-project-start-to-control-project-code-coverage-research-if-we-can-use-sonar-for-all-the-pieces) · _PROJECT_ · `MPV-Prepare`
- [ ] `INFRA-173` [Upgrade npm scripts to prepare the environment for testing being no intrusive.](https://trello.com/c/EXpZO2pZ/1033-project-upgrade-npm-scripts-to-prepare-the-environment-for-testing-being-no-intrusive) · _PROJECT_ · `MPV-Prepare`
- [ ] `INFRA-174` [Create a new Angular project for the latest version and add to it the common testing libraries](https://trello.com/c/WA38JC0Z/978-projectcreate-a-new-angular-project-for-the-latest-version-and-add-to-it-the-common-testing-libraries) · _PROJECT_ · `BACKLOG`
- [ ] `INFRA-175` [Install the mock server and start it on docker.](https://trello.com/c/OgfCIOus/964-projectinstall-the-mock-server-and-start-it-on-docker) · _PROJECT_ · `BACKLOG`

### In testing (3)

- [ ] `INFRA-176` [Check if it is possible to move cypress configuration to the NeoCom Frontend project so dependencies can remove duplications.](https://trello.com/c/ejfg51lC/1032-project-check-if-it-is-possible-to-move-cypress-configuration-to-the-neocom-frontend-project-so-dependencies-can-remove-duplicat) · _PROJECT_ · `to TEST`
- [ ] `INFRA-177` [Check that a service can be accessed from the host and that the pods can access the host mocks.](https://trello.com/c/HBxhaN9c/1051-project-check-that-a-service-can-be-accessed-from-the-host-and-that-the-pods-can-access-the-host-mocks) · _PROJECT_ · `to TEST`
- [ ] `INFRA-178` [Organise cypress files to use NeoCom if possible to reduce duplicates.](https://trello.com/c/GTwBtPLL/1031-project-organise-cypress-files-to-use-neocom-if-possible-to-reduce-duplicates) · _PROJECT_ · `to TEST`

## Bugs & fixes

### To do (8)

- [ ] `INFRA-184` [NIB date and schedule date is set to GMT time.](https://trello.com/c/IS7zIG3B/1121-fix-nib-date-and-schedule-date-is-set-to-gmt-time) · _FIX_ · `MPV-Prepare`
- [ ] `INFRA-185` [The TypedRequest interface should be reviewed and published on neocon-shared.](https://trello.com/c/hSS0Hkt1/1126-fix-the-typedrequest-interface-should-be-reviewed-and-published-on-neocon-shared) · _FIX_ · `MPV-Prepare`

## ESI integration

### To do (4)

- [ ] `INFRA-187` [Use the Singularity for the mock configuration and ESI mocked data server.](https://trello.com/c/tm2Imxem/184-configuration-use-the-singularity-for-the-mock-configuration-and-esi-mocked-data-server) · _CONFIGURATION_ · `BACKLOG`
- [ ] `INFRA-189` [Complete base documentation about the elements already designed and document on each class the responsibility that implements.](https://trello.com/c/uhZiMY1q/1013-doc-complete-base-documentation-about-the-elements-already-designed-and-document-on-each-class-the-responsibility-that-implement) · _DOC_ · `BACKLOG`
- [ ] `INFRA-190` [Add caching to Nest backend to speed up all the requests that should be cached as ESI caches their responses.](https://trello.com/c/gUp0Cuzz/1100-project-add-caching-to-nest-backend-to-speed-up-all-the-requests-that-should-be-cached-as-esi-caches-their-responses) · _PROJECT_ · `MPV-Prepare`

### In progress (1)

- [~] `INFRA-191` [Make EsiType compatible between the NIB and NIF implementations.](https://trello.com/c/TPpAFyts/1139-story-project-make-esitype-compatible-between-the-nib-and-nif-implementations) · _STORY-PROJECT_ · `WIP-P`

### In testing (3)

- [ ] `INFRA-192` [Fix the callback url when authenticating to ESI.](https://trello.com/c/IWmKGsu6/1067-fix-fix-the-callback-url-when-authenticating-to-esi) · _FIX_ · `to TEST`
- [ ] `INFRA-193` [Create a new mock service using WireMockResponse for ESI mocking.](https://trello.com/c/MaWi0ywc/1029-project-create-a-new-mock-service-using-wiremockresponse-for-esi-mocking) · _PROJECT_ · `to TEST`
- [ ] `INFRA-194` [Create a shared library with the ESI domain classes. This is shared on the frontend and the nest backend.](https://trello.com/c/BTvA6e0C/1028-project-create-a-shared-library-with-the-esi-domain-classes-this-is-shared-on-the-frontend-and-the-nest-backend) · _PROJECT_ · `to TEST`

## Documentation

### To do (6)

- [ ] `INFRA-195` [Document the api segments and update the api. Create the documents to be visible on a browser.](https://trello.com/c/4UmXHg0Z/1120-documentation-document-the-api-segments-and-update-the-api-create-the-documents-to-be-visible-on-a-browser) · _DOCUMENTATION_ · `MPV-Prepare`
- [ ] `INFRA-196` [Document the frontend application navigation map.](https://trello.com/c/8kPDUHIH/249-documentation-document-the-frontend-application-navigation-map) · _DOCUMENTATION_ · `BACKLOG`
- [ ] `INFRA-198` [Move a documentation file from the obsolete Documentation folder to the project wiki.](https://trello.com/c/t4kywbmH/199-documentation-move-a-documentation-file-from-the-obsolete-documentation-folder-to-the-project-wiki) · _DOCUMENTATION_ · `BACKLOG`
- [ ] `INFRA-200` [Add a job to generate the project and modules documentation so there is a place where to read each component usage.](https://trello.com/c/DHUlGRly/820-project-add-a-job-to-generate-the-project-and-modules-documentation-so-there-is-a-place-where-to-read-each-component-usage) · _PROJECT_ · `BACKLOG`

## Domain models

### To do (3)

- [ ] `INFRA-201` [Document the deployment process and the branch model.](https://trello.com/c/Zi1kiyKl/1119-documentation-document-the-deployment-process-and-the-branch-model) · _DOCUMENTATION_ · `MPV-Prepare`
- [ ] `INFRA-202` [Fix the command to generate the Esi model form OpenApi spec and to add it automatically to NIN.](https://trello.com/c/ua6lUp1S/1088-project-fix-the-command-to-generate-the-esi-model-form-openapi-spec-and-to-add-it-automatically-to-nin) · _PROJECT_ · `MPV-Prepare`
- [ ] `INFRA-203` [Reconfigure the neoitem service to use the local springboot admin server until the production server is ready.](https://trello.com/c/yHBuxy1x/628-project-reconfigure-the-neoitem-service-to-use-the-local-springboot-admin-server-until-the-production-server-is-ready) · _PROJECT_ · `BACKLOG`

### In testing (1)

- [ ] `INFRA-204` [Create aggregated data models for the EsiType and complementaty data.](https://trello.com/c/rEKrHmxP/1104-epic-022-create-aggregated-data-models-for-the-esitype-and-complementaty-data) · _EPIC-0.22_ · `to TEST`

## Pilot & character

### To do (3)

- [ ] `INFRA-205` [Add the endpoint to retrieve the list of daily mining extractions for an identifier. That identifier can be the extractions for a pilot or for a corporation (this later has the persister not implemented).](https://trello.com/c/Ct2yaEBY/52-mining-add-the-endpoint-to-retrieve-the-list-of-daily-mining-extractions-for-an-identifier-that-identifier-can-be-the-extraction) · _MINING_ · `BACKLOG`
- [ ] `INFRA-206` [Create unique identifiers for the selected planet to allow the use of the same planet more than one time (used in different characters)](https://trello.com/c/KPaYFL3a/756-planetary-create-unique-identifiers-for-the-selected-planet-to-allow-the-use-of-the-same-planet-more-than-one-time-used-in-diffe) · _PLANETARY_ · `BACKLOG`
- [ ] `INFRA-207` [Replace cache dependencies by local token storage dependencies. This starts with the Pilot and the Corporation but this is enough for searching the rest of the data that now comes in HAL format.](https://trello.com/c/9JgcNquB/649-refactor-replace-cache-dependencies-by-local-token-storage-dependencies-this-starts-with-the-pilot-and-the-corporation-but-this) · _REFACTOR_ · `BACKLOG`

## Assets

### To do (3)

- [ ] `INFRA-208` [To be able to select a ship construction yard we should advance two features. The first is the corporation preferences section and the other is the corporation premises for assets.](https://trello.com/c/G3zKwDKS/587-to-be-able-to-select-a-ship-construction-yard-we-should-advance-two-features-the-first-is-the-corporation-preferences-section-an) · `BACKLOG`
- [ ] `INFRA-209` [Create a mock service to provide Eve Assets.](https://trello.com/c/8j62RdPK/961-projectcreate-a-mock-service-to-provide-eve-assets) · _PROJECT_ · `BACKLOG`
- [ ] `INFRA-210` [Generate 3 snapshots of assets with increasing mining](https://trello.com/c/SxfSIPy0/958-projectgenerate-3-snapshots-of-assets-with-increasing-mining) · _PROJECT_ · `BACKLOG`

## Market

### To do (2)

- [ ] `INFRA-211` [Add the hub buy location. Hubs are a preselected set of systems for price search.](https://trello.com/c/8JsFBxZk/632-add-the-hub-buy-location-hubs-are-a-preselected-set-of-systems-for-price-search) · `BACKLOG`
- [ ] `INFRA-212` [Blueprints should not have prices since they usually are not seen on markets. Also remove the market data access.](https://trello.com/c/LyYd12jq/941-refactor-blueprints-should-not-have-prices-since-they-usually-are-not-seen-on-markets-also-remove-the-market-data-access) · _REFACTOR_ · `BACKLOG`

## Planetary

### To do (2)

- [ ] `INFRA-213` [Replace the planet database entry by a simple definition where the planet data is expressed as a simple list with the resource level values. Resource type can be inferred from the planet type.](https://trello.com/c/zXOqA8Hz/753-planetary-replace-the-planet-database-entry-by-a-simple-definition-where-the-planet-data-is-expressed-as-a-simple-list-with-the) · _PLANETARY_ · `BACKLOG`
- [ ] `INFRA-214` [When a resource is selected the planet and the resources of the same type are disabled](https://trello.com/c/Rtf3x1bc/754-planetary-when-a-resource-is-selected-the-planet-and-the-resources-of-the-same-type-are-disabled) · _PLANETARY_ · `BACKLOG`

## Universe & locations

### To do (1)

- [ ] `INFRA-215` [Get from other projects one solution to the representation for the ship production yard location.](https://trello.com/c/hjlMkAGN/627-research-get-from-other-projects-one-solution-to-the-representation-for-the-ship-production-yard-location) · _RESEARCH_ · `BACKLOG`
