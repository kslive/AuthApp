//
//  SceneDelegate.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 17.03.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    private let viewManager = ViewManager.shared
    private let userDefManager = UserDefManager.shared
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if !userDefManager.getToken().isEmpty {
            makeRootScene(scene, for: viewManager.rootPinViewController())
        } else {
            makeRootScene(scene, for: viewManager.rootLoginViewController())
        }
    }
    
    private func makeRootScene(_ scene: UIScene, for controller: UIViewController) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}

