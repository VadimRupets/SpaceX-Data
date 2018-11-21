//
//  MilestonesViewController.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 11/20/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import UIKit

fileprivate let milestoneSegue = "MilestoneSegue"

class MilestonesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
    
    var milestones: [Milestone] = []
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == milestoneSegue, let milestone = sender as? Milestone, let milestoneViewController = segue.destination as? MilestoneViewController else {
            return
        }
        
        milestoneViewController.milestone = milestone
    }

}

// MARK: - UITableViewDataSource

extension MilestonesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return milestones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = milestones.tableViewData[indexPath.row]
        
        guard let configurableCell = tableView.dequeueReusableCell(withIdentifier: cellData.cellIdentifier, for: indexPath) as? (TableViewCellDataConfigurable & UITableViewCell) else {
            return UITableViewCell()
        }
        
        configurableCell.configure(with: cellData)
        
        return configurableCell
    }
    
}

// MARK: - UITableViewDelegate

extension MilestonesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: milestoneSegue, sender: milestones[indexPath.row])
    }
    
}
