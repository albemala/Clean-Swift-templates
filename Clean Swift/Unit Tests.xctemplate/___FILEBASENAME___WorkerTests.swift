//
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//


import XCTest
@testable import ___PROJECTNAMEASIDENTIFIER___


class ___VARIABLE_sceneName___WorkerTests: XCTestCase {

    var worker: ___VARIABLE_sceneName___Worker?

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        self.worker = ___VARIABLE_sceneName___Worker()
    }

    override func tearDown() {
        self.worker = nil
        super.tearDown()
    }

    // MARK: Test setup

    class DingApiClientSpy: DingApiClient {

        var sendRequestCalled = false

        override func sendRequest<T: DingApiResponse>(_ request: DingApiRequest, responseType: T.Type, completion: @escaping (T?) -> Void, failure: @escaping (Error?) -> Void) {
            self.sendRequestCalled = true
            completion(nil)
        }
    }

    // MARK: Tests

    func testSomething() {

        // Given

        let testEmail = "dieter@ding.com"

        let apiClientSpy = DingApiClientSpy()
        self.worker?.apiClient = apiClientSpy

        var completionCalled = false

        // When
        self.worker?.sendRequest(email: testEmail, completion: { response in
            completionCalled = true
        })

        // Then
        XCTAssertTrue(apiClientSpy.sendRequestCalled)
        XCTAssertTrue(completionCalled)
    }
}
