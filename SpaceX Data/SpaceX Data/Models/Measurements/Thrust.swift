//
//  Thrust.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 7/25/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Thrust: Measurement {
    let metric: Float
    let imperial: Float
    
    enum Units: String, CodingKey {
        case
        metric = "kN",
        imperial = "lbf"
    }
    
    init(metric: Float, imperial: Float) {
        self.metric = metric
        self.imperial = imperial
    }
}

extension Thrust: Decodable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: Units.self)
        
        self.metric = try values.decode(Float.self, forKey: .metric)
        self.imperial = try values.decode(Float.self, forKey: .imperial)
    }
    
}
