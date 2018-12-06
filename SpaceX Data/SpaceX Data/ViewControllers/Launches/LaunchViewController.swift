//
//  LaunchViewController.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 11/26/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import UIKit
import SafariServices

class LaunchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
    
    var launch: Launch?
    
    var tableViewCellData: [TableViewCellData] = []
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let launch = launch else {
            return
        }
        
        title = launch.missionName
        tableViewCellData = launch.tableViewData
        tableView.reloadData()
    }
    
}

// MARK: - UITableViewDataSource

extension LaunchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewCellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = tableViewCellData[indexPath.row]
        
        guard let configurableCell = tableView.dequeueReusableCell(withIdentifier: cellData.cellIdentifier, for: indexPath) as? (UITableViewCell & TableViewCellDataConfigurable) else {
            return UITableViewCell()
        }
        
        configurableCell.configure(with: cellData)
        return configurableCell
    }
    
}

// MARK: - UITableViewDelegate

extension LaunchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        let cell = tableView.cellForRow(at: indexPath)
        
        switch cell {
        case let urlCell as URLTableViewCell:
            guard let url = urlCell.url else {
                break
            }
            
            present(SFSafariViewController(url: url), animated: true)
        case let expandableCell as ExpandableTableViewCell:
            toggleExpandableCell(expandableCell, at: indexPath)
        default:
            break
        }

    }
    
    fileprivate func toggleExpandableCell(_ expandableCell: ExpandableTableViewCell, at indexPath: IndexPath) {
        tableView.beginUpdates()
        
        expandableCell.toggle()
        
        if expandableCell.isExpanded {
            var indices = [IndexPath]()
            
            for i in 0..<expandableCell.detailCellsData.count {
                indices.append(IndexPath(row: indexPath.row + i + 1, section: 0))
                tableViewCellData.insert(expandableCell.detailCellsData[i], at: indexPath.row + i + 1)
            }
            
            tableView.insertRows(at: indices, with: .fade)
        } else {
            var indices = [IndexPath]()
            
            for i in 0..<expandableCell.detailCellsData.count {
                indices.append(IndexPath(row: indexPath.row + i + 1, section: 0))
                tableViewCellData.remove(at: indexPath.row + 1)
            }
            
            tableView.deleteRows(at: indices, with: .fade)
        }
        
        tableView.endUpdates()
    }
}
