//
//  ListDogProtocol.swift
//  Iddog
//
//  Created by THIAGO on 30/09/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

protocol ListDogPresenterInput {
    func viewDidLoad()
    func logout()
}
protocol ListDogPresenterOutput: class {
    func fetch(list: [String], category: [Category])
}
