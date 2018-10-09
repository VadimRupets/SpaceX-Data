//
//  LaunchpadsViewController.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 10/2/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import UIKit

class LaunchpadsViewController: UIViewController {
    
    private let detailSegueIdentifier = "LaunchpadDetailSegue"
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
    
    var launchpads: [Launchpad] = []
    
    // MARK: - View life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectedRowIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedRowIndexPath, animated: true)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController = segue.destination as? LaunchpadDetailViewController, let launchpad = sender as? Launchpad else {
            return
        }
        
        detailViewController.launchpad = launchpad
    }
    
}

// MARK: - UITableViewDataSource

extension LaunchpadsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launchpads.tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = launchpads.tableViewData[indexPath.row]
        
        guard let type = cellData[TableViewDataKeys.type.rawValue] as? TableViewDataType, let configurableCell = tableView.dequeueReusableCell(withIdentifier: type.cellIdentifier, for: indexPath) as? (TableViewDataConfigurable & UITableViewCell) else {
            return UITableViewCell()
        }
        
        configurableCell.configure(with: cellData)
        
        return configurableCell
    }
    
}
