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
    
    var addressString: String {
        return "\(address), \(city), \(state)"
    }
}

extension Address: Decodable {
    
    enum CodingKeys: String, CodingKey {
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
