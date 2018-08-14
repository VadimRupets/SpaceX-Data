//
//  Trunk.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/14/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Trunk {
    let volume: Volume
    let cargo: Cargo
}

extension Trunk: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        volume = "trunk_volume",
        cargo
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.volume = try values.decode(Volume.self, forKey: .volume)
        self.cargo = try values.decode(Cargo.self, forKey: .cargo)
    }
    
}
