//
//  ItemPresenter.swift
//  Iddog
//
//  Created by THIAGO on 30/09/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class ItemPresenter: ItemPresenterInput {
    
    weak var output: ItemPresenterOutput?
    
    var type: Category
    
    var interactor: ItemInteractorInput
    
    var userManager: UserManager
    
    var route: ItemRoute
    
    init(type: Category, interactor: ItemInteractorInput, userManager: UserManager, route: ItemRoute) {
        self.type = type
        self.interactor = interactor
        self.userManager = userManager
        self.route = route
    }
    
    func viewDidLoad() {
        interactor.fecth(category: type)
        output?.loading()
    }
}
extension ItemPresenter: ItemInteractorOutput {
    
    func fetched(list: [String]) {
        output?.stopLoading()
        output?.fecthed(list: list)
    }
    
    func didError(with error: ErrorType) {
        switch error {
        case .unauthorized:
            userManager.clearUserData()
            route.showLogin()
        default:break
        }
        
    }
    
}
