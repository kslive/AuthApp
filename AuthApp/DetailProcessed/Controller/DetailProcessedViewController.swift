//
//  DetailProcessedViewController.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 17.03.2021.
//

import UIKit

class DetailProcessedViewController: UIViewController {
    private let networkManager = NetworkManager.shared
    private var detail: DetailModelElement?
    
    @IBOutlet var detailView: DetailProcessedView!
    
    var number: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension DetailProcessedViewController {
    private func setup() {
        detailView.delegate = self
        fetchData()
    }
    
    private func fetchData() {
        guard let number = number else { return }
        networkManager.details(for: number) { [weak self] detail in
            guard let self = self else { return }
            self.detail = detail
            self.detailView.tableView.reloadData()
        }
    }
}

extension DetailProcessedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Constants.staticNumberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.detailCell,for: indexPath) as! DetailCell
        switch indexPath.row {
        case 0:
            cell.setData(for: Text.name, for: detail?.name)
        case 1:
            cell.setData(for: Text.number, for: "\(detail?.number ?? 0)")
        case 2:
            cell.setData(for: Text.numberPD, for: detail?.numberPD)
        case 3:
            cell.setData(for: Text.status, for: detail?.status)
        default:
            break
        }
        return cell
    }
}

extension DetailProcessedViewController: DetailProcessedViewProtocol {
    func pressedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
