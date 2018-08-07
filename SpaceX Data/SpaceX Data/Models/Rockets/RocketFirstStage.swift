//
//  RocketFirstStage.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 7/25/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct RocketFirstStage: RocketStage {
    let reusable: Bool
    let engines: Int
    let fuelAmountInTons: Float
    let burnTimeInSeconds: Int
    let thrustAtSeaLevel: Thrust
    let thrustInVacuum: Thrust
}

extension RocketFirstStage: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        reusable,
        engines,
        fuelAmountInTons = "fuel_amount_tons",
        burnTimeInSeconds = "burn_time_sec",
        thrustAtSeaLevel = "thrust_sea_level",
        thrustInVacuum = "thrust_vacuum"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.reusable = try values.decode(Bool.self, forKey: .reusable)
        self.engines = try values.decode(Int.self, forKey: .engines)
        self.fuelAmountInTons = try values.decode(Float.self, forKey: .fuelAmountInTons)
        self.burnTimeInSeconds = try values.decode(Int.self, forKey: .burnTimeInSeconds)
        self.thrustAtSeaLevel = try values.decode(Thrust.self, forKey: .thrustAtSeaLevel)
        self.thrustInVacuum = try values.decode(Thrust.self, forKey: .thrustInVacuum)
    }
    
}
