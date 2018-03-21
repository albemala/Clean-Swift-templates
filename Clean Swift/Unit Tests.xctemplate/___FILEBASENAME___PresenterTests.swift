//
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//


import XCTest
@testable import ___PROJECTNAMEASIDENTIFIER___


class ___VARIABLE_sceneName___PresenterTests: XCTestCase {

    var presenter: ___VARIABLE_sceneName___Presenter?

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        self.presenter = ___VARIABLE_sceneName___Presenter()
    }

    override func tearDown() {
        self.presenter = nil
        super.tearDown()
    }

    // MARK: Setup

    class ___VARIABLE_sceneName___DisplayLogicSpy: ___VARIABLE_sceneName___DisplayLogic {

        var displaySomethingCalled = false

        func displaySomething(_ viewModel: ___VARIABLE_sceneName___.Something.ViewModel) {
            displaySomethingCalled = true
        }
    }

    // MARK: Tests

    func test_presentSomething() {

        // Given
        let viewControllerSpy = ___VARIABLE_sceneName___DisplayLogicSpy()
        self.presenter?.viewController = viewControllerSpy

        // When
        let response = ___VARIABLE_sceneName___.Something.Response()
        self.presenter.presentSomething(response)

        // Then
        XCTAssertTrue(viewControllerSpy.displaySomethingCalled)
    }
}
