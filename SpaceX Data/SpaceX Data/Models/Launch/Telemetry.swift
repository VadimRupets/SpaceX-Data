//
//  Telemetry.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/15/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Telemetry {
    let flightClubURL: URL?
}

extension Telemetry: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case flightClubURL = "flight_club"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.flightClubURL = try values.decodeIfPresent(URL.self, forKey: .flightClubURL)
    }
    
}
