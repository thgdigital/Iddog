//
//  LoginPresenter.swift
//  Iddog
//
//  Created by THIAGO on 27/09/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class LoginPresenter: LoginPresenterInput {
    
    weak var output: LoginPresenterOutput?
    
    var wireframe: LoginRoute
    
    var interactor: LoginInteractorInput
    
    init(wireframe: LoginRoute, interactor: LoginInteractorInput) {
        self.wireframe = wireframe
        self.interactor = interactor
    }
    
    func sendLogin(with email: String?) {
        output?.clearBorder()
        interactor.fecth(email: email)
        output?.loading()
    }
}

extension LoginPresenter: LoginInteractorOutput {
    
    func didError(with error: ErrorType) {
        output?.stopLoading()
        let title = "Oppss Error"
        switch error {
        case .emailEmpty, .emailInvalid:
            output?.didError()
        case .networking:
            output?.alert(title: title, message: "Verifique sua conexão")
        case .serve:
            output?.alert(title: title, message: "Error com conexão do servidor")
        case .unauthorized:
            output?.alert(title: title, message: "Usuário não autorizado")
        }
    }
    
    func didLogged() {
        wireframe.listDog()
    }
}
