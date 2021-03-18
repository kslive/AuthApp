//
//  Constant.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 17.03.2021.
//

import UIKit

enum UserDefKey {
    static let token = "TOKEN"
    static let password = "PASSWORD"
}

enum Identifiers {
    static let storyboard = "AuthApp"
    
    static let loginVC = "LoginVC"
    static let pinVC = "PinVC"
    static let processedVC = "ProcessedVC"
    static let detailProcessedViewController = "DetailProcessedVC"
    
    static let processedCell = "ProcessedCell"
    static let headerCell = "Header"
    static let detailCell = "DetailCell"
}

enum ParametersKey {
    static let login = "login"
    static let password = "password"
}

enum Constants {
    static let heightHeader: CGFloat = 40
}
