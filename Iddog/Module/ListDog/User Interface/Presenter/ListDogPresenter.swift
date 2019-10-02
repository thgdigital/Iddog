//
//  ListDogPresenter.swift
//  Iddog
//
//  Created by THIAGO on 30/09/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class ListDogPresenter: ListDogPresenterInput {
    
    weak var output: ListDogPresenterOutput?
    
    var listDog = ["Husky", "Hound", "Pug", "labrador"]
    
    func viewDidLoad() {
        output?.fetch(list: listDog.map({ $0.capitalized }), category:  [.husky, .hound, .pug, .labrador])
    }

}
