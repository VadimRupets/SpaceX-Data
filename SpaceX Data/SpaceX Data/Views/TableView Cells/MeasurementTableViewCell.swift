//
//  MeasurementTableViewCell.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 10/4/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import UIKit

class MeasurementTableViewCell: UITableViewCell {

    enum MeasurementSystem {
        case
        metric,
        imperial
    }
    
    var measurement: Measurement?
    private var measurementSystem: MeasurementSystem = .metric
    
    func configure(with title: String, measurement: Measurement) {
        self.measurement = measurement
        self.measurementSystem = .metric
        
        textLabel?.text = title
        
        let valueString = String(format: "%.2f", measurement.metric.value)
        detailTextLabel?.text = "\(valueString) \(measurement.metric.unit)"
    }
    
    func toggle() {
        guard let measurement = measurement else {
            return
        }
        
        measurementSystem = measurementSystem == .metric ? .imperial : .metric
        
        let value = measurementSystem == .metric ? measurement.metric.value : measurement.imperial.value
        let unit = measurementSystem == .metric ? measurement.metric.unit : measurement.imperial.unit
        
        let valueString = String(format: "%.2f", value)
        
        UIView.transition(with: self, duration: 0.5, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
            self.detailTextLabel?.text = "\(valueString) \(unit)"
        })
    }

}
