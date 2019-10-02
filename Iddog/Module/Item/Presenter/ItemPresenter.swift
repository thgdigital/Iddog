//
//  ItemPresenter.swift
//  Iddog
//
//  Created by THIAGO on 30/09/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit
import Lightbox

class ItemPresenter: ItemPresenterInput {
    
    weak var output: ItemPresenterOutput?
    
    var type: Category
    
    var interactor: ItemInteractorInput
    
    var userManager: UserManager
    
    var route: ItemRoute
    
    var listImages: [String] = []
    
    init(type: Category, interactor: ItemInteractorInput, userManager: UserManager, route: ItemRoute) {
        self.type = type
        self.interactor = interactor
        self.userManager = userManager
        self.route = route
    }
    
    func viewDidLoad() {
        fetch()
    }
    
    func retry() {
        fetch()
    }
    
    func fetch() {
        interactor.fecth(category: type)
        output?.loading()
    }
    
    func didSelected(index: Int) {
        let urls = listImages.map({ URL(string: $0 )! })
        let lightboxImage = urls.map({ LightboxImage(imageURL: $0) })
        route.showLightbox(images: lightboxImage, at: index)
    }
}

extension ItemPresenter: ItemInteractorOutput {
    
    func fetched(list: [String]) {
        listImages = list
        output?.stopLoading()
        output?.fecthed(list: listImages)
    }
    
    func didError(with error: ErrorType) {
        let title = "Oppss Error"
        switch error {
        case .unauthorized:
            userManager.clearUserData()
            route.showLogin()
        case .networking:
            route.showAlert(title: title, message: "Verifique sua conexão")
        case .serve:
            route.showAlert(title: title, message: "Error com conexão do servidor")
        default:break
        }
        
    }
    
}
