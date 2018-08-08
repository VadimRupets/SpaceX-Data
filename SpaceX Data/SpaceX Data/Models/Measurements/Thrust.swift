//
//  Thrust.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 7/25/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Thrust: Measurement {
    let metric: Double
    let imperial: Double
    
    enum Units: String, CodingKey {
        case
        metric = "kN",
        imperial = "lbf"
    }
}

extension Thrust: Decodable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: Units.self)
        
        self.metric = try values.decode(Double.self, forKey: .metric)
        self.imperial = try values.decode(Double.self, forKey: .imperial)
    }
    
}
