//
//  PinViewController.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 17.03.2021.
//

import UIKit

class PinViewController: UIViewController {
    private let viewManager = ViewManager.shared
    @IBOutlet var pinView: PinView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension PinViewController {
    private func setup() {
        pinView.delegate = self
    }
}

extension PinViewController: PinViewProtocol {
    func pressedNumbers(_ sender: UIButton) {}
    
    func pressedSkip() {
        viewManager.openProcessedVC(self)
    }
}
