//
//  UserManager.swift
//  Iddog
//
//  Created by THIAGO on 02/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation

class UserManager: NSObject {
    
    let userSessionKey = "com.save.usersession"
    
    func save(user: UserModel) {
        UserDefaults.standard.set(["id": user.id, "email": user.email, "token": user.token], forKey: userSessionKey)
    }
    
    func getToken() -> String {
        guard let dict = UserDefaults.standard.value(forKey: userSessionKey) as? [String: String], let token = dict["token"] else {
            return ""
        }
        return token
    }
    
    func clearUserData() {
        UserDefaults.standard.removeObject(forKey: userSessionKey)
    }
}
