//
//  PinView.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 17.03.2021.
//

import UIKit

protocol PinViewProtocol: class {
    func pressedNumbers(_ sender: UIButton)
    func pressedSkip()
}

class PinView: UIView {
    @IBOutlet var elipsImages: [UIImageView]!
    
    weak var delegate: PinViewProtocol?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .white
    }
    
    @IBAction func pressedNumbers(_ sender: UIButton) {
        delegate?.pressedNumbers(sender)
        print(sender.titleLabel?.text)
    }
    
    @IBAction func pressedSkip(_ sender: UIButton) {
        delegate?.pressedSkip()
    }
}
