//
//  Fairings.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 11/22/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Fairings {
    let reused: Bool
    let recoveryAttempt: Bool?
    let recovered: Bool?
    let ship: String?
}

extension Fairings: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        reused,
        recoveryAttempt = "recovery_attempt",
        recovered,
        ship
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.reused = try values.decode(Bool.self, forKey: .reused)
        self.recoveryAttempt = try values.decodeIfPresent(Bool.self, forKey: .recoveryAttempt)
        self.recovered = try values.decodeIfPresent(Bool.self, forKey: .recovered)
        self.ship = try values.decodeIfPresent(String.self, forKey: .ship)
    }
    
}
