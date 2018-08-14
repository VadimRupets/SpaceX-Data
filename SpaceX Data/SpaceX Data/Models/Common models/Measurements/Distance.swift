//
//  Distance.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 7/24/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Distance: Measurement {
    let metric: Double
    let imperial: Double
    
    enum Units: String, CodingKey {
        case
        metric = "meters",
        imperial = "feet"
    }
    
    init(metric: Double, imperial: Double) {
        self.metric = metric
        self.imperial = imperial
    }
    
    init(metric: Double) {
        self.metric = metric
        self.imperial = metric * 3.28084
    }
}

extension Distance: Decodable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: Units.self)
        
        self.metric = try values.decodeIfPresent(Double.self, forKey: .metric) ?? 0
        self.imperial = try values.decodeIfPresent(Double.self, forKey: .imperial) ?? 0
    }
    
}
