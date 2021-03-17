//
//  DetailProcessedView.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 17.03.2021.
//

import UIKit

protocol DetailProcessedViewProtocol: class {
    func pressedBackButton()
}

class DetailProcessedView: UIView {

    @IBOutlet weak var titleScreen: UILabel!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
    
    weak var delegate: DetailProcessedViewProtocol?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .white
    }
    
    @IBAction func pressedBackButton(_ sender: UIButton) {
        delegate?.pressedBackButton()
    }
}
