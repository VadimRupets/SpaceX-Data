//
//  PayloadWeight.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 7/25/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct PayloadWeight {
    let id: String
    let name: String
    let weight: Mass
}

extension PayloadWeight: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id, name, kgs, lbs
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try values.decode(String.self, forKey: .id)
        self.name = try values.decode(String.self, forKey: .name)
        self.weight = try Mass(from: decoder)
    }
}
