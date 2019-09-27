//
//  LoginRoute.swift
//  Iddog
//
//  Created by THIAGO on 27/09/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class LoginRoute: StoryboardInstanciate {
    
    var storyboardName: String = "Login"
    
    weak var viewController: LoginController?
    
     func makeScreen() -> LoginController {
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(wireframe: self, interactor: interactor)
        interactor.output = presenter
        
       guard let loginControler = viewControllerFromStoryboard(withIdentifier: "LoginController") as? LoginController else {
            fatalError("Não existe ViewController")
        }
        loginControler.presenter = presenter
        viewController = loginControler
        presenter.output = viewController
        return loginControler
    }
}
