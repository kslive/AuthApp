//
//  LoginView.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 17.03.2021.
//

import UIKit

protocol LoginViewProtocol: class {
    func pressedNext()
}

class LoginView: UIView {
    private var isSecure = false
    
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    weak var delegate: LoginViewProtocol?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .white
    }
    
    @IBAction func pressedEye(_ sender: UIButton) {
        togglePasswordTF(for: isSecure)
    }
    
    @IBAction func pressedNext(_ sender: UIButton) {
        delegate?.pressedNext()
    }
}

extension LoginView {
    private func togglePasswordTF(for state: Bool) {
        isSecure.toggle()
        passwordTF.isSecureTextEntry = state
    }
}
