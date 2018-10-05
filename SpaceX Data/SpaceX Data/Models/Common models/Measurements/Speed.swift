//
//  Speed.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/8/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Speed: Measurement {
    let metric: MeasurementValue
    let imperial: MeasurementValue
    
    enum Units: String {
        case
        metric = "kph",
        imperial = "mph"
    }
    
    init(metric: Double, imperial: Double) {
        self.metric = (unit: Units.metric.rawValue, value: metric)
        self.imperial = (unit: Units.imperial.rawValue, value: imperial)
    }
}
