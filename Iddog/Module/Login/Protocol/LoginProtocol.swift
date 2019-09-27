//
//  LoginProtocol.swift
//  Iddog
//
//  Created by THIAGO on 27/09/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

protocol LoginPresenterInput: class {
    func sendLogin(with email: String)
}

protocol LoginPresenterOutput: class {
    func didError()
}

protocol LoginInteractorInput {
    func fecth(email: String)
}

protocol LoginInteractorOutput: class {
    func didError(with error: Error)
    func didLogged()
}
