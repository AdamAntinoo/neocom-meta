# Executive actions — BACK

> Backend service (neocom-back) — NestJS/API, ESI adapters, schedulers (NIN/NIB/NEST/STORY-NIN).
> 268 open action(s) across 16 feature(s) · generated 2026-10-30 · source: Trello board `neocom-infinity` (L0).

| Feature                | To do | In progress | Testing | Total |
| ---------------------- | ----- | ----------- | ------- | ----- |
| Login & authentication | 49    | 1           | 1       | 51    |
| Data & persistence     | 42    | 0           | 0       | 42    |
| General                | 30    | 2           | 1       | 33    |
| Testing                | 29    | 0           | 0       | 29    |
| Mining                 | 19    | 0           | 4       | 23    |
| Pilot & character      | 18    | 0           | 1       | 19    |
| Assets                 | 14    | 0           | 0       | 14    |
| Industry & fittings    | 14    | 0           | 0       | 14    |
| Universe & locations   | 11    | 0           | 2       | 13    |
| ESI integration        | 9     | 0           | 0       | 9     |
| Bugs & fixes           | 6     | 0           | 0       | 6     |
| Infrastructure & build | 5     | 0           | 0       | 5     |
| Market                 | 4     | 0           | 0       | 4     |
| Refactoring            | 3     | 0           | 0       | 3     |
| Documentation          | 2     | 0           | 0       | 2     |
| Domain models          | 1     | 0           | 0       | 1     |

## Login & authentication

### To do (49)

