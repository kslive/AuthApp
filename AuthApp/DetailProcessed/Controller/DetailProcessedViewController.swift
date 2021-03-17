//
//  DetailProcessedViewController.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 17.03.2021.
//

import UIKit

class DetailProcessedViewController: UIViewController {
    @IBOutlet var detailView: DetailProcessedView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension DetailProcessedViewController {
    private func setup() {
        detailView.delegate = self
    }
}

extension DetailProcessedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.detailCell,for: indexPath)
        return cell
    }
}

extension DetailProcessedViewController: DetailProcessedViewProtocol {
    func pressedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
