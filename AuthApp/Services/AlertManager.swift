//
//  AlertManager.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 18.03.2021.
//

import UIKit

enum AlertMessage: String {
    case errorLoginOrPassword = "Не правильный логин/пароль"
    case errorPinCode = "Не верный PIN"
    case errorToken = "Ошибка Токена!"
}

class AlertManager {
    static let shared = AlertManager()
    
    private init() {}
    
    func showAlert(message: AlertMessage, _ vc: UIViewController) {
        let alert = UIAlertController(title: "Ошибка", message: message.rawValue, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        vc.present(alert, animated: true)
    }
}
