//
//  PinView.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 17.03.2021.
//

import UIKit

protocol PinViewProtocol: class {
    func pressedNumbers(isEnd: Bool, for code: String)
    func pressedSkip()
}

class PinView: UIView {
    @IBOutlet var elipsImages: [UIImageView]!
    @IBOutlet weak var skipButton: UIButton!
    var code = "" {
        didSet {
            if code.count == elipsImages.count {
                delegate?.pressedNumbers(isEnd: true, for: code)
            } else {
                delegate?.pressedNumbers(isEnd: false, for: code)
            }
        }
    }
    
    weak var delegate: PinViewProtocol?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .white
    }
    
    @IBAction func pressedNumbers(_ sender: UIButton) {
        setElips(sender)
    }
    
    @IBAction func pressedSkip(_ sender: UIButton) {
        delegate?.pressedSkip()
    }
}

extension PinView {
    func setFor(state: PinState) {
        switch state {
        case .new:
            skipButton.isHidden = false
        case .old:
            skipButton.isHidden = true
        }
    }
    
    func reloadElips() {
        code = ""
        elipsImages.forEach({ $0.image = #imageLiteral(resourceName: "EmptyElipse") })
    }
    
    private func setElips(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else { return }
        switch code.count {
        case 0:
            updateElips(for: 3, number: number)
        case 1:
            updateElips(for: 2, number: number)
        case 2:
            updateElips(for: 1, number: number)
        case 3:
            updateElips(for: 0, number: number)
        default:
            break
        }
    }
    
    private func updateElips(for index: Int, number: String) {
        elipsImages[index].image = #imageLiteral(resourceName: "FullElips")
        code.append(number)
    }
}
