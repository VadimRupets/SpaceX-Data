//
//  MilestoneViewController.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 11/20/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import UIKit
import SafariServices

class MilestoneViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
    
    var milestone: Milestone!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = milestone.title
        descriptionLabel.text = milestone.description
    }
    
}

// MARK: - UITableViewDataSource

extension MilestoneViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return milestone.tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = milestone.tableViewData[indexPath.row]
        
        guard let configurableCell = tableView.dequeueReusableCell(withIdentifier: cellData.cellIdentifier, for: indexPath) as? (TableViewCellDataConfigurable & UITableViewCell) else {
            return UITableViewCell()
        }
        
        configurableCell.configure(with: cellData)
        
        return configurableCell
    }
    
}

// MARK: - UITableViewDelegate

extension MilestoneViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let urlCell = tableView.cellForRow(at: indexPath) as? URLTableViewCell, let url = urlCell.url else {
            return
        }
        
        present(SFSafariViewController(url: url), animated: true)
    }
    
}
