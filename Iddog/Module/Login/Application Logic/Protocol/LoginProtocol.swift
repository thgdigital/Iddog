//
//  LoginProtocol.swift
//  Iddog
//
//  Created by THIAGO on 27/09/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

protocol LoginPresenterInput {
    func sendLogin(with email: String?)
}

protocol LoginPresenterOutput: class {
    func didError()
    func alert(title: String, message: String)
    func clearBorder()
    func loading()
    func stopLoading()
}

protocol LoginInteractorInput {
    func fecth(email: String?)
    func AuthenticatedUser()
}

protocol LoginInteractorOutput: class {
    func didError(with error: ErrorType)
    func didLogged()
    func loggedIn(user: UserModel)
}
