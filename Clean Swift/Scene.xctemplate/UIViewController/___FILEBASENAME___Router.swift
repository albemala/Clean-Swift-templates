//
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

@objc protocol ___VARIABLE_sceneName___RoutingLogic {
    func routeToSomewhere()
}

protocol ___VARIABLE_sceneName___DataPassing {
    var dataStore: ___VARIABLE_sceneName___DataStore? { get }
}

class ___VARIABLE_sceneName___Router: NSObject, ___VARIABLE_sceneName___RoutingLogic, ___VARIABLE_sceneName___DataPassing {

    weak var viewController: ___VARIABLE_sceneName___ViewController?
    var dataStore: ___VARIABLE_sceneName___DataStore?

    func routeToSomewhere() {
        let destinationViewController = SomewhereViewController()
        var destinationDataStore = destinationViewController.router?.dataStore
        self.passDataToSomewhere(source: self.dataStore, destination: &destinationDataStore)
        self.navigateToSomewhere(destinationViewController)
    }

    // MARK: Passing data

    private func passDataToSomewhere(source: ___VARIABLE_sceneName___DataStore?, destination: inout SomewhereDataStore?) {
        destination?.name = source?.name
    }

    // MARK: Navigation

    private func navigateToSomewhere(_ viewController: SomewhereViewController) {
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
}
