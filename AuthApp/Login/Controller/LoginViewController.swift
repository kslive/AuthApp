//
//  LoginViewController.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 17.03.2021.
//

import UIKit

class LoginViewController: UIViewController {
    private let viewManager = ViewManager.shared
    private let userDefManager = UserDefManager.shared
    private let networkManager = NetworkManager.shared
    private let alert = AlertManager.shared
    
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
    func pressedNext(login: String, password: String) {
        networkManager.auth(login: login, password: password) { [weak self] auth in
            guard let self = self else { return }
            if let token = auth?.token {
                self.userDefManager.setToken(token: token)
                self.viewManager.openPinVC(self)
            } else {
                self.alert.showAlert(message: .errorLoginOrPassword, self)
            }
        }
    }
}
