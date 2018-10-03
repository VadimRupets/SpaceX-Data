//
//  MoreViewController.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 10/2/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import UIKit

fileprivate let titleKey = "title"
fileprivate let segueIdentifierKey = "segueIdentifier"

fileprivate let aboutSpaceXSegueIdentifier = "AboutSpaceXSegue"
fileprivate let launchpadsSegueIdentifier = "LaunchpadsSegue"

class MoreViewController: UIViewController {
    
    private let cellIdentifier = "MoreTableViewCell"
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
    
    private let tableViewData = [
        [titleKey: "About SpaceX", segueIdentifierKey: aboutSpaceXSegueIdentifier],
        [titleKey: "Launchpads", segueIdentifierKey: launchpadsSegueIdentifier]
    ]
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let cellText = tableViewData[indexPath.row][titleKey]
        cell.textLabel?.text = cellText
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension MoreViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let segueIdentifier = tableViewData[indexPath.row][segueIdentifierKey] else {
            tableView.deselectRow(at: indexPath, animated: true)
            return
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
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
        default:
            performSegue(withIdentifier: segueIdentifier, sender: nil)
        }
    }
    
}
