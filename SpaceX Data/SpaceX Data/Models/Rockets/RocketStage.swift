//
//  RocketStage.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 7/25/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

protocol RocketStage {
    var reusable: Bool { get }
    var engines: Int { get }
    var fuelAmountInTons: Float { get }
    var burnTimeInSeconds: Int { get }
}
