//
//  Location.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/10/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation
import CoreLocation

struct Location {
    let name: String
    let region: String
    let coordinate: CLLocationCoordinate2D
}

extension Location: Decodable {
    private enum CodingKeys: String, CodingKey {
        case
        name,
        region,
        latitude,
        longitude
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try values.decode(String.self, forKey: .name)
        self.region = try values.decode(String.self, forKey: .region)
        
        let latitude = try values.decode(Double.self, forKey: .latitude)
        let longitude = try values.decode(Double.self, forKey: .longitude)
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
