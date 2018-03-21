//
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//


import XCTest
@testable import ___PROJECTNAMEASIDENTIFIER___


class ___VARIABLE_sceneName___ViewControllerTests: XCTestCase {

    var window: UIWindow?
    var viewController: ___VARIABLE_sceneName___ViewController?

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        self.window = UIWindow()
        self.viewController = ___VARIABLE_sceneName___ViewController()
    }

    override func tearDown() {
        self.viewController = nil
        self.window = nil
        super.tearDown()
    }

    // MARK: Setup

    func loadView() {
        if let view = self.viewController?.view {
            self.window?.addSubview(view)
            RunLoop.current.run(until: Date())
        }
    }

    class ___VARIABLE_sceneName___BusinessLogicSpy: ___VARIABLE_sceneName___BusinessLogic {

        var doSomethingCalled = false

        func doSomething(_ request: ___VARIABLE_sceneName___.Something.Request) {
            doSomethingCalled = true
        }
    }

    class ___VARIABLE_sceneName___ViewLogicSpy: UIView, ___VARIABLE_sceneName___ViewLogic {

        var setEmailTextFieldErrorCalled = false
        var clearEmailTextFieldErrorCalled = false
        var emailText: String?
        var errorMessage: String?

        weak var viewDelegate: ___VARIABLE_sceneName___ViewDelegate?

        var emailTextFieldText: String? {
            get {
                return self.emailText
            }
            set(text) {
                self.emailText = text
            }
        }

        func setEmailTextFieldError(errorMessage: String) {
            setEmailTextFieldErrorCalled = true
            self.errorMessage = errorMessage
        }

        func clearEmailTextFieldError() {
            clearEmailTextFieldErrorCalled = true
        }
    }

    class ___VARIABLE_sceneName___RoutingLogicSpy: ___VARIABLE_sceneName___RoutingLogic, ___VARIABLE_sceneName___DataPassing {

        var routeToSomewhereScreenCalled = false

        var dataStore: ___VARIABLE_sceneName___DataStore?

        func routeToSomewhereScreen() {
            self.routeToPasswordResetSuccessScreenCalled = true
        }
    }

    // MARK: Tests

    func test_shouldDoSomethingWhenViewIsLoaded() {

        // Given
        let interactorSpy = ___VARIABLE_sceneName___BusinessLogicSpy()
        self.viewController?.interactor = interactorSpy

        // When
        loadView()

        // Then
        XCTAssertTrue(interactorSpy.doSomethingCalled)
    }

    func test_displaySomething() {

        // Given

        let testEmail = "dieter@ding.com"

        let viewSpy = ___VARIABLE_sceneName___ViewLogicSpy()
        self.viewController?.someView = viewSpy

        loadView()

        // When
        let viewModel = ___VARIABLE_sceneName___.Something.ViewModel(email: testEmail)
        self.viewController?.displaySomething(viewModel)

        // Then
        XCTAssertEqual(viewSpy.emailTextFieldText, testEmail)
    }

    func test_displayEmailError() {

        // Given

        let testError = "Error"

        let viewSpy = ___VARIABLE_sceneName___ViewLogicSpy()
        self.viewController?.someView = viewSpy

        loadView()

        // When
        let viewModel = ___VARIABLE_sceneName___.Something.EmailErrorViewModel(errorMessage: testError)
        self.viewController?.displayEmailError(viewModel)

        // Then
        XCTAssertTrue(viewSpy.setEmailTextFieldErrorCalled)
        XCTAssertEqual(viewSpy.errorMessage, testError)
    }
}
