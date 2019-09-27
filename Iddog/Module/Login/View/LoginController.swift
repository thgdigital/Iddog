//
//  LoginController.swift
//  Iddog
//
//  Created by THIAGO on 27/09/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    weak var presenter: LoginPresenterInput?
    
    @IBOutlet weak var boxViewEmail: UIView!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        boxViewEmail.dropShadow(radius: 20)
        sendButton.dropShadow(radius: 20)
        sendButton.addTarget(self, action: #selector(didTap(_:)), for: .touchUpInside)
    }
    
    @objc func didTap(_ sender: UIButton) {
        
    }
    
}

extension LoginController: LoginPresenterOutput {
    func didError() {
    }
}
