//
//  MoreViewController.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 10/2/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import UIKit

fileprivate let aboutSpaceXSegueIdentifier = "AboutSpaceXSegue"
fileprivate let launchpadsSegueIdentifier = "LaunchpadsSegue"
fileprivate let roadsterInfoSegueIdentifier = "RoadsterInfoSegue"

class MoreViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
    
    let segueIdentifiers = [aboutSpaceXSegueIdentifier, launchpadsSegueIdentifier, roadsterInfoSegueIdentifier]
    
    // MARK: - View life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectedRowIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedRowIndexPath, animated: true)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case aboutSpaceXSegueIdentifier:
            guard let companyInfoViewController = segue.destination as? CompanyInfoViewController, let companyInfo = sender as? CompanyInfo else {
                return
            }
            
            companyInfoViewController.companyInfo = companyInfo
        case launchpadsSegueIdentifier:
            guard let launchpadsViewController = segue.destination as? LaunchpadsViewController, let launchpads = sender as? [Launchpad] else {
                return
            }
            
            launchpadsViewController.launchpads = launchpads
        case roadsterInfoSegueIdentifier:
            guard let roadsterInfoViewController = segue.destination as? RoadsterInfoViewController, let roadsterInfo = sender as? RoadsterInfo else {
                return
            }
            
            roadsterInfoViewController.roadsterInfo = roadsterInfo
        default:
            return
        }
    }
}

// MARK: - UITableViewDataSource

extension MoreViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = tableViewData[indexPath.row]
        
        guard let type = cellData[TableViewDataKeys.type.rawValue] as? TableViewDataType, let configurableCell = tableView.dequeueReusableCell(withIdentifier: type.cellIdentifier, for: indexPath) as? (TableViewDataConfigurable & UITableViewCell) else {
            return UITableViewCell()
        }
        
        configurableCell.configure(with: cellData)
        
        return configurableCell
    }
    
}

// MARK: - UITableViewDelegate

extension MoreViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        let segueIdentifier = segueIdentifiers[indexPath.row]
        
        switch segueIdentifier {
        case aboutSpaceXSegueIdentifier:
            CompanyInfoDispatcher().executeRequest(.companyInfo) { (response) in
                DispatchQueue.main.async { [unowned self] in
                    switch response {
                    case .data(let companyInfo):
                        self.performSegue(withIdentifier: segueIdentifier, sender: companyInfo)
                    case .error(let error):
                        self.presentAlertController(with: error)
                    }
                }
            }
        case launchpadsSegueIdentifier:
            LaunchpadsDispatcher().executeRequest(.allLaunchpads) { (response) in
                DispatchQueue.main.async { [unowned self] in
                    switch response {
                    case .data(let launchpads):
                        self.performSegue(withIdentifier: segueIdentifier, sender: launchpads)
                    case .error(let error):
                        self.presentAlertController(with: error)
                    }
                }
            }
        case roadsterInfoSegueIdentifier:
            RoadsterInfoDispatcher().executeRequest(.roadsterInfo) { (response) in
                DispatchQueue.main.async { [unowned self] in
                    switch response {
                    case .data(let roadsterInfo):
                        self.performSegue(withIdentifier: segueIdentifier, sender: roadsterInfo)
                    case .error(let error):
                        self.presentAlertController(with: error)
                    }
                }
            }
        default:
            performSegue(withIdentifier: segueIdentifier, sender: nil)
        }
    }
    
}

// MARK: - TableViewDataRepresentable

extension MoreViewController: TableViewDataRepresentable {
    var tableViewData: [[String : Any]] {
        var _tableViewData = [[String: Any]]()
        
        _tableViewData.append(tableViewData(with: .rightDisclosure, arguments: "About SpaceX"))
        _tableViewData.append(tableViewData(with: .rightDisclosure, arguments: "Launchpads"))
        _tableViewData.append(tableViewData(with: .rightDisclosure, arguments: "Starman Roadster orbital data"))
        
        return _tableViewData
    }
}
