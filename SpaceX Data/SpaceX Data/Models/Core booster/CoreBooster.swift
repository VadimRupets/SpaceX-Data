//
//  CoreBooster.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/10/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

enum CoreBoosterStatus: String, Decodable {
    case
    active,
    expended,
    destroyed,
    retired
}

struct CoreBooster: CustomStringConvertible {
    let serialNumber: String
    let block: Int?
    let status: CoreBoosterStatus
    let originalLaunchDate: Date?
    let missions: [Mission]
    let rtlsAttempts: Int
    let rtlsLandings: Int
    let asdsAttempts: Int
    let asdsLandings: Int
    let waterLanding: Bool
    let description: String
}

extension CoreBooster: Decodable {
    private enum CodingKeys: String, CodingKey {
        case
        serialNumber = "core_serial",
        block,
        status,
        originalLaunchDate = "original_launch",
        missions,
        rtlsAttempts = "rtls_attempts",
        rtlsLandings = "rtls_landings",
        asdsAttempts = "asds_attempts",
        asdsLandings = "asds_landings",
        waterLanding = "water_landing",
        description = "details"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.serialNumber = try values.decode(String.self, forKey: .serialNumber)
        self.block = try values.decodeIfPresent(Int.self, forKey: .block)
        self.status = try values.decode(CoreBoosterStatus.self, forKey: .status)
        
        if let originalLaunchDateString = try values.decodeIfPresent(String.self, forKey: .originalLaunchDate) {
            guard let originalLaunchDate = DateFormatter.ISO8601.date(from: originalLaunchDateString) else {
                throw DecodingError.dataCorruptedError(forKey: .originalLaunchDate, in: values, debugDescription: "Date string does not match format expected by formatter.")
            }
            
            self.originalLaunchDate = originalLaunchDate
        } else {
            self.originalLaunchDate = nil
        }
        
        self.missions = try values.decode([Mission].self, forKey: .missions)
        self.rtlsAttempts = try values.decode(Int.self, forKey: .rtlsAttempts)
        self.rtlsLandings = try values.decode(Int.self, forKey: .rtlsLandings)
        self.asdsAttempts = try values.decode(Int.self, forKey: .asdsAttempts)
        self.asdsLandings = try values.decode(Int.self, forKey: .asdsLandings)
        self.waterLanding = try values.decode(Bool.self, forKey: .waterLanding)
        self.description = try values.decodeIfPresent(String.self, forKey: .description) ?? ""
    }
}
