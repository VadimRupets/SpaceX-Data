//
//  Thruster.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/14/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Thruster {
    let type: String
    let amount: Int
    let pods: Int
    let firstFuelOption: String?
    let secondFuelOption: String?
    let thrust: Thrust
}

extension Thruster: Decodable {
    private enum CodingKeys: String, CodingKey {
        case
        type,
        amount,
        pods,
        firstFuelOption = "fuel_1",
        secondFuelOption = "fuel_2",
        thrust
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.type = try values.decode(String.self, forKey: .type)
        self.amount = try values.decode(Int.self, forKey: .amount)
        self.pods = try values.decode(Int.self, forKey: .pods)
        self.firstFuelOption = try values.decodeIfPresent(String.self, forKey: .firstFuelOption)
        self.secondFuelOption = try values.decodeIfPresent(String.self, forKey: .secondFuelOption)
        self.thrust = try values.decode(Thrust.self, forKey: .thrust)
    }
}
