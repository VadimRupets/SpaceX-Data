//
//  Volume.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/14/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Volume: Measurement {
    let metric: MeasurementValue
    let imperial: MeasurementValue
    
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
        
        let metric = try values.decode(Double.self, forKey: .metric)
        self.metric = (unit: Units.metric.rawValue, value: metric)
        
        let imperial = try values.decode(Double.self, forKey: .imperial)
        self.imperial = (unit: Units.imperial.rawValue, value: imperial)
    }
}
