//
//  Distance.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 7/24/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Distance: Measurement {
    let metric: MeasurementValue
    let imperial: MeasurementValue
    
    enum Units: String, CodingKey {
        case
        metric = "meters",
        imperial = "feet"
    }
    
    init(metric: Double, imperial: Double) {
        self.metric = (unit: Units.metric.rawValue, value: metric)
        self.imperial = (unit: Units.imperial.rawValue, value: imperial)
    }
    
    init(metric: Double) {
        self.metric = (unit: Units.metric.rawValue, value: metric)
        self.imperial = (unit: Units.imperial.rawValue, value: metric * 3.28084)
    }
}

extension Distance: Decodable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: Units.self)
        
        let metric = try values.decodeIfPresent(Double.self, forKey: .metric) ?? 0
        self.metric = (unit: Units.metric.rawValue, value: metric)
        
        let imperial = try values.decodeIfPresent(Double.self, forKey: .imperial) ?? 0
        self.imperial = (unit: Units.imperial.rawValue, value: metric * 3.28084)
    }
    
}
