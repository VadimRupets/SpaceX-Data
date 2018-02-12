//
//  Address.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 2/12/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Address {
    
    let address: String
    let city: String
    let state: String
    
    init(address: String, city: String, state: String) {
        self.address = address
        self.city = city
        self.state = state
    }
}

extension Address: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        address,
        city,
        state
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.address = try values.decode(String.self, forKey: .address)
        self.city = try values.decode(String.self, forKey: .city)
        self.state = try values.decode(String.self, forKey: .state)
    }
    
}
