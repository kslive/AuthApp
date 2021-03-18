//
//  PinViewController.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 17.03.2021.
//

import UIKit

enum PinState {
    case new
    case old
}

class PinViewController: UIViewController {
    private let viewManager = ViewManager.shared
    private let userDef = UserDefManager.shared
    
    @IBOutlet var pinView: PinView!
    var state: PinState = .new
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension PinViewController {
    private func setup() {
        pinView.delegate = self
        setupState()
    }
    
    private func setupState() {
        pinView.setFor(state: state)
    }
}

extension PinViewController: PinViewProtocol {
    func pressedNumbers(isEnd: Bool, for code: String) {
        if isEnd {
            switch state {
            case .new:
                userDef.setPassword(code: code) { [weak self] in
                    guard let self = self else { return }
                    self.viewManager.openProcessedVC(self)
                }
            case .old:
                if code == userDef.getPassword() {
                    viewManager.openProcessedVC(self)
                }
            }
        }
    }
    
    func pressedSkip() {
        viewManager.openProcessedVC(self)
    }
}
