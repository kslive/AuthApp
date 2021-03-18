//
//  AppDelegate.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 17.03.2021.
//

import IQKeyboardManager

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    private let keyboardManager = IQKeyboardManager.shared()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupKeyboard()
        return true
    }
}

extension AppDelegate {
    private func setupKeyboard() {
        keyboardManager.isEnableAutoToolbar = false
        keyboardManager.shouldResignOnTouchOutside = true
        keyboardManager.isEnabled = true
        keyboardManager.keyboardDistanceFromTextField = 10
    }
}
