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
    let previousFlights: Int?
    let block: Int?
    let gridfins: Bool?
    let legs: Bool?
    let reused: Bool?
    let landed: Bool?
    let landingIntent: Bool?
    let landingType: LandingType?
    let landingVehicle: String?
}

extension LaunchedRocketFirstStageCoreBooster: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        serialNumber = "core_serial",
        previousFlights = "flight",
        block,
        gridfins,
        legs,
        reused,
        landed = "land_success",
        landingIntent = "landing_intent",
        landingType = "landing_type",
        landingVehicle = "landing_vehicle"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.serialNumber = try values.decodeIfPresent(String.self, forKey: .serialNumber)
        self.previousFlights = try values.decodeIfPresent(Int.self, forKey: .previousFlights)
        self.block = try values.decodeIfPresent(Int.self, forKey: .block)
        self.gridfins = try values.decodeIfPresent(Bool.self, forKey: .gridfins)
        self.legs = try values.decodeIfPresent(Bool.self, forKey: .legs)
        self.reused = try values.decodeIfPresent(Bool.self, forKey: .reused)
        self.landed = try values.decodeIfPresent(Bool.self, forKey: .landed)
        self.landingIntent = try values.decodeIfPresent(Bool.self, forKey: .landingIntent)
        self.landingType = try values.decodeIfPresent(LandingType.self, forKey: .landingType)
        self.landingVehicle = try values.decodeIfPresent(String.self, forKey: .landingVehicle)
    }
    
}
