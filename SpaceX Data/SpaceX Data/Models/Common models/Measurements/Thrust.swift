//
//  Thrust.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 7/25/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Thrust: Measurement {
    let metric: MeasurementValue
    let imperial: MeasurementValue
    
    enum Units: String, CodingKey {
        case
        metric = "kN",
        imperial = "lbf"
    }
}

extension Thrust: Decodable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: Units.self)
        
        let metric = try values.decode(Double.self, forKey: .metric)
        self.metric = (unit: Units.metric.rawValue, value: metric)
        
        let imperial = try values.decode(Double.self, forKey: .imperial)
        self.imperial = (unit: Units.imperial.rawValue, value: imperial)
    }
    
}
