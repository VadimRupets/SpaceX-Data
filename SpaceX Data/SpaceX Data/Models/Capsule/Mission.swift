//
//  Mission.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 10/25/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Mission {
    let flight: Int
    let name: String
}

extension Mission: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        flight,
        name
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.flight = try values.decode(Int.self, forKey: .flight)
        self.name = try values.decode(String.self, forKey: .name)
    }
    
}
