//
//  ProcessedViewController.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 17.03.2021.
//

import UIKit

class ProcessedViewController: UIViewController {
    private let networkManager = NetworkManager.shared
    private let viewManager = ViewManager.shared
    private let alertManager = AlertManager.shared
    private let date = Date()
    private var reports:  [[ReportsModelElement]]?
    
    @IBOutlet var processedView: ProcessedView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension ProcessedViewController {
    private func setup() {
        fetchData()
    }
    
    private func fetchData() {
        networkManager.reports { [weak self] reports in
            guard let self = self else { return }
            if let reports = reports {
                self.reports = Array(Dictionary(grouping: reports, by: { $0.date! }).values)
                self.processedView.tableView.reloadData()
            } else {
                self.alertManager.showAlert(message: .errorToken, self)
            }
        }
    }
}

extension ProcessedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        reports?[section].count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        reports?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = Header().viewFromNib(Identifiers.headerCell) as! Header
        header.date.text = date.convertServerDateToString(date: reports?[section][0].date)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        Constants.heightHeader
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.processedCell, for: indexPath) as! ProcessedCell
        cell.setData(from: reports?[indexPath.section][indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewManager.pushDetailProcessedVC(for: reports?[indexPath.section][indexPath.row].number, navigationController)
    }
}
