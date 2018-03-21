//
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//


import XCTest
@testable import ___PROJECTNAMEASIDENTIFIER___


class ___VARIABLE_sceneName___InteractorTests: XCTestCase {

    var interactor: ___VARIABLE_sceneName___Interactor?

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        self.interactor = ___VARIABLE_sceneName___Interactor()
    }

    override func tearDown() {
        self.interactor = nil
        super.tearDown()
    }

    // MARK: Setup

    class ___VARIABLE_sceneName___PresentationLogicSpy: ___VARIABLE_sceneName___PresentationLogic {

        var presentSomethingCalled = false

        func presentSomething(_ response: ___VARIABLE_sceneName___.Something.Response) {
            presentSomethingCalled = true
        }
    }

    class ___VARIABLE_sceneName___WorkerSpy: ___VARIABLE_sceneName___Worker {

        var response: DingApiResponse?

        override func sendRequest(completion: @escaping (DingApiResponse?) -> Void) {
            completion(self.response)
        }
    }

    // MARK: Tests

    func test_doSomething() {

        // Given
        let presenterSpy = ___VARIABLE_sceneName___PresentationLogicSpy()
        self.interactor?.presenter = presenterSpy

//        let workerSpy = ___VARIABLE_sceneName___WorkerSpy()
//        workerSpy.response = DingApiResponse(
//                fType: "Error",
//                subject: "",
//                time: 0,
//                code: "",
//                description: "",
//                why: .missingInformation,
//                extraDetails: nil)
//        self.interactor?.worker = workerSpy

        // When
        let request = ___VARIABLE_sceneName___.Something.Request()
        self.interactor.doSomething(request)

        // Then
        XCTAssertTrue(presenterSpy.presentSomethingCalled)
//        XCTAssertEqual(spy.errorType, .missingInformation)
    }
}
