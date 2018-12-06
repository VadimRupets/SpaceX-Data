//
//  LaunchesViewController.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 11/21/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import UIKit

fileprivate let launchSegueIdentifier = "LaunchSegue"

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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else {
            return
        }
        
        tableView.deselectRow(at: selectedIndexPath, animated: true)
    }
    
    // MARK: - Fetching launches
    
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
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == launchSegueIdentifier, let launch = sender as? Launch, let launchesViewController = segue.destination as? LaunchViewController else {
            return
        }
        
        launchesViewController.launch = launch
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
        performSegue(withIdentifier: launchSegueIdentifier, sender: launches[indexPath.row])
    }
    
}
