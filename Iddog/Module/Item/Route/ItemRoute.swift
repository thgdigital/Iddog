//
//  ItemRoute.swift
//  Iddog
//
//  Created by THIAGO on 30/09/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit
import Lightbox

class ItemRoute {
    
    var listDogController: ListDogController
    
    init(listDogController: ListDogController) {
        self.listDogController = listDogController
    }
    
    func showLogin() {
        let windows = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        let loginController = LoginRoute().makeScreen(windows: windows)
        windows?.rootViewController = loginController
    }
    
    func showAlert(title: String, message: String) {
        let alert  = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Tentar Novamente", style: .default, handler: { dados in
            self.listDogController.presenter.viewDidLoad()
        }))
        
        let topController = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.visibleViewController()
        topController?.present(alert, animated: true)
    }
    
    func showLightbox(images: [LightboxImage], at index: Int) {
        let controller = LightboxController(images: images, startIndex: index)
        LightboxConfig.CloseButton.text = "Fechar"
        if #available(iOS 13.0, *) {
            controller.isModalInPresentation = true
            controller.modalPresentationStyle = .fullScreen
        }
        
        listDogController.present(controller, animated: true, completion: nil)
    }
}
