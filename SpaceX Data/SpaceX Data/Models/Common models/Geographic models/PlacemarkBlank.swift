//
//  PlacemarkBlank.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 10/3/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation
import CoreLocation

struct PlacemarkBlank {
    
    let coordinates: CLLocationCoordinate2D?
    let addressString: String
    
    init(coordinates: CLLocationCoordinate2D? = nil, addressString: String) {
        self.coordinates = coordinates
        self.addressString = addressString
    }
    
}
