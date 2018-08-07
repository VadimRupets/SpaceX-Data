//
//  Engines.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/6/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Engines {
    let quantity: Int
    let type: String
    let version: String
    let layout: String
    let engineLossMax: Int
    let propellants: [String]
    let thrustAtSeaLevel: Thrust
    let thurstInVacuum: Thrust
    let thrustToWeightRatio: Float
}

extension Engines: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        quantity = "number",
        type,
        version,
        layout,
        engineLossMax = "engine_loss_max",
        propellant1 = "propellant_1",
        propellant2 = "propellant_2",
        thrustAtSeaLevel = "thrust_sea_level",
        thrustInVacuum = "thrust_vacuum",
        thurstToWeightRatio = "thrust_to_weight"
        
        static var propellantOptions: [CodingKeys] {
            return [.propellant1, .propellant2]
        }
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.quantity = try values.decode(Int.self, forKey: .quantity)
        self.type = try values.decode(String.self, forKey: .type)
        self.version = try values.decode(String.self, forKey: .version)
        self.layout = try values.decodeIfPresent(String.self, forKey: .layout) ?? ""
        self.engineLossMax = try values.decodeIfPresent(Int.self, forKey: .engineLossMax) ?? 0
        self.thrustAtSeaLevel = try values.decode(Thrust.self, forKey: .thrustAtSeaLevel)
        self.thurstInVacuum = try values.decode(Thrust.self, forKey: .thrustInVacuum)
        self.thrustToWeightRatio = try values.decodeIfPresent(Float.self, forKey: .thurstToWeightRatio) ?? 0
        
        var propellants = [String]()
        for propellantOption in CodingKeys.propellantOptions {
            guard
                let wrappedPropellantOption = try? values.decodeIfPresent(String.self, forKey: propellantOption),
                let unwrappedPropellantOption = wrappedPropellantOption else {
                    continue
            }
            
            propellants.append(unwrappedPropellantOption.capitalizingFirstLetter())
        }
        
        self.propellants = propellants
    }
    
}
