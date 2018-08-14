//
//  Temperature.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/13/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Temperature: Measurement {
    let metric: Double
    let imperial: Double
    
    enum Units: String {
        case
        metric = "celsius",
        imperial = "fahrenheit"
    }
    
    init(metric: Double) {
        self.metric = metric
        self.imperial = metric * 9 / 5 + 32
    }
}
