//
//  ItemPresenterBuilder.swift
//  Iddog
//
//  Created by THIAGO on 02/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class ItemPresenterBuilder {

    static func make(category: Category, view: ItemPresenterOutput?, controller: ListDogController) -> ItemPresenter {
        let interactor = ItemInteractor()
        let route = ItemRoute(listDogController: controller)
        let presenter = ItemPresenter(type: category, interactor: interactor, userManager: UserManager(), route: route)
        interactor.output = presenter
        presenter.output = view
        return presenter
    }
}
