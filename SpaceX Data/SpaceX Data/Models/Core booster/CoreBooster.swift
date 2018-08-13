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

struct CoreBooster {
    let serialNumber: String
    let block: Int?
    let status: CoreBoosterStatus
    let originalLaunchDate: Date?
    let missions: [String]
    let rtlsAttempt: Bool
    let rtlsLandings: Int
    let asdsAttempt: Bool
    let asdsLandings: Int
    let waterLanding: Bool
    private let _description: String?
}

extension CoreBooster: Decodable {
    private enum CodingKeys: String, CodingKey {
        case
        serialNumber = "core_serial",
        block,
        status,
        originalLaunchDate = "original_launch",
        missions,
        rtlsAttempt = "rtls_attempt",
        rtlsLandings = "rtls_landings",
        asdsAttempt = "asds_attempt",
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
        
        self.missions = try values.decode([String].self, forKey: .missions)
        self.rtlsAttempt = try values.decode(Bool.self, forKey: .rtlsAttempt)
        self.rtlsLandings = try values.decode(Int.self, forKey: .rtlsLandings)
        self.asdsAttempt = try values.decode(Bool.self, forKey: .asdsAttempt)
        self.asdsLandings = try values.decode(Int.self, forKey: .asdsLandings)
        self.waterLanding = try values.decode(Bool.self, forKey: .waterLanding)
        self._description = try values.decodeIfPresent(String.self, forKey: .description)
    }
}

extension CoreBooster: CustomStringConvertible {
    var description: String {
        return _description ?? ""
    }
}
