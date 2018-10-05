//
//  Temperature.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/13/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Temperature: Measurement {
    let metric: MeasurementValue
    let imperial: MeasurementValue
    
    enum Units: String {
        case
        metric = "celsius",
        imperial = "fahrenheit"
    }
    
    init(metric: Double) {
        self.metric = (unit: Units.metric.rawValue, value: metric)
        
        let imperial = metric * 9 / 5 + 32
        self.imperial = (unit: Units.imperial.rawValue, value: imperial)
    }
}
