//
//  LaunchesViewController.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 11/21/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import UIKit

class LaunchesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
    
    private var launches: [Launch] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchLaunches()
    }
    
    private func fetchLaunches() {
        LaunchesDispatcher().executeRequest(.allLaunches) { (response) in
            DispatchQueue.main.async { [unowned self] in
                if case let .data(launches) = response {
                    self.launches = launches
                } else if case let .error(error) = response {
                    self.presentAlertController(with: error)
                }
            }
        }
    }

}

// MARK: - UITableViewDataSource

extension LaunchesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = launches.tableViewData[indexPath.row]
        
        guard let configurableCell = tableView.dequeueReusableCell(withIdentifier: cellData.cellIdentifier, for: indexPath) as? (TableViewCellDataConfigurable & UITableViewCell) else {
            return UITableViewCell()
        }
        
        configurableCell.configure(with: cellData)
        
        return configurableCell
    }
    
}

// MARK: - UITableViewDelegate

extension LaunchesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
