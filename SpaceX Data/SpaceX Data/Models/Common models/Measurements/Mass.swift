//
//  Mass.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 7/24/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Mass: Measurement {
    let metric: MeasurementValue
    let imperial: MeasurementValue
    
    enum Units: String {
        case
        metric = "kgs",
        imperial = "lbs"
    }
    
    init(metric: Double, imperial: Double) {
        self.metric = (unit: Units.metric.rawValue, value: metric)
        self.imperial = (unit: Units.imperial.rawValue, value: imperial)
    }
}

extension Mass: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        metric = "kg",
        imperial = "lb"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        let metric = try values.decode(Double.self, forKey: .metric)
        self.metric = (unit: Units.metric.rawValue, value: metric)
        
        let imperial = try values.decode(Double.self, forKey: .imperial)
        self.imperial = (unit: Units.imperial.rawValue, value: imperial)
    }
    
}

