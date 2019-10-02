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
        let presenter = ListDogPresenter()
        let listController = ListDogController()
        presenter.output = listController
        listController.presenter = presenter
        let navigation = UINavigationController(rootViewController: listController)
        return navigation
    }
}
