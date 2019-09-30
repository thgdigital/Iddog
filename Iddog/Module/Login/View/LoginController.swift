//
//  LoginController.swift
//  Iddog
//
//  Created by THIAGO on 27/09/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    var presenter: LoginPresenterInput!
    
    @IBOutlet weak var boxViewEmail: UIView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
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
        presenter?.sendLogin(with: emailTextField.text)
    }
    
    
    fileprivate func setLayoutBorder(width: CGFloat, color: UIColor) {
        boxViewEmail.layer.borderWidth = width
        boxViewEmail.layer.borderColor = color.cgColor
        boxViewEmail.setNeedsLayout()
    }
}

extension LoginController: LoginPresenterOutput {
    
    func clearBorder() {
        setLayoutBorder(width: 0, color: .clear)
    }
    
    
    func alert(title: String, message: String) {
        
        let alert  = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Tentar Novamente", style: .default, handler: { dados in
            self.presenter?.sendLogin(with: self.emailTextField.text)
        }))
        
        present(alert, animated: true)
    }
    
    func didError() {
        setLayoutBorder(width: 1, color: .red)
    }
}
