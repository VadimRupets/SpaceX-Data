//
//  MapViewViewController.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 9/25/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewViewController: UIViewController {
    
    private let pinReuseIdentifier = "Pin"
    
    @IBOutlet weak var mapView: MKMapView!
    
    var addressToShow: String?
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeMarker()
    }
    
    // MARK: - Fetching location
    
    private func placeMarker() {
        guard let address = addressToShow else {
            return
        }
        
        CLGeocoder().geocodeAddressString(address) { [unowned self] (placemarks, error) in
            if error != nil {
                return
            }
            
            guard let placemarks = placemarks, let placemark = placemarks.first else {
                return
            }
            
            let mkPlacemark = MKPlacemark(placemark: placemark)
            self.mapView.addAnnotation(mkPlacemark)
            self.mapView.setCenter(mkPlacemark.coordinate, animated: true)
        }
    }

}
