//
//  CompanyInfoViewController.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 9/25/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import UIKit

class CompanyInfoViewController: UIViewController {
    
    private let subtitleCellIdentifier = "CompanyInfoSubtitleCell"
    private let rightDetailCellIdentifier = "CompanyInfoRightDetailCell"
    
    private let mapViewViewControllerSegueIdentifier = "MapViewViewControllerSegue"
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
    
    var companyInfo: CompanyInfo?

    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionLabel.text = companyInfo?.summary
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectedRowIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedRowIndexPath, animated: true)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == mapViewViewControllerSegueIdentifier, let mapViewViewController = segue.destination as? MapViewViewController, let address = sender as? Address else {
            return
        }
        
        mapViewViewController.placemarkBlank = PlacemarkBlank(addressString: address.addressString)
    }

}

// MARK: - UITableViewDataSource

extension CompanyInfoViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companyInfo?.tableViewData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let companyInfo = companyInfo else {
            return UITableViewCell()
        }
        
        var cell: UITableViewCell
        
        if indexPath.row == companyInfo.tableViewData.count - 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: rightDetailCellIdentifier, for: indexPath)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: subtitleCellIdentifier, for: indexPath)
            cell.selectionStyle = .none
        }
        
        let data = companyInfo.tableViewData[indexPath.row]
        cell.textLabel?.text = data.title
        cell.detailTextLabel?.text = data.description
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension CompanyInfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let companyInfo = companyInfo, indexPath.row == companyInfo.tableViewData.count - 1 else {
            return
        }
        
        performSegue(withIdentifier: mapViewViewControllerSegueIdentifier, sender: companyInfo.headquarters)
    }
}

// MARK: - CompanyInfo extension

fileprivate extension CompanyInfo {
    
    var tableViewData: [(title: String, description: String)] {
        var collectionViewData = [(title: String, description: String)]()
        collectionViewData.append((title: "Founder", description: founder))
        collectionViewData.append((title: "Founded", description: String(yearOfFoundation)))
        collectionViewData.append((title: "Employees", description: String(employees)))
        collectionViewData.append((title: "Vehicles", description: String(vehicles)))
        collectionViewData.append((title: "Launch sites", description: String(launchSites)))
        collectionViewData.append((title: "Test sites", description: String(testSites)))
        collectionViewData.append((title: "CEO", description: ceo))
        collectionViewData.append((title: "CTO", description: cto))
        collectionViewData.append((title: "COO", description: coo))
        collectionViewData.append((title: "CTO Propulsion", description: ctoPropulsion))
        
        let formattedValuation = NumberFormatter.dollarFormatter.string(from: NSNumber(value: valuation)) ?? "$\(valuation)"
        collectionViewData.append((title: "Valuation", description: formattedValuation))
        collectionViewData.append((title: "Headquarters", description: ""))
        
        return collectionViewData
    }
    
}
