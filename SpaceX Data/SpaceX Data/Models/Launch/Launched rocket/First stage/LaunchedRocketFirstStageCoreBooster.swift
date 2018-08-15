//
//  LaunchedRocketFirstStageCoreBooster.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/15/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

enum LandingType: String, Decodable {
    case
    ocean = "Ocean",
    asds = "ASDS",
    rtls = "RTLS"
}

struct LaunchedRocketFirstStageCoreBooster {
    let serialNumber: String?
    let flight: Int?
    let block: Int?
    let reused: Bool?
    let landed: Bool?
    let landingType: LandingType?
    let landingVehicle: String?
}

extension LaunchedRocketFirstStageCoreBooster: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        serialNumber = "core_serial",
        flight,
        block,
        reused,
        landed = "land_success",
        landingType = "landing_type",
        landingVehicle = "landing_vehicle"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.serialNumber = try values.decodeIfPresent(String.self, forKey: .serialNumber)
        self.flight = try values.decodeIfPresent(Int.self, forKey: .flight)
        self.block = try values.decodeIfPresent(Int.self, forKey: .block)
        self.reused = try values.decodeIfPresent(Bool.self, forKey: .reused)
        self.landed = try values.decodeIfPresent(Bool.self, forKey: .landed)
        self.landingType = try values.decodeIfPresent(LandingType.self, forKey: .landingType)
        self.landingVehicle = try values.decodeIfPresent(String.self, forKey: .landingVehicle)
    }
    
}
