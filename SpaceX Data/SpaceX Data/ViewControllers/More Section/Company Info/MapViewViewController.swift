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
import Contacts

class MapViewViewController: UIViewController {
    
    private let pinReuseIdentifier = "Pin"
    
    @IBOutlet weak var mapView: MKMapView!
    
    var placemarkBlank: PlacemarkBlank?
    
    // MARK: - View life cycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        placeMarker()
    }
    
    // MARK: - MKMapView related methods
    
    private func placeMarker() {
        guard let placemarkBlank = placemarkBlank else {
            return
        }
        
        guard let coordinates = placemarkBlank.coordinates else {
            CLGeocoder().geocodeAddressString(placemarkBlank.addressString) { [unowned self] (placemarks, error) in
                if error != nil {
                    return
                }
                
                guard let placemarks = placemarks, let placemark = placemarks.first else {
                    return
                }
                
                let mkPlacemark = MKPlacemark(placemark: placemark)
                self.addPlacemark(mkPlacemark)
            }
            return
        }
        
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: [CNPostalAddressStreetKey: placemarkBlank.addressString])
        addPlacemark(placemark)
    }
    
    private func addPlacemark(_ placemark: MKPlacemark) {
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotation(placemark)
        mapView.setCenter(placemark.coordinate, animated: true)
    }

}
