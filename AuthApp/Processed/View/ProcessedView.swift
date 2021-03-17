//
//  ProcessedView.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 17.03.2021.
//

import UIKit

class ProcessedView: UIView {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.separatorStyle = .none
            tableView.tableFooterView = UIView()
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .white
    }
}
