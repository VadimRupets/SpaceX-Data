//
//  RocketSecondStage.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 7/25/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct RocketSecondStage: RocketStage {
    let reusable: Bool
    let engines: Int
    let fuelAmountInTons: Float
    let burnTimeInSeconds: Int
    let thrust: Thrust
    let payloads: Payloads
}

extension RocketSecondStage: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        engines,
        fuelAmountInTons = "fuel_amount_tons",
        burnTimeInSeconds = "burn_time_sec",
        thrust,
        payloads
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.reusable = false
        self.engines = try values.decode(Int.self, forKey: .engines)
        // FIXME: Falcon Heavy doesn't contain fuel amount in tons parameter, so there's a temporary workaround
        self.fuelAmountInTons = try values.decodeIfPresent(Float.self, forKey: .fuelAmountInTons) ?? 0
        self.burnTimeInSeconds = try values.decode(Int.self, forKey: .burnTimeInSeconds)
        self.thrust = try values.decode(Thrust.self, forKey: .thrust)
        self.payloads = try values.decode(Payloads.self, forKey: .payloads)
    }
    
}

