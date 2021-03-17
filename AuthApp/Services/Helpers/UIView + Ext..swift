//
//  UIView + Ext..swift
//  AuthApp
//
//  Created by Eugene Kiselev on 17.03.2021.
//

import UIKit

extension UIView {
    func viewFromNib(_ nibName: String) -> UIView? {
        let nib = UINib(nibName: nibName, bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView else {
            return nil
        }
        return view
    }
}

