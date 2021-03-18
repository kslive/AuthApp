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
        let controller = storyboard.instantiateViewController(identifier: Identifiers.pinVC ) as! PinViewController
        controller.state = .old
        return controller
    }
    
    func openPinVC(_ vc: UIViewController) {
        let controller = storyboard.instantiateViewController(identifier: Identifiers.pinVC ) as! PinViewController
        controller.state = .new
        controller.modalPresentationStyle = .fullScreen
        vc.present(controller, animated: true)
    }
    
    func openProcessedVC(_ vc: UIViewController) {
        let controller = storyboard.instantiateViewController(identifier: Identifiers.processedVC ) as! UINavigationController
        controller.modalPresentationStyle = .fullScreen
        vc.present(controller, animated: true)
    }
    
    func pushDetailProcessedVC(for number: Int?, _ nv: UINavigationController?) {
        let controller = storyboard.instantiateViewController(identifier: Identifiers.detailProcessedViewController ) as! DetailProcessedViewController
        controller.number = number
        nv?.pushViewController(controller, animated: true)
    }
}
