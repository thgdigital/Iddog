//
//  UserInteractor.swift
//  Iddog
//
//  Created by THIAGO on 02/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

protocol UserInteractorInput {
    func save(user: UserModel)
    func deleteUser()
}

class UserInteractor: UserInteractorInput {
    
    var manager: UserManager
    
    init(manager: UserManager) {
        self.manager = manager
    }
    
    func save(user: UserModel) {
        manager.save(user: user)
    }
    
    func deleteUser() {
        manager.clearUserData()
    }
    
}
