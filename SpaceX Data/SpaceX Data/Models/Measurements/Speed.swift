//
//  Speed.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/8/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Speed: Measurement {
    let metric: Double
    let imperial: Double
    
    enum Units: String {
        case
        metric = "kph",
        imperial = "mph"
    }
    
    init(metric: Double, imperial: Double) {
        self.metric = metric
        self.imperial = imperial
    }
}
