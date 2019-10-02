//
//  LoginTest.swift
//  IddogTests
//
//  Created by THIAGO on 02/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import XCTest
import Quick
import Nimble

@testable import Iddog


class LoginTest: QuickSpec {
    
    override func spec() {
        var interactor: LoginInteractor!
        var presenter: LoginPresenter!
        var userInteractor: UserInteractor!
        
        describe("LoginTests") {
            beforeSuite {
                let route = LoginRoute()
                interactor = LoginInteractor(userManager: UserManager())
                userInteractor = UserInteractor(manager: UserManager())
                presenter = LoginPresenter(wireframe: route, interactor: interactor, userInteractor: userInteractor)
                interactor.output = presenter
                
            }
        }
        
        context("Protocol") {
            it("checking Conforming Protocol") {
                expect(interactor).to(beAKindOf(LoginInteractor.self))
                expect(interactor).to(beAKindOf(LoginInteractorInput.self))
                expect(presenter).to(beAKindOf(LoginPresenter.self))
                expect(presenter).to(beAKindOf(LoginPresenterInput.self))
                expect(presenter).to(beAKindOf(LoginInteractorOutput.self))
            }
            
            it("OutputNill") {
                expect(interactor.output).notTo(beNil())
                expect(presenter.output).to(beNil())
            }
            
            it("ConvertUser") {
                let userData = Data()
                let user = interactor.getUser(data: userData)
                expect(user).to(beNil())
            }
            
            it("Usuario Token") {
                interactor.findUser(email: "t.vaz.santos@gmail.com")
                expect(interactor.userManager.getToken()).toEventually(equal("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJpZGRvZy1zZXJ2aWNlIiwic3ViIjoiNWQ4ZDY5NTU0NzRkYWE0YjYxYjIwMWM4IiwiaWF0IjoxNTY5NTQ4NjI5LCJleHAiOjE1NzA4NDQ2Mjl9.rxJR8tC_8XwtpbwY1ZiSVflFQKPPvTDdYbEI7dr1PNk"), timeout: 2.0)
            }
            
            it("Usuario sem token") {
                interactor.userManager.clearUserData()
                expect(interactor.userManager.getToken()).toEventually(equal(""), timeout: 2.0)
            }
            
            it("Email Valid") {
                let email = "teste@teste.com"
                expect(email.validEmail()).to(beTrue())
            }
        }
        
    }
}
