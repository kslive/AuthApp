//
//  PinView.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 17.03.2021.
//

import UIKit

protocol PinViewProtocol: class {
    func pressedNumbers(isEnd: Bool)
    func pressedSkip()
}

class PinView: UIView {
    @IBOutlet var elipsImages: [UIImageView]!
    var code = ""
    
    weak var delegate: PinViewProtocol?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .white
    }
    
    @IBAction func pressedNumbers(_ sender: UIButton) {
        if code.count >= 3 {
            delegate?.pressedNumbers(isEnd: true)
        } else {
            delegate?.pressedNumbers(isEnd: false)
        }
        setElips(sender)
    }
    
    @IBAction func pressedSkip(_ sender: UIButton) {
        delegate?.pressedSkip()
    }
}

extension PinView {
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
        print(code)
    }
    
    private func updateElips(for index: Int, number: String) {
        elipsImages[index].image = #imageLiteral(resourceName: "FullElips")
        code.append(number)
    }
}