- [ ] `BACK-001` [Update the documentation for the authentication endpoints.](https://trello.com/c/sYNdUYXt/904-api-update-the-documentation-for-the-authentication-endpoints) · _API_ · `BACKLOG`
- [ ] `BACK-002` [Access to the Credential is allowed on authenticated services and that access should not interfere with the REST authentication. So the Credential should come from the service injection but not from the authentication.](https://trello.com/c/ClQOfGqI/915-backend-access-to-the-credential-is-allowed-on-authenticated-services-and-that-access-should-not-interfere-with-the-rest-authent) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-003` [Activate the logging for authorization data so I can detect failures on the authentication headers and contents.](https://trello.com/c/7rwE1gUP/252-backend-activate-the-logging-for-authorization-data-so-i-can-detect-failures-on-the-authentication-headers-and-contents) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-005` [Add a new option to dump the list of session on every save cycle after a complete save.](https://trello.com/c/dMcL0sBQ/131-backend-add-a-new-option-to-dump-the-list-of-session-on-every-save-cycle-after-a-complete-save) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-007` [Add session management so once authenticated the validation token has a validity time. Because the JWT token should travel from the client probably we should not have to store any data because that information will come.](https://trello.com/c/Iks7U4Rx/195-backend-add-session-management-so-once-authenticated-the-validation-token-has-a-validity-time-because-the-jwt-token-should-trave) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-009` [Check the scheduler initialization and loading of tasks. Use a configuration repository to detectt the tasks to start for a Credential.](https://trello.com/c/QDnAg5Yc/737-backend-check-the-scheduler-initialization-and-loading-of-tasks-use-a-configuration-repository-to-detectt-the-tasks-to-start-for) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-010` [Create the service to get the Credential from the authentication token.](https://trello.com/c/OMqQDD4i/279-backend-create-the-service-to-get-the-credential-from-the-authentication-token) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-012` [Extend the authentication to store my own elements and not generic objects.](https://trello.com/c/bXHMtXK5/221-backend-extend-the-authentication-to-store-my-own-elements-and-not-generic-objects) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-014` [On the file input/output exceptions intercepted when processing the session show the complete message the be able to identify the problem. Most of the time is related to Serialization.](https://trello.com/c/gItQyM8N/135-backend-on-the-file-input-output-exceptions-intercepted-when-processing-the-session-show-the-complete-message-the-be-able-to-ide) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-016` [PilotV2 is not seriaizable since it has swagger elements that are not in control. To allow to put this data into the session I should do a complete test and trim of the PilotV2 class serialization.](https://trello.com/c/bkDSCGJ8/128-backend-pilotv2-is-not-seriaizable-since-it-has-swagger-elements-that-are-not-in-control-to-allow-to-put-this-data-into-the-sess) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-018` [The additional credential fields should be populated before the credential is stored on the validation response.](https://trello.com/c/4bawx5JU/247-backend-the-additional-credential-fields-should-be-populated-before-the-credential-is-stored-on-the-validation-response) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-020` [The allowed scopes come from the character validation. Store them on the Credential to be used on the retrofit calls.](https://trello.com/c/HPG1TdAG/222-backend-the-allowed-scopes-come-from-the-character-validation-store-them-on-the-credential-to-be-used-on-the-retrofit-calls) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-022` [The download of Corporation assets can me moved to the general downloader. The Credential to be used should be the one for the CEO if this pilot is available on the credential database.](https://trello.com/c/IJIQSl3Z/127-backend-the-download-of-corporation-assets-can-me-moved-to-the-general-downloader-the-credential-to-be-used-should-be-the-one-fo) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-024` [When a Credential is created the additional fields are not updated until a time consuming set of calls is completed. On authentication none of that data is used but schedule an update of such fields asap.](https://trello.com/c/4G2PbyWY/78-backend-when-a-credential-is-created-the-additional-fields-are-not-updated-until-a-time-consuming-set-of-calls-is-completed-on-a) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-029` [Move the test cache and data directories to the build directory to be out of the project scope.](https://trello.com/c/Ixnv6NEf/670-backendrefactor-move-the-test-cache-and-data-directories-to-the-build-directory-to-be-out-of-the-project-scope) · _BACKEND · REFACTOR_ · `BACKLOG`
- [ ] `BACK-031` [Check if the ESI authentication token is available at the frontend.](https://trello.com/c/ZhayyqmP/1117-fix-check-if-the-esi-authentication-token-is-available-at-the-frontend) · _FIX_ · `MPV-Prepare`
- [ ] `BACK-032` [There is a single page out of the authentication scheme. That page is the Login page where the user should start the ESI SSO login authentication to store the credential and get a valid session that allows to progress to the rest of the application. The authenticated session token should go on all backend calls to authorize the access to the resources and help locate the right session data to be used on database access.](https://trello.com/c/v41o8Eoq/99-login-there-is-a-single-page-out-of-the-authentication-scheme-that-page-is-the-login-page-where-the-user-should-start-the-esi-ss) · _LOGIN_ · `BACKLOG`
- [ ] `BACK-034` [Validate and store a new external Credential at the repository.](https://trello.com/c/HusP0bCi/37-nib0103-validate-and-store-a-new-external-credential-at-the-repository) · _NIB01.03_ · `BACKLOG`
- [ ] `BACK-035` [Validate that an existing Credential is updated with the new data.](https://trello.com/c/EDt93Qjr/36-nib0104-validate-that-an-existing-credential-is-updated-with-the-new-data) · _NIB01.04_ · `BACKLOG`
- [ ] `BACK-036` [When the result for the validation is VALID then check for the JWT token and the Credential data.](https://trello.com/c/b4379kVS/901-nib0109-when-the-result-for-the-validation-is-valid-then-check-for-the-jwt-token-and-the-credential-data) · _NIB01.09_ · `BACKLOG`
- [ ] `BACK-037` [When authenticating a Pilot a Credential and a Corporation are persisted.](https://trello.com/c/pwAtHtFp/671-nib0201-when-authenticating-a-pilot-a-credential-and-a-corporation-are-persisted) · _NIB02.01_ · `BACKLOG`
- [ ] `BACK-038` [The pilot authentication fails so the result is the expected exception.](https://trello.com/c/1tVHILUD/283-nib0602-the-pilot-authentication-fails-so-the-result-is-the-expected-exception) · _NIB06.02_ · `BACKLOG`
- [ ] `BACK-040` [Every scheduler cycle there is a cycle that will scan the list of Credentials and the generate the list of jobs     that should be registered for that credential. Then that list of jobs gets registered on the JobScheduler.](https://trello.com/c/rDCTWO0j/319-nib0802-every-scheduler-cycle-there-is-a-cycle-that-will-scan-the-list-of-credentials-and-the-generate-the-list-of-jobs-that-sho) · _NIB08.02_ · `BACKLOG`
- [ ] `BACK-041` [Credential sharing between different applications is not possible because the client/secret/callback are not the same. To be able to complete the Credential synchronization feature the backends should be able to identify the application and use the right set of properties. Also it should generate an specific retrofit for that credential/client pair.](https://trello.com/c/ISqD4yVF/332-oauth-credential-sharing-between-different-applications-is-not-possible-because-the-client-secret-callback-are-not-the-same-to-b) · _OAUTH_ · `BACKLOG`
- [ ] `BACK-042` [The authentication required list of scopes comes from the first login call. This is the place where the list of scopes should be read and processed.](https://trello.com/c/nx9UoXc5/331-oauth-the-authentication-required-list-of-scopes-comes-from-the-first-login-call-this-is-the-place-where-the-list-of-scopes-shou) · _OAUTH_ · `BACKLOG`
- [ ] `BACK-043` [Activate the credential creation and setup any mock that is required for backend isolation.](https://trello.com/c/zZUCvpXq/55-refactor-activate-the-credential-creation-and-setup-any-mock-that-is-required-for-backend-isolation) · _REFACTOR_ · `BACKLOG`
- [ ] `BACK-044` [Use the Credential data loader to check for real sizes like the scope when all privileges are activated.](https://trello.com/c/7lVEKGQv/668-refactorbackend-use-the-credential-data-loader-to-check-for-real-sizes-like-the-scope-when-all-privileges-are-activated) · _REFACTOR · BACKEND_ · `BACKLOG`
- [ ] `BACK-045` [Use new synchronized credentials to start mining data retrieval periodically and store delta information on the repository for easy client use.](https://trello.com/c/IM7qBi8V/34-scheduler-use-new-synchronized-credentials-to-start-mining-data-retrieval-periodically-and-store-delta-information-on-the-reposi) · _SCHEDULER_ · `BACKLOG`
- [ ] `BACK-046` [Define the state for the production application and the development set. Probably to simplify the code both should be the same. The state starts at the login request button and is verified at the backend.](https://trello.com/c/MyFbhWCk/198-static-define-the-state-for-the-production-application-and-the-development-set-probably-to-simplify-the-code-both-should-be-the) · _STATIC_ · `BACKLOG`
- [ ] `BACK-048` [If the credential is invalid or the valid period has completed then the session is invalidated and the servers responds 'not valid' (401 UNAUTHORIZED)](https://trello.com/c/M7QQC4fl/892-storybackend-if-the-credential-is-invalid-or-the-valid-period-has-completed-then-the-session-is-invalidated-and-the-servers-resp) · _STORY · BACKEND_ · `BACKLOG`
- [ ] `BACK-049` [If the session is not found or there is no secure cookie then the server returns a 'not found' message. (404 NOT FOUND)](https://trello.com/c/4COzDnKL/891-storybackend-if-the-session-is-not-found-or-there-is-no-secure-cookie-then-the-server-returns-a-not-found-message-404-not-found) · _STORY · BACKEND_ · `BACKLOG`

### In progress (1)

- [~] `BACK-050` [Start to replace the use of cookies for authentication and use instead Headers. This will allow to use different characters from the same interface.](https://trello.com/c/C9BfXYOu/1144-story-nib-start-to-replace-the-use-of-cookies-for-authentication-and-use-instead-headers-this-will-allow-to-use-different-charac) · _STORY-NIB_ · `WIP-P`

### In testing (1)

- [ ] `BACK-051` [Add additional privileges to the ESI scope to add the mining operations.](https://trello.com/c/q8x3XlVG/1066-fix-add-additional-privileges-to-the-esi-scope-to-add-the-mining-operations) · _FIX_ · `to TEST`

## Data & persistence

### To do (42)

- [ ] `BACK-052` [The configuration service cannot find the properties if the compilation option is changed from IntelliJ to Gradle.](https://trello.com/c/AEcW8pfG/42-adapter-the-configuration-service-cannot-find-the-properties-if-the-compilation-option-is-changed-from-intellij-to-gradle) · _ADAPTER_ · `BACKLOG`
- [ ] `BACK-053` [Add a validation to check if the database is active and quit the application with a clear message if not.](https://trello.com/c/COCGANrz/285-backend-add-a-validation-to-check-if-the-database-is-active-and-quit-the-application-with-a-clear-message-if-not) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-055` [Add logger interceptors to the backend to generate consistent logs without the need to repeat the code on the entry point.](https://trello.com/c/C7oag7xu/106-backend-add-logger-interceptors-to-the-backend-to-generate-consistent-logs-without-the-need-to-repeat-the-code-on-the-entry-poin) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-057` [Check the version value read from the database instance.](https://trello.com/c/LYWdAS6w/235-backend-check-the-version-value-read-from-the-database-instance) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-059` [Configure a flag to print stack traces for intercepted exceptions at the global interceptor.](https://trello.com/c/yvbJLHjb/74-backend-configure-a-flag-to-print-stack-traces-for-intercepted-exceptions-at-the-global-interceptor) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-060` [Configure the DM library to be able to access the SDE database.](https://trello.com/c/EflXNSZJ/814-backend-configure-the-dm-library-to-be-able-to-access-the-sde-database) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-061` [Control the generation of seed data with runtime properties.](https://trello.com/c/SGYkaqKM/121-backend-control-the-generation-of-seed-data-with-runtime-properties) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-063` [Create a way to dump the configuration to the log output or to a endpoint.](https://trello.com/c/FiaGR1eP/679-backend-create-a-way-to-dump-the-configuration-to-the-log-output-or-to-a-endpoint) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-064` [Create the right serializer to fit the output required by the Frontend.](https://trello.com/c/K0wrTtCk/8-backend-create-the-right-serializer-to-fit-the-output-required-by-the-frontend) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-066` [Exceptions should be separated by their return type so the handler can send the right http return code.](https://trello.com/c/DOdN5jaU/244-backend-exceptions-should-be-separated-by-their-return-type-so-the-handler-can-send-the-right-http-return-code) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-068` [Force a first execution for a job when it is registered on the scheduler queue.](https://trello.com/c/Y2h0ETne/823-backend-force-a-first-execution-for-a-job-when-it-is-registered-on-the-scheduler-queue) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-069` [Intercept output exceptions to replace the 500 return code by the right return code.](https://trello.com/c/USAJUQXZ/224-backend-intercept-output-exceptions-to-replace-the-500-return-code-by-the-right-return-code) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-071` [Reinstall the scheduler configuring the jobs as instances with builders.](https://trello.com/c/ZD2jTGqZ/934-backend-reinstall-the-scheduler-configuring-the-jobs-as-instances-with-builders) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-072` [Removed the JSON codec. Using pure java serialization now that the swagger classes all can be serialized. This removed the exceptions.](https://trello.com/c/Kt8z6EYk/942-backend-removed-the-json-codec-using-pure-java-serialization-now-that-the-swagger-classes-all-can-be-serialized-this-removed-the) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-073` [Replace the database version by a Liquibase setup message that should be changed every schema change.](https://trello.com/c/CRcE2HO3/76-backend-replace-the-database-version-by-a-liquibase-setup-message-that-should-be-changed-every-schema-change) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-074` [Until the read of properties is solved replace them by environment definitions.](https://trello.com/c/mci38DOR/176-backend-until-the-read-of-properties-is-solved-replace-them-by-environment-definitions) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-076` [Use the version to validate initialization correct database availability and configuration.](https://trello.com/c/wncFuCOL/77-backend-use-the-version-to-validate-initialization-correct-database-availability-and-configuration) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-086` [Do the save for the EveTask. It also serializes the item that should be available elsewhere.](https://trello.com/c/lzLZH8bK/143-backendevetask-do-the-save-for-the-evetask-it-also-serializes-the-item-that-should-be-available-elsewhere) · _BACKEND · EVETASK_ · `BACKLOG`
- [ ] `BACK-088` [Add a serializer specific for NullPointer exceptions to locate failured.](https://trello.com/c/LTbdOOXQ/328-exceptions-add-a-serializer-specific-for-nullpointer-exceptions-to-locate-failured) · _EXCEPTIONS_ · `BACKLOG`
- [ ] `BACK-089` [Add the cause to exception serialization.](https://trello.com/c/12lbeNUk/317-exceptions-add-the-cause-to-exception-serialization) · _EXCEPTIONS_ · `BACKLOG`
- [ ] `BACK-090` [Check that the list of scheduler jobs matches the expectations.](https://trello.com/c/QwjBfmdE/45-nib0801-check-that-the-list-of-scheduler-jobs-matches-the-expectations) · _NIB08.01_ · `BACKLOG`
- [ ] `BACK-091` [If the loyalty service configuration is changed then the results also change.](https://trello.com/c/ERy9Raty/880-nib1103-if-the-loyalty-service-configuration-is-changed-then-the-results-also-change) · _NIB11.03_ · `BACKLOG`
- [ ] `BACK-092` [Remove the different levels and caches to access backend data and implement the frontend on a most direct way to access the data when it is necessary.](https://trello.com/c/y3Z7lY1m/647-refactor-remove-the-different-levels-and-caches-to-access-backend-data-and-implement-the-frontend-on-a-most-direct-way-to-access) · _REFACTOR_ · `BACKLOG`
- [ ] `BACK-093` [Create a component that installs at start time and that when run checks for the list of jobs to be generated.](https://trello.com/c/Z3ou3GWN/46-scheduler-create-a-component-that-installs-at-start-time-and-that-when-run-checks-for-the-list-of-jobs-to-be-generated) · _SCHEDULER_ · `BACKLOG`

## General

### To do (30)

- [ ] `BACK-094` [Define the set of States that are valid for the different backend clients and start to verify their values on the request.](https://trello.com/c/Cbqz44Eb/313-define-the-set-of-states-that-are-valid-for-the-different-backend-clients-and-start-to-verify-their-values-on-the-request) · `BACKLOG`
- [ ] `BACK-095` [Add a new job to be executed every hour to download and process blueprints to search for profitable instances.](https://trello.com/c/wLTPoWO5/815-backend-add-a-new-job-to-be-executed-every-hour-to-download-and-process-blueprints-to-search-for-profitable-instances) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-096` [Add endpoint registration log info.](https://trello.com/c/Hm4vQ9UU/253-backend-add-endpoint-registration-log-info) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-098` [Add the health actuator to detect when the application is started.](https://trello.com/c/AS6eaKpU/177-backend-add-the-health-actuator-to-detect-when-the-application-is-started) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-101` [Add the server name to the ServerInfo response at the origin to remove the addition of that data on reception. It is not the client responsibility.](https://trello.com/c/2ZoZTUJO/241-backend-add-the-server-name-to-the-serverinfo-response-at-the-origin-to-remove-the-addition-of-that-data-on-reception-it-is-not) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-103` [Add to the message externalization then format translation to allow the use of parameters.](https://trello.com/c/W8tiBvam/225-backend-add-to-the-message-externalization-then-format-translation-to-allow-the-use-of-parameters) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-105` [Create a component with references to all the services required by any of the Jobs. This way we pass only a single reference and any future change will be available to all jobs without code changes.](https://trello.com/c/q8mNr9wp/935-backend-create-a-component-with-references-to-all-the-services-required-by-any-of-the-jobs-this-way-we-pass-only-a-single-refere) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-106` [Create a function to validate the state. State is a signature validation so we only accept requests from a selected set of clients that set this state.](https://trello.com/c/1e2LBCyA/203-backend-create-a-function-to-validate-the-state-state-is-a-signature-validation-so-we-only-accept-requests-from-a-selected-set-o) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-108` [Generate the valid state code to validate that callers are the authorized callers.](https://trello.com/c/z7Lf9Haf/229-backend-generate-the-valid-state-code-to-validate-that-callers-are-the-authorized-callers) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-110` [Implement the hop calculator and use distances and ship speed to estimate jump time.](https://trello.com/c/GOhqaZtL/712-backend-implement-the-hop-calculator-and-use-distances-and-ship-speed-to-estimate-jump-time) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-111` [Log the exposed endpoints on construction. Probably can use an annotation.](https://trello.com/c/yHFStrdy/175-backend-log-the-exposed-endpoints-on-construction-probably-can-use-an-annotation) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-113` [Log the request input and the response output for all channels.](https://trello.com/c/U5alL9bm/181-backend-log-the-request-input-and-the-response-output-for-all-channels) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-115` [On the MDC filter add the HTTP method to the list of recorded elements.](https://trello.com/c/Da6PWvrV/259-backend-on-the-mdc-filter-add-the-http-method-to-the-list-of-recorded-elements) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-117` [Remove unused converters](https://trello.com/c/YNSkTNH6/255-backend-remove-unused-converters) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-119` [Complete the new entries to the neocom api and add also the item service api.](https://trello.com/c/ECSGoXhP/282-backendapi-complete-the-new-entries-to-the-neocom-api-and-add-also-the-item-service-api) · _BACKEND · API_ · `BACKLOG`
- [ ] `BACK-121` [There is no endpoint to create new files and the folder path in between.](https://trello.com/c/sT0BzgGY/310-file-there-is-no-endpoint-to-create-new-files-and-the-folder-path-in-between) · _FILE_ · `BACKLOG`
- [ ] `BACK-122` [Add NestJs as the backend](https://trello.com/c/LsSNrO4q/957-nestadd-nestjs-as-the-backend) · _NEST_ · `BACKLOG`
- [ ] `BACK-123` [Get the base data for a Eve Online game item.](https://trello.com/c/6PuuczkB/38-nib0701-get-the-base-data-for-a-eve-online-game-item) · _NIB07.01_ · `BACKLOG`

### In progress (2)

- [~] `BACK-124` [Replace search functions by lookup functions that should return Optionals or if asynchronous return Future of Optional.](https://trello.com/c/vV0oE11f/1136-story-nib-replace-search-functions-by-lookup-functions-that-should-return-optionals-or-if-asynchronous-return-future-of-optional) · _STORY-NIB_ · `WIP-P`
- [~] `BACK-125` [Move the endpoint to retrieve Processed Blueprints from NIB. Leave the creation process at NIB.](https://trello.com/c/nxTNzp7Y/1146-story-nin-move-the-endpoint-to-retrieve-processed-blueprints-from-nib-leave-the-creation-process-at-nib) · _STORY-NIN_ · `WIP-P`

### In testing (1)

- [ ] `BACK-126` [Check that any endpoint request has a valid token.](https://trello.com/c/5PLmw270/1043-nin0201-check-that-any-endpoint-request-has-a-valid-token) · _NIN02.01_ · `to TEST`

## Testing

### To do (29)

- [ ] `BACK-127` [Adjust configuration properties for the acceptance environment and the local environment to use the api simulator mock servers.](https://trello.com/c/8dcILB91/63-backend-adjust-configuration-properties-for-the-acceptance-environment-and-the-local-environment-to-use-the-api-simulator-mock-s) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-128` [Component setup and initialization should be exposed so it can be configured for testing. Some of the components lack this feature.](https://trello.com/c/7guvxD68/178-backend-component-setup-and-initialization-should-be-exposed-so-it-can-be-configured-for-testing-some-of-the-components-lack-thi) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-130` [Spring boot serializers fail to be tested.](https://trello.com/c/FAmcl1Pw/406-backend-spring-boot-serializers-fail-to-be-tested) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-131` [Update the adapters wrappers to the latest data management library version.](https://trello.com/c/WDWKPwV7/4-backend-update-the-adapters-wrappers-to-the-latest-data-management-library-version) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-132` [Add the configuration properties from the real production or development properties](https://trello.com/c/qnQf6ZFV/193-backendacceptance-add-the-configuration-properties-from-the-real-production-or-development-properties) · _BACKEND · ACCEPTANCE_ · `BACKLOG`
- [ ] `BACK-134` [Reduce the number of source sets.](https://trello.com/c/vaIbPfom/248-backendacceptance-reduce-the-number-of-source-sets) · _BACKEND · ACCEPTANCE_ · `BACKLOG`
- [ ] `BACK-136` [Simplify the package hierarchy.](https://trello.com/c/5Bt9RyPi/218-backendacceptance-simplify-the-package-hierarchy) · _BACKEND · ACCEPTANCE_ · `BACKLOG`
- [ ] `BACK-138` [Test the Heroku autoconfiguration.](https://trello.com/c/6s1bwhl9/234-backendacceptance-test-the-heroku-autoconfiguration) · _BACKEND · ACCEPTANCE_ · `BACKLOG`
- [ ] `BACK-140` [Upgrade the acceptance feign client to use virtual server configuration and remove hardcoded references.](https://trello.com/c/YBactBOK/59-backendacceptance-upgrade-the-acceptance-feign-client-to-use-virtual-server-configuration-and-remove-hardcoded-references) · _BACKEND · ACCEPTANCE_ · `BACKLOG`
- [ ] `BACK-144` [Create the integration test for the service using mock beans and not a real server implementation.](https://trello.com/c/fiLJY3nQ/172-backendintegration-create-the-integration-test-for-the-service-using-mock-beans-and-not-a-real-server-implementation) · _BACKEND · INTEGRATION_ · `BACKLOG`
- [ ] `BACK-146` [Complete the unit tests for the serializers.](https://trello.com/c/6YkHCKNV/217-backendtesting-complete-the-unit-tests-for-the-serializers) · _BACKEND · TESTING_ · `BACKLOG`
- [ ] `BACK-148` [Create a test set on Postman to check that production api works as the specifications describe.](https://trello.com/c/I9upii3o/227-backendtesting-create-a-test-set-on-postman-to-check-that-production-api-works-as-the-specifications-describe) · _BACKEND · TESTING_ · `BACKLOG`
- [ ] `BACK-150` [Fix and complete unit tests for controllers and services.](https://trello.com/c/PNOLT08a/287-backendtesting-fix-and-complete-unit-tests-for-controllers-and-services) · _BACKEND · TESTING_ · `BACKLOG`
- [ ] `BACK-152` [Parametrize the acceptance access to the application. The current calls have hardcoded data.](https://trello.com/c/XmPRVR1b/219-backendvalidation-parametrize-the-acceptance-access-to-the-application-the-current-calls-have-hardcoded-data) · _BACKEND · VALIDATION_ · `BACKLOG`
- [ ] `BACK-154` [Upgrade backend to use Cucumber with JUnit 5 and integrated test running.](https://trello.com/c/YfwGPTxb/1123-refactor-upgrade-backend-to-use-cucumber-with-junit-5-and-integrated-test-running) · _REFACTOR_ · `MPV-Prepare`
- [ ] `BACK-155` [Functions should not return null in any case. Non existent values should be supported and replaced by default elements easy to identifícate on Frontend or on other functions. Use the MOCK code to identify such cases.](https://trello.com/c/0dP8lpYi/1137-story-nib-functions-should-not-return-null-in-any-case-non-existent-values-should-be-supported-and-replaced-by-default-elements) · _STORY-NIB_ · `MPV-Prepare`

## Mining

### To do (19)

- [ ] `BACK-156` [Wrap the backend calls always inside the AppStore service.](https://trello.com/c/ZLfadRlh/618-wrap-the-backend-calls-always-inside-the-appstore-service) · `BACKLOG`
- [ ] `BACK-157` [Review and complete the current backend API before publisinh the code at production.](https://trello.com/c/ZB8cdfc1/749-api-review-and-complete-the-current-backend-api-before-publisinh-the-code-at-production) · _API_ · `BACKLOG`
- [ ] `BACK-158` [Check that we do not store null values into the Market data cache.](https://trello.com/c/V3a5GTXD/118-backend-check-that-we-do-not-store-null-values-into-the-market-data-cache) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-160` [Create a new entity table to store the build preferences.](https://trello.com/c/IZaifGJs/694-backend-create-a-new-entity-table-to-store-the-build-preferences) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-161` [Create the mining extractions table to store the hourly processed mining extractions delta calculations. This table is already defined but not created on version 0.20.](https://trello.com/c/f7TwCUPr/733-backend-create-the-mining-extractions-table-to-store-the-hourly-processed-mining-extractions-delta-calculations-this-table-is-al) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-162` [If a call to the DataStore service detects that the content has not been initialized then the call should force the execution of the job or fail with a message.](https://trello.com/c/cd4PC4Gc/822-backend-if-a-call-to-the-datastore-service-detects-that-the-content-has-not-been-initialized-then-the-call-should-force-the-exec) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-163` [Mining extractions depend on time so they are difficult to mock. Data requested through the endpoints come from the repository and not from a mocked server.](https://trello.com/c/l74GUZ1W/735-backend-mining-extractions-depend-on-time-so-they-are-difficult-to-mock-data-requested-through-the-endpoints-come-from-the-repos) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-164` [Mining extractions mock data should generate a set of records for some of the day hours so the repository gets filled with that test data.](https://trello.com/c/tuP1X66M/736-backend-mining-extractions-mock-data-should-generate-a-set-of-records-for-some-of-the-day-hours-so-the-repository-gets-filled-wi) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-165` [Reactivate the Redis database to store Java objects that can be accessed by identifier instead of creating more database tables. Use this for volatile or cache information.](https://trello.com/c/wQe7GH0W/938-backend-reactivate-the-redis-database-to-store-java-objects-that-can-be-accessed-by-identifier-instead-of-creating-more-database) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-166` [Store the application run caches inside a single directory identified so the folders do not mangle the code.](https://trello.com/c/SspMxW52/370-backend-store-the-application-run-caches-inside-a-single-directory-identified-so-the-folders-do-not-mangle-the-code) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-168` [The mock data for mining extractions should generate data on the fly to add the current time and date to the stored records.](https://trello.com/c/FzNZh0xT/734-backend-the-mock-data-for-mining-extractions-should-generate-data-on-the-fly-to-add-the-current-time-and-date-to-the-stored-reco) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-173` [Describe the output when the delta calculator receives a type 02 configuration.](https://trello.com/c/UTDZq1lQ/993-nin0202-describe-the-output-when-the-delta-calculator-receives-a-type-02-configuration) · _NIN02.02_ · `BACKLOG`
- [ ] `BACK-174` [A new mining operation is started from the UX with the use case StartMiningOperation.](https://trello.com/c/SeS8jvZ5/1005-nin0401-a-new-mining-operation-is-started-from-the-ux-with-the-use-case-startminingoperation) · _NIN04.01_ · `BACKLOG`

### In testing (4)

- [ ] `BACK-175` [Check that the Mining Resources are properly generated.](https://trello.com/c/59Q7o4kf/1098-nin0104-check-that-the-mining-resources-are-properly-generated) · _NIN01.04_ · `to TEST`
- [ ] `BACK-176` [Replace Mining Resource by the new EsiType and the grouping on the Stack.](https://trello.com/c/fUq57ZTG/1106-story-nin-replace-mining-resource-by-the-new-esitype-and-the-grouping-on-the-stack) · _STORY-NIN_ · `to TEST`
- [ ] `BACK-177` [The backend should aggregate economic information to each of the ores on the mining operation. The economic data is the estimated value for the ore at the Jita hub that is the predefined trading hub.](https://trello.com/c/qgwTomqx/1097-story-nin-the-backend-should-aggregate-economic-information-to-each-of-the-ores-on-the-mining-operation-the-economic-data-is-the) · _STORY-NIN_ · `to TEST`
- [ ] `BACK-178` [The backend should get the ESI data and aggregate it by system and date. For each system-date pair we generate a single Mining Operation that will contain the list of resources mined for that combination.](https://trello.com/c/DpM1gEe3/1087-story-nin-the-backend-should-get-the-esi-data-and-aggregate-it-by-system-and-date-for-each-system-date-pair-we-generate-a-single) · _STORY-NIN_ · `to TEST`

## Pilot & character

### To do (18)

- [ ] `BACK-179` [Add the functionlity to download Corporation assets. Instead storing the assets on the database I will attempt to get the list on real time and see how I can handle the downloaded data. The first handicap is to detect when the Pilot has no privileges to get the data.](https://trello.com/c/czcV8td2/115-backend-add-the-functionlity-to-download-corporation-assets-instead-storing-the-assets-on-the-database-i-will-attempt-to-get-the) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-181` [Create the Pilot Preferences table that is not defined and generating exceptions.](https://trello.com/c/6kcDvT69/944-backend-create-the-pilot-preferences-table-that-is-not-defined-and-generating-exceptions) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-182` [The serialization for a Resource can add a link to the Market endpoint to retrieve market value data in the right context for this pilot.](https://trello.com/c/GpxpnnAp/825-backend-the-serialization-for-a-resource-can-add-a-link-to-the-market-endpoint-to-retrieve-market-value-data-in-the-right-contex) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-183` [Use the real pilot data to set the development mock data while developing the apis.](https://trello.com/c/1c6GZ8s6/669-backend-use-the-real-pilot-data-to-set-the-development-mock-data-while-developing-the-apis) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-184` [Add information about the number of assets downloaded.](https://trello.com/c/DE2iDJ1d/122-backendesinetworkmanagergetcharacterscharacteridassets-add-information-about-the-number-of-assets-downloaded) · _BACKEND · ESINetworkManager.getCharactersCharacterIdAssets_ · `BACKLOG`
- [ ] `BACK-186` [Add volume and cost calculations to the task so we can have some accounting on the flow. Use vistual methods to get this data serialized.](https://trello.com/c/FvNkjIoz/140-backendevetask-add-volume-and-cost-calculations-to-the-task-so-we-can-have-some-accounting-on-the-flow-use-vistual-methods-to-ge) · _BACKEND · EVETASK_ · `BACKLOG`
- [ ] `BACK-188` [Add the current pilot location to the Pilot data. This is a secured endpoint so it should be provided through the backend api.](https://trello.com/c/uD8kPV6p/85-backendrefactor-add-the-current-pilot-location-to-the-pilot-data-this-is-a-secured-endpoint-so-it-should-be-provided-through-the) · _BACKEND · REFACTOR_ · `BACKLOG`
- [ ] `BACK-189` [Get the list of fittings for the authenticated pilot. Endpoint version 1.](https://trello.com/c/NWPHsSVP/675-nib0303-get-the-list-of-fittings-for-the-authenticated-pilot-endpoint-version-1) · _NIB03.03_ · `BACKLOG`
- [ ] `BACK-190` [Get the list of fittings for the authenticated pilot. Endpoint version 2.](https://trello.com/c/2mwab4vV/683-nib0304-get-the-list-of-fittings-for-the-authenticated-pilot-endpoint-version-2) · _NIB03.04_ · `BACKLOG`
- [ ] `BACK-191` [The pilot authenticated has no fittings. This should raise an exception.](https://trello.com/c/thR3Pbba/284-nib0603-the-pilot-authenticated-has-no-fittings-this-should-raise-an-exception) · _NIB06.03_ · `BACKLOG`
- [ ] `BACK-193` [Obtain the list of blueprints related to the selected pilot. This is the list of summary blueprint data.](https://trello.com/c/kAkZW467/955-nib1201-obtain-the-list-of-blueprints-related-to-the-selected-pilot-this-is-the-list-of-summary-blueprint-data) · _NIB12.01_ · `BACKLOG`
- [ ] `BACK-194` [If a second mining operation is started and there is one running for the same pilot the result is the same current operation.](https://trello.com/c/QQzuBokf/1006-nin0402-if-a-second-mining-operation-is-started-and-there-is-one-running-for-the-same-pilot-the-result-is-the-same-current-opera) · _NIN04.02_ · `BACKLOG`
- [ ] `BACK-195` [replace the current fitting implementation by a GetCharacterFitting to Fitting converter that will not need ESI data access.](https://trello.com/c/x5YnWWAJ/713-refactor-replace-the-current-fitting-implementation-by-a-getcharacterfitting-to-fitting-converter-that-will-not-need-esi-data-ac) · _REFACTOR_ · `BACKLOG`
- [ ] `BACK-196` [Create a new endpoint to retrieve the list of blueprints for a pilot along the manufacture cost and profit index. This list has no details about the blueprint processing because there is much information.](https://trello.com/c/VEqzVxCD/821-storybackend-create-a-new-endpoint-to-retrieve-the-list-of-blueprints-for-a-pilot-along-the-manufacture-cost-and-profit-index-th) · _STORY · BACKEND_ · `BACKLOG`

### In testing (1)

- [ ] `BACK-197` [Resolve or mock the problem with the Pilot on the latest version of the backend until a new implementation is ready. The initial approach is remove the functionality at the frontend.](https://trello.com/c/LHy7AC7W/1082-fix-resolve-or-mock-the-problem-with-the-pilot-on-the-latest-version-of-the-backend-until-a-new-implementation-is-ready-the-init) · _FIX_ · `to TEST`

## Assets

### To do (14)

- [ ] `BACK-198` [Add to the backend service a new endpoint to download corporation assets classified by location.](https://trello.com/c/5jbVwBdA/583-add-to-the-backend-service-a-new-endpoint-to-download-corporation-assets-classified-by-location) · `BACKLOG`
- [ ] `BACK-199` [Store the EveItem serialized to JSON into a field on the NewComAssetV2 database class.](https://trello.com/c/AZ716Feb/116-backend-store-the-eveitem-serialized-to-json-into-a-field-on-the-newcomassetv2-database-class) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-201` [The user name download process will left the name off the writting process. So the download should connect to the asset being saved so when the name resolves it will update the database record.](https://trello.com/c/sNyYKS6P/543-backend-the-user-name-download-process-will-left-the-name-off-the-writting-process-so-the-download-should-connect-to-the-asset-b) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-205` [Create an acceptance test to read a list of assets.](https://trello.com/c/csvcHh2t/963-nestcreate-an-acceptance-test-to-read-a-list-of-assets) · _NEST_ · `BACKLOG`
- [ ] `BACK-206` [Read a list of assets as obtained from ESI.](https://trello.com/c/kKaQPQJp/960-nestread-a-list-of-assets-as-obtained-from-esi) · _NEST_ · `BACKLOG`
- [ ] `BACK-207` [Read two consecutive asset lists to detect new mining resources](https://trello.com/c/RRj7rB9q/959-nestread-two-consecutive-asset-lists-to-detect-new-mining-resources) · _NEST_ · `BACKLOG`
- [ ] `BACK-208` [Given a set of few assets validate the resulting hierarchy with details deep checks. Use the simplest   asset configuration that is a single asset inside a corporation container at the first office.](https://trello.com/c/dr9aY7bc/31-nib0204-given-a-set-of-few-assets-validate-the-resulting-hierarchy-with-details-deep-checks-use-the-simplest-asset-configuration) · _NIB02.04_ · `BACKLOG`
- [ ] `BACK-209` [Given two consecutive sets of assets there is a service that return the difference for the Ore assets only.](https://trello.com/c/XFXAU5zF/991-nin0101-given-two-consecutive-sets-of-assets-there-is-a-service-that-return-the-difference-for-the-ore-assets-only) · _NIN01.01_ · `BACKLOG`
- [ ] `BACK-210` [The Mining Operations Manager should be connected to the Assets update publication to detect a Mining Operation start.](https://trello.com/c/vSw3Ivka/998-nin0301-the-mining-operations-manager-should-be-connected-to-the-assets-update-publication-to-detect-a-mining-operation-start) · _NIN03.01_ · `BACKLOG`
- [ ] `BACK-211` [When the scheduled job is created the current list of assets is ordered, filtered and stored on the mining operation.](https://trello.com/c/JCa1BB2n/1007-nin0403-when-the-scheduled-job-is-created-the-current-list-of-assets-is-ordered-filtered-and-stored-on-the-mining-operation) · _NIN04.03_ · `BACKLOG`

## Industry & fittings

### To do (14)

- [ ] `BACK-212` [A Processed Blueprint should return the module that can be manufacture with the blueprint.](https://trello.com/c/rUNstOFQ/832-backend-a-processed-blueprint-should-return-the-module-that-can-be-manufacture-with-the-blueprint) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-213` [Add a new endpoint to get the list of fittings.](https://trello.com/c/SsgK52RA/2-backend-add-a-new-endpoint-to-get-the-list-of-fittings) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-215` [Fitting retrieval is a quite lengthy operation because it has to render the complete EveItem and the related data. That data is not guaranteed to be cached and available so the time to get all that data can take even 2 minutes. Remove the complete eve item and replace it by a lookup into the frontend local cache to get the data from the frontend database. If the data is not available then go to the backend for it but on a dynamic upload way to the UI presentation layer.](https://trello.com/c/X1fJLRE6/542-backend-fitting-retrieval-is-a-quite-lengthy-operation-because-it-has-to-render-the-complete-eveitem-and-the-related-data-that-d) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-217` [Generate the serialization for a corporation location home station and add this to the corporation record.](https://trello.com/c/XvRXUeJp/243-backend-generate-the-serialization-for-a-corporation-location-home-station-and-add-this-to-the-corporation-record) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-219` [The manufactured blueprint module should also contain the market value information.](https://trello.com/c/IFbKoWQU/833-backend-the-manufactured-blueprint-module-should-also-contain-the-market-value-information) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-220` [Update the Fitting model information to include the Eve item information corresponding to the ship hull.](https://trello.com/c/yVklRCaB/11-backend-update-the-fitting-model-information-to-include-the-eve-item-information-corresponding-to-the-ship-hull) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-223` [Move the ESI serializers and the Industry Group enumerated to the DataManagement project.](https://trello.com/c/uUcKR4Ye/711-refactor-move-the-esi-serializers-and-the-industry-group-enumerated-to-the-datamanagement-project) · _REFACTOR_ · `BACKLOG`
- [ ] `BACK-224` [The Fitting Builder is a new set on endpoints under the 'industry' group. This should return the All Buy fitting configuration and the transformed fitting build order configuration.](https://trello.com/c/Gt0CnKMk/692-storybackend-the-fitting-builder-is-a-new-set-on-endpoints-under-the-industry-group-this-should-return-the-all-buy-fitting-confi) · _STORY · BACKEND_ · `BACKLOG`
- [ ] `BACK-225` [To start the industrial process to build a Fitting we need as starting point a new set of endpoints to manage Fitting Build Configurations.](https://trello.com/c/BgDVOdgn/684-storybackend-to-start-the-industrial-process-to-build-a-fitting-we-need-as-starting-point-a-new-set-of-endpoints-to-manage-fitti) · _STORY · BACKEND_ · `BACKLOG`

## Universe & locations

### To do (11)

- [ ] `BACK-226` [Define the links as a composed structure creating an specific link component for each link type.](https://trello.com/c/4VzJHtSb/906-api-define-the-links-as-a-composed-structure-creating-an-specific-link-component-for-each-link-type) · _API_ · `BACKLOG`
- [ ] `BACK-227` [Convert Configuration and FileSystem wrappers to the new wrapper pattern and update all references.](https://trello.com/c/JKgcpmFV/280-backend-convert-configuration-and-filesystem-wrappers-to-the-new-wrapper-pattern-and-update-all-references) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-229` [Create a new space location service to manage the location list and the location storage.](https://trello.com/c/CvD7LwY8/87-backend-create-a-new-space-location-service-to-manage-the-location-list-and-the-location-storage) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-230` [If during initialization we detect that there are no Locations pre-loaded we should launch the jobs to process the Citadel and Outpost locations.](https://trello.com/c/scNCdO6a/110-backend-if-during-initialization-we-detect-that-there-are-no-locations-pre-loaded-we-should-launch-the-jobs-to-process-the-citad) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-232` [Support the Heroku way to setup the database access URL. If the system has that environment variable then it should supersede the configuration value.](https://trello.com/c/5pKtZ8Vh/230-backend-support-the-heroku-way-to-setup-the-database-access-url-if-the-system-has-that-environment-variable-then-it-should-super) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-236` [The base location for application resources depends if the compilation is done by the IntelliJ or by gradle. The use different locations and structure.](https://trello.com/c/NWPJwdGO/311-file-the-base-location-for-application-resources-depends-if-the-compilation-is-done-by-the-intellij-or-by-gradle-the-use-differe) · _FILE_ · `BACKLOG`

### In testing (2)

- [ ] `BACK-237` [Create on additional endpoint to access the EsiType structure removing hierarchy data for Group and Category.](https://trello.com/c/V3zBAlUX/1105-story-nin-create-on-additional-endpoint-to-access-the-esitype-structure-removing-hierarchy-data-for-group-and-category) · _STORY-NIN_ · `to TEST`
- [ ] `BACK-238` [Locations require additional endpoints to aggregate the location path.](https://trello.com/c/ENp6ojZc/1111-story-nin-locations-require-additional-endpoints-to-aggregate-the-location-path) · _STORY-NIN_ · `to TEST`

## ESI integration

### To do (9)

- [ ] `BACK-239` [Add Hystrix feature to controllers based on the availability of the ESI server.](https://trello.com/c/0sGHGIF1/302-backend-add-hystrix-feature-to-controllers-based-on-the-availability-of-the-esi-server) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-240` [Check and make the application development calls to use the mock simulator for ESI calls.](https://trello.com/c/HV0Cj0iw/6-backend-check-and-make-the-application-development-calls-to-use-the-mock-simulator-for-esi-calls) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-242` [Wrap the ESI adapter into a new component and component initilization to add all dependencies while startup.](https://trello.com/c/MUKXAZkR/174-backend-wrap-the-esi-adapter-into-a-new-component-and-component-initilization-to-add-all-dependencies-while-startup) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-245` [When the application starts it should check that the ESI token is still valid and that it has not expired.](https://trello.com/c/ruZ1WX2r/1127-fix-when-the-application-starts-it-should-check-that-the-esi-token-is-still-valid-and-that-it-has-not-expired) · _FIX_ · `MPV-Prepare`
- [ ] `BACK-246` [Access the EsiItem data. Endpoint version 2.](https://trello.com/c/aJ3usSUI/682-nib0503-access-the-esiitem-data-endpoint-version-2) · _NIB05.03_ · `BACKLOG`
- [ ] `BACK-247` [The use of the datasource is deprecated when accessing esi servers. There only one server online so this parameter can be removed from the API.](https://trello.com/c/BoAT2WlI/750-refactor-the-use-of-the-datasource-is-deprecated-when-accessing-esi-servers-there-only-one-server-online-so-this-parameter-can-b) · _REFACTOR_ · `BACKLOG`

## Bugs & fixes

### To do (6)


## Infrastructure & build

### To do (5)

- [ ] `BACK-254` [Upgrade the API documentation to reflect the new version 2 endpoints and the new rest response formats.](https://trello.com/c/cVm70COX/81-api-upgrade-the-api-documentation-to-reflect-the-new-version-2-endpoints-and-the-new-rest-response-formats) · _API_ · `BACKLOG`
- [ ] `BACK-255` [Add the backend version information to the logs](https://trello.com/c/Qh33FFld/272-backend-add-the-backend-version-information-to-the-logs) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-257` [Use the SDE version name to select the download origin for the sde data so the contents do not change uncontrolled.](https://trello.com/c/tzS1wiBN/949-backend-use-the-sde-version-name-to-select-the-download-origin-for-the-sde-data-so-the-contents-do-not-change-uncontrolled) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-258` [Generate a production version that is suitable for the development access to item data.](https://trello.com/c/IT9nnE2h/13-backenddeploy-generate-a-production-version-that-is-suitable-for-the-development-access-to-item-data) · _BACKEND · DEPLOY_ · `BACKLOG`

## Market

### To do (4)

- [ ] `BACK-259` [Create a service to access NeoItem full information. This would be served by the backend because it would need the market information.](https://trello.com/c/864wU5ch/615-create-a-service-to-access-neoitem-full-information-this-would-be-served-by-the-backend-because-it-would-need-the-market-informa) · `BACKLOG`
- [ ] `BACK-260` [Add a new Item service. Now items have HAL attributes so the consumer determines which data is required to be used and then can access additional market data or any other market details from the item start point.](https://trello.com/c/N5ecg4Du/88-backend-add-a-new-item-service-now-items-have-hal-attributes-so-the-consumer-determines-which-data-is-required-to-be-used-and-th) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-261` [Processed blueprints that have no sell orders for the output will have invalid price and market hubs so should not be added to the list of available blueprints.](https://trello.com/c/SxaI9uy3/947-backend-processed-blueprints-that-have-no-sell-orders-for-the-output-will-have-invalid-price-and-market-hubs-so-should-not-be-ad) · _BACKEND_ · `BACKLOG`
- [ ] `BACK-262` [The front end is allowed to change the loyalty service filter configuration. Allow market region change.](https://trello.com/c/huUJkns8/879-nib1102-the-front-end-is-allowed-to-change-the-loyalty-service-filter-configuration-allow-market-region-change) · _NIB11.02_ · `BACKLOG`

## Refactoring

### To do (3)

- [ ] `BACK-263` [Remove the direct call to the backend service from the ServerInfoPanelComponent.](https://trello.com/c/qdEwyKsf/617-refactor-remove-the-direct-call-to-the-backend-service-from-the-serverinfopanelcomponent) · _REFACTOR_ · `BACKLOG`
- [ ] `BACK-264` [Review the backend adapters and check if it is really necessary to have to adapters chained to get a Nest response.](https://trello.com/c/Qitu3Zxy/1099-refactor-review-the-backend-adapters-and-check-if-it-is-really-necessary-to-have-to-adapters-chained-to-get-a-nest-response) · _REFACTOR_ · `MPV-Prepare`
- [ ] `BACK-265` [Remove the NeoComController since it has no contents.](https://trello.com/c/1eye3h0N/800-refactorbackend-remove-the-neocomcontroller-since-it-has-no-contents) · _REFACTOR · BACKEND_ · `BACKLOG`

## Documentation

### To do (2)

- [ ] `BACK-266` [Write the OpenApi documentation for the endpoints exposed by the backend.](https://trello.com/c/iNpzAlEK/180-specs-write-the-openapi-documentation-for-the-endpoints-exposed-by-the-backend) · _SPECS_ · `BACKLOG`

## Domain models

### To do (1)

- [ ] `BACK-268` [There are now two backend services. One for the NeoCom APPI and a second one for the NeoItem API. Update the reference constants because even the server can change.](https://trello.com/c/5rzwolNn/619-refactor-there-are-now-two-backend-services-one-for-the-neocom-appi-and-a-second-one-for-the-neoitem-api-update-the-reference-co) · _REFACTOR_ · `BACKLOG`
