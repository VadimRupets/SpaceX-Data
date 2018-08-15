//
//  Mass.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 7/24/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Mass: Measurement {
    let metric: Double
    let imperial: Double
    
    enum Units: String {
        case
        metric = "kgs",
        imperial = "lbs"
    }
    
    init(metric: Double, imperial: Double) {
        self.metric = metric
        self.imperial = imperial
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
        
        self.metric = try values.decode(Double.self, forKey: .metric)
        self.imperial = try values.decode(Double.self, forKey: .imperial)
    }
    
}

