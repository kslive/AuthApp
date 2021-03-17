//
//  ViewManager.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 17.03.2021.
//

import UIKit

class ViewManager {
    private let storyboard = UIStoryboard(name: Identifiers.storyboard, bundle: nil)
    
    static let shared = ViewManager()
    
    private init() {}
    
    func rootLoginViewController() -> UIViewController {
        return storyboard.instantiateViewController(identifier: Identifiers.loginVC ) as! LoginViewController
    }
}
