//
//  DetailCell.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 17.03.2021.
//

import UIKit

class DetailCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var info: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        selectionStyle = .none
    }
}
