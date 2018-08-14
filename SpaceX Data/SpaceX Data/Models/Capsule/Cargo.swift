//
//  Cargo.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/14/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Cargo {
    let solarArrays: Int
    let unpressurizedCargo: Bool
}

extension Cargo: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        solarArrays = "solar_array",
        unpressurizedCargo = "unpressurized_cargo"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.solarArrays = try values.decode(Int.self, forKey: .solarArrays)
        self.unpressurizedCargo = try values.decode(Bool.self, forKey: .unpressurizedCargo)
    }
    
}
