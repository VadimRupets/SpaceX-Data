//
//  Distance.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 7/24/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Distance: Measurement {
    let metric: Float
    let imperial: Float
    
    enum Units: String, CodingKey {
        case
        metric = "meters",
        imperial = "feet"
    }
}

extension Distance: Decodable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: Units.self)
        
        self.metric = try values.decodeIfPresent(Float.self, forKey: .metric) ?? 0
        self.imperial = try values.decodeIfPresent(Float.self, forKey: .imperial) ?? 0
    }
    
}
