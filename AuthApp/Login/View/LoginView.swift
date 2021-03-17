//
//  LoginView.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 17.03.2021.
//

import UIKit

protocol LoginViewProtocol: class {
    func pressedEye()
    func pressedNext()
}

class LoginView: UIView {
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    weak var delegate: LoginViewProtocol?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .white
    }
    
    @IBAction func pressedEye(_ sender: UIButton) {
        delegate?.pressedEye()
    }
    
    @IBAction func pressedNext(_ sender: UIButton) {
        delegate?.pressedNext()
    }
}
