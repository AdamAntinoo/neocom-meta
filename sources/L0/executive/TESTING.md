# Executive actions — TESTING

> Testing & quality — acceptance tests, mocks, coverage.
> 42 open action(s) across 6 feature(s) · generated 2026-10-30 · source: Trello board `neocom-infinity` (L0).

| Feature | To do | In progress | Testing | Total |
| --- | --- | --- | --- | --- |
| Testing | 21 | 0 | 1 | 22 |
| Login & authentication | 11 | 0 | 1 | 12 |
| Mining | 4 | 0 | 0 | 4 |
| Assets | 2 | 0 | 0 | 2 |
| Domain models | 1 | 0 | 0 | 1 |
| Planetary | 1 | 0 | 0 | 1 |

## Testing

### To do (21)

- [ ] [Add a test field to detect when the services are up and add that to the gradle task dependencies.](https://trello.com/c/hFXF7arr/844-acceptance-add-a-test-field-to-detect-when-the-services-are-up-and-add-that-to-the-gradle-task-dependencies) · _ACCEPTANCE_ · `BACKLOG`
- [ ] [Add the test containers to the acceptance tests to have the services available and ready for the testing.](https://trello.com/c/ViUnQYqJ/18-acceptance-add-the-test-containers-to-the-acceptance-tests-to-have-the-services-available-and-ready-for-the-testing) · _ACCEPTANCE_ · `BACKLOG`
- [ ] [Check that acceptance tests collaborate to the code coverage because unit testing does not complete the code coverage.](https://trello.com/c/59Hg7B9W/19-acceptance-check-that-acceptance-tests-collaborate-to-the-code-coverage-because-unit-testing-does-not-complete-the-code-coverage) · _ACCEPTANCE_ · `BACKLOG`
- [ ] [Create a backend launcher with an special profile that should have the scheduler disabled.](https://trello.com/c/on8rqODB/335-acceptance-create-a-backend-launcher-with-an-special-profile-that-should-have-the-scheduler-disabled) · _ACCEPTANCE_ · `BACKLOG`
- [ ] [Try to use standard classes but setting them with the Json tags.](https://trello.com/c/fdm7EJME/304-acceptance-try-to-use-standard-classes-but-setting-them-with-the-json-tags) · _ACCEPTANCE_ · `BACKLOG`
- [ ] [Create and test the annotation to log the entry/exit from a method.](https://trello.com/c/PZkdWXwt/170-annotations-create-and-test-the-annotation-to-log-the-entry-exit-from-a-method) · _ANNOTATIONS_ · `BACKLOG`
- [ ] [Create and test the annotation to log the entry/exit from a method.](https://trello.com/c/88FP8uw8/490-annotations-create-and-test-the-annotation-to-log-the-entry-exit-from-a-method) · _ANNOTATIONS_ · `BACKLOG`
- [ ] [Fix startup for the acceptance environment to create a running application. Use the docker file for the deployment.](https://trello.com/c/1D0gHYsE/1124-fix-fix-startup-for-the-acceptance-environment-to-create-a-running-application-use-the-docker-file-for-the-deployment) · _FIX_ · `MPV-Prepare`
- [ ] [Create a mock static page to show the UI rendering examples that follow the application feature definitions.](https://trello.com/c/mTObInKE/665-mock-create-a-mock-static-page-to-show-the-ui-rendering-examples-that-follow-the-application-feature-definitions) · _MOCK_ · `BACKLOG`
- [ ] [Create a mock static page to show the UI rendering examples that follow the application feature definitions.](https://trello.com/c/VgfY0P5s/89-mock-create-a-mock-static-page-to-show-the-ui-rendering-examples-that-follow-the-application-feature-definitions) · _MOCK_ · `BACKLOG`
- [ ] [Create a set of Postman urls for production quality testing. They can be run in batches.](https://trello.com/c/nri6jODb/309-production-create-a-set-of-postman-urls-for-production-quality-testing-they-can-be-run-in-batches) · _PRODUCTION_ · `BACKLOG`
- [ ] [Do some database initialization test when wrapping the database and opening it.](https://trello.com/c/oiPlJ7gr/75-refactor-do-some-database-initialization-test-when-wrapping-the-database-and-opening-it) · _REFACTOR_ · `BACKLOG`
- [ ] [Integration tests cannot use TestContainers since they are not supported at CircleCi. Replace that by docker solution and ApiSimulator scriptable configuration.](https://trello.com/c/3JT7v0jo/752-refactor-integration-tests-cannot-use-testcontainers-since-they-are-not-supported-at-circleci-replace-that-by-docker-solution-an) · _REFACTOR_ · `BACKLOG`
- [ ] [The server status does not use a proper DTO construction so the deserializer cannot get the right information and the acceptance test fails.](https://trello.com/c/qpJucupp/751-refactor-the-server-status-does-not-use-a-proper-dto-construction-so-the-deserializer-cannot-get-the-right-information-and-the-a) · _REFACTOR_ · `BACKLOG`
- [ ] [Add the testing for the ActiveCacheWrapper](https://trello.com/c/EyGo3z8f/251-testing-add-the-testing-for-the-activecachewrapper) · _TESTING_ · `BACKLOG`
- [ ] [Add the testing for the ActiveCacheWrapper](https://trello.com/c/k6rfCuwZ/411-testing-add-the-testing-for-the-activecachewrapper) · _TESTING_ · `BACKLOG`
- [ ] [Create a test page for the different spinners. Check for size adaption and with different presentations (horizontal, veltical).](https://trello.com/c/InHNzEr3/155-testing-create-a-test-page-for-the-different-spinners-check-for-size-adaption-and-with-different-presentations-horizontal-veltic) · _TESTING_ · `BACKLOG`
- [ ] [Create a test page for the different spinners. Check for size adaption and with different presentations (horizontal, veltical).](https://trello.com/c/ZlS84BW6/502-testing-create-a-test-page-for-the-different-spinners-check-for-size-adaption-and-with-different-presentations-horizontal-veltic) · _TESTING_ · `BACKLOG`
- [ ] [Use isolation to separate the construction from the start on some of the adapters. Because internal classes cannot be mocked use an isolation instance that can be replaced during testing.](https://trello.com/c/OAO3cEL7/312-testing-use-isolation-to-separate-the-construction-from-the-start-on-some-of-the-adapters-because-internal-classes-cannot-be-moc) · _TESTING_ · `BACKLOG`
- [ ] [Complete and update the acceptance tests using the DI and the new world for each feature. Use hierarchy to share code.](https://trello.com/c/QqPebQlC/1011-test-complete-and-update-the-acceptance-tests-using-the-di-and-the-new-world-for-each-feature-use-hierarchy-to-share-code) · _TEST_ · `BACKLOG`
- [ ] [Complete the unit tests for the already developed code.](https://trello.com/c/VGKGujJj/1010-test-complete-the-unit-tests-for-the-already-developed-code) · _TEST_ · `BACKLOG`

### In testing (1)

- [ ] [Cucumber tests at NIN require that the configuration uses mocked destinations and not the real external endpoints.](https://trello.com/c/LhQD3uhb/1109-fix-cucumber-tests-at-nin-require-that-the-configuration-uses-mocked-destinations-and-not-the-real-external-endpoints) · _FIX_ · `to TEST`

## Login & authentication

### To do (11)

- [ ] [Before running acceptance tests create steps to setup the database records. Usually steps fail because there are no credentials stored.](https://trello.com/c/bWM8sKgp/303-acceptance-before-running-acceptance-tests-create-steps-to-setup-the-database-records-usually-steps-fail-because-there-are-no-cr) · _ACCEPTANCE_ · `BACKLOG`
- [ ] [Credential serialization does not include sensible fields so this information does not travel over the network. This implies that is not possible to test the contents of those fields.](https://trello.com/c/VzcWrJu6/306-acceptance-credential-serialization-does-not-include-sensible-fields-so-this-information-does-not-travel-over-the-network-this-i) · _ACCEPTANCE_ · `BACKLOG`
- [ ] [Generate a new authorization JWT token with the right Credential identifier format ('.' instead of '/').](https://trello.com/c/fo7srfFY/334-acceptance-generate-a-new-authorization-jwt-token-with-the-right-credential-identifier-format-instead-of) · _ACCEPTANCE_ · `BACKLOG`
- [ ] [Missing the race name and corporation identifier from the Credential definitions on acceptance tests.](https://trello.com/c/Psm6aBhf/305-acceptance-missing-the-race-name-and-corporation-identifier-from-the-credential-definitions-on-acceptance-tests) · _ACCEPTANCE_ · `BACKLOG`
- [ ] [There are two test credentials. One for Beth Ripley as CEO of a corporation and another as Perico Tuerto as one of the directors.](https://trello.com/c/vK9JcdBN/586-refactor-there-are-two-test-credentials-one-for-beth-ripley-as-ceo-of-a-corporation-and-another-as-perico-tuerto-as-one-of-the-d) · _REFACTOR_ · `BACKLOG`
- [ ] [Test the cases where the credential does not have the right values or the JWT is not valid](https://trello.com/c/c6bm6aVK/189-testing-test-the-cases-where-the-credential-does-not-have-the-right-values-or-the-jwt-is-not-valid) · _TESTING_ · `BACKLOG`
- [ ] [Test the cases where the credential does not have the right values or the JWT is not valid](https://trello.com/c/Fkjep0XQ/469-testing-test-the-cases-where-the-credential-does-not-have-the-right-values-or-the-jwt-is-not-valid) · _TESTING_ · `BACKLOG`
- [ ] [Validate that changes on the Credential do not change the unique job value but the credential identifier.](https://trello.com/c/DOpkX0Fw/323-testing-validate-that-changes-on-the-credential-do-not-change-the-unique-job-value-but-the-credential-identifier) · _TESTING_ · `BACKLOG`
- [ ] [Validate the other branches on the login panels](https://trello.com/c/RVglRsH1/190-testing-validate-the-other-branches-on-the-login-panels) · _TESTING_ · `BACKLOG`
- [ ] [Validate the other branches on the login panels](https://trello.com/c/X9nlZHZC/468-testing-validate-the-other-branches-on-the-login-panels) · _TESTING_ · `BACKLOG`
- [ ] [Create a integrattion testing for the authentication flow on the new NIN backend.](https://trello.com/c/wxI8O2WB/1118-test-create-a-integrattion-testing-for-the-authentication-flow-on-the-new-nin-backend) · _TEST_ · `MPV-Prepare`

### In testing (1)

- [ ] [Create unit tests and acceptance test for the OAuth authentication. It is one of the most delicate elements of the architecture.](https://trello.com/c/QNbN9jQa/1074-test-create-unit-tests-and-acceptance-test-for-the-oauth-authentication-it-is-one-of-the-most-delicate-elements-of-the-architect) · _TEST_ · `to TEST`

## Mining

### To do (4)

- [ ] [Run the scheduled jobs before testing their results.](https://trello.com/c/nLSAlFsI/956-acceptance-run-the-scheduled-jobs-before-testing-their-results) · _ACCEPTANCE_ · `BACKLOG`
- [ ] [Create test pages to check the renders and functionlities for each one of the Renders and Panels in the application. The test page should render a list of preselected and stored list of resources that will have all the data combinations variations found on the aplication. Short data values, data missing, long values, values type mismatch and any other set of data that can be found or had been found on the application development.](https://trello.com/c/FpBDPhAm/157-testing-create-test-pages-to-check-the-renders-and-functionlities-for-each-one-of-the-renders-and-panels-in-the-application-the) · _TESTING_ · `BACKLOG`
- [ ] [Create test pages to check the renders and functionlities for each one of the Renders and Panels in the application. The test page should render a list of preselected and stored list of resources that will have all the data combinations variations found on the aplication. Short data values, data missing, long values, values type mismatch and any other set of data that can be found or had been found on the application development.](https://trello.com/c/1RNrQ5zH/506-testing-create-test-pages-to-check-the-renders-and-functionlities-for-each-one-of-the-renders-and-panels-in-the-application-the) · _TESTING_ · `BACKLOG`
- [ ] [Review the MiningRepositoryIT test to use the latest integration configuration.](https://trello.com/c/17bbK0y2/300-testing-review-the-miningrepositoryit-test-to-use-the-latest-integration-configuration) · _TESTING_ · `BACKLOG`

## Assets

### To do (2)

- [ ] [Create a common step to define the list of assets to be received.](https://trello.com/c/e9SCAlM6/1004-test-create-a-common-step-to-define-the-list-of-assets-to-be-received) · _TEST_ · `BACKLOG`
- [ ] [Write the step to get the list of assets from an external server. In this case the mock server.](https://trello.com/c/nQPhDQep/968-testwrite-the-step-to-get-the-list-of-assets-from-an-external-server-in-this-case-the-mock-server) · _TEST_ · `BACKLOG`

## Domain models

### To do (1)

- [ ] [The current ApiSimulator for the neoitem service is not functional. I need to get the correct item data and not always the same item. Replace it by a springboot service that returns the right data format.](https://trello.com/c/VpfgUHfe/621-mock-the-current-apisimulator-for-the-neoitem-service-is-not-functional-i-need-to-get-the-correct-item-data-and-not-always-the-s) · _MOCK_ · `BACKLOG`

## Planetary

### To do (1)

- [ ] [Use unique identifiers for selected resources so it can be easily tested against already selected resources.](https://trello.com/c/RTvx1Zok/757-planetary-use-unique-identifiers-for-selected-resources-so-it-can-be-easily-tested-against-already-selected-resources) · _PLANETARY_ · `BACKLOG`
