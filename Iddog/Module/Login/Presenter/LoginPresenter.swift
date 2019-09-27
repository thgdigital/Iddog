//
//  LoginPresenter.swift
//  Iddog
//
//  Created by THIAGO on 27/09/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class LoginPresenter: NSObject, LoginPresenterInput {
    
    weak var output: LoginPresenterOutput?
    
    var wireframe: LoginRoute
    
    var interactor: LoginInteractorInput
    
    init(wireframe: LoginRoute, interactor: LoginInteractorInput) {
        self.wireframe = wireframe
        self.interactor = interactor
    }
    
    func sendLogin(with email: String) {
        interactor.fecth(email: email)
    }
}

extension LoginPresenter: LoginInteractorOutput {
    
    func didError(with error: Error) {
        
    }
    
    func didLogged() {
        
    }
    
    
}
