//
//  ProcessedCell.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 17.03.2021.
//

import UIKit

class ProcessedCell: UITableViewCell {
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var price: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        selectionStyle = .none
    }
}
