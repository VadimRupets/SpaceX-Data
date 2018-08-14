//
//  Volume.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/14/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Volume: Measurement {
    let metric: Double
    let imperial: Double
    
    enum Units: String {
        case
        metric = "m³",
        imperial = "ft³"
    }
}

extension Volume: Decodable {
    private enum CodingKeys: String, CodingKey {
        case
        metric = "cubic_meters",
        imperial = "cubic_feet"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.metric = try values.decode(Double.self, forKey: .metric)
        self.imperial = try values.decode(Double.self, forKey: .imperial)
    }
}
