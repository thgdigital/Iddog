//
//  ItemRoute.swift
//  Iddog
//
//  Created by THIAGO on 30/09/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class ItemRoute {
    
    func showLogin() {
        let windows = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        let loginController = LoginRoute().makeScreen(windows: windows)
        windows?.rootViewController = loginController
    }
}
