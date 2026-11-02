# Executive actions — DATAMANAGEMENT

> Shared data-management library — models, repositories, persistence, ESI clients (DATAMANAGEMENT/PS/CORE/NEOITEM).
> 120 open action(s) across 14 feature(s) · generated 2026-10-30 · source: Trello board `neocom-infinity` (L0).

| Feature | To do | In progress | Testing | Total |
| --- | --- | --- | --- | --- |
| Testing | 19 | 0 | 0 | 19 |
| Data & persistence | 15 | 0 | 0 | 15 |
| Login & authentication | 14 | 0 | 0 | 14 |
| Domain models | 13 | 0 | 0 | 13 |
| Mining | 12 | 1 | 0 | 13 |
| Assets | 12 | 0 | 0 | 12 |
| Universe & locations | 8 | 0 | 0 | 8 |
| ESI integration | 7 | 0 | 0 | 7 |
| Infrastructure & build | 5 | 0 | 0 | 5 |
| Market | 4 | 0 | 0 | 4 |
| Industry & fittings | 4 | 0 | 0 | 4 |
| Pilot & character | 2 | 0 | 0 | 2 |
| General | 2 | 0 | 0 | 2 |
| Refactoring | 2 | 0 | 0 | 2 |

## Testing

### To do (19)

- [ ] `DATAMANAGEMENT-001` [Convert free test messages into a template inside the LogMessagesExternalised class so log messages have no hardcoded text on the code class.](https://trello.com/c/zuDxVm5Y/197-datamanagement-convert-free-test-messages-into-a-template-inside-the-logmessagesexternalised-class-so-log-messages-have-no-hardc) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-003` [Move the annotation placeholders out of the library into another module and use it only for Android and test environments.](https://trello.com/c/vdg5XQXZ/173-datamanagement-move-the-annotation-placeholders-out-of-the-library-into-another-module-and-use-it-only-for-android-and-test-envi) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-005` [Remove the use of real services from unit testing and the complex mock setup to use support alternate services. Use configuration to convert real services or mock them.](https://trello.com/c/yNbt441d/270-datamanagement-remove-the-use-of-real-services-from-unit-testing-and-the-complex-mock-setup-to-use-support-alternate-services-us) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-007` [Retrofit factory contains mock code. Maybe this factory can be replaced on test code so production will be clear of this code.](https://trello.com/c/fAP9osR8/205-datamanagement-retrofit-factory-contains-mock-code-maybe-this-factory-can-be-replaced-on-test-code-so-production-will-be-clear-o) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-009` [Test the database version management for the NeoCom database.](https://trello.com/c/XbPysTx6/213-datamanagement-test-the-database-version-management-for-the-neocom-database) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-011` [Write acceptance tests only for integration elements. Most of the testing on libraries should be on unit tests.](https://trello.com/c/wshZls6h/403-datamanagementacceptance-write-acceptance-tests-only-for-integration-elements-most-of-the-testing-on-libraries-should-be-on-unit) · _DATAMANAGEMENT · ACCEPTANCE_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-013` [Move integration code to the test folder because it is not being detected by the test tasks.](https://trello.com/c/cHOx6rzp/30-datamanagementrefactor-move-integration-code-to-the-test-folder-because-it-is-not-being-detected-by-the-test-tasks) · _DATAMANAGEMENT · REFACTOR_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-014` [Add the test data for the mocks of the eve items used on the tests.](https://trello.com/c/IjWyGr5Y/204-datamanagementtesting-add-the-test-data-for-the-mocks-of-the-eve-items-used-on-the-tests) · _DATAMANAGEMENT · TESTING_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-016` [Increase the test coverage to the 50%](https://trello.com/c/gxT8lyO4/212-datamanagementtesting-increase-the-test-coverage-to-the-50) · _DATAMANAGEMENT · TESTING_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-018` [Serialization testing should be completed on the library because this usually requires changes and recompilations.](https://trello.com/c/jDsaSGmJ/254-datamanagementtesting-serialization-testing-should-be-completed-on-the-library-because-this-usually-requires-changes-and-recompi) · _DATAMANAGEMENT · TESTING_ · `BACKLOG`

## Data & persistence

### To do (15)

- [ ] `DATAMANAGEMENT-020` [Add log methods to document automatically method input parameter values.](https://trello.com/c/8HK5LNH5/281-datamanagement-add-log-methods-to-document-automatically-method-input-parameter-values) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-022` [Configuration properties are Optional that if not present should default to the current predefined value.](https://trello.com/c/IJrU57i2/210-datamanagement-configuration-properties-are-optional-that-if-not-present-should-default-to-the-current-predefined-value) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-024` [Define the new retrofit properties and also set default values on the code so the missing properties will not break the run.](https://trello.com/c/XboAhjG6/366-datamanagement-define-the-new-retrofit-properties-and-also-set-default-values-on-the-code-so-the-missing-properties-will-not-bre) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-026` [Filter out not .properties files from properties processing.](https://trello.com/c/zHGGi2ok/216-datamanagement-filter-out-not-properties-files-from-properties-processing) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-028` [Restart the project at version 0.16.0 and remove all code but the classes used on the Infinity Backend.](https://trello.com/c/CDmCMne4/201-datamanagement-restart-the-project-at-version-0160-and-remove-all-code-but-the-classes-used-on-the-infinity-backend) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-030` [Updaters should register themselves into the factory so no code change is required when a new updater is created.](https://trello.com/c/NMDUMesf/206-datamanagement-updaters-should-register-themselves-into-the-factory-so-no-code-change-is-required-when-a-new-updater-is-created) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-032` [When reading properties read all the sets in sequence, first the production configured directory and then the current profile properties.](https://trello.com/c/eowffehO/214-datamanagement-when-reading-properties-read-all-the-sets-in-sequence-first-the-production-configured-directory-and-then-the-curr) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-034` [Unify the provider and adapter packages into the most generic services.](https://trello.com/c/wxi4eFTT/22-datamanagementretrofit-unify-the-provider-and-adapter-packages-into-the-most-generic-services) · _DATAMANAGEMENT · RETROFIT_ · `BACKLOG`

## Login & authentication

### To do (14)

- [ ] `DATAMANAGEMENT-035` [Check if the Credential scope is used at someplace. If not used remove it because creates dependencies that should be resolved.](https://trello.com/c/etoH7l6r/208-datamanagement-check-if-the-credential-scope-is-used-at-someplace-if-not-used-remove-it-because-creates-dependencies-that-should) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-037` [ESI endpoints that do not require authentication should not need credential information to complete.](https://trello.com/c/zdOnF6qn/380-datamanagement-esi-endpoints-that-do-not-require-authentication-should-not-need-credential-information-to-complete) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-039` [Scope data comes informed when the character is validated. Use that information to be stored on the database and also to be used on all ESI authenticated calls.](https://trello.com/c/HKsJNDMy/226-datamanagement-scope-data-comes-informed-when-the-character-is-validated-use-that-information-to-be-stored-on-the-database-and-a) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-041` [Search a way to associate the office container with the office division. The office container does not contain such information.](https://trello.com/c/Z80V1kDx/24-datamanagement-search-a-way-to-associate-the-office-container-with-the-office-division-the-office-container-does-not-contain-suc) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-042` [The scope list to setup a Credential is a configurable item that should not require the access ot the ESI adapter.](https://trello.com/c/H2GRGq0q/169-datamanagement-the-scope-list-to-setup-a-credential-is-a-configurable-item-that-should-not-require-the-access-ot-the-esi-adapter) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-046` [The Credential updater faild because uring the wrong mock server.](https://trello.com/c/VGXPPOjg/237-datamanagementtesting-the-credential-updater-faild-because-uring-the-wrong-mock-server) · _DATAMANAGEMENT · TESTING_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-048` [Move the Credential job generator to the DataManagement library because this functionality should be shared with Android.](https://trello.com/c/pDvJumKI/326-refactor-move-the-credential-job-generator-to-the-datamanagement-library-because-this-functionality-should-be-shared-with-androi) · _REFACTOR_ · `BACKLOG`

## Domain models

### To do (13)

- [ ] `DATAMANAGEMENT-049` [Create a downloader wrapper service to replace the NeoItem references from downloaded data into the local full NeoItem data.](https://trello.com/c/PJIoSZ5g/620-create-a-downloader-wrapper-service-to-replace-the-neoitem-references-from-downloaded-data-into-the-local-full-neoitem-data) · `BACKLOG`
- [ ] `DATAMANAGEMENT-050` [Create the new endpoint for NeoItem data retrieval.](https://trello.com/c/QI5mcj0m/12-create-the-new-endpoint-for-neoitem-data-retrieval) · `BACKLOG`
- [ ] `DATAMANAGEMENT-051` [The data returned by the endpoint item/basic is not the same NeoItem object found on the backend. Testing should have this change on the spot.](https://trello.com/c/jm9r0pC1/44-neoitem-the-data-returned-by-the-endpoint-item-basic-is-not-the-same-neoitem-object-found-on-the-backend-testing-should-have-thi) · _NEOITEM_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-052` [The components should be grouped into Modules. I have identified the App module, the NeoCom-Models, the Detailed-Models and the UI module. There is an entry for each one of those modules and for other that can be found on the future.](https://trello.com/c/WLvd3JxV/94-ps01-modules-the-components-should-be-grouped-into-modules-i-have-identified-the-app-module-the-neocom-models-the-detailed-model) · _PS01-Modules_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-054` [This module contains common UI components and other even depending on models that can be used everywhere or that are application independent and then can be reused in other applications.](https://trello.com/c/3rRjHHtD/96-ps02-ui-this-module-contains-common-ui-components-and-other-even-depending-on-models-that-can-be-used-everywhere-or-that-are-app) · _PS02-UI_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-056` [EsiItemModel is outdated and can be replaced by the EsiType from the DM library.](https://trello.com/c/LmTE714x/824-refactor-esiitemmodel-is-outdated-and-can-be-replaced-by-the-esitype-from-the-dm-library) · _REFACTOR_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-057` [Rename EveItem to the new patters NeoItem.](https://trello.com/c/sUFQqNyw/215-refactor-rename-eveitem-to-the-new-patters-neoitem) · _REFACTOR_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-059` [Unify the way to access business model data unique Identifier. There is already a getUniqueId() that should be generic for all UX instances.](https://trello.com/c/6ATCUACZ/1035-refactor-unify-the-way-to-access-business-model-data-unique-identifier-there-is-already-a-getuniqueid-that-should-be-generic-for) · _REFACTOR_ · `MPV-Prepare`
- [ ] `DATAMANAGEMENT-060` [Use the new mechanics to share and keep in synch the Models and the Interfaces from the POC to the final Infinity project.](https://trello.com/c/XbRCtvWx/129-sharing-use-the-new-mechanics-to-share-and-keep-in-synch-the-models-and-the-interfaces-from-the-poc-to-the-final-infinity-projec) · _SHARING_ · `BACKLOG`

## Mining

### To do (12)

- [ ] `DATAMANAGEMENT-062` [Create the new EveItemManagerService to be able to get the backend for EveItems or their MarketData.](https://trello.com/c/n3TIsXr5/108-core-create-the-new-eveitemmanagerservice-to-be-able-to-get-the-backend-for-eveitems-or-their-marketdata) · _CORE_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-064` [Corporation divisions should store the division name on the User Label field for the container.](https://trello.com/c/vG6Qkayy/23-datamanagement-corporation-divisions-should-store-the-division-name-on-the-user-label-field-for-the-container) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-065` [Create a branch to remove the ESI Universe version because this only makes referencing the ESI more complex.](https://trello.com/c/BXnUFkws/367-datamanagement-create-a-branch-to-remove-the-esi-universe-version-because-this-only-makes-referencing-the-esi-more-complex) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-066` [Library exceptions should come from a set of predefined and configured errors that should log automatically the exception message along with the location and store all the data on the instance. Also all them should be Runtime so the signature of the methods does not declare them.](https://trello.com/c/CsUzd7g0/207-datamanagement-library-exceptions-should-come-from-a-set-of-predefined-and-configured-errors-that-should-log-automatically-the-e) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-069` [Move core.support classes to the core package.](https://trello.com/c/WgyOPLNX/211-datamanagementrefactor-move-coresupport-classes-to-the-core-package) · _DATAMANAGEMENT · REFACTOR_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-071` [Search for the possibility to store the locations cache on the database but with a preload cache on memory.](https://trello.com/c/MTPVotse/15-datamanagementresearch-search-for-the-possibility-to-store-the-locations-cache-on-the-database-but-with-a-preload-cache-on-memor) · _DATAMANAGEMENT · RESEARCH_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-072` [Desing a button that following the application visual style behaves as a button.](https://trello.com/c/GPDIVGLs/148-infinitycore-desing-a-button-that-following-the-application-visual-style-behaves-as-a-button) · _INFINITY · CORE_ · `BACKLOG`

### In progress (1)

- [~] `DATAMANAGEMENT-074` [Add the line number to the exception log registration.](https://trello.com/c/dU9POXE2/1135-core-add-the-line-number-to-the-exception-log-registration) · _CORE_ · `WIP-P`

## Assets

### To do (12)

- [ ] `DATAMANAGEMENT-075` [Converters get code coveraged when the asset downloaders are run. Specific tests can be left.](https://trello.com/c/m5Kb0ZV7/298-datamanagement-converters-get-code-coveraged-when-the-asset-downloaders-are-run-specific-tests-can-be-left) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-076` [Redesing the neocom asset to use a new and more flexible asset location service.](https://trello.com/c/yHoGwgkU/271-datamanagement-redesing-the-neocom-asset-to-use-a-new-and-more-flexible-asset-location-service) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-078` [Split the assets download and storage process into two separate actions. One of them will download and convert the assets to NeoAsset internal structures and generate a list. The other will persist that list on the repository.](https://trello.com/c/vzWHBHaZ/296-datamanagement-split-the-assets-download-and-storage-process-into-two-separate-actions-one-of-them-will-download-and-convert-the) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-083` [Assets converters share the code to detect blueprints and containers.](https://trello.com/c/0Q7O1Fnt/14-datamanagementrefactor-assets-converters-share-the-code-to-detect-blueprints-and-containers) · _DATAMANAGEMENT · REFACTOR_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-084` [Remove any processing for 200Ok assets before them being converted to the common form Esi200OkAsset.](https://trello.com/c/zFCxtOgE/16-datamanagementrefactor-remove-any-processing-for-200ok-assets-before-them-being-converted-to-the-common-form-esi200okasset) · _DATAMANAGEMENT · REFACTOR_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-085` [Add unit testing for all the assets package contents](https://trello.com/c/32ruLxmA/362-datamanagementtesting-add-unit-testing-for-all-the-assets-package-contents) · _DATAMANAGEMENT · TESTING_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-086` [Proper asset source requires that the AssetDownloader instance is generated outside the source so it can be mocked.](https://trello.com/c/L5wvR0Vk/21-datamanagementtesting-proper-asset-source-requires-that-the-assetdownloader-instance-is-generated-outside-the-source-so-it-can-b) · _DATAMANAGEMENT · TESTING_ · `BACKLOG`

## Universe & locations

### To do (8)

- [ ] `DATAMANAGEMENT-087` [Decide what is the right result when a location is not found on request.](https://trello.com/c/5vxxv5NA/245-datamanagement-decide-what-is-the-right-result-when-a-location-is-not-found-on-request) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-089` [Remove the Component feature from the Location service so its usage requires the creation of a new access instance. This requires to separate the cache from the search features.](https://trello.com/c/oke3Jx75/299-datamanagement-remove-the-component-feature-from-the-location-service-so-its-usage-requires-the-creation-of-a-new-access-instanc) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-090` [Replace the class loader dependent by a traditional file iteration and file loading using the file system adapter.](https://trello.com/c/ClphC1kZ/231-datamanagement-replace-the-class-loader-dependent-by-a-traditional-file-iteration-and-file-loading-using-the-file-system-adapter) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-092` [Replace the method 'locationProcessing' by one that does not complete the functionality by implementing side effects.](https://trello.com/c/DaYgLOgQ/297-datamanagement-replace-the-method-locationprocessing-by-one-that-does-not-complete-the-functionality-by-implementing-side-effect) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-093` [There is a shared location where the code inside is replicated to the POCs project. This way the POC developments will progress with production development and the opposite. The sahed place has all the entities and most of the production Models, Interfaces and Render components. It will also contain some common components and panels.](https://trello.com/c/qI7H47wX/101-ps02-modules-there-is-a-shared-location-where-the-code-inside-is-replicated-to-the-pocs-project-this-way-the-poc-developments-wi) · _PS02-Modules_ · `BACKLOG`

## ESI integration

### To do (7)

- [ ] `DATAMANAGEMENT-095` [Check for ESI server down and then throw an exception to disconnect the server controllers.](https://trello.com/c/WQJ7m4DE/25-datamanagement-check-for-esi-server-down-and-then-throw-an-exception-to-disconnect-the-server-controllers) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-096` [Check that the refrsh code can be setup when the retrofit is created. Then remove it from every esi call.](https://trello.com/c/q2cV55Fj/223-datamanagement-check-that-the-refrsh-code-can-be-setup-when-the-retrofit-is-created-then-remove-it-from-every-esi-call) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-098` [Get the new list of esi configuration properties and create a document to explain their values.](https://trello.com/c/tcBwuUVM/365-datamanagement-get-the-new-list-of-esi-configuration-properties-and-create-a-document-to-explain-their-values) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-100` [Wrap ESI calls into a exception interception mechanism so all exception get converted to NeoComRuntimeExceptions from the list of predefined exceptions.](https://trello.com/c/2NkkcduA/200-datamanagement-wrap-esi-calls-into-a-exception-interception-mechanism-so-all-exception-get-converted-to-neocomruntimeexceptions) · _DATAMANAGEMENT_ · `BACKLOG`

## Infrastructure & build

### To do (5)

- [ ] `DATAMANAGEMENT-102` [Components should have a prefix that depends on the module so multiple modules can have different version of the same component. It should also have a v<n> to indicate the version of the component so different requirements components will not interfere with previous developments as now.](https://trello.com/c/N7pG1AGM/102-ps03-naming-components-should-have-a-prefix-that-depends-on-the-module-so-multiple-modules-can-have-different-version-of-the-sam) · _PS03-Naming_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-104` [Evaluate the cost to migrate the A5POC to the Angular version 6.](https://trello.com/c/REkstwYX/150-psangular-6-evaluate-the-cost-to-migrate-the-a5poc-to-the-angular-version-6) · _PS · ANGULAR 6_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-106` [Check if the deploy scripts are to be maintained. If so then refactor the code to use common library.](https://trello.com/c/x5Jw90s1/1073-refactor-check-if-the-deploy-scripts-are-to-be-maintained-if-so-then-refactor-the-code-to-use-common-library) · _REFACTOR_ · `MPV-Prepare`

## Market

### To do (4)

- [ ] `DATAMANAGEMENT-107` [Create an exception recorder to dump to an special file and the exception information and keep the application logs clean.](https://trello.com/c/1vJPWFHL/278-datamanagement-create-an-exception-recorder-to-dump-to-an-special-file-and-the-exception-information-and-keep-the-application-lo) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-109` [EveItem has been reduced and there is not market data access. This will impact on api specifications so this should be recovered on next iteration.](https://trello.com/c/MvSDQobt/202-datamanagementrefactor-eveitem-has-been-reduced-and-there-is-not-market-data-access-this-will-impact-on-api-specifications-so-th) · _DATAMANAGEMENT · REFACTOR_ · `BACKLOG`

## Industry & fittings

### To do (4)

- [ ] `DATAMANAGEMENT-111` [When processing a Fitting and adding the fitting items process the NeoItem so the full item information is linked to the FittingItem.](https://trello.com/c/xhR21YzO/613-when-processing-a-fitting-and-adding-the-fitting-items-process-the-neoitem-so-the-full-item-information-is-linked-to-the-fitting) · `BACKLOG`
- [ ] `DATAMANAGEMENT-112` [There is a new entity to save the fitting build action preferences. This new entity should have a repository loaded as a @Repository](https://trello.com/c/hJBtGo2C/693-datamanagement-there-is-a-new-entity-to-save-the-fitting-build-action-preferences-this-new-entity-should-have-a-repository-loade) · _DATAMANAGEMENT_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-113` [Updated logs insformation for this endpoint .](https://trello.com/c/Vguwg5da/262-datamanagement-updated-logs-insformation-for-this-endpoint-esidataadaptergetcorporationscorporationid) · _DATAMANAGEMENT · ESIDataAdapter.getCorporationsCorporationId_ · `BACKLOG`

## Pilot & character

### To do (2)

- [ ] `DATAMANAGEMENT-115` [The database descriptor validation should have on account the different values for the postgres and sqlite databases. Not all fields are mandatory.](https://trello.com/c/FgPtR402/220-datamanagement-the-database-descriptor-validation-should-have-on-account-the-different-values-for-the-postgres-and-sqlite-databa) · _DATAMANAGEMENT_ · `BACKLOG`

## General

### To do (2)

- [ ] `DATAMANAGEMENT-117` [Add the Settings isolation code to allow use of user configurable settings on the DataMangement library.](https://trello.com/c/P5Ptuy2Y/320-add-the-settings-isolation-code-to-allow-use-of-user-configurable-settings-on-the-datamangement-library) · `BACKLOG`
- [ ] `DATAMANAGEMENT-118` [Move to the library the AppComponent and the Viewer.](https://trello.com/c/xsQalQi6/771-library-move-to-the-library-the-appcomponent-and-the-viewer) · _LIBRARY_ · `BACKLOG`

## Refactoring

### To do (2)

- [ ] `DATAMANAGEMENT-119` [Include the common dimensinfin library published at Bit.](https://trello.com/c/XfpFXGhk/653-refactor-include-the-common-dimensinfin-library-published-at-bit) · _REFACTOR_ · `BACKLOG`
- [ ] `DATAMANAGEMENT-120` [Move storage management service wrapped inside the Isolation into the Bit library.](https://trello.com/c/qs9KppOL/659-refactor-move-storage-management-service-wrapped-inside-the-isolation-into-the-bit-library) · _REFACTOR_ · `BACKLOG`
