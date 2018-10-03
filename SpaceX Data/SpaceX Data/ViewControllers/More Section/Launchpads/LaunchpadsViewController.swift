//
//  LaunchpadsViewController.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 10/2/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import UIKit

class LaunchpadsViewController: UIViewController {
    
    private let cellIdentifier = "LaunchpadsTableViewCell"
    
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
        return launchpads.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let launchpad = launchpads[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = launchpad.name
        cell.detailTextLabel?.text = "Status: \(launchpad.status.rawValue)"
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension LaunchpadsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: detailSegueIdentifier, sender: launchpads[indexPath.row])
    }
    
}
