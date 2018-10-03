//
//  LaunchpadDetailViewController.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 10/2/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import UIKit

class LaunchpadDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var vehiclesLaunchedLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    var launchpad: Launchpad?
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()
        setupChildViewController()
    }
    
    // MARK: - UI Setup
    
    func setupLabels() {
        titleLabel.text = launchpad?.name
        statusLabel.text = "Status: \(launchpad?.status.rawValue ?? "")"
        descriptionLabel.text = launchpad?.description
        
        let launchedVehicles = launchpad?.launchedVehicles.reduce("") { $0 + "\n• " + $1 } ?? ""
        vehiclesLaunchedLabel.text = "Vehicles launched: " + launchedVehicles
    }
    
    func setupChildViewController() {
        guard let mapViewViewController = childViewControllers.first as? MapViewViewController, let launchpad = launchpad else {
            return
        }
        
        mapViewViewController.placemarkBlank = PlacemarkBlank(coordinates: launchpad.location.coordinate, addressString: launchpad.name)
    }
    
}
