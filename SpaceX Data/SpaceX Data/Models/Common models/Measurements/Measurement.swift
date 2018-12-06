//
//  Measurement.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 7/25/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

protocol Measurement {
    typealias MeasurementValue = (unit: String, value: Double)
    
    var metric: MeasurementValue { get }
    var imperial: MeasurementValue  { get }
}

extension Measurement {
    
    func isEqual(to other: Measurement) -> Bool {
        return self.metric == other.metric && self.imperial == other.imperial
    }
    
}
