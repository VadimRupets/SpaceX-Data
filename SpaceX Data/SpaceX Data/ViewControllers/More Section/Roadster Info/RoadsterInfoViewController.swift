//
//  RoadsterInfoViewController.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 10/3/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import UIKit
import SafariServices

class RoadsterInfoViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
    
    var roadsterInfo: RoadsterInfo?
    
    // MARK: - View life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        titleLabel.text = roadsterInfo?.name
        descriptionLabel.text = roadsterInfo?.description
    }
    
}

// MARK: - UITableViewDataSource

extension RoadsterInfoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roadsterInfo?.tableViewData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellData = roadsterInfo?.tableViewData[indexPath.row], let configurableCell = tableView.dequeueReusableCell(withIdentifier: cellData.cellIdentifier, for: indexPath) as? (TableViewCellDataConfigurable & UITableViewCell) else {
            return UITableViewCell()
        }
        
        configurableCell.configure(with: cellData)
        
        return configurableCell
    }
    
}

// MARK: - UITableViewDelegate

extension RoadsterInfoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        let cell = tableView.cellForRow(at: indexPath)
        
        switch cell {
        case let measurementCell as MeasurementTableViewCell:
            measurementCell.toggle()
        case let urlCell as URLTableViewCell:
            guard let url = urlCell.url else {
                return
            }
            
            present(SFSafariViewController(url: url), animated: true)
        default:
            break
        }
    }
    
}
