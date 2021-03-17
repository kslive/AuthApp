//
//  LoginViewController.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 17.03.2021.
//

import UIKit

class LoginViewController: UIViewController {
    private let viewManager = ViewManager.shared
    
    @IBOutlet var loginView: LoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension LoginViewController {
    private func setup() {
        loginView.delegate = self
    }
}

extension LoginViewController: LoginViewProtocol {
    func pressedEye() {}
    
    func pressedNext() {
        viewManager.openPinVC(self)
    }
}
