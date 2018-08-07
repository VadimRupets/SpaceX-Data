//
//  CompositeFairing.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 7/25/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct CompositeFairing {
    let height: Distance
    let diameter: Distance
}

extension CompositeFairing: Decodable {
    private enum CodingKeys: String, CodingKey {
        case height, diameter
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.height = try values.decode(Distance.self, forKey: .height)
        self.diameter = try values.decode(Distance.self, forKey: .diameter)
    }
}
