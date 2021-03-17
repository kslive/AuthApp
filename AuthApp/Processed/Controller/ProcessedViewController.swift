//
//  ProcessedViewController.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 17.03.2021.
//

import UIKit

class ProcessedViewController: UIViewController {
    private let header = HeaderCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ProcessedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        header.viewFromNib(Identifiers.headerCell)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        header.frame.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.processedCell, for: indexPath) as! ProcessedCell
        return cell
    }
}
