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
    
    func rootPinViewController() -> UIViewController {
        return storyboard.instantiateViewController(identifier: Identifiers.pinVC ) as! PinViewController
    }
    
    func openPinVC(_ vc: UIViewController) {
        let controller = storyboard.instantiateViewController(identifier: Identifiers.pinVC ) as! PinViewController
        controller.modalPresentationStyle = .fullScreen
        vc.present(controller, animated: true)
    }
    
    func openProcessedVC(_ vc: UIViewController) {
        let controller = storyboard.instantiateViewController(identifier: Identifiers.rocessedVC ) as! UINavigationController
        controller.modalPresentationStyle = .fullScreen
        vc.present(controller, animated: true)
    }
}
