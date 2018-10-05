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

    private let defaultCellIdentifier = "RoadsterInfoTableViewCell"
    private let measurementCellIdentifier = "MeasurementTableViewCell"
    private let urlCellIdentifier = "URLTableViewCell"
    
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
        return roadsterInfo?.tableViewDataSource.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let roadsterInfo = roadsterInfo else {
            return UITableViewCell()
        }
        
        let cellData = roadsterInfo.tableViewDataSource[indexPath.row]
        
        guard let type = cellData[TableViewDataKeys.type.rawValue] as? TableViewDataType else {
            return UITableViewCell()
        }
        
        let cell: UITableViewCell
        
        switch type {
        case .default:
            cell = tableView.dequeueReusableCell(withIdentifier: defaultCellIdentifier, for: indexPath)
            cell.textLabel?.text = cellData[TableViewDataKeys.title.rawValue] as? String
            cell.detailTextLabel?.text = cellData[TableViewDataKeys.subtitle.rawValue] as? String
        case .measurement:
            guard let measurementCell = tableView.dequeueReusableCell(withIdentifier: measurementCellIdentifier, for: indexPath) as? MeasurementTableViewCell, let title = cellData[TableViewDataKeys.title.rawValue] as? String, let measurement = cellData[TableViewDataKeys.measurement.rawValue] as? Measurement else {
                return UITableViewCell()
            }
            
            measurementCell.configure(with: title, measurement: measurement)
            
            cell = measurementCell
        case .url:
            guard let urlCell = tableView.dequeueReusableCell(withIdentifier: urlCellIdentifier, for: indexPath) as? URLTableViewCell, let title = cellData[TableViewDataKeys.title.rawValue] as? String, let url = cellData[TableViewDataKeys.url.rawValue] as? URL else {
                return UITableViewCell()
            }
            
            urlCell.configure(with: title, url: url)
            
            cell = urlCell
        }
        
        return cell
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
