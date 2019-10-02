//
//  ItemProtocol.swift
//  Iddog
//
//  Created by THIAGO on 30/09/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

protocol ItemPresenterInput {
    func viewDidLoad()
}

protocol ItemPresenterOutput: class {
    func fecthed(list: [String])
    func loading()
    func stopLoading()
    func alert(title: String, message: String)
}

protocol ItemInteractorInput {
    func fecth(category: Category)
}

protocol ItemInteractorOutput: class {
    func fetched(list: [String])
    func didError(with error: ErrorType)
}
