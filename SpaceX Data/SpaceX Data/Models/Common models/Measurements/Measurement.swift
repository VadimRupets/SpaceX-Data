//
//  Measurement.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 7/25/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

protocol Measurement {
    var metric: Double { get }
    var imperial: Double  { get }
}
