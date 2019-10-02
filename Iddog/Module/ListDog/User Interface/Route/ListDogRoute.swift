//
//  ListDogRoute.swift
//  Iddog
//
//  Created by THIAGO on 30/09/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class ListDogRoute {
    
    weak var windows: UIWindow?
    
    func makeScreen(windows: UIWindow?) -> UINavigationController {
        let presenter = ListDogPresenter(route: self)
        let listController = ListDogController()
        presenter.output = listController
        listController.presenter = presenter
        let navigation = UINavigationController(rootViewController: listController)
        self.windows = windows
        return navigation
    }
    
    func showLogin() {
        let loginController = LoginRoute().makeScreen(windows: windows)
        windows?.rootViewController = loginController
    }
}
