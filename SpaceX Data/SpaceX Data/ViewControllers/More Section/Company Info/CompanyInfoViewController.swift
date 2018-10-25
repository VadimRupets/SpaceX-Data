//
//  CompanyInfoViewController.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 9/25/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import UIKit

class CompanyInfoViewController: UIViewController {
    
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companyInfo?.tableViewData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellData = companyInfo?.tableViewData[indexPath.row], let configurableCell = tableView.dequeueReusableCell(withIdentifier: cellData.cellIdentifier, for: indexPath) as? (TableViewDataConfigurable & UITableViewCell) else {
            return UITableViewCell()
        }
        
        configurableCell.configure(with: cellData)
        
        return configurableCell
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
