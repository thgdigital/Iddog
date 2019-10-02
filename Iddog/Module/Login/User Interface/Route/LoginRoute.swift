//
//  LoginRoute.swift
//  Iddog
//
//  Created by THIAGO on 27/09/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class LoginRoute: StoryboardInstanciate {
    
    var storyboardName: String = "Login"
    
    weak var viewController: LoginController?
    
    weak var windows: UIWindow?
    
     func makeScreen(windows: UIWindow?) -> LoginController {
        let interactor = LoginInteractor(userManager: UserManager())
        let presenter = LoginPresenter(wireframe: self, interactor: interactor)
        interactor.output = presenter
        self.windows = windows
        
       guard let loginControler = viewControllerFromStoryboard(withIdentifier: "LoginController") as? LoginController else {
            fatalError("Não existe ViewController")
        }
        loginControler.presenter = presenter
        viewController = loginControler
        presenter.output = viewController
        return loginControler
    }
    
    func listDog() {
        windows?.rootViewController = ListDogRoute().makeScreen(windows: windows)
    }
    
}
