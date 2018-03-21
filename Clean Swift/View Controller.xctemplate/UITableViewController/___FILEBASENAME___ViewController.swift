//
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol ___VARIABLE_sceneName___DisplayLogic: class {
    func displaySomething(viewModel: ___VARIABLE_sceneName___.Something.ViewModel)
}

class ___VARIABLE_sceneName___ViewController: UITableViewController {

    var interactor: ___VARIABLE_sceneName___BusinessLogic?
    var router: (NSObjectProtocol & ___VARIABLE_sceneName___RoutingLogic & ___VARIABLE_sceneName___DataPassing)?

    var someView = SomeView()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
}

// MARK: Setup

private extension ___VARIABLE_sceneName___ViewController {

    func setup() {
        let viewController = self
        let interactor = ___VARIABLE_sceneName___Interactor()
        let presenter = ___VARIABLE_sceneName___Presenter()
        let router = ___VARIABLE_sceneName___Router()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

// MARK: Setup UI

extension ___VARIABLE_sceneName___ViewController {

    override func loadView() {
        super.loadView()
        self.view.backgroundColor = Style.Colors.white
        self.hideKeyboardOnTap()
        self.setupView()
    }

    private func setupView() {

        self.someView.viewDelegate = self

        self.view.addSubview(self.someView)

        self.someView.left(to: self.view)
        self.someView.right(to: self.view)
        self.someView.top(to: self.view, self.topLayoutGuide.bottomAnchor)
        self.someView.bottom(to: self.view)
    }
}

// MARK: View lifecycle

extension ___VARIABLE_sceneName___ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }

    private func doSomething() {
        let request = ___VARIABLE_sceneName___.Something.Request()
        interactor?.doSomething(request: request)
    }
}

// MARK: ___VARIABLE_sceneName___DisplayLogic

extension ___VARIABLE_sceneName___ViewController: ___VARIABLE_sceneName___DisplayLogic {

    func displaySomething(viewModel: ___VARIABLE_sceneName___.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

// MARK: ViewDelegate

extension ___VARIABLE_sceneName___ViewController: ViewDelegate {

}
