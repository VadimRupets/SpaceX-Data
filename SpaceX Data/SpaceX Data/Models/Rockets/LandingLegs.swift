//
//  LandingLegs.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/6/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct LandingLegs {
    let quantity: Int
    let material: String
}

extension LandingLegs: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        quantity = "number",
        material
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.quantity = try values.decode(Int.self, forKey: .quantity)
        self.material = try values.decodeIfPresent(String.self, forKey: .material) ?? ""
    }
    
}
