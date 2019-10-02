//
//  LoginInteractor.swift
//  Iddog
//
//  Created by THIAGO on 27/09/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation
import Alamofire

class LoginInteractor: LoginInteractorInput {
    
    weak var output: LoginInteractorOutput?
    
    var userManager: UserManager
    
    init(userManager: UserManager) {
        self.userManager = userManager
    }
    
    func fecth(email: String?) {
        
        guard let email = email else {
            output?.didError(with: .emailInvalid)
            return
        }
        
        if email.isEmpty {
            output?.didError(with: .emailEmpty)
        } else if !email.validEmail() {
            output?.didError(with: .emailInvalid)
        } else {
            findUser(email: email)
        }
    }
    
    func findUser(email: String) {
        let parameters: [String: Any] = [ "email": email]
        
        Alamofire.request(RouterManager.login(parameters: parameters)).responseJSON { response in
            
            switch response.result {
                
            case .success:
                guard let data = response.data, let userModel = self.getUser(data: data) else {
                    self.output?.didError(with: .serve)
                    return
                }
               
                self.userManager.save(user: userModel.user)
                
                self.validUser(token: userModel.user.token, completion: { (success) -> Void in
                    if success {
                        self.output?.didLogged()
                    } else {
                        self.output?.didError(with: .unauthorized)
                        self.userManager.clearUserData()
                    }
                })
            case let .failure(error):
                if let error = error as? URLError, error.code == .notConnectedToInternet {
                    self.output?.didError(with: .networking)
                } else {
                    self.output?.didError(with: .serve)
                }
            }
        }
        
    }
    
     func validUser(token: String, completion: @escaping (Bool) -> ()) {
        let parameters: [String: Any] = [ "category": Category.husky]
        Alamofire.request(RouterManager.feed(parameters: parameters)).responseJSON { response in
            switch response.result {
            case .success:
                if response.response?.statusCode == 200 {
                   completion(true)
                } else {
                    completion(false)
                }
               
            case .failure:
                completion(false)
            }
        }
    }
    
     func getUser(data: Data) -> LoginUserModel? {
        do {
            let decoder = JSONDecoder()
            let userModel = try decoder.decode(LoginUserModel.self, from: data)
            return userModel
        } catch {
            return nil
        }
    }
}


enum Category: String {
    case husky = "husky"
    case hound = "hound"
    case pug = "pug"
    case labrador = "labrador"
    
}
enum ErrorType {
    case emailEmpty
    case serve
    case unauthorized
    case emailInvalid
    case networking
}
